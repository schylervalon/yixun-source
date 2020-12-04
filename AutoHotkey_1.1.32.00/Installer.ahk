#NoEnv
#NoTrayIcon
; #Warn
#SingleInstance Off
try Menu Tray, Icon, appwiz.cpl, -1500if !A_IsAdmin && !%False%
{
    if A_OSVersion not in WIN_2003,WIN_XP,WIN_2000
    {
        Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%",, UseErrorLevel
        if !ErrorLevel
            ExitApp
    }
    MsgBox 0x31, AutoHotkey Setup,
    (LTrim Join`s
    Setup is running as a limited user.  If you continue, some problems
    are likely to occur.  It is strongly recommended that you run Setup
    as an administrator.`n
    `n
    To continue anyway, click OK.  Otherwise click Cancel.
    )
    IfMsgBox Cancel
        ExitApp
}

SourceDir := A_ScriptDirSilentMode := false
SilentErrors := 0
AutoRestart := false

ProductName := "AutoHotkey"
ProductVersion := A_AhkVersion
ProductPublisher := "Lexikos"
ProductWebsite := "https://autohotkey.com/"

EnvGet ProgramW6432, ProgramW6432
DefaultPath := (ProgramW6432 ? ProgramW6432 : A_ProgramFiles) "\AutoHotkey"
DefaultType := A_Is64bitOS ? "x64" : "Unicode"
DefaultStartMenu := "AutoHotkey"
DefaultCompiler := true
DefaultDragDrop := true
DefaultToUTF8 := false
DefaultIsHostApp := false
DefaultUIAccess := false
AutoHotkeyKey := "SOFTWARE\AutoHotkey"
UninstallKey := "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\AutoHotkey"
FileTypeKey := "AutoHotkeyScript"

RegRead UACIsEnabled, HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System, EnableLUA

Menu Tray, MainWindow  ; Enable debugging setup.exe.

if 1 = /exec ; For internal use
{
    HandleExec(1)
    ExitApp
}

DetermineVersion()

ConfigureMode := DefaultPath = A_ScriptDir

Loop %0%
    if %A_Index% = /S
        SilentMode := true
    else if %A_Index% = /R
        AutoRestart := true
    else if %A_Index% = /U32
        DefaultType = Unicode
    else if %A_Index% in /U64,/x64
        DefaultType = x64
    else if %A_Index% in /A32,/ANSI
        DefaultType = ANSI
    else if %A_Index% in /uiAccess,/uiAccess=0,/uiAccess=1
        DefaultUIAccess := SubStr(%A_Index%, 10) != "=0"
    else if %A_Index% in /IsHostApp,/IsHostApp=0,/IsHostApp=1
        DefaultIsHostApp := SubStr(%A_Index%, 11) != "=0"
    else if InStr(%A_Index%, "/D=") = 1 {
        if !RegExMatch(DllCall("GetCommandLine", "str"), "(?<!"")/D=\K[^""]*?(?=$|[ `t]+/)", DefaultPath)
            DefaultPath := SubStr(%A_Index%, 4)
        Loop %DefaultPath%, 2  ; Resolve relative path.
            DefaultPath := A_LoopFileLongPath
        SlashD := true
    }
    else if (%A_Index% = "/?") {
        ViewHelp("/docs/Scripts.htm#install")
        ExitApp
    }
    else if (%A_Index% = "/Uninstall") {
        SilentMode := true
        Uninstall()
        ExitApp
    }
    else if (%A_Index% = "/E") {
        Extract(SlashD ? DefaultPath : "")
        ExitApp
    }
    else if (SubStr(%A_Index%,1,5) = "/Test")
        TestMode := SubStr(%A_Index%,6)

if SilentMode {
    QuickInstall()
    ExitApp % SilentErrors
}

if WinExist("AutoHotkey Setup ahk_class AutoHotkeyGUI") {
    MsgBox 0x30, AutoHotkey Setup, AutoHotkey Setup is already running!
    WinActivate
    ExitApp
}

OnExit GuiClose
Gui Margin, 0, 0
Gui +LastFound
try {  ; Hide window title.
    DllCall("UxTheme\SetWindowThemeAttribute", "ptr", WinExist()
        , "int", 1, "int64*", (3<<32)|3, "int", 8)
}
OnMessage(0x100, "gui_KeyDown", 2)
try Gui Add, ActiveX, vwb w600 h400 hwndhwb, Shell.Explorer
try {
    if !wb
        throw Exception("Failed to create IE control")
    if GetKeyState("Shift") || GetKeyState("Ctrl")
        throw 1
    SetWBClientSite()
    InitUI()
}
catch excpt {
    if ConfigureMode {
        MsgBox 0x10, AutoHotkey Setup, Setup failed to initialize its user interface and will now exit.
        ExitApp
    }
    message := IsObject(excpt)
        ? "Setup encountered an error.`n"
        . "  Specifically: " excpt.Message
        : "Setup is in troubleshooting mode (you're holding Ctrl or Shift)."
    type := DefaultType="ANSI" ? "ANSI 32-bit" : "Unicode " (DefaultType="x64"?"64":"32") "-bit"
    MsgBox 0x33, AutoHotkey Setup,
(
%message%

Do you want to install with default options?
  %ProductName% v%ProductVersion% (%type%)
  %DefaultPath%

Click Yes to install.
Click No to copy setup files to a directory of your choosing.
Click Cancel to exit.
)
    IfMsgBox Yes
    {
        QuickInstall()
        MsgBox 0, AutoHotkey Setup, Installation complete.
    }
    else IfMsgBox No
        Extract()
    ExitApp
}
Gui Show,, AutoHotkey Setup
Gui +OwnDialogs
WinWaitClose ; Let +OwnDialogs apply to threadless callbacks.
return

GuiEscape:
Gui +OwnDialogs
MsgBox 0x2034, AutoHotkey Setup, Are you sure you want to exit setup?
IfMsgBox No
    return
GuiClose:
Gui Destroy
OnExit
ExitApp

DetermineVersion() {
    global
    local url, v
    ; This first section has two purposes:
    ;  1) Determine the location of any current installation.
    ;  2) Determine which view of the registry it was installed into
    ;     (only applicable if the OS is 64-bit).
    CurrentRegView := ""
    Loop % (A_Is64bitOS ? 2 : 1) {
        SetRegView % 32*A_Index
        RegRead CurrentPath, HKLM, %AutoHotkeyKey%, InstallDir
        if !ErrorLevel {
            CurrentRegView := A_RegView
            break
        }
    }
    if ErrorLevel {
        CurrentName := ""
        CurrentVersion := ""
        CurrentType := ""
        CurrentPath := ""
        CurrentStartMenu := ""
        return
    }
    RegRead CurrentVersion, HKLM, %AutoHotkeyKey%, Version
    RegRead CurrentStartMenu, HKLM, %AutoHotkeyKey%, StartMenuFolder
    RegRead url, HKLM, %UninstallKey%, URLInfoAbout
    ; Identify by URL since uninstaller display name is the same:
    if (url = "http://www.autohotkey.net/~Lexikos/AutoHotkey_L/"
        || url = "http://l.autohotkey.net/")
        CurrentName := "AutoHotkey_L"
    else
        CurrentName := "AutoHotkey"
    ; Identify which build is installed/set as default:
    FileAppend ExitApp `% (A_IsUnicode=1) << 8 | (A_PtrSize=8) << 9, %A_Temp%\VersionTest.ahk
    RunWait %CurrentPath%\AutoHotkey.exe "%A_Temp%\VersionTest.ahk",, UseErrorLevel
    if ErrorLevel = 0x300
        CurrentType := "x64"
    else if ErrorLevel = 0x100
        CurrentType := "Unicode"
    else if ErrorLevel = 0
        CurrentType := "ANSI"
    else
        CurrentType := ""
    FileDelete %A_Temp%\VersionTest.ahk
    ; Set some default parameter based on current installation:
    if CurrentType
        DefaultType := CurrentType
    DefaultPath := CurrentPath
    DefaultStartMenu := CurrentStartMenu
    DefaultCompiler := FileExist(CurrentPath "\Compiler\Ahk2Exe.exe") != ""
    RegRead v, HKCR, %FileTypeKey%\ShellEx\DropHandler
    DefaultDragDrop := ErrorLevel = 0
    RegRead v, HKCR, Applications\AutoHotkey.exe, IsHostApp
    DefaultIsHostApp := !ErrorLevel
    RegRead v, HKCR, %FileTypeKey%\Shell\uiAccess\Command
    DefaultUIAccess := !ErrorLevel && UACIsEnabled
    RegRead v, HKCR, %FileTypeKey%\Shell\Open\Command
    DefaultToUTF8 := InStr(v, " /CP65001 ") != 0
}

InitUI() {
    local w    gosub DefineUI
    wb.Silent := true
    wb.Navigate("about:<!DOCTYPE HTML><meta http-equiv='x-ua-compatible' content='IE=Edge'>")
    while wb.ReadyState != 4 {
        Sleep 10
        if (A_TickCount-initTime > 2000)
            throw 1
    }
    wb.Document.open()
    wb.Document.write(html)
    wb.Document.close()    w := wb.Document.parentWindow
    if !w || !w.initOptions
        throw 1
    w.AHK := Func("JS_AHK")
    if (!CurrentType && A_ScriptDir != DefaultPath)
        CurrentName := ""  ; Avoid showing the Reinstall option since we don't know which version it was.
    w.initOptions(CurrentName, CurrentVersion, CurrentType
                , ProductVersion, DefaultPath, DefaultStartMenu
                , DefaultType, A_Is64bitOS = 1)
    w.configureMode := ConfigureMode
    w.document.body.className := ConfigureMode ? "config-mode" : ""
    if ConfigureMode {
        w.installdir.disabled := true
        w.installdir_browse.disabled := true
        w.nav_install.innerText := "apply"
        w.install_button.innerText := "Apply"
        w.opt1.onclick := ""
        w.opt1.removeAttribute("href")
        w.opt1.firstChild.innerText := "Checking for updates..."
    }
    w.installcompiler.checked := DefaultCompiler
    w.enabledragdrop.checked := DefaultDragDrop
    w.separatebuttons.checked := DefaultIsHostApp
    w.enableuiaccess.checked := DefaultUIAccess && IsTrustedLocation(DefaultPath)
    ; w.defaulttoutf8.checked := DefaultToUTF8
    if !A_Is64bitOS
        w.it_x64.style.display := "None"
    if A_OSVersion in WIN_2000,WIN_2003,WIN_XP,WIN_VISTA ; i.e. not WIN_7, WIN_8 or a future OS.
        w.separatebuttons.parentNode.style.display := "none"
    if !UACIsEnabled
        w.enableuiaccess.parentNode.style.display := "none"
    else {
        w.enableuiaccess.onchange := Func("enableuiaccess_onchange")
        w.installdir.onchange := Func("installdir_onchange")
    }
    w.switchPage("start")
    w.document.body.focus()
    ; Scale UI by screen DPI.  My testing showed that Vista with IE7 or IE9
    ; did not scale by default, but Win8.1 with IE10 did.  The scaling being
    ; done by the control itself = deviceDPI / logicalDPI.
    logicalDPI := w.screen.logicalXDPI, deviceDPI := w.screen.deviceXDPI
    if (A_ScreenDPI != 96)
        w.document.body.style.zoom := A_ScreenDPI/96 * (logicalDPI/deviceDPI)
    if ConfigureMode
        CheckForUpdates()
}

CheckForUpdates() {
    local w := getWindow(), latestVersion := ""
    try {
        req := ComObjCreate("Msxml2.XMLHTTP")
        req.open("GET", "https://autohotkey.com/download/1.1/version.txt?" SubStr(A_Now,1,8), true)
        req.onreadystatechange := Func("VersionReceived").Bind(req)
        req.send()
    }
}

VersionReceived(req) {
    local w := getWindow(), latestVersion := ""
    if req.readyState != 4
        return
    latestVersion := req.responseText
    if RegExMatch(latestVersion, "^(\d+\.){3}\d+") {
        if (latestVersion = ProductVersion)
            w.opt1.firstChild.innerText := "Reinstall (download required)"
        else
            w.opt1.firstChild.innerText := "Download v" latestVersion
        w.opt1.href := "#"
        w.opt1.onclick := Func("DownloadAHK")
    } else
        w.opt1.innerText := "An error occurred while checking for updates."
}


/*  Fix keyboard shortcuts in WebBrowser control.
 */

gui_KeyDown(wParam, lParam, nMsg, hWnd) {
    global wb
    if (Chr(wParam) ~= "[A-Z]" || wParam = 0x74) ; Disable Ctrl+O/L/F/N and F5.
        return
    Gui +OwnDialogs ; For threadless callbacks which interrupt this.
    pipa := ComObjQuery(wb, "{00000117-0000-0000-C000-000000000046}")
    VarSetCapacity(kMsg, 48), NumPut(A_GuiY, NumPut(A_GuiX
    , NumPut(A_EventInfo, NumPut(lParam, NumPut(wParam
    , NumPut(nMsg, NumPut(hWnd, kMsg)))), "uint"), "int"), "int")
    Loop 2
    r := DllCall(NumGet(NumGet(1*pipa)+5*A_PtrSize), "ptr", pipa, "ptr", &kMsg)
    ; Loop to work around an odd tabbing issue (it's as if there
    ; is a non-existent element at the end of the tab order).
    until wParam != 9 || wb.Document.activeElement != ""
    ObjRelease(pipa)
    if r = 0 ; S_OK: the message was translated to an accelerator.
        return 0
}


/*  javascript:AHK('Func') --> Func()
 */

JS_AHK(func, prms*) {
    global wb
    ; Stop navigation prior to calling the function, in case it uses Exit.
    wb.Stop(),  %func%(prms*)
}


/*  Complex workaround to override "Active scripting" setting
 *  and ensure scripts can run within the WebBrowser control.
 */

global WBClientSite

SetWBClientSite()
{
    interfaces := {
    (Join,
        IOleClientSite: [0,3,1,0,1,0]
        IServiceProvider: [3]
        IInternetSecurityManager: [1,1,3,4,8,7,3,3]
    )}
    unkQI      := RegisterCallback("WBClientSite_QI", "Fast")
    unkAddRef  := RegisterCallback("WBClientSite_AddRef", "Fast")
    unkRelease := RegisterCallback("WBClientSite_Release", "Fast")
    WBClientSite := {_buffers: bufs := {}}, bufn := 0, 
    for name, prms in interfaces
    {
        bufn += 1
        bufs.SetCapacity(bufn, (4 + prms.MaxIndex()) * A_PtrSize)
        buf := bufs.GetAddress(bufn)
        NumPut(unkQI,       buf + 1*A_PtrSize)
        NumPut(unkAddRef,   buf + 2*A_PtrSize)
        NumPut(unkRelease,  buf + 3*A_PtrSize)
        for i, prmc in prms
            NumPut(RegisterCallback("WBClientSite_" name, "Fast", prmc+1, i), buf + (3+i)*A_PtrSize)
        NumPut(buf + A_PtrSize, buf + 0)
        WBClientSite[name] := buf
    }
    global wb
    if pOleObject := ComObjQuery(wb, "{00000112-0000-0000-C000-000000000046}")
    {   ; IOleObject::SetClientSite
        DllCall(NumGet(NumGet(pOleObject+0)+3*A_PtrSize), "ptr"
            , pOleObject, "ptr", WBClientSite.IOleClientSite, "uint")
        ObjRelease(pOleObject)
    }
}

WBClientSite_QI(p, piid, ppvObject)
{
    static IID_IUnknown := "{00000000-0000-0000-C000-000000000046}"
    static IID_IOleClientSite := "{00000118-0000-0000-C000-000000000046}"
    static IID_IServiceProvider := "{6d5140c1-7436-11ce-8034-00aa006009fa}"
    iid := _String4GUID(piid)
    if (iid = IID_IOleClientSite || iid = IID_IUnknown)
    {
        NumPut(WBClientSite.IOleClientSite, ppvObject+0)
        return 0 ; S_OK
    }
    if (iid = IID_IServiceProvider)
    {
        NumPut(WBClientSite.IServiceProvider, ppvObject+0)
        return 0 ; S_OK
    }
    NumPut(0, ppvObject+0)
    return 0x80004002 ; E_NOINTERFACE
}

WBClientSite_AddRef(p)
{
    return 1
}

WBClientSite_Release(p)
{
    return 1
}

WBClientSite_IOleClientSite(p, p1="", p2="", p3="")
{
    if (A_EventInfo = 3) ; GetContainer
    {
        NumPut(0, p1+0) ; *ppContainer := NULL
        return 0x80004002 ; E_NOINTERFACE
    }
    return 0x80004001 ; E_NOTIMPL
}

WBClientSite_IServiceProvider(p, pguidService, piid, ppvObject)
{
    static IID_IUnknown := "{00000000-0000-0000-C000-000000000046}"
    static IID_IInternetSecurityManager := "{79eac9ee-baf9-11ce-8c82-00aa004ba90b}"
    if (_String4GUID(pguidService) = IID_IInternetSecurityManager)
    {
        iid := _String4GUID(piid)
        if (iid = IID_IInternetSecurityManager || iid = IID_IUnknown)
        {
            NumPut(WBClientSite.IInternetSecurityManager, ppvObject+0)
            return 0 ; S_OK
        }
        NumPut(0, ppvObject+0)
        return 0x80004002 ; E_NOINTERFACE
    }
    NumPut(0, ppvObject+0)
    return 0x80004001 ; E_NOTIMPL
}

WBClientSite_IInternetSecurityManager(p, p1="", p2="", p3="", p4="", p5="", p6="", p7="", p8="")
{
    if (A_EventInfo = 5) ; ProcessUrlAction
    {
        if (p2 = 0x1400) ; dwAction = URLACTION_SCRIPT_RUN
        {
            NumPut(0, p3+0)  ; *pPolicy := URLPOLICY_ALLOW
            return 0 ; S_OK
        }
    }
    return 0x800C0011 ; INET_E_DEFAULT_ACTION
}

_String4GUID(pGUID)
{
	VarSetCapacity(String,38*2)
	DllCall("ole32\StringFromGUID2", "ptr", pGUID, "str", String, "int", 39)
	Return	String
}


/*  Utility Functions
 */

getWindow() {
    global wb
    return wb.document.parentWindow
}

ErrorExit(errMsg) {
    global
    if !SilentMode
        MsgBox 0x2010, AutoHotkey Setup, %errMsg%
    ExitApp 1
}

CloseScriptsEtc(installdir, actionToContinue) {
    titles := ""
    DetectHiddenWindows On
    close := [], reopen := []
    WinGet w, List, ahk_class AutoHotkey
    Loop % w {
        ; Exclude the install script.
        if (w%A_Index% = A_ScriptHwnd)
            continue
        ; Determine if the script actually needs to be terminated.
        WinGet exe_path, ProcessPath, % "ahk_id " w%A_Index%
        if (exe_path != "") {
            ; Exclude external executables.
            if InStr(exe_path, installdir "\") != 1
                continue
            ; The main purpose of this next check is to avoid closing
            ; SciTE4AutoHotkey's toolbar, but also may be helpful for
            ; other situations.
            exe := SubStr(exe_path, StrLen(installdir) + 2)
            if !RegExMatch(exe, "i)^(AutoHotkey((A32|U32|U64)(_UIA)?)?\.exe|Compiler\\Ahk2Exe.exe)$")
                continue
        }        
        ; Append script path to the list.
        WinGetTitle title, % "ahk_id " w%A_Index%
        title := RegExReplace(title, " - AutoHotkey v.*")
        titles .= "  -  " title "`n"
        close.Push(w%A_Index%)
        if FileExist(title)
            reopen.Push({path: title, exe: exe_path})
    }
    if (titles != "") {
        global SilentMode, installInPlace
        if !SilentMode {
            static button_retry, button_mode
            button_retry := 3
            if (actionToContinue = "installation") {
                help_text =
                (LTrim
                Click Reload to automatically reload the scripts later.
                Click Close All to just close the scripts and continue.
                )
                button_mode := 3
            } else {
                help_text =
                (LTrim
                Click Close All to close all scripts and continue the %actionToContinue%.
                )
                button_mode := 1
            }
            SetTimer CloseScriptsEtc_Buttons, -5
            MsgBox % 0x2030|button_mode, AutoHotkey Setup,
            (LTrim
            Setup needs to close the following script(s):
            `n%titles%
            %help_text%
            )
            IfMsgBox Cancel
                Exit
            IfMsgBox Yes
                global AutoRestart := true
        }
        ; Close script windows (typically causing them to exit).
        Loop % close.MaxIndex()
        {
            WinClose % "ahk_id " close[A_Index]
            WinWaitClose % "ahk_id " close[A_Index],, 1
        }
    }
    ; Close all help file windows automatically:
    GroupAdd autoclosegroup, AutoHotkey_L Help ahk_class HH Parent
    GroupAdd autoclosegroup, AutoHotkey Help ahk_class HH Parent
    ; Also close the old Ahk2Exe (but the new one is a script, so it
    ; was already handled by the section above):
    GroupAdd autoclosegroup, Ahk2Exe v ahk_exe %installdir%\Compiler\Ahk2Exe.exe
    WinClose ahk_group autoclosegroup
    return reopen
    
    CloseScriptsEtc_Buttons:
    Critical
    if !WinExist("ahk_class #32770 ahk_pid " DllCall("GetCurrentProcessId")) {
        if (button_retry--)
            SetTimer,, -5
        return
    }
    if (button_mode = 1)
        ControlSetText Button1, Close &All
    else {
        ControlSetText Button1, &Reload
        ControlSetText Button2, Close &All
    }
    return
}

ReopenScripts(scripts) {
    global AutoRestart
    if !AutoRestart || !scripts || !scripts.MaxIndex()
        return
    failed := ""
    for i, script in scripts {
        workdir := script.path
        SplitPath workdir,, workdir
        try
            script.exe ? Run_(script.exe, """" script.path """", workdir)
                       : Run_("""" script.path """",, workdir)
        catch
            failed .= "`n" script
    }
    if (failed != "" && !SilentMode)
        MsgBox 0x2010, AutoHotkey Setup, Failed to restart the following scripts:`n%failed%
}

GetErrorMessage(error_code="") {
    VarSetCapacity(buf, 1024) ; Probably won't exceed 1024 chars.
    if DllCall("FormatMessage", "uint", 0x1200, "ptr", 0, "int", error_code!=""
                ? error_code : A_LastError, "uint", 1024, "str", buf, "uint", 1024, "ptr", 0)
        return buf
}

switchPage(page) {
    global
    if !SilentMode
        getWindow().switchPage(page)
}

UpdateStatus(status) {
    ; ToolTip % status
    ; if !SilentMode
        ; getWindow().install_status.innerText := status
}

ShellRun(prms*)
{
    shellWindows := ComObjCreate("Shell.Application").Windows
    VarSetCapacity(_hwnd, 4, 0)
    desktop := shellWindows.FindWindowSW(0, "", 8, ComObj(0x4003, &_hwnd), 1)
    if ptlb := ComObjQuery(desktop
        , "{4C96BE40-915C-11CF-99D3-00AA004AE837}"  ; SID_STopLevelBrowser
        , "{000214E2-0000-0000-C000-000000000046}") ; IID_IShellBrowser
    {
        if DllCall(NumGet(NumGet(ptlb+0)+15*A_PtrSize), "ptr", ptlb, "ptr*", psv:=0) = 0
        {
            VarSetCapacity(IID_IDispatch, 16)
            NumPut(0x46000000000000C0, NumPut(0x20400, IID_IDispatch, "int64"), "int64")
            DllCall(NumGet(NumGet(psv+0)+15*A_PtrSize), "ptr", psv
                , "uint", 0, "ptr", &IID_IDispatch, "ptr*", pdisp:=0)
            shell := ComObj(9,pdisp,1).Application
            shell.ShellExecute(prms*)
            ObjRelease(psv)
        }
        ObjRelease(ptlb)
    }
}

Run_(target, args:="", workdir:="") {
    try
        ShellRun(target, args, workdir)
    catch e
        Run % args="" ? target : target " " args, % workdir
}


/*  Utility Functions invoked by the UI
 */

Customize() {
    local w := getWindow()
    if !ConfigureMode
        w.document.body.className := "custom-mode"
    w.switchPage("version")
}

SelectFolder(id, prompt="", root="::{20d04fe0-3aea-1069-a2d8-08002b30309d}") {
    global wb
    if !(field := wb.document.getElementById(id))
        return
    Gui +OwnDialogs
    FileSelectFolder path
        , % root " *" field.value
        ,, % prompt
    if !ErrorLevel && (id != "installdir" || installdir_allowed(path))
        field.value := path
}

ReadLicense() {
    Run_(A_ScriptDir "\license.txt")
}

ViewHelp(topic) {
    local path
    if FileExist(A_ScriptDir "\AutoHotkey.chm")
        path := A_ScriptDir "\AutoHotkey.chm"
    else
        path := CurrentPath "\AutoHotkey.chm"
    if FileExist(path)
        Run_("hh.exe", "mk:@MSITStore:" path "::" topic)
    else
        Run_("https://autohotkey.com" topic)
}

RunAutoHotkey() {
    ; Setup may be running as a user other than the one that's logged
    ; in (i.e. an admin user), so in addition to running AutoHotkey.exe
    ; in user mode, have it call the function below to ensure the script
    ; file is correctly located.
    Run_("AutoHotkey.exe", """" A_WorkingDir "\Installer.ahk"" /exec runahk")
}
Exec_RunAHK() {
    ; This could detect %ExeDir%\AutoHotkey.ahk (which takes precedence
    ; over %A_MyDocuments%\AutoHotkey.ahk), but that file is unlikely to
    ; exist in this situation.
    script_path := A_MyDocuments "\AutoHotkey.ahk"
    ; Start the script.
    Run AutoHotkey.exe,,, pid
    ; Check for common failures.
    SetTitleMatchMode 2
    DetectHiddenWindows On
    message := ""
    message_flags := 0x2034
    Loop {
        Sleep 50
        Process Exist, %pid%
        if !ErrorLevel {
            if !FileExist(script_path) {
                WinWait AutoHotkey Help,, 1
                if !ErrorLevel {
                    WinActivate  ; Welcome screen (v1.1.20).
                    return
                }
            }
            message =
            (LTrim Join`s
            AutoHotkey has exited.  You may need to edit your startup
            script.  For instance, if it exited because it had nothing
            to do, you can add a hotkey.
            )
            message_flags := 0x2044 ; Less severe, since it might be intentional.
            break
        }
        if WinExist("ahk_class #32770 ahk_pid " pid) {
            WinGetText message
            if !InStr(message, "Error")
                return
            WinWaitClose
            Process Exist, %pid%
            message := "Your script encountered an error" (ErrorLevel ? "." : " and exited.")
                   . "  You will need to edit it to resolve this error."
            break
        }
        if WinExist("ahk_class AutoHotkey ahk_pid " pid) {
            WinWaitClose,,, .2 ; Wait a moment in case the script is empty/about to exit.
            if !ErrorLevel
                continue ; Back to the top of the loop.
            DetectHiddenWindows Off
            if !WinExist("ahk_pid " pid)
                MsgBox 0x2040, AutoHotkey Setup, Your script is running in the background.
            return
        }
    }
    MsgBox % message_flags, AutoHotkey Setup, %message%`n`nYour script is located here:`n   %script_path%`n`nDo you want to edit this file?
    IfMsgBox Yes
    {
        if !FileExist(script_path)
            FileAppend,, %script_path%
        Run edit "%script_path%"
    }
}

Quit() {
    ExitApp
}

ViewWebsite() {
    global
    Run_(ProductWebsite)
}

Extract(dstDir="") {
    if (dstDir = "") {
        FileSelectFolder dstDir,,, Select a folder to copy program files to.
        if ErrorLevel
            return
    }
    try {
        global TestMode, SourceDir
        if (TestMode = "FailExtract")
            throw
        shell := ComObjCreate("Shell.Application")
        try FileCreateDir %dstDir%
        dst := shell.NameSpace(dstDir)
        src := shell.NameSpace(SourceDir)
        if !(dst && src)
            throw
        try dst.CopyHere(src.Items, 256)
    }
    catch {
        FileCopyDir %SourceDir%, %dstDir%, 1
        if ErrorLevel {
            MsgBox 0x2030, AutoHotkey Setup, An unspecified error occurred.
            return
        }
    }
    Run %dstDir%
}

DownloadAHK() {
    global wb
    wb.Stop()
    file := A_Temp "\ahk-install.exe"
    switchPage("downloading")
    Sleep 10
    if !Download("https://autohotkey.com/download/ahk-install.exe", file, "DownloadAHK_Progress") {
        MsgBox 0x2010,, Download failed.
        switchPage("start")
        return
    }
    Run "%file%" /exec waitclose %A_ScriptHwnd% /exec downloaded "%file%"
    ExitApp
}
Exec_WaitClose(hwnd) {
    DetectHiddenWindows On
    WinWaitClose ahk_id %hwnd%
}
Exec_Downloaded(file) {
    ; global SilentMode := true
    DetermineVersion()
    QuickInstall()
    ; NOTE: .\ is required here.  Otherwise it launches the copy found
    ; in the directory containing the current module -- the temp dir.
    Run .\AutoHotkeyU32.exe Installer.ahk /exec cleanup "%file%"
}
Exec_Cleanup(file) {
    SplitPath file, name
    Process WaitClose, %name%
    MsgBox 64, AutoHotkey Setup, Installation complete.
    FileDelete %file%
}
DownloadAHK_Progress(n, nMax) {
    if !nMax
        return
    w := getWindow()
    w.document.getElementById("dl_progress")
        .style.width := (n*100/nMax) "%"
    w.document.getElementById("dl_text")
        .innerText := DownloadSize(n) " / " DownloadSize(nMax)
    Sleep 10
}
DownloadSize(n) {
    n /= 1024
    if (n > 1024)
        return Round(n/1024, 2) " MB"
    return Round(n, 2) " KB"
}

; Based on code by Sean and SKAN @ http://www.autohotkey.com/forum/viewtopic.php?p=184468#184468
Download(url, file, callback) {
    static vt
    if !VarSetCapacity(vt) {
        VarSetCapacity(vt, A_PtrSize*11), nPar := "31132253353"
        Loop Parse, nPar
            NumPut(RegisterCallback("DL_Progress", "F", A_LoopField, A_Index-1), vt, A_PtrSize*(A_Index-1))
    }
    if !(IsObject(callback) || (callback := Func(callback)))
        return !(ErrorLevel := 1)
    VarSetCapacity(bobj, A_PtrSize*2), NumPut(&callback, NumPut(&vt, bobj)), VarSetCapacity(tn, 520)
    if (0 = DllCall("urlmon\URLDownloadToCacheFile", "ptr", 0, "str", url, "str", tn, "uint", 260, "uint", 0x10, "ptr", &bobj))
        FileCopy %tn%, %file%, 1
    else
        ErrorLevel := 1
    return !ErrorLevel
}
DL_Progress( pthis, nP=0, nPMax=0, nSC=0, pST=0 ) {
    if A_EventInfo = 6
        fn := Object(NumGet(pthis+A_PtrSize)), %fn%(np, npMax)
    return 0
}


/*  Setup Actions
 */

; Upgrade to newer version or from AutoHotkey to AutoHotkey_L.
;   Type: "ANSI" or "Unicode"
Upgrade(Type="") {
    global
    _Install({
    (Join C
        type: Type,
        path: DefaultPath,
        menu: DefaultStartMenu,
        ahk2exe: DefaultCompiler,
        dragdrop: DefaultDragDrop,
        uiAccess: DefaultUIAccess,
        utf8: DefaultToUTF8,
        isHostApp: DefaultIsHostApp
    )})
}

; Quick install with default options.
QuickInstall() {
    global
    _Install({
    (Join
        type: DefaultType,
        path: DefaultPath,
        menu: DefaultStartMenu,
        ahk2exe: DefaultCompiler,
        dragdrop: DefaultDragDrop,
        uiAccess: DefaultUIAccess,
        utf8: DefaultToUTF8,
        isHostApp: DefaultIsHostApp
    )})
}

; Begin installation after reviewing options.
CustomInstall() {
    local w := getWindow()
    _Install({
    (C Join
        type: w.installtype.value,
        path: w.installdir.value,
        menu: w.startmenu.value,
        ahk2exe: w.installcompiler.checked,
        dragdrop: w.enabledragdrop.checked,
        uiAccess: w.enableuiaccess.checked,
        utf8: DefaultToUTF8, ;w.defaulttoutf8.checked
        isHostApp: w.separatebuttons.checked
    )})
}

; Uninstall.
Uninstall() {
    global
    
    try
        SetWorkingDir % CurrentPath
    catch
        ErrorExit("Error uninstalling; installation directory '" CurrentPath "' may be invalid.")
    
    CloseScriptsEtc(CurrentPath, "uninstallation")
    
    switchPage("wait")
    
    /*  Registry
     */
    
    SetRegView % CurrentRegView
    
    RegDelete HKLM, %UninstallKey%
    RegDelete HKLM, %AutoHotkeyKey%
    RegDelete HKCU, %AutoHotkeyKey%  ; Created by Ahk2Exe.
    
    RegDelete HKCR, .ahk
    RegDelete HKCR, %FileTypeKey%
    RegDelete HKCR, Applications\AutoHotkey.exe
    
    RegDelete HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\AutoHotkey.exe
    
    /*  Files
     */
    
    FileDelete AutoHotkeyU32.exe
    FileDelete AutoHotkeyA32.exe
    FileDelete AutoHotkeyU64.exe
    
    FileDelete AutoHotkeyU32_UIA.exe
    FileDelete AutoHotkeyA32_UIA.exe
    FileDelete AutoHotkeyU64_UIA.exe
    
    FileDelete WindowSpy.ahk
    FileDelete AutoHotkey.chm
    FileDelete license.txt
    
    ; These files would only exist if an older version of AutoHotkey(_L)
    ; installed it:
    FileDelete Update.ahk
    FileDelete AU3_Spy.exe
    
    ; Although the old installer was designed not to overwrite this in
    ; case the user made customizations, the old uninstaller deletes it:
    FileDelete %A_WinDir%\ShellNew\Template.ahk
    
    RemoveCompiler()
    
    FileDelete %ProductName% Website.url
    if (CurrentStartMenu != "") { ; Must not remove A_ProgramsCommon itself!
        local i, lnk
        for i, lnk in ["AutoHotkey", "AutoIt3 Window Spy", "Active Window Info (Window Spy)"
            , "AutoHotkey Help File", "Website", "AutoHotkey Setup", "Convert .ahk to .exe"
            , "Window Spy"]
            FileDelete %A_ProgramsCommon%\%CurrentStartMenu%\%lnk%.lnk
        FileRemoveDir %A_ProgramsCommon%\%CurrentStartMenu% ; Only if empty.
    }
    
    if !SilentMode
        MsgBox 0x2040, AutoHotkey Setup
            , Setup will now close to complete the uninstallation.
    
    ; Try deleting it normally first, in case this script is running
    ; on an external exe (such as via a downloaded installer).
    FileDelete AutoHotkey.exe
    if !ErrorLevel {
        FileDelete Installer.ahk
        SetWorkingDir %A_Temp%  ; Otherwise FileRemoveDir will fail.
        FileRemoveDir %CurrentPath%  ; Only if empty.
        ExitApp
    }
    
    ; Delete certificate and private key used to sign UIA executables.
    try EnableUIAccess_DeleteCertAndKey("AutoHotkey")
    
    Gui Cancel
    
    ; Use cmd.exe to work around the fact that AutoHotkey.exe is locked
    ; while it is still running.  Having a second instance of the script
    ; terminate this instance should be more reliable than performing
    ; an arbitrary wait (e.g. by calling "ping").
    Run %ComSpec% /c "
    (Join`s&`s
    AutoHotkey.exe "%A_ScriptFullPath%" /exec kill %A_ScriptHwnd%
    del Installer.ahk
    del AutoHotkey.exe
    cd %A_Temp%
    rmdir "%CurrentPath%"
    )",, Hide
}


/*  Installation
 */

_Install(opt) {
    global
    
    /*  Validation
     */
    
    local exefile, binfile
    if opt.type = "Unicode" {
        exefile := "AutoHotkeyU32.exe"
        binfile := "Unicode 32-bit.bin"
    } else if opt.type = "x64" && A_Is64bitOS {
        exefile := "AutoHotkeyU64.exe"
        binfile := "Unicode 64-bit.bin"
    } else if opt.type = "ANSI" {
        exefile := "AutoHotkeyA32.exe"
        binfile := "ANSI 32-bit.bin"
    } else
        ErrorExit("Invalid installation type '" opt.type "'")
    
    if !InStr(FileExist(opt.path), "D")
        try
            FileCreateDir % opt.path
        catch
            ErrorExit("Unable to create installation directory ('" opt.path "')")
    
    /*  Preparation
     */
    
    SetWorkingDir % opt.path
    
    ; If the following is "true", we have no source files to install,
    ; but we may have settings to change.  This includes replacing the
    ; binary files with %exefile% and %binfile%.
    installInPlace := (A_WorkingDir = A_ScriptDir)
    
    reopen := CloseScriptsEtc(CurrentPath, "installation")
    
    switchPage("wait")
    
    ; Remove old files which are no longer relevant.
    if (CurrentVersion <= "1.0.48.05") {
        FileDelete Compiler\README.txt
        FileDelete Compiler\upx.exe
    }
    FileDelete uninst.exe
    
    if A_Is64bitOS {
        ; For xx-bit installs, write to the xx-bit view of the registry.
        local regView := (opt.type = "x64") ? 64 : 32
        if (CurrentRegView && CurrentRegView != regView) {
            ; Clean up old keys in the other registry view.
            SetRegView % CurrentRegView
            RegDelete HKLM, %UninstallKey%
            RegDelete HKLM, %AutoHotkeyKey%
            RegDelete HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\AutoHotkey.exe
            RegDelete HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Ahk2Exe.exe
        }
        SetRegView % regView
    }
    
    /*  Install Files
     */
    
    UpdateStatus("Copying files")
    
    ; Install all unique files.
    if !installInPlace {
        InstallMainFiles()
        if opt.ahk2exe
            InstallCompilerFiles()
    }
    
    ; Create UIA files from main files.
    InstallUIAccessFiles(opt.uiAccess)
    
    ; If the user deselected Ahk2Exe and it was previously installed,
    ; ensure it is removed.
    if !opt.ahk2exe
        RemoveCompiler()
    
    ; Create the "default" binaries, corresponding to whichever version
    ; the user selected.
    if !installInPlace
        InstallFile(exefile, "AutoHotkey.exe")
    ;else: a workaround is needed later.
    if opt.ahk2exe
        InstallFile("Compiler\" binfile, "Compiler\AutoHotkeySC.bin")
    
    /*  Start Menu Shortcuts
     */
    
    if CurrentStartMenu
        FileRemoveDir %A_ProgramsCommon%\%CurrentStartMenu%, 1
    
    if opt.menu {
        UpdateStatus("Creating shortcuts")
        local smpath := A_ProgramsCommon "\" opt.menu
        FileCreateDir %smpath%
        FileCreateShortcut %A_WorkingDir%\AutoHotkey.exe, %smpath%\AutoHotkey.lnk
        FileDelete %smpath%\AutoIt3 Window Spy.lnk
        FileCreateShortcut %A_WorkingDir%\WindowSpy.ahk, %smpath%\Window Spy.lnk
        FileCreateShortcut %A_WorkingDir%\AutoHotkey.chm, %smpath%\AutoHotkey Help File.lnk
        IniWrite %ProductWebsite%, %ProductName% Website.url, InternetShortcut, URL
        FileCreateShortcut %A_WorkingDir%\%ProductName% Website.url, %smpath%\Website.lnk
        FileCreateShortcut %A_WorkingDir%\Installer.ahk, %smpath%\AutoHotkey Setup.lnk
            ,,,, %A_WinDir%\System32\appwiz.cpl,, -1499
        if opt.ahk2exe
            FileCreateShortcut %A_WorkingDir%\Compiler\Ahk2Exe.exe
                , %smpath%\Convert .ahk to .exe.lnk
    }
    
    /*  Registry
     */
    
    UpdateStatus("Configuring registry")
    
    RegWrite REG_SZ, HKLM, %AutoHotkeyKey%, InstallDir, %A_WorkingDir%
    RegWrite REG_SZ, HKLM, %AutoHotkeyKey%, Version, %ProductVersion%
    if opt.menu
        RegWrite REG_SZ, HKLM, %AutoHotkeyKey%, StartMenuFolder, % opt.menu
    else
        RegDelete HKLM, %AutoHotkeyKey%, StartMenuFolder
    
    ; Might need to get rid of this to allow the ShellNew template to work:
    RegDelete HKCR, ahk_auto_file
    RegWrite REG_SZ, HKCR, .ahk,, %FileTypeKey%
    RegWrite REG_SZ, HKCR, .ahk\ShellNew, FileName, Template.ahk
    
    RegWrite REG_SZ, HKCR, %FileTypeKey%,, AutoHotkey Script
    RegWrite REG_SZ, HKCR, %FileTypeKey%\DefaultIcon,, %A_WorkingDir%\AutoHotkey.exe`,1
    
    ; Set up system verbs:
    RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\Open,, Run Script
    RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\Edit,, Edit Script
    if opt.ahk2exe
        RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\Compile,, Compile Script
    
    local value
    
    ; Set default action, but don't overwrite.
    try
        RegRead value, HKCR, %FileTypeKey%\Shell,
    catch   ; Key likely doesn't exist.
        RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell,, Open
    
    ; Set editor, but don't overwrite.
    try
        RegRead value, HKCR, %FileTypeKey%\Shell\Edit\Command,
    catch
        RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\Edit\Command,, notepad.exe `%1
    
    if opt.ahk2exe
        RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\Compile\Command,, "%A_WorkingDir%\Compiler\Ahk2Exe.exe" /in "`%l"
    
    local cmd
    cmd = "%A_WorkingDir%\AutoHotkey.exe"
    if opt.utf8
        cmd = %cmd% /CP65001
    cmd = %cmd% "`%1" `%*
    RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\Open\Command,, %cmd%
    
    if UACIsEnabled {
        ; Run as administrator
        RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\RunAs\Command,, "%A_WorkingDir%\AutoHotkey.exe" "`%1" `%*
        RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\RunAs, HasLUAShield
        ; Run with UI Access
        if opt.uiAccess && FileExist(uiafile := StrReplace(exefile, ".exe", "_UIA.exe")) {
            RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\uiAccess,, Run with UI Access
            RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\uiAccess\Command,, "%A_WorkingDir%\%uiafile%" "`%1" `%*
        } else
            RegDelete HKCR, %FileTypeKey%\Shell\uiAccess
    }
    
    if opt.dragdrop
        RegWrite REG_SZ, HKCR, %FileTypeKey%\ShellEx\DropHandler,, {86C86720-42A0-1069-A2E8-08002B30309D}
    else
        RegDelete HKCR, %FileTypeKey%\ShellEx
    
    ; App Paths registration isn't strictly necessary, so it's not done for the other exe versions.
    RegWrite REG_SZ, HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\AutoHotkey.exe,, %A_WorkingDir%\AutoHotkey.exe
    if opt.ahk2exe
        RegWrite REG_SZ, HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Ahk2Exe.exe,, %A_WorkingDir%\Compiler\Ahk2Exe.exe
    
    local suffixList := "|A32|U32|U64|A32_UIA|U32_UIA|U64_UIA"
    Loop Parse, suffixList, |
    {
        RegDelete HKCR, Applications\AutoHotkey%A_LoopField%.exe
        if opt.isHostApp && FileExist("AutoHotkey" A_LoopField ".exe")
            RegWrite REG_SZ, HKCR, Applications\AutoHotkey%A_LoopField%.exe, IsHostApp
    }
    
    ; Write uninstaller info.
    RegWrite REG_SZ, HKLM, %UninstallKey%, DisplayName, %ProductName% %ProductVersion%
    RegWrite REG_SZ, HKLM, %UninstallKey%, UninstallString, "%A_WorkingDir%\AutoHotkey.exe" "%A_WorkingDir%\Installer.ahk"
    RegWrite REG_SZ, HKLM, %UninstallKey%, DisplayIcon, %A_WorkingDir%\AutoHotkey.exe
    RegWrite REG_SZ, HKLM, %UninstallKey%, DisplayVersion, %ProductVersion%
    RegWrite REG_SZ, HKLM, %UninstallKey%, URLInfoAbout, %ProductWebsite%
    RegWrite REG_SZ, HKLM, %UninstallKey%, Publisher, %ProductPublisher%
    RegWrite REG_SZ, HKLM, %UninstallKey%, NoModify, 1
    
    ; Notify other programs (e.g. explorer.exe) that file type associations have changed.
    ; This may be necessary to update the icon when upgrading from an older version of AHK.
    DllCall("shell32\SHChangeNotify", "uint", 0x08000000, "uint", 0, "int", 0, "int", 0) ; SHCNE_ASSOCCHANGED
    
    UpdateStatus("")
    
    if installInPlace {
        ; As AutoHotkey.exe is probably in use by this script, the final
        ; step will be completed by another instance of this script:
        reopen_args := ""
        for _, script in reopen
            reopen_args .= " """ script.path """ """ script.exe """"
        Run .\AutoHotkeyU32.exe "%A_ScriptFullPath%"
                /exec kill %A_ScriptHwnd%
                /exec setExe %exefile% %SilentMode%
                /exec reopen%reopen_args%
        ExitApp
    }
    
    ReopenScripts(reopen)
    
    SwitchDone()
}

SwitchDone() {
    getWindow().document.body.className := ""
    switchPage("done")
}

Exec_Reopen(args*) {
    reopen := []
    while args.Length()
        reopen.Push({path: args.RemoveAt(1), exe: args.RemoveAt(1)})
    global AutoRestart := true
    ReopenScripts(reopen)
}

InstallFile(file, target="") {
    global
    if (target = "")
        target := file
    Loop { ; Retry loop.
        try {
            FileCopy %SourceDir%\%file%, %target%, 1
            ; If successful (no exception thrown):
            return
        }
        if SilentMode {
            SilentErrors += 1
            return  ; Continue anyway.
        }
        local error_message := RTrim(GetErrorMessage(), "`r`n")
        MsgBox 0x2012, AutoHotkey Setup,
        (LTrim
        Error installing file "%target%"
        
        Specifically: %error_message%
        
        Click Abort to stop the installation,
        Retry to try again, or
        Ignore to skip this file.
        )
        IfMsgBox Abort
            ExitApp
        IfMsgBox Ignore
            return
    }
}

InstallMainFiles() {
    InstallFile("AutoHotkeyU32.exe")
    InstallFile("AutoHotkeyA32.exe")
    if A_Is64bitOS
        InstallFile("AutoHotkeyU64.exe")
    
    InstallFile("WindowSpy.ahk")
    InstallFile("AutoHotkey.chm")
    InstallFile("license.txt")
    
    InstallFile("Installer.ahk")
    
    if !FileExist(A_WinDir "\ShellNew\Template.ahk") {
        FileCreateDir %A_WinDir%\ShellNew
        InstallFile("Template.ahk", A_WinDir "\ShellNew\Template.ahk")
    }
}

InstallUIAccessFiles(create) {
    local suffixList := "A32|U32" (A_Is64bitOS ? "|U64" : "")
    Loop Parse, suffixList, |
    {
        file = AutoHotkey%A_LoopField%_UIA.exe
        if !(create || FileExist(file))
            continue
        FileCopy AutoHotkey%A_LoopField%.exe, %file%, 1
        try
            EnableUIAccess(file)
        catch
            MsgBox 48, AutoHotkey Setup, Error creating %file%. ; Non-critical.
    }
}

installdir_allowed(path) {
    local w := getWindow()
    if w.enableuiaccess.checked && !IsTrustedLocation(path) {
        MsgBox 0x2034, AutoHotkey Setup, Installing to "%path%" will disable the "Run with UI Access" option`, which requires that you install to a subdirectory of Program Files.`n`nInstall here anyway?
        IfMsgBox No
            return false
        w.enableuiaccess.checked := false
    }
    return true
}

installdir_onchange() {
    local w := getWindow()
    if !installdir_allowed(w.installdir.value)
        w.installdir.value := DefaultPath
}

enableuiaccess_onchange() {
    local w := getWindow()
    if w.enableuiaccess.checked && !IsTrustedLocation(w.installdir.value) {
        w.enableuiaccess.checked := false
        MsgBox 0x2030, AutoHotkey Setup, This option requires installing AutoHotkey to a subdirectory of Program Files.
    }
}

IsTrustedLocation(path) { ; http://msdn.com/library/bb756929
    EnvGet other, % A_PtrSize=8 ? "ProgramFiles(x86)" : "ProgramW6432"
    return InStr(path, A_ProgramFiles "\") = 1
        || other && InStr(path, other "\") = 1
}

EnableUIAccess(filename)
{
    hStore := DllCall("Crypt32\CertOpenStore", "ptr", 10 ; STORE_PROV_SYSTEM_W
        , "uint", 0, "ptr", 0, "uint", 0x20000 ; SYSTEM_STORE_LOCAL_MACHINE
        , "wstr", "Root", "ptr")
    if !hStore
        throw
    p := DllCall("Crypt32\CertFindCertificateInStore", "ptr", hStore
        , "uint", 0x10001 ; X509_ASN_ENCODING|PKCS_7_ASN_ENCODING
        , "uint", 0, "uint", 0x80007 ; FIND_SUBJECT_STR
        , "wstr", "AutoHotkey", "ptr", 0, "ptr")
    if p
        cert := new CertContext(p)
    else
        cert := EnableUIAccess_CreateCert("AutoHotkey", hStore)
    EnableUIAccess_SetManifest(filename)
    EnableUIAccess_SignFile(filename, cert, "AutoHotkey")
}
EnableUIAccess_SetManifest(file)
{
    xml := ComObjCreate("Msxml2.DOMDocument")
    xml.async := false
    xml.setProperty("SelectionLanguage", "XPath")
    xml.setProperty("SelectionNamespaces"
        , "xmlns:v1='urn:schemas-microsoft-com:asm.v1' "
        . "xmlns:v3='urn:schemas-microsoft-com:asm.v3'")
    if !xml.load("res://" file "/#24/#1") ; Load current manifest
        throw
    node := xml.selectSingleNode("/v1:assembly/v3:trustInfo/v3:security"
                    . "/v3:requestedPrivileges/v3:requestedExecutionLevel")
    if !node ; Not AutoHotkey v1.1?
        throw
    node.setAttribute("uiAccess", "true")
    xml := RTrim(xml.xml, "`r`n")
    VarSetCapacity(data, data_size := StrPut(xml, "utf-8") - 1)
    StrPut(xml, &data, "utf-8")
    if !(hupd := DllCall("BeginUpdateResource", "str", file, "int", false))
        throw
    r := DllCall("UpdateResource", "ptr", hupd, "ptr", 24, "ptr", 1
                    , "ushort", 1033, "ptr", &data, "uint", data_size)
    if !DllCall("EndUpdateResource", "ptr", hupd, "int", !r) && r
        throw
}
EnableUIAccess_CreateCert(CertName, hStore)
{
    if !DllCall("Advapi32\CryptAcquireContext", "ptr*", hProv
        , "str", CertName, "ptr", 0, "uint", 1, "uint", 0) ; PROV_RSA_FULL=1, open existing=0
    {
        if !DllCall("Advapi32\CryptAcquireContext", "ptr*", hProv
            , "str", CertName, "ptr", 0, "uint", 1, "uint", 8) ; PROV_RSA_FULL=1, CRYPT_NEWKEYSET=8
            throw
        prov := new CryptContext(hProv)
        if !DllCall("Advapi32\CryptGenKey", "ptr", hProv
                , "uint", 2, "uint", 0x4000001, "ptr*", hKey) ; AT_SIGNATURE=2, EXPORTABLE=..01
            throw
        (new CryptKey(hKey)) ; To immediately release it.
    }
    Loop 2
    {
        if A_Index = 1
            pbName := cbName := 0
        else
            VarSetCapacity(bName, cbName), pbName := &bName
        if !DllCall("Crypt32\CertStrToName", "uint", 1, "str", "CN=" CertName
            , "uint", 3, "ptr", 0, "ptr", pbName, "uint*", cbName, "ptr", 0) ; X509_ASN_ENCODING=1, CERT_X500_NAME_STR=3
            throw
    }
    VarSetCapacity(cnb, 2*A_PtrSize), NumPut(pbName, NumPut(cbName, cnb))
    VarSetCapacity(endTime, 16)
    DllCall("GetSystemTime", "ptr", &endTime)
    NumPut(NumGet(endTime, "ushort") + 10, endTime, "ushort") ; += 10 years
    if !hCert := DllCall("Crypt32\CertCreateSelfSignCertificate"
        , "ptr", hProv, "ptr", &cnb, "uint", 0, "ptr", 0
        , "ptr", 0, "ptr", 0, "ptr", &endTime, "ptr", 0, "ptr")
        throw
    cert := new CertContext(hCert)
    if !DllCall("Crypt32\CertAddCertificateContextToStore", "ptr", hStore
        , "ptr", hCert, "uint", 1, "ptr", 0) ; STORE_ADD_NEW=1
        throw
    return cert
}
EnableUIAccess_DeleteCertAndKey(CertName)
{
    DllCall("Advapi32\CryptAcquireContext", "ptr*", undefined
        , "str", CertName, "ptr", 0, "uint", 1, "uint", 16) ; PROV_RSA_FULL=1, CRYPT_DELETEKEYSET=16
    if !hStore := DllCall("Crypt32\CertOpenStore", "ptr", 10 ; STORE_PROV_SYSTEM_W
        , "uint", 0, "ptr", 0, "uint", 0x20000 ; SYSTEM_STORE_LOCAL_MACHINE
        , "wstr", "Root", "ptr")
		throw
	if !p := DllCall("Crypt32\CertFindCertificateInStore", "ptr", hStore
        , "uint", 0x10001 ; X509_ASN_ENCODING|PKCS_7_ASN_ENCODING
        , "uint", 0, "uint", 0x80007 ; FIND_SUBJECT_STR
        , "wstr", CertName, "ptr", 0, "ptr")
		return 0
	if !DllCall("Crypt32\CertDeleteCertificateFromStore", "ptr", p)
		throw
	return 1
}
class CryptContext {
    __New(p) {
        this.p := p
    }
    __Delete() {
        DllCall("Advapi32\CryptReleaseContext", "ptr", this.p, "uint", 0)
    }
}
class CertContext extends CryptContext {
    __Delete() {
        DllCall("Crypt32\CertFreeCertificateContext", "ptr", this.p)
    }
}
class CryptKey extends CryptContext {
    __Delete() {
        DllCall("Advapi32\CryptDestroyKey", "ptr", this.p)
    }
}
EnableUIAccess_SignFile(File, CertCtx, Name)
{
    VarSetCapacity(wfile, 2 * StrPut(File, "utf-16")), StrPut(File, &wfile, "utf-16")
    VarSetCapacity(wname, 2 * StrPut(Name, "utf-16")), StrPut(Name, &wname, "utf-16")
    cert_ptr := IsObject(CertCtx) ? CertCtx.p : CertCtx
    EnableUIAccess_Struct(file_info, "ptr", A_PtrSize*3 ; SIGNER_FILE_INFO
        , "ptr", &wfile)
    VarSetCapacity(dwIndex, 4, 0) ; DWORD
    EnableUIAccess_Struct(subject_info, "ptr", A_PtrSize*4 ; SIGNER_SUBJECT_INFO
        , "ptr", &dwIndex, "ptr", SIGNER_SUBJECT_FILE:=1, "ptr", &file_info)
    EnableUIAccess_Struct(cert_store_info, "ptr", A_PtrSize*4 ; SIGNER_CERT_STORE_INFO
        , "ptr", cert_ptr, "ptr", SIGNER_CERT_POLICY_CHAIN:=2)
    EnableUIAccess_Struct(cert_info, "uint", 8+A_PtrSize*2 ; SIGNER_CERT
        , "uint", SIGNER_CERT_STORE:=2, "ptr", &cert_store_info)
    EnableUIAccess_Struct(authcode_attr, "uint", 8+A_PtrSize*3 ; SIGNER_ATTR_AUTHCODE
        , "int", false, "ptr", true, "ptr", &wname)
    EnableUIAccess_Struct(sig_info, "uint", 8+A_PtrSize*4 ; SIGNER_SIGNATURE_INFO
        , "uint", CALG_SHA1:=0x8004, "ptr", SIGNER_AUTHCODE_ATTR:=1
        , "ptr", &authcode_attr)
    hr := DllCall("MSSign32\SignerSign"
        , "ptr", &subject_info, "ptr", &cert_info, "ptr", &sig_info
        , "ptr", 0, "ptr", 0, "ptr", 0, "ptr", 0, "uint")
    if (hr != 0)
        throw hr
}
EnableUIAccess_Struct(ByRef struct, arg*)
{
    VarSetCapacity(struct, arg[2], 0), p := &struct
    Loop % arg.Length()//2
        p := NumPut(arg[2], p+0, arg[1]), arg.RemoveAt(1, 2)
    return &struct
}

InstallCompilerFiles() {
    FileCreateDir Compiler
    InstallFile("Compiler\Ahk2Exe.exe")
    InstallFile("Compiler\ANSI 32-bit.bin")
    InstallFile("Compiler\Unicode 32-bit.bin")
    ; Install the following file even if !isOS64bit() to support
    ; compiling scripts for 64-bit systems on 32-bit systems:
    InstallFile("Compiler\Unicode 64-bit.bin")
}

RemoveCompiler() {
    global
    FileDelete Compiler\Ahk2Exe.exe
    FileDelete Compiler\ANSI 32-bit.bin
    FileDelete Compiler\Unicode 32-bit.bin
    FileDelete Compiler\Unicode 64-bit.bin
    FileDelete Compiler\AutoHotkeySC.bin
    FileRemoveDir Compiler  ; Only if empty.    
    RegDelete HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Ahk2Exe.exe
}

HandleExec(n) {
    ++n    
    argn := %false%
    while (n <= argn) {
        fn := Func("Exec_" %n%), ++n, args := []
        while (n <= argn) {
            v := %n%, ++n
            if v = /exec
                break
            args.Push(v)
        }
        c := args.Length()
        if !fn || c < fn.MinParams || (c > fn.MaxParams && !fn.IsVariadic)
            ErrorExit("Internal: bad /exec")
        %fn%(args*)
    }
}

Exec_Kill(id) {
    DetectHiddenWindows On
    WinKill ahk_id %id%
    WinWaitClose ahk_id %id%,, 10
}

Exec_SetExe(exefile, SilentMode := false) {
    InstallFile(exefile, "AutoHotkey.exe")
    if !SilentMode
        MsgBox 64, AutoHotkey Setup, The settings have been updated.
}
DefineUI:
html=
(%`
<!DOCTYPE HTML>
<html><head>

<style type="text/css">
body {
	background-color: ButtonFace;
	font-family: "Arial", sans-serif;
	font-size: 14px;
	overflow: hidden;
	cursor: default;
	padding: 0;
	margin: 0;
	border: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 600px;
	height: 400px;
}
h1 {
	font-size: 37px;
	font-weight: normal;
	color: #405871;
	background-color: white;
	padding: 15px 25px;
	margin: 0 -15px;
}
p {
	margin-top: 15px;
}
a:link, a:visited {
	color: #0066CC;
}
.options {
	margin: 0 3em 0 2em;
}
.options a {
	display: block;
	padding: 0.8em 1em;
	margin: 0.3em 0;
	position: relative;
	_height: 1%; /* IE6 hasLayout */
}
.marker {
	position: absolute;
	right: 10px;
	font-size: 25px;
	top: 50%;
	margin-top: -17px;
}
a.button,
.options a {
	border: 1px solid ButtonShadow;
	background-color: white;
	text-decoration: none;
}
a.button {
	padding: .3em .5em;
	text-align: center;
}
a.button,
a.button:visited,
.options a:link,
.options a:visited {
	cursor: hand;
	color: #405871;
}
a.button:hover,
a.button:active, /*IE6*/
.options a:hover,
.options a:active,
.options a:focus {
	background-color: #F8F8FF;
	border-color: #4774B2;
	color: #4774B2;			
}
.options a:active,
.options a:focus {
	left: 3px;
}
.options p {
	font-size: 85%;
	margin: 0.2em 1em;
}
.footer {
	position: absolute;
	bottom: 1em;
	font-size: 85%;
}
p.footer {
	left: 2em;
}
p#extract {
	left: auto;
	right: 2em;
}
.page {
	padding: 15px;
	display: none; /* overridden by script */
	color: ButtonText;
}
.nav {
	background-color: #405871;
	color: white;
	padding: 3px 0;
}
#version_number {
	position: absolute;
	right: 20px;
}
.nav a,
.nav a:visited {
	color: #ddd;
	text-decoration: none;
	padding: 0 5px 3px;
}
.nav a:hover {
	color: white;
}
.nav a.current,
.nav a.current:visited /*IE6*/ {
	color: #405871;
	background-color: ButtonFace;
	cursor: default;
	border-top: 2px solid #60A0F0;
	padding: 0 7px 3px;
	margin: 0 -2px;
}
#configure_nav {
	padding-left: 1em;
	display: none;
}
.custom-mode #configure_nav,
.config-mode #configure_nav {
	display: inline;
}
.config-mode .install-only {
	display: none;
}
.warning {
	display: none;
	background-color: #fee;
	color: #800;
	border: 1px solid #800;
	padding: 0.5em;
	margin: -0.5em 0 1em;
}
.textbox {
	border: 1px solid ButtonShadow;
	padding: 0 0.4em;
	margin: 7px 0 10px;
	height: 29px;
	line-height: 27px;
	vertical-align: top;
}
#installdir, #startmenu {
	width: 70%;
}
#installdir_browse, #startmenu_del {
	padding: 0 0.6em;
	margin: 7px 0 10px;
	height: 29px;
	line-height: 29px;
	display: inline-block;
	background-color: ButtonFace;
}
label {
	padding: 5px;
	display: block;
	width: 90%;
}
label.indent {
	padding-left: 30px;
}
label p {
	font-size: 85%;
	margin: .3em 25px;
	color: #405871;
}
#install_button, #next-button {
	font-size: 125%;
	right: 15px;
	width: 5em;
}
#dl_container {
	position: absolute;
	left: 12%;
	top: 50%;
	width: 80%;
	height: 1em;
	background-color: white;
	border: 1px solid #405871;
}
#dl_progress {
	width: 0;
	height: 100%;
	background-color: #405871;
}
#dl_text {
	position: absolute;
	left: 12%;
	top: 60%;
	width: 80%;
	text-align: center;
}
</style>
<script type="text/javascript">
function forEach(arr, fn) {
	var i;
	for (i = 0; i < arr.length; ++i)
		fn.apply(arr[i]);
}
function selectNavTab(nav, tab) {
	tab = '#' + tab;
	forEach (nav.getElementsByTagName("a"), function() {
		this.className = this.hash == tab ? this.className + ' current '
			: this.className.replace(' current ', '');
	})
}
function onload() {
	forEach (configure_nav.getElementsByTagName("a"), function() {
		this.tabIndex = 1000;
		if (this.hash != "") {
			this.onclick = function() {
				if (event.preventDefault)
					event.preventDefault(); // IE11
				event.returnValue =  // IE8/IE6
				switchPage(this.hash.substr(1));
			}
		}
	})
}
function initOptions(curName, curVer, curType, newVer, instDir, smFolder, defType, is64) {
	if (onload) onload(), onload = null;
	var opt;
	var warn;
	var types = {Unicode: "Unicode 32-bit", ANSI: "ANSI 32-bit", x64: "Unicode 64-bit"};
	var curTypeName = types[curType];
	var defTypeName = types[defType];
	curTypeName = curTypeName ? " (" + curTypeName + ")" : "";
	if (curName == "AutoHotkey" && curVer <= "1.0.48.05") {
		start_intro.innerText = curName + " v" + curVer + " is installed. What do you want to do?";
		var uniType = is64 ? "x64" : "Unicode";
		var uniTypeName = types[uniType];
		opt = [
			"AHK('Upgrade', 'ANSI')", "Upgrade to v" + newVer + " (" + types.ANSI + ")", "Recommended for compatibility.",
			"AHK('Upgrade', '" + uniType + "')", "Upgrade to v" + newVer + " (" + uniTypeName + ")", "",
			"AHK('Customize')", "Custom Installation", ""
		];
		warn = '<strong>Note:</strong> Some AutoHotkey 1.0 scripts are <a href="#" onclick="'+"AHK('ViewHelp', '/docs/Compat.htm'); return false"+'">not compatible</a> with AutoHotkey 1.1.';
	} else if (curName == "") {
		start_intro.innerText = "Please select the type of installation you wish to perform.";
		opt = [
			"AHK('QuickInstall')", "Express Installation", "Default version: " + defTypeName + "<br>Install in: " + instDir,
			"AHK('Customize')", "Custom Installation", ""
		];
	} else if (curVer != newVer) {
		start_intro.innerText = curName + " v" + curVer + curTypeName + " is installed. What do you want to do?";
		opt = [
			"AHK('Upgrade', '" + defType + "')", (curVer < newVer ? "Upgrade" : "Downgrade") + " to v" + newVer + " (" + defTypeName + ")", "",
			"AHK('Customize')", "Custom Installation", ""
		];
	} else {
		start_intro.innerText = curName + " v" + curVer + curTypeName + " is installed. What do you want to do?";
		opt = [
			"AHK('QuickInstall')", "Repair", "",
			"AHK('Customize')", "Modify", "",
			"AHK('Uninstall')", "Uninstall", ""
		];
	}
	var i, html = [];
	for (i = 0; i < opt.length; i += 3) {
		html.push('<a href="#" onclick="', opt[i], '; return false" id="opt', Math.floor(i/3)+1, '"><span>', opt[i+1], '</span>');
		if (opt[i+2])
			html.push('<p>', opt[i+2], '</p>');
		if (opt[i] == "AHK('Customize')")
			html.push('<div class="marker">\u00BB</div>');
		html.push('</a>');
	}
	start_options.innerHTML = html.join("");
	start_warning.innerHTML = warn;
	start_warning.style.display = warn ? "block" : "none";
	version_number.innerHTML = 'version ' + newVer;
	installtype.value = defType;
	installdir.value = instDir;
	startmenu.value = smFolder;
	startmenu.onblur();
	forEach (document.getElementsByTagName("a"), function() {
		if (/*this.className == "button" ||*/ this.parentNode.className == "options")
			this.hideFocus = true;
	})
}
document.onselectstart =
document.oncontextmenu =
document.ondragstart =
	function() {
		return window.event && event.srcElement.tagName == "INPUT" || false;
	};
function setInstallType(type) {
	installtype.value = type;
	switchPage(configureMode ? 'options' : 'location');
	event.returnValue = false;
}
function switchPage(page) {
	page = document.getElementById(page);
	for (var n = page.parentNode.firstChild; n; n = n.nextSibling) if (n.className == "page") {
		if (n != page)
			n.style.display = "none";
		else
			n.style.display = "block";
	}
	selectNavTab(configure_nav, page.id);
	var f;
	switch (page.id) {
	case "version": f = "it_" + installtype.value; break;
	case "location": f = "next-button"; break;
	case "options": f = "install_button"; break;
	case "done": f = "done_exit"; break;
	}
	if (f) {
		// If page == version, it mightn't actually be visible at this point,
		// which causes IE7 (and perhaps older) to throw error 0x80020101.
		try { document.getElementById(f).focus() } catch (ex) { }
	}
	return false;
}
function customInstall() {
	if (startmenu.style.color)
		startmenu.value = '';
	return AHK('CustomInstall');
}</script>
</head><body scroll="no">

<h1>AutoHotkey Setup</h1>
<div class="nav">
  <em id="version_number"></em>
	<span id="configure_nav">
		<a href="#start">home</a>
		<a href="#version">version</a>
		<a href="#location" class="install-only">location</a>
		<a href="#options">options</a>
		<a href="#" onclick="customInstall(); return false" id="nav_install">install</a>
	</span>
	&nbsp;
</div>

<div class="page" id="start">	
	<p id="start_intro"></p>
	<div class="warning" id="start_warning"></div>
	<div class="options" id="start_options"></div>
	<p class="footer">AutoHotkey is open source software: <a href="#" onclick="AHK('ReadLicense'); return false">read license</a></p>
	<p class="footer install-only" id="extract"><a href="#" onclick="AHK('Extract'); return false" title="Save program files without installing.">extract to...</a></p>
</div>

<div class="page" id="version">
	<p>Which version of AutoHotkey.exe should run by default?</p>
	<input type="hidden" id="installtype">
	<div class="options">
		<a href="#" id="it_Unicode" onclick="setInstallType('Unicode')">Unicode 32-bit
			<p>Recommended for new installations/scripts.</p> <div class="marker">&#187;</div></a>
		<a href="#" id="it_x64" onclick="setInstallType('x64')">Unicode 64-bit
			<p>Faster, but compiled scripts won't run on 32-bit systems.</p> <div class="marker">&#187;</div></a>
		<a href="#" id="it_ANSI" onclick="setInstallType('ANSI')">ANSI 32-bit
			<p>Better compatibility with some legacy scripts.</p> <div class="marker">&#187;</div></a>
	</div>
	<p class="footer"><a id="versionhelp" href="#" onclick="AHK('ViewHelp', '/docs/Compat.htm#Format'); return false">More information</a></p>
</div>

<div class="page" id="location">
	<label for="installdir" class="indent">Install location:<br>
	<input type="text" class="textbox" id="installdir" value="C:\Program Files\AutoHotkey"> <a href="#" onclick="AHK('SelectFolder', 'installdir', 'Select the folder to install AutoHotkey in.'); return false" id="installdir_browse" class="button">Browse</a></label>
	<label for="startmenu" class="indent"> Create shortcuts in the following Start menu folder:<br>
	<input type="text" class="textbox" id="startmenu" value="AutoHotkey"
		onfocus="if (style.color) value='', style.color = '';"
		onblur="if (value == '') value = '(don\'t create shortcuts)', style.color = '#888';">
	<a href="#" id="startmenu_del" class="button" style="color:red"
		onclick = "startmenu.value=''; startmenu.onblur(); return false;">X</a>
	</label>
	<a href="#" onclick="switchPage('options'); return false" class="button footer" id="next-button">Next</a>
</div>

<div class="page" id="options">
	<label for="installcompiler" class="install-only"><input type="checkbox" id="installcompiler" checked="checked"> Install script compiler
		<p>Installs Ahk2Exe, a tool to convert any .ahk script into a stand-alone EXE.<br>
		Also adds a "Compile" option to .ahk context menus.</p></label>
	<label for="enabledragdrop"><input type="checkbox" id="enabledragdrop"> Enable drag &amp; drop
		<p>Files dropped onto a .ahk script will launch that script (the files will be passed as parameters).  This can lead to accidental launching so you may wish to disable it.</p></label>
	<label for="separatebuttons"><input type="checkbox" id="separatebuttons"> Separate taskbar buttons
		<p>Causes each script which has visible windows to be treated as a separate program, but prevents AutoHotkey.exe from being pinned to the taskbar. <a href="#" onclick="AHK('ViewHelp', '/docs/Program.htm#Installer_IsHostApp')">[help]</a></p></label>
	<label for="enableuiaccess"><input type="checkbox" id="enableuiaccess"> Add 'Run with UI Access' to context menus
		<p>UI Access enables scripts to automate administrative programs. <a href="#" onclick="AHK('ViewHelp', '/docs/Program.htm#Installer_uiAccess')">[help]</a></p></label>
	<a href="#" onclick="customInstall(); return false" id="install_button" class="button footer">Install</a>
</div>

<div class="page" id="wait">
	<p style="color: #999; font-size: 120%; text-align: center; margin-top: 5em">this shouldn't take long...</p>
	<p style="text-align: center" id="install_status"></p>
</div>

<div class="page" id="done">
	<p>Installation complete.</p>
	<div class="options">
		<a href="#" onclick="AHK('ViewHelp', '/docs/AHKL_ChangeLog.htm'); return false">View Changes &amp; New Features</a>
		<a href="#" onclick="AHK('ViewHelp', '/docs/Tutorial.htm'); return false">View the Tutorial</a>
		<a href="#" onclick="AHK('RunAutoHotkey'); return false">Run AutoHotkey</a>
		<a href="#" onclick="AHK('Quit'); return false" id="done_exit">Exit</a>
	</div>
</div>

<div class="page" id="downloading">
	<div id="dl_container"><div id="dl_progress"></div></div>
	<div id="dl_text">Connecting...</div>
</div>

</body></html>
)
return