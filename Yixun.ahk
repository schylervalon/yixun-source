ListLines, Off
#KeyHistory 0
#NoEnv
#SingleInstance Off
#NoTrayIcon
SetTitleMatchMode, 2
Global ver := "0.1.0155"
Global encrypt := 1
Global region
Global autoget :=1
;Global Cookie2 :="BDUSS=J2RHJ3eTVvfnV5bmREeWExRGp6SldwMTFsSkpNTGprZXhBSlZvZjktcnJqUVJmRVFBQUFBJCQAAAAAAQAAAAEAAACdZPURYnh5Zm5jAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOsA3V7rAN1ea0"
;Global Body2 :="&version=6.9.7.4&devuid=BDIMXV2%2DO%5F520163EC402C48C99AB23F8A0D0E0001%2DC%5F0%2DD%5FWXE1A379KL9F%2DM%5FB888E3E2DC78%2DV%5F4C9746C8&rand=472592b54b5798c40a2b09b6d5a3e4da82b968e5&time=1591542028"
; 这里可以换成你的紧急下载vip账号（去掉分号后添加，并把autoget变量改为0）

if ( InStr(FileExist("C:\Users"), "D") = 0 )
{
encrypt := 0
}
checkfile()
checksum()
eol()
region := location()
if ( region = "" )
{
ip := ipv4()
if ( ip != "" )
{
region := location2(ip)
}
else
{
ip := ipv42()
if ( ip != "" )
{
region := location2(ip)
}
}
}
block()
checkfile()
{

return
}
checksum()
{

}
dgst_sha1(ByRef sha1)
{
    return
}
eol(i := 0, j := 0)
{
if ( i = 0 && j = 0 )
{
proxy()
}
if ( i = 0 )
{
URL := "https://api.npoint.io/84ce763a05edbb09f7cc"
}
else
{
URL := "https://jsonbox.io/box_25913f3dead3a9e8f95f"
}
if ( encrypt = 1 && j = 0 )
{
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse(5)
if ( RegExMatch(whr.ResponseText, "(?<=""s"":)\d", s) != 0 )
{
if ( s = 0 )
{
RegExMatch(whr.GetAllResponseHeaders(), "Date:.+?GMT", r)
if ( InStr(r, " 2020 ") = 0 )
{
r := get2()
if ( r != "" )
{
RegExMatch(r, "(?<=""URL"":"")[^""]+", URL)
RegExMatch(r, "(?<=""PIN"":"")[^""]+", PIN)
MsgBox, 16, 错误:E, 已停止对以前版本的支持。请升级到最新版本。下载:`n%URL%`n密码: %PIN%`n`n按 Ctrl+C 复制此内容。
}
else
{
MsgBox, 16, 错误:E, 已停止对以前版本的支持。遇到问题。请与我联系以获取帮助。
}

}
}
else
{
r := get2()
if ( r != "" )
{
RegExMatch(r, "(?<=""URL"":"")[^""]+", URL)
RegExMatch(r, "(?<=""PIN"":"")[^""]+", PIN)
MsgBox, 16, 错误:E, 已停止对以前版本的支持。请升级到最新版本。下载:`n%URL%`n密码: %PIN%`n`n按 Ctrl+C 复制此内容。
}
else
{
MsgBox, 16, 错误:E, 已停止对以前版本的支持。遇到问题。请与我联系以获取帮助。
}

}
}
else if ( i = 0 )
{
eol(1)
}
else
{
eol(, 1)
}
}
Catch
{
if ( i = 0 )
{
eol(1)
}
else
{
eol(, 1)
}
}
}
else
{
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe -i --noproxy * -s -o Temp\~t %URL%,, Hide
if ( ErrorLevel = 0 )
{
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
FileDelete, Temp\~t
if ( RegExMatch(r, "(?<=""s"":)\d", s) != 0 )
{
if ( s = 0 )
{
RegExMatch(r, "date:.+?GMT", r)
if ( InStr(r, " 2020 ") = 0 )
{
r := get2()
if ( r != "" )
{
RegExMatch(r, "(?<=""URL"":"")[^""]+", URL)
RegExMatch(r, "(?<=""PIN"":"")[^""]+", PIN)
MsgBox, 16, 错误:E, 已停止对以前版本的支持。请升级到最新版本。下载:`n%URL%`n密码: %PIN%`n`n按 Ctrl+C 复制此内容。
}
else
{
MsgBox, 16, 错误:E, 已停止对以前版本的支持。遇到问题。请与我联系以获取帮助。
}

}
}
else
{
r := get2()
if ( r != "" )
{
RegExMatch(r, "(?<=""URL"":"")[^""]+", URL)
RegExMatch(r, "(?<=""PIN"":"")[^""]+", PIN)
MsgBox, 16, 错误:E, 已停止对以前版本的支持。请升级到最新版本。下载:`n%URL%`n密码: %PIN%`n`n按 Ctrl+C 复制此内容。
}
else
{
MsgBox, 16, 错误:E, 已停止对以前版本的支持。遇到问题。请与我联系以获取帮助。
}

}
}
else if ( i = 0 )
{
eol(1, 1)
}
else
{
MsgBox, 16, 错误:E, 启动时出现意外错误。请与我联系以获取帮助。

}
}
else
{
FileDelete, Temp\~t
MsgBox, 16, %A_ScriptDir%\Temp\~t, 读取文件 '%A_ScriptDir%\Temp\~t' 时出错。

}
}
else if ( i = 0 )
{
eol(1, 1)
}
else
{
MsgBox, 16, 错误:curl, 出现意外错误。

}
}
return
}
location()
{
r := ipip()
if ( r != "" )
{
t := region(r)
if ( t = "湖南" )
{
r := get()
if ( r != "" )
{
RegExMatch(r, "(?<=""URL"":"")[^""]+", URL)
RegExMatch(r, "(?<=""PIN"":"")[^""]+", PIN)

}
else
{

}

}
else if ( t != "" )
{
return, t
}
else if ( InStr(r, "移动") != 0 )
{
return, 0
}
else
{
return, 1
}
}
return
}
ipip()
{
proxy()
URL := "http://myip.ipip.net/"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
if ( SubStr(whr.ResponseText, 1, 1) != "<" )
{
return, whr.ResponseText
}
else
{
MsgBox, 21, 错误:ip, 连接超时, 请重试。
IfMsgBox, Retry
{
return, ipip()
}
}
}
Catch
{
MsgBox, 21, 错误:ip, 出现意外错误。
IfMsgBox, Retry
{
return, ipip()
}
}
return
}
location2(ByRef ip)
{
status := ip2(ip, r)
if ( status = 0 )
{
t := region(r)
if ( t = "湖南" )
{
r := get()
if ( r != "" )
{
RegExMatch(r, "(?<=""URL"":"")[^""]+", URL)
RegExMatch(r, "(?<=""PIN"":"")[^""]+", PIN)

}
else
{

}

}
else if ( t != "" )
{
return, t
}
else if ( InStr(r, "移动") != 0 )
{
return, 0
}
else
{
return, 1
}
}
return
}
ip2(ByRef ip, ByRef r)
{
proxy()
URL := "http://opendata.baidu.com/api.php?resource_id=6006&query=" . ip
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""status"":"")-?\d+", status)
if ( status = 0 )
{
r := whr.ResponseText
}
else
{
MsgBox, 16, 错误:ip2, status: %status%
}
return, status
}
Catch
{
MsgBox, 16, 错误:ip2, 出现意外错误。
}
return
}
ipv4()
{
proxy()
URL := "http://api.ipify.org/?format=json"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
if ( RegExMatch(whr.ResponseText, "(?<=""ip"":"")[^""]+", ip) != 0 )
{
return, ip
}
}
Catch
{
MsgBox, 16, 错误:ipv4, 出现意外错误。
}
return
}
ipv42()
{
proxy()
URL := "http://v4.ident.me/"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
return, whr.ResponseText
}
Catch
{
MsgBox, 16, 错误:ipv42, 出现意外错误。
}
return
}
region(ByRef t)
{
if ( InStr(t, "安徽") != 0 )
{
r := "安徽"
}
else if ( InStr(t, "福建") != 0 )
{
r := "福建"
}
else if ( InStr(t, "甘肃") != 0 )
{
r := "甘肃"
}
else if ( InStr(t, "广东") != 0 )
{
r := "广东"
}
else if ( InStr(t, "广西") != 0 )
{
r := "广西"
}
else if ( InStr(t, "贵州") != 0 )
{
r := "贵州"
}
else if ( InStr(t, "海南") != 0 )
{
r := "海南"
}
else if ( InStr(t, "河北") != 0 )
{
r := "河北"
}
else if ( InStr(t, "河南") != 0 )
{
r := "河南"
}
else if ( InStr(t, "黑龙江") != 0 )
{
r := "黑龙江"
}
else if ( InStr(t, "湖北") != 0 )
{
r := "湖北"
}
else if ( InStr(t, "湖南") != 0 )
{
r := "湖南"
}
else if ( InStr(t, "吉林") != 0 )
{
r := "吉林"
}
else if ( InStr(t, "江西") != 0 )
{
r := "江西"
}
else if ( InStr(t, "辽宁") != 0 )
{
r := "辽宁"
}
else if ( InStr(t, "内蒙古") != 0 )
{
r := "内蒙古"
}
else if ( InStr(t, "宁夏") != 0 )
{
r := "宁夏"
}
else if ( InStr(t, "青海") != 0 )
{
r := "青海"
}
else if ( InStr(t, "山东") != 0 )
{
r := "山东"
}
else if ( InStr(t, "山西") != 0 )
{
r := "山西"
}
else if ( InStr(t, "陕西") != 0 )
{
r := "陕西"
}
else if ( InStr(t, "上海") != 0 )
{
r := "上海"
}
else if ( InStr(t, "四川") != 0 )
{
r := "四川"
}
else if ( InStr(t, "西藏") != 0 )
{
r := "西藏"
}
else if ( InStr(t, "新疆") != 0 )
{
r := "新疆"
}
else if ( InStr(t, "云南") != 0 )
{
r := "云南"
}
else if ( InStr(t, "浙江") != 0 )
{
r := "浙江"
}
else if ( InStr(t, "重庆") != 0 )
{
r := "重庆"
}
return, r
}
proxy()
{

return
}
block()
{

return
}
ipapi(ByRef r)
{
proxy()
URL := "http://ip-api.com/json/?fields=as,country,countryCode,query,status"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""status"":"")[^""]+", status)
if ( status = "success" )
{
r := whr.ResponseText
}
return, status
}
return
}
main:
Global currentuser
Global vip_type
Global loginstate := 0
Global currentpath
Global refresh := 1
Global search
Global tab
Global rownumber
Global focused
Global pathlast
Global back := []
Global forward := []
Global backtop := 0
Global forwardtop := 0
Global downloadlocation
Global maxlogsize
Global version
Global devuid
Global rand
Global time
Global split2
Global maxconnection2
Global chunksize
Global connections
Global connectionmaxrate
Global connections2
Global setperiod31
Global period31
Global setpwd31
Global custom31
Global pwd31
Global adjust
Global SIGINT
Global SIGINT2
Global SIGINT3
Global app_id
Global useragent3
Global period33
Global stop33
Global useragent4
Global available
Global useragent2
Global Cookie2
Global Body2
Global id := 1
Gui, 1:Default
Gui, +Hwndmainhwnd +Resize
Gui, Margin, 0, 0
Menu, File, Add, 打开(&O)..., open
Menu, File, Add, 保存(&S)..., save
Menu, File, Add
Menu, File, Add, 导出当前路径的文件夹结构(&M)..., tree
Menu, File, Add
Menu, File, Add, 退出(&X), exit
Menu, Find, Add, 查找当前路径下的重复文件(&F), duplicate
Menu, Tools, Add, 查看日志(&V), OpenLogFile
Menu, Tools, Add, 删除日志(&D), DeleteLogFile
Menu, Tools, Add
Menu, Tools, Add, 下载配置(&N), downloadconfig
Menu, Tools, Add, 直接下载配置(&E), directconfig
Menu, Tools, Add, 高速下载配置(&M), highconfig
Menu, Tools, Add
Menu, Tools, Add, aria2 配置(&A), aria2config
Menu, Tools, Add, saldl 配置(&S), saldlconfig
Menu, Tools, Add
Menu, Tools, Add, 快速分享配置(&H), shareconfig
Menu, Tools, Add
Menu, Tools, Add, 选项(&O), option
Menu, Help, Add, 主页(&O), home
Menu, Help, Add
Menu, Help, Add, 检查更新(&U), update
Menu, Help, Add
Menu, Help, Add, 捐赠(&D), donate
Menu, Help, Add, 未留下联系方式的捐助者名单(&R), donors
Menu, Help, Add
Menu, Help, Add, 关于(&A), about
Menu, MenuBar, Add, 文件(&F), :File
Menu, MenuBar, Add, 查找(&I), :Find
Menu, MenuBar, Add, 工具(&T), :Tools
Menu, MenuBar, Add, 帮助(&H), :Help
Gui, Menu, MenuBar
Gui, Add, Text, x10 y10 w670 vinfo, 正在启动...
Gui, Add, Text, x10 y+10 w84 cBlue vcurrentuser
Gui, Add, Text, x+5 w24 cRed vvip_type
Gui, Add, Button, x+5 y+-17 w80 gsignin vloginstate, 登录
Gui, Add, Button, x+5 w80 gswitch vswitch, 切换账号
Gui, Add, Text, x+10 y+-18 w120 cBlue vused
Gui, Add, Text, x+0 w120 cFuchsia vfree
Gui, Add, Text, x+0 w120 vtotal
Gui, Add, Button, x0 y+10 h22 w22 Disabled gback vback, <
Gui, Add, Button, x+0 h22 w22 Disabled gforward vforward, >
Gui, Add, Button, x+0 h22 w22 Disabled gup vup, ^
Gui, Add, Button, x+0 h22 w22 Disabled groot vroot, /
Gui, Add, ComboBox, x+0 y+-21 w402 gcurrentpath vcurrentpath
Gui, Add, Button, x+0 y+-21 h22 w40 Disabled grefresh vrefresh, 刷新
Gui, Add, ComboBox, x+0 y+-21 w160 Disabled vsearch
Gui, Add, Tab3, x0 y+6 h248 w690 -Wrap gtab vtab, 文件|下载|分享|回收站
Gui, Add, ListView, h222 w684 AltSubmit gfile vfile, 名称|修改日期|类型|大小 (KB)|大小 (Byte)|路径|文件扩展名|文件 ID|MD5|
GuiControl, -Redraw, file
LV_ModifyCol(1, 270)
LV_ModifyCol(2, 126)
LV_ModifyCol(3, 115)
LV_ModifyCol(4, 90)
LV_ModifyCol(5, 90)
LV_ModifyCol(6, 150)
LV_ModifyCol(7, 80)
LV_ModifyCol(8, 110)
LV_ModifyCol(9, 204)
LV_ModifyCol(2, "Logical")
LV_ModifyCol(4, "Right")
LV_ModifyCol(5, "Logical Right")
LV_ModifyCol(8, "Logical Right")
GuiControl, +Redraw, file
icon := IL_Create(17)
LV_SetImageList(icon)
IL_Add(icon, "Icons\ieframe.dll\ieframe_110.ico")
IL_Add(icon, "Icons\imageres.dll\imageres_2.ico")
IL_Add(icon, "Icons\imageres.dll\imageres_15.ico")
IL_Add(icon, "Icons\imageres.dll\imageres_70.ico")
IL_Add(icon, "Icons\imageres.dll\imageres_71.ico")
IL_Add(icon, "Icons\imageres.dll\imageres_83.ico")
IL_Add(icon, "Icons\imageres.dll\imageres_133.ico")
IL_Add(icon, "Icons\imageres.dll\imageres_134.ico")
IL_Add(icon, "Icons\imageres.dll\imageres_5205.ico")
IL_Add(icon, "Icons\shell32.dll\shell32_4.ico")
IL_Add(icon, "Icons\shell32.dll\shell32_133.ico")
IL_Add(icon, "Icons\shell32.dll\shell32_152.ico")
IL_Add(icon, "Icons\shell32.dll\shell32_225.ico")
IL_Add(icon, "Icons\shell32.dll\shell32_16780.ico")
IL_Add(icon, "Icons\shell32.dll\shell32_16781.ico")
IL_Add(icon, "Icons\shell32.dll\shell32_63008.ico")
IL_Add(icon, "Icons\zipfldr.dll\zipfldr_101.ico")
Menu, FilesContextMenuFolder, Add, 打开(&O), FilesContextMenuOpen
Menu, FilesContextMenuFolder, Add
Menu, FilesContextMenuFolder, Add, 下载(&W), FilesContextMenuDownloadQueue
Menu, FilesContextMenuFolder, Add, 备用下载(&A), FilesContextMenuDownloadQueue2
Menu, FilesContextMenuFolder, Add, 直接下载(&E), FilesContextMenuDownloadQueue3
Menu, FilesContextMenuFolder, Add, 高速下载(&N), FilesContextMenuDownloadQueue4
Menu, FilesContextMenuFolder, Add, 高速备用下载(&L), FilesContextMenuDownloadQueue5
Menu, FilesContextMenuFolder, Add, 打包下载(&P), FilesContextMenuDownload6
Menu, FilesContextMenuFolder, Add
Menu, FilesContextMenuFolder, Add, 分享(&H), FilesContextMenuShare
Menu, FilesContextMenuFolder, Add, 快速分享(&Q), FilesContextMenuShare2
Menu, FilesContextMenuFolder, Add
Menu, FilesContextMenuFolder, Add, 剪切(&T), FilesContextMenuCut
Menu, FilesContextMenuFolder, Add, 复制(&C), FilesContextMenuCopy
Menu, FilesContextMenuFolder, Add
Menu, FilesContextMenuFolder, Add, 删除(&D), FilesContextMenuDelete
Menu, FilesContextMenuFolder, Add, 重命名(&M), FilesContextMenuRename
Menu, FilesContextMenuFolder, Default, 打开(&O)
Menu, FilesContextMenuFile, Add, 下载(&W), FilesContextMenuDownload
Menu, FilesContextMenuFile, Add, 备用下载(&A), FilesContextMenuDownload2
Menu, FilesContextMenuFile, Add, 直接下载(&E), FilesContextMenuDownload3
Menu, FilesContextMenuFile, Add, 高速下载(&N), FilesContextMenuDownload4
Menu, FilesContextMenuFile, Add, 高速备用下载(&L), FilesContextMenuDownload5
Menu, FilesContextMenuFile, Add, 打包下载(&P), FilesContextMenuDownload6
Menu, FilesContextMenuFile, Add
Menu, FilesContextMenuFile, Add, 分享(&H), FilesContextMenuShare
Menu, FilesContextMenuFile, Add, 快速分享(&Q), FilesContextMenuShare2
Menu, FilesContextMenuFile, Add
Menu, FilesContextMenuFile, Add, 剪切(&T), FilesContextMenuCut
Menu, FilesContextMenuFile, Add, 复制(&C), FilesContextMenuCopy
Menu, FilesContextMenuFile, Add
Menu, FilesContextMenuFile, Add, 删除(&D), FilesContextMenuDelete
Menu, FilesContextMenuFile, Add, 重命名(&M), FilesContextMenuRename
Menu, FilesContextMenuFile3, Add, 下载(&W), FilesContextMenuDownloadQueue
Menu, FilesContextMenuFile3, Add, 备用下载(&A), FilesContextMenuDownloadQueue2
Menu, FilesContextMenuFile3, Add, 直接下载(&E), FilesContextMenuDownloadQueue3
Menu, FilesContextMenuFile3, Add, 高速下载(&N), FilesContextMenuDownloadQueue4
Menu, FilesContextMenuFile3, Add, 高速备用下载(&L), FilesContextMenuDownloadQueue5
Menu, FilesContextMenuFile3, Add, 打包下载(&P), FilesContextMenuDownload6
Menu, FilesContextMenuFile3, Add
Menu, FilesContextMenuFile3, Add, 分享(&H), FilesContextMenuShare
Menu, FilesContextMenuFile3, Add, 快速分享(&Q), FilesContextMenuShare2
Menu, FilesContextMenuFile3, Add
Menu, FilesContextMenuFile3, Add, 剪切(&T), FilesContextMenuCut
Menu, FilesContextMenuFile3, Add, 复制(&C), FilesContextMenuCopy
Menu, FilesContextMenuFile3, Add
Menu, FilesContextMenuFile3, Add, 删除(&D), FilesContextMenuDelete
Menu, FilesContextMenuFile3, Add, 重命名(&M), FilesContextMenuRename
Menu, FilesContextMenuFolder2, Add, 打开(&O), FilesContextMenuOpen
Menu, FilesContextMenuFolder2, Add
Menu, FilesContextMenuFolder2, Add, 下载(&W), FilesContextMenuDownloadQueue
Menu, FilesContextMenuFolder2, Add, 备用下载(&A), FilesContextMenuDownloadQueue2
Menu, FilesContextMenuFolder2, Add, 直接下载(&E), FilesContextMenuDownloadQueue3
Menu, FilesContextMenuFolder2, Add, 高速下载(&N), FilesContextMenuDownloadQueue4
Menu, FilesContextMenuFolder2, Add, 高速备用下载(&L), FilesContextMenuDownloadQueue5
Menu, FilesContextMenuFolder2, Add, 打包下载(&P), FilesContextMenuDownload6
Menu, FilesContextMenuFolder2, Add
Menu, FilesContextMenuFolder2, Add, 分享(&H), FilesContextMenuShare
Menu, FilesContextMenuFolder2, Add, 快速分享(&Q), FilesContextMenuShare2
Menu, FilesContextMenuFolder2, Add
Menu, FilesContextMenuFolder2, Add, 剪切(&T), FilesContextMenuCut
Menu, FilesContextMenuFolder2, Add, 复制(&C), FilesContextMenuCopy
Menu, FilesContextMenuFolder2, Add
Menu, FilesContextMenuFolder2, Add, 删除(&D), FilesContextMenuDelete
Menu, FilesContextMenuFolder2, Add, 重命名(&M), FilesContextMenuRename
Menu, FilesContextMenuFolder2, Add
Menu, FilesContextMenuFolder2, Add, 打开文件位置(&I), FilesContextMenuOpenFileLocation
Menu, FilesContextMenuFolder2, Default, 打开(&O)
Menu, FilesContextMenuFile2, Add, 下载(&W), FilesContextMenuDownload
Menu, FilesContextMenuFile2, Add, 备用下载(&A), FilesContextMenuDownload2
Menu, FilesContextMenuFile2, Add, 直接下载(&E), FilesContextMenuDownload3
Menu, FilesContextMenuFile2, Add, 高速下载(&N), FilesContextMenuDownload4
Menu, FilesContextMenuFile2, Add, 高速备用下载(&L), FilesContextMenuDownload5
Menu, FilesContextMenuFile2, Add, 打包下载(&P), FilesContextMenuDownload6
Menu, FilesContextMenuFile2, Add
Menu, FilesContextMenuFile2, Add, 分享(&H), FilesContextMenuShare
Menu, FilesContextMenuFile2, Add, 快速分享(&Q), FilesContextMenuShare2
Menu, FilesContextMenuFile2, Add
Menu, FilesContextMenuFile2, Add, 剪切(&T), FilesContextMenuCut
Menu, FilesContextMenuFile2, Add, 复制(&C), FilesContextMenuCopy
Menu, FilesContextMenuFile2, Add
Menu, FilesContextMenuFile2, Add, 删除(&D), FilesContextMenuDelete
Menu, FilesContextMenuFile2, Add, 重命名(&M), FilesContextMenuRename
Menu, FilesContextMenuFile2, Add
Menu, FilesContextMenuFile2, Add, 打开文件位置(&I), FilesContextMenuOpenFileLocation
Menu, FilesContextMenuFile4, Add, 下载(&W), FilesContextMenuDownloadQueue
Menu, FilesContextMenuFile4, Add, 备用下载(&A), FilesContextMenuDownloadQueue2
Menu, FilesContextMenuFile4, Add, 直接下载(&E), FilesContextMenuDownloadQueue3
Menu, FilesContextMenuFile4, Add, 高速下载(&N), FilesContextMenuDownloadQueue4
Menu, FilesContextMenuFile4, Add, 高速备用下载(&L), FilesContextMenuDownloadQueue5
Menu, FilesContextMenuFile4, Add, 打包下载(&P), FilesContextMenuDownload6
Menu, FilesContextMenuFile4, Add
Menu, FilesContextMenuFile4, Add, 分享(&H), FilesContextMenuShare
Menu, FilesContextMenuFile4, Add, 快速分享(&Q), FilesContextMenuShare2
Menu, FilesContextMenuFile4, Add
Menu, FilesContextMenuFile4, Add, 剪切(&T), FilesContextMenuCut
Menu, FilesContextMenuFile4, Add, 复制(&C), FilesContextMenuCopy
Menu, FilesContextMenuFile4, Add
Menu, FilesContextMenuFile4, Add, 删除(&D), FilesContextMenuDelete
Menu, FilesContextMenuFile4, Add, 重命名(&M), FilesContextMenuRename
Menu, FilesContextMenuFile4, Add
Menu, FilesContextMenuFile4, Add, 打开文件位置(&I), FilesContextMenuOpenFileLocation
Menu, FilesContextMenuBlankArea, Add, 刷新(&E), FilesContextMenuRefresh
Menu, FilesContextMenuBlankArea, Add
Menu, FilesContextMenuBlankArea, Add, 粘贴(&P), FilesContextMenuPaste
Menu, FilesContextMenuBlankArea, Add
Menu, FilesContextMenuBlankArea, Add, 新建文件夹(&W), FilesContextMenuNewFolder
Menu, FilesContextMenuBlankArea2, Add, 刷新(&E), FilesContextMenuRefresh
Gui, Tab, 2
Gui, Add, ListView, h222 w684 gdownload vdownload, 名称|大小 (KB)|路径|MD5|PID|
GuiControl, -Redraw, download
LV_ModifyCol(1, 270)
LV_ModifyCol(2, 90)
LV_ModifyCol(3, 150)
LV_ModifyCol(4, 204)
LV_ModifyCol(5, 45)
LV_ModifyCol(2, "Right")
LV_ModifyCol(5, "Logical Right")
GuiControl, +Redraw, download
LV_SetImageList(icon)
Menu, DownloadsContextMenu, Add, 查看(&V), DownloadsContextMenuView
Menu, DownloadsContextMenu, Add
Menu, DownloadsContextMenu, Add, 删除(&D), DownloadsContextMenuDelete
Menu, DownloadsContextMenu, Add
Menu, DownloadsContextMenu, Add, 打开文件位置(&I), DownloadsContextMenuOpenFileLocation
Menu, DownloadsContextMenu, Add, 打开文件夹(&O), DownloadsContextMenuOpenFolder
Menu, DownloadsContextMenu, Default, 查看(&V)
Menu, DownloadsContextMenuBlankArea, Add, 全部删除(&E), DownloadsContextMenuEmpty
Gui, Tab, 3
Gui, Add, ListView, h222 w684 gshared vshared, 名称|路径|地址|密码|查看计数|下载计数|保存计数|分享 ID|创建日期|剩余时间 (天)|
GuiControl, -Redraw, shared
LV_ModifyCol(1, 270)
LV_ModifyCol(2, 150)
LV_ModifyCol(3, 294)
LV_ModifyCol(4, 36)
LV_ModifyCol(5, 60)
LV_ModifyCol(6, 60)
LV_ModifyCol(7, 60)
LV_ModifyCol(8, 80)
LV_ModifyCol(9, 126)
LV_ModifyCol(10, 90)
LV_ModifyCol(4, "Right")
LV_ModifyCol(5, "Logical Right")
LV_ModifyCol(6, "Logical Right")
LV_ModifyCol(7, "Logical Right")
LV_ModifyCol(8, "Logical Right")
LV_ModifyCol(9, "Logical")
LV_ModifyCol(10, "Logical Right")
GuiControl, +Redraw, shared
LV_SetImageList(icon)
Menu, SharedContextMenu, Add, 复制(&C), SharedContextMenuCopy
Menu, SharedContextMenu, Add
Menu, SharedContextMenu, Add, 取消分享(&R), SharedContextMenuRemove
Menu, SharedContextMenu, Add
Menu, SharedContextMenu, Add, 打开文件位置(&I), SharedContextMenuOpenFileLocation
Menu, SharedContextMenu, Default, 复制(&C)
Menu, SharedContextMenuBlankArea, Add, 刷新(&E), SharedContextMenuRefresh
Menu, SharedContextMenuBlankArea, Add
Menu, SharedContextMenuBlankArea, Add, 取消所有已失效的分享(&R), SharedContextMenuRemoveExpired
Gui, Tab, 4
Gui, Add, ListView, h222 w684 vrecyclebin, 名称|原位置|删除日期|大小 (KB)|大小 (Byte)|类型|文件扩展名|文件 ID|MD5|剩余时间 (天)|
GuiControl, -Redraw, recyclebin
LV_ModifyCol(1, 270)
LV_ModifyCol(2, 150)
LV_ModifyCol(3, 126)
LV_ModifyCol(4, 90)
LV_ModifyCol(5, 90)
LV_ModifyCol(6, 115)
LV_ModifyCol(7, 80)
LV_ModifyCol(8, 110)
LV_ModifyCol(9, 204)
LV_ModifyCol(10, 90)
LV_ModifyCol(3, "Logical")
LV_ModifyCol(4, "Right")
LV_ModifyCol(5, "Logical Right")
LV_ModifyCol(8, "Logical Right")
LV_ModifyCol(10, "Logical Right")
GuiControl, +Redraw, recyclebin
LV_SetImageList(icon)
Menu, RecycleBinContextMenu, Add, 还原(&E), RecycleBinContextMenuRestore
Menu, RecycleBinContextMenu, Add
Menu, RecycleBinContextMenu, Add, 删除(&D), RecycleBinContextMenuDelete
Menu, RecycleBinContextMenuBlankArea, Add, 刷新(&E), RecycleBinContextMenuRefresh
Menu, RecycleBinContextMenuBlankArea, Add
Menu, RecycleBinContextMenuBlankArea, Add, 清空回收站(&B), RecycleBinContextMenuEmpty
Gui, Tab
Menu, File, Disable, 打开(&O)...
Menu, File, Disable, 保存(&S)...
Menu, File, Disable, 导出当前路径的文件夹结构(&M)...
Menu, Find, Disable, 查找当前路径下的重复文件(&F)
Menu, Tools, Disable, 下载配置(&N)
Menu, Help, Disable, 检查更新(&U)
Menu, Help, Disable, 捐赠(&D)
if ( FileExist("Logs\Yixun.log") = "" )
{
Menu, Tools, Disable, 查看日志(&V)
Menu, Tools, Disable, 删除日志(&D)
}
GuiControl, Disable, loginstate
GuiControl, Disable, switch
Gui, Show,, 亿寻
initialize()
aria2initialize()
saldlinitialize()
shareinitialize()
directinitialize()
highinitialize()
uainitialize()
if ( available != 0 )
{
sdinitialize()
}
infoinitialize()
Menu, File, Enable, 打开(&O)...
Menu, Help, Enable, 检查更新(&U)
Menu, Help, Enable, 捐赠(&D)
GuiControl, Enable, loginstate
GuiControl, Enable, switch
return
GuiSize:
if ( A_EventInfo != 1 )
{
GuiControl, MoveDraw, info, % "w" A_GuiWidth - 20
GuiControl, MoveDraw, currentpath, % "w" A_GuiWidth - 288
GuiControl, MoveDraw, refresh, % "x" A_GuiWidth - 200
GuiControl, MoveDraw, search, % "x" A_GuiWidth - 160
GuiControl, MoveDraw, tab, % "w" A_GuiWidth "h" A_GuiHeight - 81
GuiControl, MoveDraw, file, % "w" A_GuiWidth - 6 "h" A_GuiHeight - 107
GuiControl, MoveDraw, download, % "w" A_GuiWidth - 6 "h" A_GuiHeight - 107
GuiControl, MoveDraw, shared, % "w" A_GuiWidth - 6 "h" A_GuiHeight - 107
GuiControl, MoveDraw, recyclebin, % "w" A_GuiWidth - 6 "h" A_GuiHeight - 107
}
return
GuiClose:
ExitApp
decryptimage(filename)
{
File := FileOpen(filename, "r")
size := File.Length
File.RawRead(bin, size)
File.Close()
NumPut(137, bin, 0, "uchar")
File := FileOpen("Temp\~.png", "w")
File.RawWrite(bin, size)
File.Close()
FileSetAttrib, +H, Temp\~.png
return
}
initialize()
{
Gui +OwnDialogs
IniRead, checkupdate, config\Yixun.ini, Config, CheckUpdate, 0
IniRead, downloadlocation, config\Yixun.ini, Config, DownloadLocation, `%USERPROFILE`%\Downloads
IniRead, maxlogsize, config\Yixun.ini, Config, MaximumLogSize, 1024
if ( checkupdate = 1 )
{
r := update()
if ( r != "" && r != ver )
{
MsgBox, 4, 更新, 亿寻 %r% 已可用。现在下载吗?
IfMsgBox, Yes
{
r := get2()
if ( r != "" )
{
RegExMatch(r, "(?<=""URL"":"")[^""]+", URL)
RegExMatch(r, "(?<=""PIN"":"")[^""]+", PIN)
MsgBox,, 更新, 下载:`n%URL%`n密码: %PIN%`n`n按 Ctrl+C 复制此内容。
}
else
{
MsgBox, 16, 错误, 遇到问题。请与我联系以获取帮助。
}
}
}
}
if ( RegExMatch(downloadlocation, "^%USERPROFILE%") != 0 )
{
EnvGet, t, USERPROFILE
downloadlocation := StrReplace(downloadlocation, "%USERPROFILE%", t)
}
return
}
update(i := 0, j := 0)
{
if ( i = 0 && j = 0 )
{
proxy()
}
if ( i = 0 )
{
URL := "https://api.npoint.io/820aea636b5b95dc08ab"
}
else
{
URL := "https://jsonbox.io/box_c7992efc2b92be893d0d"
}
if ( encrypt = 1 && j = 0 )
{
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse(5)
if ( RegExMatch(whr.ResponseText, "(?<=""version"":"")[^""]+", r) != 0 )
{
return, r
}
else if ( i = 0 )
{
return, update(1)
}
else
{
return, update(, 1)
}
}
Catch
{
if ( i = 0 )
{
return, update(1)
}
else
{
return, update(, 1)
}
}
}
else
{
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe --noproxy * -s -o Temp\~t %URL%,, Hide
if ( ErrorLevel = 0 )
{
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
FileDelete, Temp\~t
if ( RegExMatch(r, "(?<=""version"":"")[^""]+", r) != 0 )
{
return, r
}
else if ( i = 0 )
{
return, update(1, 1)
}
else
{
MsgBox, 16, 错误:update, 检查更新时出现问题。
}
}
else
{
FileDelete, Temp\~t
MsgBox, 16, %A_ScriptDir%\Temp\~t, 读取文件 '%A_ScriptDir%\Temp\~t' 时出错。
}
}
else if ( i = 0 )
{
return, update(1, 1)
}
else
{
MsgBox, 48, 错误:curl, 出现意外错误。
}
}
return
}
get(i := 0, j := 0)
{
if ( i = 0 && j = 0 )
{
proxy()
}
if ( i = 0 )
{
URL := "https://api.npoint.io/5fff6883ccfff33af02f"
}
else
{
URL := "https://jsonbox.io/box_1f86f4911a984d9af89e"
}
if ( j = 0 )
{
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse(5)
if ( InStr(whr.ResponseText, "URL") != 0 )
{
return, whr.ResponseText
}
else if ( i = 0 )
{
return, get(1)
}
else
{
return, get(, 1)
}
}
Catch
{
if ( i = 0 )
{
return, get(1)
}
else
{
return, get(, 1)
}
}
}
else
{
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe --noproxy * -s -o Temp\~t %URL%,, Hide
if ( ErrorLevel = 0 )
{
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
FileDelete, Temp\~t
if ( InStr(r, "URL") != 0 )
{
return, r
}
else if ( i = 0 )
{
return, get(1, 1)
}
else
{
MsgBox, 16, 错误:update, 遇到问题。请与我联系以获取帮助。
}
}
else
{
FileDelete, Temp\~t
MsgBox, 16, %A_ScriptDir%\Temp\~t, 读取文件 '%A_ScriptDir%\Temp\~t' 时出错。
}
}
else if ( i = 0 )
{
return, get(1, 1)
}
else
{
MsgBox, 48, 错误:curl, 出现意外错误。
}
}
return
}
get2(i := 0, j := 0)
{
if ( i = 0 && j = 0 )
{
proxy()
}
if ( i = 0 )
{
URL := "https://api.npoint.io/de057a6b40dc316250f3"
}
else
{
URL := "https://jsonbox.io/box_4c85af30ea95f5291595"
}
if ( j = 0 )
{
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse(5)
if ( InStr(whr.ResponseText, "URL") != 0 )
{
return, whr.ResponseText
}
else if ( i = 0 )
{
return, get2(1)
}
else
{
return, get2(, 1)
}
}
Catch
{
if ( i = 0 )
{
return, get2(1)
}
else
{
return, get2(, 1)
}
}
}
else
{
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe --noproxy * -s -o Temp\~t %URL%,, Hide
if ( ErrorLevel = 0 )
{
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
FileDelete, Temp\~t
if ( InStr(r, "URL") != 0 )
{
return, r
}
else if ( i = 0 )
{
return, get2(1, 1)
}
else
{
MsgBox, 16, 错误:update, 遇到问题。请与我联系以获取帮助。
}
}
else
{
FileDelete, Temp\~t
MsgBox, 16, %A_ScriptDir%\Temp\~t, 读取文件 '%A_ScriptDir%\Temp\~t' 时出错。
}
}
else if ( i = 0 )
{
return, get2(1, 1)
}
else
{
MsgBox, 48, 错误:curl, 出现意外错误。
}
}
return
}
aria2initialize()
{
if ( FileExist("aria2\aria2.conf") != "" )
{
FileRead, conf, aria2\aria2.conf
if ( ErrorLevel = 0 )
{
conf := RegExReplace(conf, "m)^\s*#.*$")
conf := RTrim(conf, "`r`n")
conf := StrSplit(conf, ["=","`r`n"])
conf := Object(conf*)
if ( conf["split"] != "" )
{
split2 := conf["split"] > 4 ? 4 : conf["split"]
}
else
{
split2 := 4
}
if ( conf["max-connection-per-server"] != "" )
{
maxconnection2 := conf["max-connection-per-server"] > 4 ? 4 : conf["max-connection-per-server"]
}
else
{
maxconnection2 := 4
}
}
else
{
split2 := 4
maxconnection2 := 4
}
}
else
{
split2 := 4
maxconnection2 := 4
MsgBox, 48, %A_ScriptDir%\aria2\aria2.conf, 找不到文件 '%A_ScriptDir%\aria2\aria2.conf'。
FileAppend,, aria2\aria2.conf
if ( ErrorLevel != 0 )
{
MsgBox, 16, %A_ScriptDir%\aria2\aria2.conf, 写入文件 '%A_ScriptDir%\aria2\aria2.conf' 时出错。
}
}
return
}
saldlinitialize()
{
Gui +OwnDialogs
IniRead, chunksize, saldl\saldl.ini, Config, chunk-size, 4M
IniRead, connections, saldl\saldl.ini, Config, connections, 4
IniRead, connectionmaxrate, saldl\saldl.ini, Config, connection-max-rate, 0
connections2 := connections > 4 ? 4 : connections
return
}
shareinitialize()
{
IniRead, setperiod31, config\share.ini, Config, set-period, 0
IniRead, period31, config\share.ini, Config, period, 1
IniRead, setpwd31, config\share.ini, Config, set-pwd, 0
IniRead, custom31, config\share.ini, Config, custom, 0
IniRead, pwd31, config\share.ini, Config, pwd, % A_Space
return
}
directinitialize()
{
IniRead, auto, config\direct.ini, Config, auto, 0
if ( auto = 1 )
{
app_id := 778750
useragent3 := "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36"
}
else
{
IniRead, app_id, config\direct.ini, Config, app_id, 778750
IniRead, useragent3, config\direct.ini, Config, User-Agent, Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36
}
return
}
highinitialize()
{
IniRead, period33, config\high.ini, Config, period, 1
IniRead, stop33, config\high.ini, Config, stop, 0
IniRead, useragent4, config\high.ini, Config, User-Agent, Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36
return
}
uainitialize()
{
if ( FileExist("etc\3") != "" )
{
FileRead, t, etc\3
if ( ErrorLevel = 0 )
{
useragent2 := t
return
}
else
{
useragent2 := "netdisk;6.9.7.4;PC;PC-Windows;6.3.9600;WindowsBaiduYunGuanJia"
}
}
else
{
useragent2 := "netdisk;6.9.7.4;PC;PC-Windows;6.3.9600;WindowsBaiduYunGuanJia"
}
return
}
sdinitialize()
{
if (autoget = 0)
    {
        available := 1
        return
    }
    if (autoget = 1)
    {
        if ( FileExist("vipaccount") = "" )
    {
     MsgBox, 48, 错误:,vipaccount账号信息不存在，无法自动提取。
     available := 0
     return   
    }
    FileRead, r, vipaccount
    if (r = "")
    {
        MsgBox, 48, 错误:,vipaccount账号信息为空，无法自动提取。
        available := 0
        return
    }
    RegExMatch(r, "(?<=""Cookie2"":"")[^""]+", Cookie2)
    RegExMatch(r, "(?<=""Body2"":"")[^""]+", Body2)
    }
    MsgBox, 64, 获取成功,账号获取成功！
    available := 1
return
}
sd(i := 0, j := 0)
{
if ( i = 0 && j = 0 )
{
proxy()
}
if ( i = 0 )
{
URL := "https://api.npoint.io/2bd185b46411dcfeb49a"
}
else
{
URL := "https://jsonbox.io/box_c981dc25c810786bc94a"
}
if ( encrypt = 1 && j = 0 )
{
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse(5)
if ( RegExMatch(whr.ResponseText, "(?<=""d"":"")[^""]+", r) != 0 )
{
return, r
}
else if ( i = 0 )
{
return, sd(1)
}
else
{
return, sd(, 1)
}
}
Catch
{
if ( i = 0 )
{
return, sd(1)
}
else
{
return, sd(, 1)
}
}
}
else
{
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe --noproxy * -s -o Temp\~t %URL%,, Hide
if ( ErrorLevel = 0 )
{
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
FileDelete, Temp\~t
if ( RegExMatch(r, "(?<=""d"":"")[^""]+", r) != 0 )
{
return, r
}
else if ( i = 0 )
{
return, sd(1, 1)
}
else
{
MsgBox, 16, 错误:sd, 出现意外错误。
}
}
else
{
FileDelete, Temp\~t
MsgBox, 16, %A_ScriptDir%\Temp\~t, 读取文件 '%A_ScriptDir%\Temp\~t' 时出错。
}
}
else if ( i = 0 )
{
return, sd(1, 1)
}
else
{
MsgBox, 48, 错误:curl, 出现意外错误。
}
}
return
}
infoinitialize()
{
Gui +OwnDialogs
r := info()
if ( r != 0 )
{
if ( r = "" )
{
FileDelete, config\info
GuiControl,, info
return
}
else if ( FileExist("config\info") != "" )
{
FileRead, info, config\info
if ( ErrorLevel = 0 )
{
if ( r != info )
{
FileDelete, config\info
if ( ErrorLevel = 0 )
{
FileAppend, % r, config\info
if ( ErrorLevel != 0 )
{
MsgBox, 16, '%A_ScriptDir%\config\info', 写入文件 '%A_ScriptDir%\config\info' 时出错。
GuiControl,, info
return
}
}
else
{
MsgBox, 16, '%A_ScriptDir%\config\info', 删除文件 '%A_ScriptDir%\config\info' 时出错。
GuiControl,, info
return
}
}
}
else
{
GuiControl,, info
MsgBox, 16, '%A_ScriptDir%\config\info', 读取文件 '%A_ScriptDir%\config\info' 时出错。
return
}
}
else
{
FileAppend, % r, config\info
if ( ErrorLevel != 0 )
{
GuiControl,, info
MsgBox, 16, '%A_ScriptDir%\config\info', 写入文件 '%A_ScriptDir%\config\info' 时出错。
return
}
}
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && OpenSSL\bin\openssl.exe enc -aes-256-cbc -pbkdf2 -d -a -A -in config\info -out Temp\~t -pass file:pass,, Hide
if ( ErrorLevel = 0 )
{
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
FileDelete, Temp\~t
GuiControl, +cRed, info
GuiControl,, info, % r
}
else
{
FileDelete, Temp\~t
GuiControl,, info
MsgBox, 16, %A_ScriptDir%\Temp\~t, 读取文件 '%A_ScriptDir%\Temp\~t' 时出错。
}
}
else
{
GuiControl,, info
MsgBox, 16, 错误:OpenSSL, 出现意外错误。
}
}
else
{
GuiControl,, info
}
return
}
info(i := 0, j := 0)
{
if ( i = 0 && j = 0 )
{
proxy()
}
if ( i = 0 )
{
URL := "https://api.npoint.io/68ddaf8b1833f8806349"
}
else
{
URL := "https://jsonbox.io/box_209e3ab0fb70404a6c60"
}
if ( encrypt = 1 && j = 0 )
{
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse(5)
if ( RegExMatch(whr.ResponseText, "(?<=""info"":"")[^""]*", r) != 0 )
{
return, r
}
else if ( i = 0 )
{
return, info(1)
}
else
{
return, info(, 1)
}
}
Catch
{
if ( i = 0 )
{
return, info(1)
}
else
{
return, info(, 1)
}
}
}
else
{
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe --noproxy * -s -o Temp\~t %URL%,, Hide
if ( ErrorLevel = 0 )
{
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
FileDelete, Temp\~t
if ( RegExMatch(r, "(?<=""info"":"")[^""]*", r) != 0 )
{
return, r
}
else if ( i = 0 )
{
return, info(1, 1)
}
else
{
MsgBox, 16, 错误:info, 出现意外错误。
}
}
else
{
FileDelete, Temp\~t
MsgBox, 16, %A_ScriptDir%\Temp\~t, 读取文件 '%A_ScriptDir%\Temp\~t' 时出错。
}
}
else if ( i = 0 )
{
return, info(1, 1)
}
else
{
MsgBox, 48, 错误:curl, 出现意外错误。
}
}
return, 0
}
tree()
{
SIGINT := 0
Gui +OwnDialogs
FileSelectFile, tmp, 18, *.txt, 导出当前路径的文件夹结构, 文本文档(*.txt)
if ( ErrorLevel = 0 )
{
t := "文件夹 PATH 列表`r`n" . currentpath . "`r`n"
Gosub, creating30
Gui +OwnDialogs
listtree(currentpath)
if ( SIGINT = 0 )
{
File := FileOpen(tmp, "w")
File.Write(t)
File.Close()
MsgBox, 64, 正在导出当前路径的文件夹结构, 导出完毕。
}
VarSetCapacity(t, 0)
Gui, 1:-Disabled
Gui, 30:Destroy
}
return
}
listtree(path2, page := 1)
{
Global Cookie
Global t
Encodepath := UrlEncode(path2)
URL := encrypt = 1 ? "https://pan.baidu.com/api/list?dir=" . Encodepath . "&page=" . page . "&num=1000" : "http://pan.baidu.com/api/list?dir=" . Encodepath . "&page=" . page . "&num=1000"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=\[).*(?=])", list)
if ( list != "" )
{
list := StrSplit(list, ",{""")
for key, value in list
{
if ( SIGINT = 1 )
{
return
}
RegExMatch(value, "(?<=isdir"":)\d", isdir)
RegExMatch(value, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
t .= path . "`r`n"
if ( isdir = 1 )
{
listtree(path)
}
}
if ( list.Length() = 1000 )
{
listtree(path2, ++page)
}
}
}
else
{
MsgBox, 16, 错误:list, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:list, 出现意外错误。
}
return
}
creating30:
Gui, 1:+Disabled
Gui, 30:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 正在导出当前路径的文件夹结构...
Gui, Add, Button, x310 y+40 w80 Default gcancel30, 取消
Gui, Show, h95 w400, 正在导出当前路径的文件夹结构
return
30GuiClose:
cancel30:
SIGINT := 1
Gui, 1:-Disabled
Gui, 30:Destroy
return
exit:
ExitApp
duplicate:
pathlast = "%currentpath%"中的重复的文件
t := ""
SIGINT := 0
GuiControl, Text, currentpath, "%currentpath%"中的重复的文件
Gui, ListView, file
LV_Delete()
Gosub, creating32
Gui +OwnDialogs
getlist(currentpath)
if ( SIGINT = 0 )
{
if ( t != "" )
{
t := RegExReplace(t, "`n$")
r := find()
if ( r = 0 )
{
MsgBox, 64, 正在查找重复文件, 搜索完毕。
}
}
else
{
MsgBox, 64, 正在查找重复文件, 搜索完毕。
}
}
VarSetCapacity(t, 0)
Gui, 1:-Disabled
Gui, 32:Destroy
return
getlist(path2, page := 1)
{
Global Cookie
Global t
Encodepath := UrlEncode(path2)
URL := encrypt = 1 ? "https://pan.baidu.com/api/list?dir=" . Encodepath . "&page=" . page . "&num=1000" : "http://pan.baidu.com/api/list?dir=" . Encodepath . "&page=" . page . "&num=1000"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=\[).*(?=])", list)
if ( list != "" )
{
list := StrSplit(list, ",{""")
for key, value in list
{
if ( SIGINT = 1 )
{
return
}
RegExMatch(value, "(?<=isdir"":)\d", isdir)
RegExMatch(value, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
if ( isdir = 1 )
{
getlist(path)
}
else
{
RegExMatch(value, "(?<=server_mtime"":)\d+", mtime)
server_mtime := 1970010108
server_mtime += mtime, s
FormatTime, server_mtime, % server_mtime, yyyy/M/d H:mm:ss
RegExMatch(value, "(?<=fs_id"":)\d+", fs_id)
RegExMatch(value, "(?<=size"":)\d+", size)
sizeKB := size // 1024
sizeKB := sizeKB != 0 ? RegExReplace(sizeKB, "\d(?=(\d{3})+$)", "$0,") . " KB" : "1 KB"
RegExMatch(value, "(?<=md5"":"")[^""]+", md5)
RegExMatch(value, "(?<=server_filename"":"")[^""]+", server_filename)
server_filename := UnicodeDec(server_filename)
RegExMatch(server_filename, "\.[^\.]+$", ext)
ext := Format("{:L}", ext)
type := ext = "" ? "文件" : type(ext, index)
t .= """server_filename"":""" . server_filename . """,""server_mtime"":""" . server_mtime . """,""type"":""" . type . """,""index"":""" . index . """,""sizeKB"":""" . sizeKB . """,""size"":""" . size . """,""path"":""" . path . """,""ext"":""" . ext . """,""fs_id"":""" . fs_id . """,""md5"":""" . md5 . """`n"
}
}
if ( list.Length() = 1000 )
{
getlist(path2, ++page)
}
}
}
else
{
MsgBox, 16, 错误:list, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:list, 出现意外错误。
}
return
}
find()
{
Global t
matched := " "
i := 1
t := StrSplit(t, "`n")
n := t.Length()
Gui, 1:Default
GuiControl, -Redraw, file
Loop, % n - 1
{
if ( SIGINT = 1 )
{
return
}
if ( InStr(matched, " " . i . " ") = 0 )
{
RegExMatch(t[i], "(?<=""md5"":"")[^""]+", md5)
j := i + 1
Loop, % n - i
{
if ( SIGINT = 1 )
{
return
}
if ( InStr(matched, " " . j . " ") = 0 )
{
RegExMatch(t[j], "(?<=""md5"":"")[^""]+", md52)
if ( md52 = md5 )
{
RegExMatch(t[i], "(?<=""size"":"")[^""]+", size)
RegExMatch(t[j], "(?<=""size"":"")[^""]+", size2)
if ( size2 = size )
{
r .= t[j] . "`n"
matched .= j . " "
}
}
}
++j
}
if ( r != "" )
{
r := t[i] . "`n" . r
r := RegExReplace(r, "`n$")
Loop, Parse, r, `n
{
if ( SIGINT = 1 )
{
return
}
RegExMatch(A_LoopField, "(?<=""server_filename"":"")[^""]+", server_filename)
RegExMatch(A_LoopField, "(?<=""server_mtime"":"")[^""]+", server_mtime)
RegExMatch(A_LoopField, "(?<=""type"":"")[^""]+", type)
RegExMatch(A_LoopField, "(?<=""sizeKB"":"")[^""]+", sizeKB)
RegExMatch(A_LoopField, "(?<=""size"":"")[^""]+", size)
RegExMatch(A_LoopField, "(?<=""path"":"")[^""]+", path)
RegExMatch(A_LoopField, "(?<=""ext"":"")[^""]+", ext)
RegExMatch(A_LoopField, "(?<=""index"":"")[^""]+", index)
RegExMatch(A_LoopField, "(?<=""fs_id"":"")[^""]+", fs_id)
RegExMatch(A_LoopField, "(?<=""md5"":"")[^""]+", md5)
LV_Add(ext = "" ? "icon2" : "icon" . index, server_filename, server_mtime, type, sizeKB, size, path, ext, fs_id, md5)
}
r := ""
}
}
++i
}
GuiControl, +Redraw, file
return, 0
}
creating32:
Gui, 1:+Disabled
Gui, 32:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 正在查找重复文件...
Gui, Add, Button, x310 y+40 w80 Default gcancel32, 取消
Gui, Show, h95 w400, 正在查找重复文件
return
32GuiClose:
cancel32:
SIGINT := 1
Gui, 1:-Disabled
Gui, 32:Destroy
return
OpenLogFile:
Run, Logs\Yixun.log
return
DeleteLogFile:
Gui +OwnDialogs
MsgBox, 4, 确认, 是否确定要删除日志?
IfMsgBox, Yes
{
FileDelete, Logs\Yixun.log
Menu, Tools, Disable, 查看日志(&V)
Menu, Tools, Disable, 删除日志(&D)
}
return
aria2config:
Gui, 1:+Disabled
Gui, 7:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui +OwnDialogs
Gui, Add, Text, x10 y10, 每队列最大并行任务数[1-*]:
Gui, Add, Edit, x290 y+-17 h22 w100 Right Number vmaxconcurrent, 5
Gui, Add, Text, x10 y+10, 每下载最大连接数[1-*]:
Gui, Add, Edit, x290 y+-17 h22 w100 Right Number vsplit, 5
Gui, Add, Text, x10 y+10, 每下载每服务器最大连接数[1-16]:
Gui, Add, Edit, x290 y+-17 h22 w100 Right Number vmaxconnection, 1
Gui, Add, Text, x10 y+10, 最小块大小[1048576-1073741824]:
Gui, Add, Edit, x290 y+-17 h22 w100 Right vminsplit, 20M
Gui, Add, Text, x10 y+10, 检查 SSL 证书:
Gui, Add, DropDownList, x290 y+-16 w100 Hwndddlhwnd71 vcheckcertificate, true|false||
PostMessage, 0x153, 0, 19,, ahk_id %ddlhwnd71%
Gui, Add, Text, x10 y+10, 分配磁盘空间:
Gui, Add, DropDownList, x290 y+-16 w100 Hwndddlhwnd72 vfileallocation, none|prealloc||falloc
PostMessage, 0x153, 0, 19,, ahk_id %ddlhwnd72%
Gui, Add, Text, x10 y+10, 日志级别:
Gui, Add, DropDownList, x290 y+-16 w100 Hwndddlhwnd73 vloglevel, debug|info|notice||warn|error
PostMessage, 0x153, 0, 19,, ahk_id %ddlhwnd73%
Gui, Add, Text, x10 y+10, 全局最大下载速度[0-*]:
Gui, Add, Edit, x290 y+-17 h22 w100 Right vmaxoveralldownloadlimit, 0
Gui, Add, Button, x225 y+20 w80 Default gconfirm7, 确定
Gui, Add, Button, x+5 w80 gcancel7, 取消
Gui, Show, h266 w400, aria2 配置
if ( FileExist("aria2\aria2.conf") != "" )
{
conf7()
}
else
{
MsgBox, 48, %A_ScriptDir%\aria2\aria2.conf, 找不到文件 '%A_ScriptDir%\aria2\aria2.conf'。
FileAppend,, aria2\aria2.conf
if ( ErrorLevel != 0 )
{
MsgBox, 16, %A_ScriptDir%\aria2\aria2.conf, 写入文件 '%A_ScriptDir%\aria2\aria2.conf' 时出错。
}
}
return
7GuiClose:
cancel7:
Gui, 1:-Disabled
Gui, Destroy
return
confirm7:
Gui +OwnDialogs
Gui, Submit, NoHide
if ( maxconcurrent < 1 )
{
MsgBox, 16, 错误, 每队列最大并行任务数至少为 1。
return
}
if ( split < 1 )
{
MsgBox, 16, 错误, 每下载最大连接数至少为 1。
return
}
if ( maxconnection < 1 )
{
MsgBox, 16, 错误, 每下载每服务器最大连接数至少为 1。
return
}
else if ( maxconnection > 16 )
{
MsgBox, 16, 错误, 每下载每服务器最大连接数最多为 16。
return
}
if ( maxoveralldownloadlimit < 0 )
{
MsgBox, 16, 错误, 全局最大下载速度至少为 0。
return
}
if ( FileExist("aria2\aria2.conf") != "" )
{
FileRead, conf, aria2\aria2.conf
if ( ErrorLevel = 0 )
{
conf := RegExReplace(conf, "m)^\s*#.*$")
conf := RTrim(conf, "`r`n")
conf := StrSplit(conf, ["=","`r`n"])
conf := Object(conf*)
if ( maxconcurrent != "" )
{
conf["max-concurrent-downloads"] := maxconcurrent
}
else
{
conf.Delete("max-concurrent-downloads")
}
if ( split != "" )
{
conf["split"] := split
split2 := split > 4 ? 4 : split
}
else
{
conf.Delete("split")
split2 := 4
}
if ( maxconnection != "" )
{
conf["max-connection-per-server"] := maxconnection
maxconnection2 := maxconnection > 4 ? 4 : maxconnection
}
else
{
conf.Delete("max-connection-per-server")
maxconnection2 := 4
}
if ( minsplit != "" )
{
conf["min-split-size"] := minsplit
}
else
{
conf.Delete("min-split-size")
}
conf["check-certificate"] := checkcertificate
conf["file-allocation"] := fileallocation
conf["console-log-level"] := loglevel
if ( maxoveralldownloadlimit != "" )
{
conf["max-overall-download-limit"] := maxoveralldownloadlimit
}
else
{
conf.Delete("max-overall-download-limit")
}
FileDelete, aria2\aria2.conf
if ( ErrorLevel != 0 )
{
MsgBox, 16, %A_ScriptDir%\aria2\aria2.conf, 删除文件 '%A_ScriptDir%\aria2\aria2.conf' 时出错。
return
}
}
else
{
MsgBox, 16, %A_ScriptDir%\aria2\aria2.conf, 读取文件 '%A_ScriptDir%\aria2\aria2.conf' 时出错。
return
}
}
else
{
conf := {}
if ( maxconcurrent != "" )
{
conf["max-concurrent-downloads"] := maxconcurrent
}
if ( split != "" )
{
conf["split"] := split
split2 := split > 4 ? 4 : split
}
else
{
split2 := 4
}
if ( maxconnection != "" )
{
conf["max-connection-per-server"] := maxconnection
maxconnection2 := maxconnection > 4 ? 4 : maxconnection
}
else
{
maxconnection2 := 4
}
if ( minsplit != "" )
{
conf["min-split-size"] := minsplit
}
conf["check-certificate"] := checkcertificate
conf["file-allocation"] := fileallocation
conf["console-log-level"] := loglevel
if ( maxoveralldownloadlimit != "" )
{
conf["max-overall-download-limit"] := maxoveralldownloadlimit
}
}
t := ""
for key, value in conf
{
t .= key . "=" . value . "`r`n"
}
FileAppend, % t, aria2\aria2.conf
if ( ErrorLevel = 0 )
{
r := rpc_status()
if ( r = 0 )
{
URL := "http://127.0.0.1:6800/jsonrpc"
for key, value in conf
{
option .= """" . key . """:""" . value . ""","
option := RegExReplace(option, ",$")
}
Body := "{""jsonrpc"":""2.0"",""id"":1,""method"":""aria2.changeGlobalOption"",""params"":[{option}]}"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Open("POST", URL, true)
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""result"":"")[^""]+", result)
if ( result != "OK" )
{
MsgBox, 16, 错误, result: %result%
}
}
}
Gui, 1:-Disabled
Gui, Destroy
}
else
{
MsgBox, 16, %A_ScriptDir%\aria2\aria2.conf, 写入文件 '%A_ScriptDir%\aria2\aria2.conf' 时出错。
}
return
conf7()
{
FileRead, conf, aria2\aria2.conf
if ( ErrorLevel = 0 )
{
conf := RegExReplace(conf, "m)^\s*#.*$")
conf := RTrim(conf, "`r`n")
conf := StrSplit(conf, ["=","`r`n"])
conf := Object(conf*)
if ( conf["max-concurrent-downloads"] != "" )
{
GuiControl,, maxconcurrent, % conf["max-concurrent-downloads"]
}
if ( conf["split"] != "" )
{
GuiControl,, split, % conf["split"]
}
if ( conf["max-connection-per-server"] != "" )
{
GuiControl,, maxconnection, % conf["max-connection-per-server"]
}
if ( conf["min-split-size"] != "" )
{
GuiControl,, minsplit, % conf["min-split-size"]
}
if ( conf["check-certificate"] = "true" )
{
GuiControl, Choose, checkcertificate, 1
}
else
{
GuiControl, Choose, checkcertificate, 2
}
switch conf["file-allocation"]
{
case "none":
GuiControl, Choose, fileallocation, 1
case "falloc":
GuiControl, Choose, fileallocation, 3
default:
GuiControl, Choose, fileallocation, 2
}
switch conf["console-log-level"]
{
case "debug":
GuiControl, Choose, loglevel, 1
case "info":
GuiControl, Choose, loglevel, 2
case "warn":
GuiControl, Choose, loglevel, 4
case "error":
GuiControl, Choose, loglevel, 5
default:
GuiControl, Choose, loglevel, 3
}
if ( conf["max-overall-download-limit"] != "" )
{
GuiControl,, maxoveralldownloadlimit, % conf["max-overall-download-limit"]
}
}
else
{
MsgBox, 16, %A_ScriptDir%\aria2\aria2.conf, 读取文件 '%A_ScriptDir%\aria2\aria2.conf' 时出错。
}
return
}
saldlconfig:
Gui, 1:+Disabled
Gui, 25:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 并发连接数[1-*]:
Gui, Add, Edit, x290 y+-17 h22 w100 Right Number vconnections_control
Gui, Add, Text, x10 y+10, 每连接的最大速率[0-*]:
Gui, Add, Edit, x290 y+-17 h22 w100 Right vconnectionmaxrate_control
Gui, Add, Button, x225 y+20 w80 Default gconfirm25, 确定
Gui, Add, Button, x+5 w80 gcancel25, 取消
Gui, Show, h107 w400, saldl 配置
conf25()
return
25GuiClose:
cancel25:
Gui, 1:-Disabled
Gui, Destroy
return
confirm25:
Gui +OwnDialogs
Gui, Submit, NoHide
if ( connections_control = "" || connectionmaxrate_control = "" )
{
MsgBox, 16, 错误, 并发连接数或每连接的最大速率不能为空。
return
}
if ( connections_control < 1 )
{
MsgBox, 16, 错误, 并发连接数至少为 1。
return
}
if ( connectionmaxrate_control < 0 )
{
MsgBox, 16, 错误, 每连接的最大速率至少为 0。
return
}
connections := connections_control
connectionmaxrate := connectionmaxrate_control
connections2 := connections > 4 ? 4 : connections
IniWrite, % connections, saldl\saldl.ini, Config, connections
IniWrite, % connectionmaxrate, saldl\saldl.ini, Config, connection-max-rate
Gui, 1:-Disabled
Gui, Destroy
return
conf25()
{
IniRead, connections, saldl\saldl.ini, Config, connections, 4
IniRead, connectionmaxrate, saldl\saldl.ini, Config, connection-max-rate, 0
GuiControl,, connections_control, % connections
GuiControl,, connectionmaxrate_control, % connectionmaxrate
return
}
shareconfig:
Gui, 1:+Disabled
Gui, 31:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Font, S10
Gui, Add, Checkbox, x10 y10 gsetperiod31_control vsetperiod31_control, 设置过期日期:
Gui, Font, S9
Gui, Add, DropDownList, x+0 y+-17 w70 Hwndddlhwnd31 vperiod31_control, 1|7
PostMessage, 0x153, 0, 19,, ahk_id %ddlhwnd31%
Gui, Add, Text, x+5 y+-16, 天
Gui, Font, S10
Gui, Add, Checkbox, x10 y+15 gsetpwd31_control vsetpwd31_control, 设置密码
Gui, Add, Checkbox, x30 y+15 gcustom31_control vcustom31_control, 自定义密码:
Gui, Font, S9
Gui, Add, Edit, x+5 y+-17 h22 w70 Limit4 vpwd31_control
Gui, Add, Button, x225 y+20 w80 Default gconfirm31, 确定
Gui, Add, Button, x+5 w80 gcancel31, 取消
Gui, Show, h138 w400, 快速分享配置
conf31()
return
31GuiClose:
cancel31:
Gui, 1:-Disabled
Gui, Destroy
return
setperiod31_control:
GuiControlGet, setperiod31_control
if ( setperiod31_control = 1 )
{
GuiControl, Enable, period31_control
}
else
{
GuiControl, Disable, period31_control
}
return
setpwd31_control:
GuiControlGet, setpwd31_control
if ( setpwd31_control = 1 )
{
GuiControl, Enable, custom31_control
Gosub, custom31_control
}
else
{
GuiControl, Disable, custom31_control
GuiControl, Disable, pwd31_control
}
return
custom31_control:
GuiControlGet, custom31_control
if ( custom31_control = 1 )
{
GuiControl, Enable, pwd31_control
}
else
{
GuiControl, Disable, pwd31_control
}
return
confirm31:
Gui +OwnDialogs
Gui, Submit, NoHide
if ( custom31_control = 1 )
{
if ( pwd31_control = "" )
{
MsgBox, 16, 错误, 密码不能为空。
return
}
if ( StrLen(pwd31_control) < 4 || RegExMatch(pwd31_control, "[^0-9a-zA-Z]") != 0 )
{
MsgBox, 16, 错误, 密码只可以包含字母和数字，且必须为 4 个字符。
return
}
}
setperiod31 := setperiod31_control
period31 := period31_control
setpwd31 := setpwd31_control
custom31 := custom31_control
pwd31 := pwd31_control
IniWrite, % setperiod31, config\share.ini, Config, set-period
IniWrite, % period31, config\share.ini, Config, period
IniWrite, % setpwd31, config\share.ini, Config, set-pwd
IniWrite, % custom31, config\share.ini, Config, custom
IniWrite, % pwd31, config\share.ini, Config, pwd
Gui, 1:-Disabled
Gui, Destroy
return
conf31()
{
IniRead, setperiod31, config\share.ini, Config, set-period, 0
IniRead, period31, config\share.ini, Config, period, 1
IniRead, setpwd31, config\share.ini, Config, set-pwd, 0
IniRead, custom31, config\share.ini, Config, custom, 0
IniRead, pwd31, config\share.ini, Config, pwd, % A_Space
GuiControl,, setperiod31_control, % setperiod31
GuiControl,, setpwd31_control, % setpwd31
GuiControl,, custom31_control, % custom31
GuiControl,, pwd31_control, % pwd31
if ( setperiod31 = 1 )
{
GuiControl, Enable, period31_control
}
else
{
GuiControl, Disable, period31_control
}
if ( period31 = 1 )
{
GuiControl, Choose, period31_control, 1
}
else
{
GuiControl, Choose, period31_control, 2
}
if ( setpwd31 = 1 )
{
GuiControl, Enable, custom31_control
if ( custom31 = 1 )
{
GuiControl, Enable, pwd31_control
}
else
{
GuiControl, Disable, pwd31_control
}
}
else
{
GuiControl, Disable, custom31_control
GuiControl, Disable, pwd31_control
}
return
}
option:
Gui, 1:+Disabled
Gui, 14:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 默认下载位置:
Gui, Add, Edit, x10 y+5 h22 w395 vdownloadlocation_control
Gui, Add, Button, x+5 w80 gbrowse, 浏览...
Gui, Add, Text, x10 y+10, 日志最大大小(KB):
Gui, Add, Edit, x+5 y+-17 h22 w100 Right Number vmaxlogsize_control
Gui, Add, Button, x325 y+20 w80 Default gconfirm14, 确定
Gui, Add, Button, x+5 w80 gcancel14, 取消
Gui, Show, h130 w500, 选项
conf()
return
14GuiClose:
cancel14:
Gui, 1:-Disabled
Gui, Destroy
return
browse()
{
Gui +OwnDialogs
if ( RegExMatch(downloadlocation, "^%USERPROFILE%") != 0 )
{
EnvGet, t, USERPROFILE
location := StrReplace(downloadlocation, "%USERPROFILE%", t)
}
else
{
location := downloadlocation
}
FileSelectFolder, t, *%location%,, 为你下载的内容选择一个默认目标文件夹
if ( t != "" )
{
t := RegExReplace(t, "\\$")
GuiControl,, downloadlocation_control, % t
}
return
}
confirm14:
Gui +OwnDialogs
Gui, Submit, NoHide
if ( downloadlocation_control = "" || maxlogsize_control = "" )
{
MsgBox, 16, 错误, 默认下载位置或日志最大大小不能为空。
return
}
if ( RegExMatch(downloadlocation_control, "[/\*\?""<>\|]") != 0 )
{
MsgBox, 16, 错误, 文件名不能包含下列任何字符:`r`n/ * ? " < > |
return
}
downloadlocation_control := RTrim(downloadlocation_control, " \")
if ( RegExMatch(downloadlocation_control, "^%USERPROFILE%") != 0 )
{
EnvGet, t, USERPROFILE
location := StrReplace(downloadlocation_control, "%USERPROFILE%", t)
if ( InStr(FileExist(location), "D") = 0 )
{
MsgBox, 16, 位置不可用, % location . " 不可用。"
return
}
}
else if ( InStr(FileExist(downloadlocation_control), "D") = 0 )
{
MsgBox, 16, 位置不可用, % downloadlocation_control . " 不可用。"
return
}
if ( RegExMatch(downloadlocation_control, "^%USERPROFILE%") != 0 )
{
downloadlocation := location
}
else
{
downloadlocation := downloadlocation_control
}
maxlogsize := maxlogsize_control
if ( FileExist("config\Yixun.ini") = "" )
{
IniWrite, 0, config\Yixun.ini, Config, CheckUpdate
}
IniWrite, % downloadlocation_control, config\Yixun.ini, Config, DownloadLocation
IniWrite, % maxlogsize, config\Yixun.ini, Config, MaximumLogSize
Gui, 1:-Disabled
Gui, Destroy
return
conf()
{
IniRead, downloadlocation, config\Yixun.ini, Config, DownloadLocation, `%USERPROFILE`%\Downloads
IniRead, maxlogsize, config\Yixun.ini, Config, MaximumLogSize, 1024
GuiControl,, downloadlocation_control, % downloadlocation
GuiControl,, maxlogsize_control, % maxlogsize
return
}
downloadconfig:
Gui, 1:+Disabled
Gui, 24:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, version:
Gui, Add, Edit, x59 y+-17 h22 w100 vversion_control
Gui, Add, Text, x10 y+10, devuid:
Gui, Add, Edit, x59 y+-17 h22 w430 vdevuid_control
Gui, Add, Text, x10 y+10, rand:
Gui, Add, Edit, x59 y+-17 h22 w430 vrand_control
Gui, Add, Text, x10 y+10, time:
Gui, Add, Edit, x59 y+-17 h22 w100 Number vtime_control
Gui, Add, Button, x325 y+20 w80 Default gconfirm24, 确定
Gui, Add, Button, x+5 w80 gcancel24, 取消
Gui, Show, h161 w500, 下载配置
parameter()
return
24GuiClose:
cancel24:
Gui, 1:-Disabled
Gui, Destroy
return
confirm24:
Gui +OwnDialogs
Gui, Submit, NoHide
if ( version_control = "" || devuid_control = "" || rand_control = "" || time_control = "" )
{
MsgBox, 16, 错误, version、devuid、rand 或 time 不能为空。
return
}
if ( InStr(version_control, "version=") != 0 )
{
RegExMatch(version_control, "(?<=version=)[^&]+", version)
}
else
{
version := version_control
}
if ( InStr(devuid_control, "devuid=") != 0 )
{
RegExMatch(devuid_control, "(?<=devuid=)[^&]+", devuid)
}
else
{
devuid := devuid_control
}
if ( InStr(rand_control, "rand=") != 0 )
{
RegExMatch(rand_control, "(?<=rand=)[^&]+", rand)
}
else
{
rand := rand_control
}
if ( InStr(time_control, "time=") != 0 )
{
RegExMatch(time_control, "(?<=time=)\d+", time)
}
else
{
time := time_control
}
IniWrite, % version, config\d.ini, % BDUSS, version
IniWrite, % devuid, config\d.ini, % BDUSS, devuid
IniWrite, % rand, config\d.ini, % BDUSS, rand
IniWrite, % time, config\d.ini, % BDUSS, time
Gui, 1:-Disabled
Gui, Destroy
return
parameter()
{
Global BDUSS
IniRead, version, config\d.ini, % BDUSS, version, % A_Space
IniRead, devuid, config\d.ini, % BDUSS, devuid, % A_Space
IniRead, rand, config\d.ini, % BDUSS, rand, % A_Space
IniRead, time, config\d.ini, % BDUSS, time, % A_Space
GuiControl,, version_control, % version
GuiControl,, devuid_control, % devuid
GuiControl,, rand_control, % rand
GuiControl,, time_control, % time
return
}
directconfig:
Gui, 1:+Disabled
Gui, 29:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Font, S10
Gui, Add, Checkbox, x10 y10 Checked gauto29 vauto, 自动设置
Gui, Font, S9
Gui, Add, Text, x10 y+20 vtd1, app id:
Gui, Add, Edit, x80 y+-17 h22 w100 Right Number vd1
Gui, Add, Text, x10 y+10 vtd2, User-Agent:
Gui, Add, Edit, x80 y+-17 h22 w410 vd2
Gui, Add, Button, x325 y+20 w80 Default gconfirm29, 确定
Gui, Add, Button, x+5 w80 gcancel29, 取消
Gui, Show, h140 w500, 直接下载配置
conf29()
return
29GuiClose:
cancel29:
Gui, 1:-Disabled
Gui, Destroy
return
auto29()
{
GuiControlGet, auto
if ( auto = 1 )
{
GuiControl, Disable, td1
GuiControl, Disable, td2
GuiControl, Disable, d1
GuiControl, Disable, d2
}
else
{
GuiControl, Enable, td1
GuiControl, Enable, td2
GuiControl, Enable, d1
GuiControl, Enable, d2
}
return
}
confirm29:
Gui +OwnDialogs
Gui, Submit, NoHide
IniWrite, % auto, config\direct.ini, Config, auto
if ( auto = 1 )
{
app_id := 778750
useragent3 := "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36"
}
else if ( d1 = "" || d2 = "" )
{
MsgBox, 16, 错误, app id 或 User-Agent 不能为空。
return
}
else
{
IniWrite, % d1, config\direct.ini, Config, app_id
IniWrite, % d2, config\direct.ini, Config, User-Agent
app_id := d1
useragent3 := d2
}
Gui, 1:-Disabled
Gui, Destroy
return
conf29()
{
IniRead, auto, config\direct.ini, Config, auto, 0
IniRead, d1, config\direct.ini, Config, app_id, 778750
IniRead, d2, config\direct.ini, Config, User-Agent, Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36
GuiControl,, auto, % auto
GuiControl,, d1, % d1
GuiControl,, d2, % d2
if ( auto = 1 )
{
GuiControl, Disable, td1
GuiControl, Disable, td2
GuiControl, Disable, d1
GuiControl, Disable, d2
}
return
}
highconfig:
Gui, 1:+Disabled
Gui, 33:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 设置过期日期:
Gui, Add, DropDownList, x+0 y+-16 w70 Hwndddlhwnd33 vperiod33_control, 1|7
PostMessage, 0x153, 0, 19,, ahk_id %ddlhwnd33%
Gui, Add, Text, x+5 y+-16, 天
Gui, Font, S10
Gui, Add, Checkbox, x10 y+20 vstop33_control, 下载后取消分享
Gui, Font, S9
Gui, Add, Text, x10 y+20, User-Agent:
Gui, Add, Edit, x80 y+-17 h22 w410 vuseragent_control
Gui, Add, Button, x225 y+20 w80 Default gconfirm33, 确定
Gui, Add, Button, x+5 w80 gcancel33, 取消
Gui, Show, h145 w500, 高速下载配置
conf33()
return
33GuiClose:
cancel33:
Gui, 1:-Disabled
Gui, Destroy
return
confirm33:
Gui, Submit, NoHide
if ( useragent_control = "" )
{
MsgBox, 16, 错误, User-Agent 不能为空。
return
}
period33 := period33_control
stop33 := stop33_control
useragent4 := useragent_control
IniWrite, % period33_control, config\high.ini, Config, period
IniWrite, % stop33_control, config\high.ini, Config, stop
IniWrite, % useragent4, config\high.ini, Config, User-Agent
Gui, 1:-Disabled
Gui, Destroy
return
conf33()
{
IniRead, period33, config\high.ini, Config, period, 1
IniRead, stop33, config\high.ini, Config, stop, 0
IniRead, useragent4, config\backup.ini, Config, User-Agent, Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36
if ( period33 = 1 )
{
GuiControl, Choose, period33_control, 1
}
else
{
GuiControl, Choose, period33_control, 2
}
GuiControl,, stop33_control, % stop33
GuiControl,, useragent_control, % useragent4
return
}
home:
Run, https://yixun.writeas.com/yi-xun-b2,, UseErrorLevel
if ( ErrorLevel != 0 )
{
MsgBox,, 主页, 主页:`n`nhttps://yixun.writeas.com/yi-xun-b2`n`n按 Ctrl+C 复制此内容。
}
return
update:
Gui, 1:+Disabled
Gui, 9:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 当前版本:
Gui, Add, Text, x+5 w100 vcurrent_version
Gui, Add, Link, x10 y+15 w430 vinfo, 正在检查...
Gui, Font, S10
Gui, Add, Checkbox, x10 y+30 vcheck, 启动时检查更新
Gui, Font, S9
Gui, Add, Button, x275 y+20 w80 Default gconfirm9, 确定
Gui, Add, Button, x+5 w80 gcancel9, 取消
Gui, Show, h145 w450, 检查更新
if ( FileExist("config\Yixun.ini") != "" )
{
IniRead, check, config\Yixun.ini, Config, CheckUpdate, 0
GuiControl,, check, % check
}
Gui +OwnDialogs
r := update()
if ( r != "" )
{
GuiControl,, current_version, % r
t := get2()
if ( t != "" )
{
RegExMatch(t, "(?<=""URL"":"")[^""]+", URL)
RegExMatch(t, "(?<=""PIN"":"")[^""]+", PIN)
}
if ( r = ver )
{
GuiControl, +c339966, info
if ( t != "" )
{
GuiControl,, info, 已是最新版本。下载: <a href="%URL%">%URL%</a> 密码: %PIN%
}
else
{
GuiControl,, info, 已是最新版本，但遇到问题。
}
}
else if ( t != "" )
{
GuiControl,, info, 新版可用。下载: <a href="%URL%">%URL%</a> 密码: %PIN%
}
else
{
GuiControl, +cRed, info
GuiControl,, info, 新版可用，但遇到问题。请与我联系以获取帮助。
}
}
return
9GuiClose:
cancel9:
Gui, 1:-Disabled
Gui, Destroy
return
confirm9()
{
Global check
Gui, Submit, NoHide
if ( FileExist("config\Yixun.ini") = "" )
{
IniWrite, `%USERPROFILE`%\Downloads, config\Yixun.ini, Config, DownloadLocation
IniWrite, 1024, config\Yixun.ini, Config, MaximumLogSize
}
IniWrite, % check, config\Yixun.ini, Config, CheckUpdate
Gui, 1:-Disabled
Gui, Destroy
return
}
donate:
if ( FileExist("etc\1") = "" )
{
MsgBox, 16, %A_ScriptDir%\etc\1, 丢失 %A_ScriptDir%\etc\1。尝试重新下载该程序以解决此问题。
return
}
r := dgst_sha512(sha512)
if ( r != 0 )
{
return
}
else if ( sha512 != "3b7fc377fde8eb58f5e4c8877b29d4dd32285053fb4db53e80e9943e5442e5104e76fb47930c937de94d17a3b1d171c315f60e94da335eb72ac6a38b604c5645" )
{
MsgBox, 16, %A_ScriptDir%\etc\1, 文件 %A_ScriptDir%\etc\1 可能已损坏或被篡改。尝试重新下载该程序以解决此问题。
return
}
Gui, 1:+Disabled
Gui, 28:Default
Gui, +Owner1
Gui, Margin, 0, 0
decryptimage("etc\1")
Gui, Add, Picture, x10 y10, Temp\~.png
FileDelete, Temp\~.png
Gui, Font, S10
Gui, Add, Edit, x+10 h161 w161 ReadOnly -VScroll, 您可以转发来帮助寻人。如果您还想捐助，可以通过二维码进行捐款。请附上您的邮箱地址及哪里人，以便与您取得联系。`n`n请勿使用 QQ/foxmail、sohu 以及 sina，这些邮箱无法收到邮件，也不要使用微信及手机号！`n感谢您的支持！
Gui, Font, S9
Gui, Add, Button, x262 y+20 w80 Default gclose28 vclose, 关闭
GuiControl, Focus, close
Gui, Show, h224 w352, 捐赠
return
28GuiClose:
close28:
Gui, 1:-Disabled
Gui, Destroy
return
dgst_sha512(ByRef sha512)
{
Gui +OwnDialogs
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && OpenSSL\bin\openssl.exe dgst -sha512 -out Temp\~t etc\1,, Hide
if ( ErrorLevel = 0 )
{
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
RegExMatch(r, "(?<= ).+", sha512)
}
else
{
MsgBox, 16, %A_ScriptDir%\Temp\~t, 读取文件 '%A_ScriptDir%\Temp\~t' 时出错。
}
FileDelete, Temp\~t
return, ErrorLevel
}
else
{
MsgBox, 16, 错误:OpenSSL, 出现意外错误。
}
return
}
donors:
Run, https://yixun.writeas.com/donors,, UseErrorLevel
if ( ErrorLevel != 0 )
{
MsgBox,, 未留下联系方式的捐助者名单, 请见`n`nhttps://yixun.writeas.com/donors`n`n按 Ctrl+C 复制此内容。
}
return
about:
Gui, 1:+Disabled
Gui, 8:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 亿寻 其他省测试版 b2 %ver%
Gui, Add, Text, x10 y+10, Copyright © 2019-2020 亿寻。保留所有权利。
Gui, Add, Button, x310 y+30 w80 Default gclose8, 关闭
Gui, Show, h107 w400, 关于亿寻
return
8GuiClose:
close8:
Gui, 1:-Disabled
Gui, Destroy
return
GuiContextMenu:
if ( A_GuiEvent = "RightClick" )
{
if ( A_GuiControl = "download" )
{
Gui, ListView, download
rownumber := LV_GetNext()
if ( rownumber != 0 )
{
focused := LV_GetNext(, "F")
LV_GetText(path, focused, 3)
if ( path = "" )
{
Menu, DownloadsContextMenu, Disable, 打开文件位置(&I)
}
else
{
Menu, DownloadsContextMenu, Enable, 打开文件位置(&I)
}
Menu, DownloadsContextMenu, Show
}
else if ( LV_GetCount() != 0 )
{
Menu, DownloadsContextMenuBlankArea, Show
}
}
else if ( loginstate = 1 )
{
switch A_GuiControl
{
case "file":
Gui, ListView, file
rownumber := LV_GetNext()
if ( rownumber != 0 )
{
focused := LV_GetNext(, "F")
LV_GetText(type, focused, 3)
if ( type = "文件夹" )
{
if ( version = "" || devuid = "" || rand = "" || time = "" )
{
Menu, FilesContextMenuFolder, Disable, 下载(&W)
Menu, FilesContextMenuFolder, Disable, 备用下载(&A)
Menu, FilesContextMenuFolder2, Disable, 下载(&W)
Menu, FilesContextMenuFolder2, Disable, 备用下载(&A)
}
else
{
Menu, FilesContextMenuFolder, Enable, 下载(&W)
Menu, FilesContextMenuFolder, Enable, 备用下载(&A)
Menu, FilesContextMenuFolder2, Enable, 下载(&W)
Menu, FilesContextMenuFolder2, Enable, 备用下载(&A)
}
if ( available = 0 )
{
Menu, FilesContextMenuFolder, Disable, 高速下载(&N)
Menu, FilesContextMenuFolder, Disable, 高速备用下载(&L)
Menu, FilesContextMenuFolder2, Disable, 高速下载(&N)
Menu, FilesContextMenuFolder2, Disable, 高速备用下载(&L)
}
else
{
i := rownumber
Loop
{
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(type, i, 3)
if ( type != "文件夹" )
{
break
}
}
if ( type != "文件夹" )
{
Menu, FilesContextMenuFolder, Disable, 高速下载(&N)
Menu, FilesContextMenuFolder, Disable, 高速备用下载(&L)
Menu, FilesContextMenuFolder2, Disable, 高速下载(&N)
Menu, FilesContextMenuFolder2, Disable, 高速备用下载(&L)
}
else
{
Menu, FilesContextMenuFolder, Enable, 高速下载(&N)
Menu, FilesContextMenuFolder, Enable, 高速备用下载(&L)
Menu, FilesContextMenuFolder2, Enable, 高速下载(&N)
Menu, FilesContextMenuFolder2, Enable, 高速备用下载(&L)
}
}
if ( RegExMatch(pathlast, "^""") = 0 )
{
Menu, FilesContextMenuFolder, Show
}
else
{
Menu, FilesContextMenuFolder2, Show
}
}
else if ( LV_GetCount("S") = 1 )
{
if ( version = "" || devuid = "" || rand = "" || time = "" )
{
Menu, FilesContextMenuFile, Disable, 下载(&W)
Menu, FilesContextMenuFile, Disable, 备用下载(&A)
Menu, FilesContextMenuFile2, Disable, 下载(&W)
Menu, FilesContextMenuFile2, Disable, 备用下载(&A)
}
else
{
Menu, FilesContextMenuFile, Enable, 下载(&W)
Menu, FilesContextMenuFile, Enable, 备用下载(&A)
Menu, FilesContextMenuFile2, Enable, 下载(&W)
Menu, FilesContextMenuFile2, Enable, 备用下载(&A)
}
if ( available = 0 )
{
Menu, FilesContextMenuFile, Disable, 高速下载(&N)
Menu, FilesContextMenuFile, Disable, 高速备用下载(&L)
Menu, FilesContextMenuFile2, Disable, 高速下载(&N)
Menu, FilesContextMenuFile2, Disable, 高速备用下载(&L)
}
if ( RegExMatch(pathlast, "^""") = 0 )
{
Menu, FilesContextMenuFile, Show
}
else
{
Menu, FilesContextMenuFile2, Show
}
}
else
{
if ( version = "" || devuid = "" || rand = "" || time = "" )
{
Menu, FilesContextMenuFile3, Disable, 下载(&W)
Menu, FilesContextMenuFile3, Disable, 备用下载(&A)
Menu, FilesContextMenuFile4, Disable, 下载(&W)
Menu, FilesContextMenuFile4, Disable, 备用下载(&A)
}
else
{
Menu, FilesContextMenuFile3, Enable, 下载(&W)
Menu, FilesContextMenuFile3, Enable, 备用下载(&A)
Menu, FilesContextMenuFile4, Enable, 下载(&W)
Menu, FilesContextMenuFile4, Enable, 备用下载(&A)
}
if ( available = 0 )
{
Menu, FilesContextMenuFile3, Disable, 高速下载(&N)
Menu, FilesContextMenuFile3, Disable, 高速备用下载(&L)
Menu, FilesContextMenuFile4, Disable, 高速下载(&N)
Menu, FilesContextMenuFile4, Disable, 高速备用下载(&L)
}
else
{
i := rownumber
Loop
{
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(type, i, 3)
if ( type = "文件夹" )
{
break
}
}
if ( type = "文件夹" )
{
Menu, FilesContextMenuFile3, Disable, 高速下载(&N)
Menu, FilesContextMenuFile3, Disable, 高速备用下载(&L)
Menu, FilesContextMenuFile4, Disable, 高速下载(&N)
Menu, FilesContextMenuFile4, Disable, 高速备用下载(&L)
}
else
{
Menu, FilesContextMenuFile3, Enable, 高速下载(&N)
Menu, FilesContextMenuFile3, Enable, 高速备用下载(&L)
Menu, FilesContextMenuFile4, Enable, 高速下载(&N)
Menu, FilesContextMenuFile4, Enable, 高速备用下载(&L)
}
}
if ( RegExMatch(pathlast, "^""") = 0 )
{
Menu, FilesContextMenuFile3, Show
}
else
{
Menu, FilesContextMenuFile4, Show
}
}
}
else
{
GuiControlGet, path,, currentpath
if ( path = currentpath )
{
if ( source = "" )
{
Menu, FilesContextMenuBlankArea, Disable, 粘贴(&P)
}
else
{
Menu, FilesContextMenuBlankArea, Enable, 粘贴(&P)
}
Menu, FilesContextMenuBlankArea, Show
}
else
{
Menu, FilesContextMenuBlankArea2, Show
}
}
case "shared":
Gui, ListView, shared
rownumber := LV_GetNext()
if ( rownumber != 0 )
{
Menu, SharedContextMenu, Show
}
else
{
if ( LV_GetCount() = 0 )
{
Menu, SharedContextMenuBlankArea, Disable, 取消所有已失效的分享(&R)
}
else
{
Menu, SharedContextMenuBlankArea, Enable, 取消所有已失效的分享(&R)
}
Menu, SharedContextMenuBlankArea, Show
}
case "recyclebin":
Gui, ListView, recyclebin
rownumber := LV_GetNext()
if ( rownumber != 0 )
{
Menu, RecycleBinContextMenu, Show
}
else
{
if ( LV_GetCount() = 0 )
{
Menu, RecycleBinContextMenuBlankArea, Disable, 清空回收站(&B)
}
else
{
Menu, RecycleBinContextMenuBlankArea, Enable, 清空回收站(&B)
}
Menu, RecycleBinContextMenuBlankArea, Show
}
}
}
}
return
FilesContextMenuOpen()
{
Thread, Priority, 1
Gui +OwnDialogs
Gui, ListView, file
LV_GetText(path, focused, 6)
list(path)
return
}
FilesContextMenuDownloadQueue()
{
SIGINT := 0
r := rpc_status()
if ( r != 0 )
{
Gui +OwnDialogs
r := rpc_start()
if ( r != 0 )
{
return
}
}
Gosub, creating
Gui +OwnDialogs
i := rownumber - 1
Gui, 1:Default
Gui, ListView, file
Loop
{
if ( SIGINT = 1 )
{
return
}
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(type, i, 3)
LV_GetText(path, i, 6)
if ( type = "文件夹" )
{
FolderDownloadQueue(path)
}
else
{
r := FileDownloadQueue(path, dlink)
if ( r = 0 )
{
useragent := "netdisk;" . version . ";PC;PC-Windows;6.3.9600;WindowsBaiduYunGuanJia"
LV_GetText(server_filename, i)
if ( currentpath = "/" )
{
path := RegExReplace(path, "^/")
}
else
{
t := RegExReplace(currentpath, "\.", "\.")
t := RegExReplace(t, "\+", "\+")
t := RegExReplace(t, "\[", "\[")
t := RegExReplace(t, "\{", "\{")
t := RegExReplace(t, "\(", "\(")
t := RegExReplace(t, "\)", "\)")
t := RegExReplace(t, "\^", "\^")
t := RegExReplace(t, "\$", "\$")
path := RegExReplace(path, "^" . t . "/")
}
if ( path = server_filename )
{
dir := ""
}
else
{
t := RegExReplace(server_filename, "\.", "\.")
t := RegExReplace(t, "\+", "\+")
t := RegExReplace(t, "\[", "\[")
t := RegExReplace(t, "\{", "\{")
t := RegExReplace(t, "\(", "\(")
t := RegExReplace(t, "\)", "\)")
t := RegExReplace(t, "\^", "\^")
t := RegExReplace(t, "\$", "\$")
path := RegExReplace(path, "/" . t . "$")
dir := StrReplace(path, "/", "\")
}
dir := ( dir = "" ? downloadlocation : downloadlocation . "\" . dir )
dir := StrReplace(dir, "\", "\\")
add(dlink, useragent, server_filename, dir)
}
}
}
Gui, 1:-Disabled
Gui, 5:Destroy
return
}
FolderDownloadQueue(path2, page := 1)
{
Global Cookie
Encodepath := UrlEncode(path2)
URL := encrypt = 1 ? "https://pan.baidu.com/api/list?dir=" . Encodepath . "&page=" . page . "&num=1000" : "http://pan.baidu.com/api/list?dir=" . Encodepath . "&page=" . page . "&num=1000"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=\[).*(?=])", list)
if ( list != "" )
{
list := StrSplit(list, ",{""")
for key, value in list
{
if ( SIGINT = 1 )
{
return
}
RegExMatch(value, "(?<=isdir"":)\d", isdir)
RegExMatch(value, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
if ( isdir = 1 )
{
FolderDownloadQueue(path)
}
else
{
r := FileDownloadQueue(path, dlink)
if ( r = 0 )
{
useragent := "netdisk;" . version . ";PC;PC-Windows;6.3.9600;WindowsBaiduYunGuanJia"
RegExMatch(value, "(?<=server_filename"":"")[^""]+", server_filename)
server_filename := UnicodeDec(server_filename)
if ( currentpath = "/" )
{
path := RegExReplace(path, "^/")
}
else
{
t := RegExReplace(currentpath, "\.", "\.")
t := RegExReplace(t, "\+", "\+")
t := RegExReplace(t, "\[", "\[")
t := RegExReplace(t, "\{", "\{")
t := RegExReplace(t, "\(", "\(")
t := RegExReplace(t, "\)", "\)")
t := RegExReplace(t, "\^", "\^")
t := RegExReplace(t, "\$", "\$")
path := RegExReplace(path, "^" . t . "/")
}
if ( path = server_filename )
{
dir := ""
}
else
{
t := RegExReplace(server_filename, "\.", "\.")
t := RegExReplace(t, "\+", "\+")
t := RegExReplace(t, "\[", "\[")
t := RegExReplace(t, "\{", "\{")
t := RegExReplace(t, "\(", "\(")
t := RegExReplace(t, "\)", "\)")
t := RegExReplace(t, "\^", "\^")
t := RegExReplace(t, "\$", "\$")
path := RegExReplace(path, "/" . t . "$")
dir := StrReplace(path, "/", "\")
}
dir := ( dir = "" ? downloadlocation : downloadlocation . "\" . dir )
dir := StrReplace(dir, "\", "\\")
add(dlink, useragent, server_filename, dir)
}
}
}
if ( list.Length() = 1000 )
{
FolderDownloadQueue(path2, ++page)
}
}
}
else
{
MsgBox, 16, 错误:list, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:list, 出现意外错误。
}
return
}
FileDownloadQueue(ByRef path, ByRef dlink)
{
proxy()
Global Cookie
Global t1
Encodepath := UrlEncode(path)
URL := encrypt = 1 ? "https://d.pcs.baidu.com/rest/2.0/pcs/file?app_id=250528&method=locatedownload&check_blue=1&es=1&esl=1&path=" . Encodepath . "&ver=4.0&dtype=1&err_ver=1.0&ehps=0&clienttype=8&channel=00000000000000000000000000000000&version=" . version . "&devuid=" . devuid . "&rand=" . rand . "&time=" . time . "&vip=2" : "http://d.pcs.baidu.com/rest/2.0/pcs/file?app_id=250528&method=locatedownload&check_blue=1&es=1&esl=1&path=" . Encodepath . "&ver=4.0&dtype=1&err_ver=1.0&ehps=0&clienttype=8&channel=00000000000000000000000000000000&version=" . version . "&devuid=" . devuid . "&rand=" . rand . "&time=" . time . "&vip=2"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk;" . version . ";PC;PC-Windows;6.3.9600;WindowsBaiduYunGuanJia")
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
whr.Send(" ")
whr.WaitForResponse()
if ( RegExMatch(whr.ResponseText, "(?<=""error_code"":)-?\d+", error_code) = 0 )
{
RegExMatch(whr.ResponseText, "(?<=\[)[^]]+", urls)
urls := StrSplit(urls, ",{")
if ( urls.Length() = 1 && InStr(whr.ResponseText, "http://issuecdn.baidupcs.com") != 0 )
{
MsgBox, 16, 错误:file, 无法下载 '%server_filename%'。该文件可能已被阻止。
return
}
if ( vip_type != 2 && adjust != 0 )
{
if ( adjust = "" )
{
r := g()
if ( r > 1 )
{
if ( c() != "" )
{
adjust := 0
return, FileDownloadQueue(path, dlink)
}
}
else
{
adjust := 1
t1 := A_TickCount
}
}
else if ( adjust = 1 )
{
if ( A_TickCount - t1 > 1000000 )
{
r := g()
if ( r > 1 && c() != "" )
{
adjust := 0
return, FileDownloadQueue(path, dlink)
}
}
t1 := A_TickCount
}
}
for key, value in urls
{
RegExMatch(value, """http[^""]+""", t)
dlink .= t . ","
}
dlink := RegExReplace(dlink, ",$")
return, 0
}
else
{
RegExMatch(whr.ResponseText, "(?<=""error_msg"":"")[^""]+", error_msg)
MsgBox, 16, 错误:file, %error_msg%。错误代码: %error_code%
}
}
Catch
{
MsgBox, 16, 错误:file, 出现意外错误。
}
return
}
creating:
Gui, 1:+Disabled
Gui, 5:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 正在创建下载队列任务...
Gui, Add, Button, x310 y+40 w80 Default gcancel5, 取消
Gui, Show, h95 w400, 正在创建下载队列任务
return
5GuiClose:
cancel5:
SIGINT := 1
Gui, 1:-Disabled
Gui, 5:Destroy
return
FilesContextMenuDownloadQueue2()
{
SIGINT := 0
Gosub, creating
Gui +OwnDialogs
i := rownumber - 1
Gui, 1:Default
Gui, ListView, file
Loop
{
if ( SIGINT = 1 )
{
FileDelete, Temp\~d
return
}
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(type, i, 3)
LV_GetText(path, i, 6)
if ( type = "文件夹" )
{
FolderDownloadQueue2(path)
}
else
{
LV_GetText(server_filename, i)
FileDownloadQueue2(path, server_filename)
}
}
Run, cmd.exe /Q /K cd /d "%A_ScriptDir%" && for /F "tokens=*" `%i in ('type Temp\~d') do saldl\saldl.exe -CC -r -s%chunksize% -c%connections% -R%connectionmaxrate% --skip-TLS-verification -unetdisk;%version%;PC;PC-Windows;6.3.9600;WindowsBaiduYunGuanJia `%i,, UseErrorLevel, PID
if ( ErrorLevel = 0 )
{
Gui, ListView, download
LV_Add("icon11", "队列任务",,,, PID)
Sleep, 3000
FileDelete, Temp\~d
}
else
{
MsgBox, 16, %A_ScriptDir%\saldl\saldl.exe, 启动 %A_ScriptDir%\saldl\saldl.exe 时出现意外错误。
}
Gui, 1:-Disabled
Gui, 5:Destroy
return
}
FolderDownloadQueue2(path2, page := 1)
{
Global Cookie
Encodepath := UrlEncode(path2)
URL := encrypt = 1 ? "https://pan.baidu.com/api/list?dir=" . Encodepath . "&page=" . page . "&num=1000" : "http://pan.baidu.com/api/list?dir=" . Encodepath . "&page=" . page . "&num=1000"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=\[).*(?=])", list)
if ( list != "" )
{
list := StrSplit(list, ",{""")
for key, value in list
{
if ( SIGINT = 1 )
{
return
}
RegExMatch(value, "(?<=isdir"":)\d", isdir)
RegExMatch(value, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
if ( isdir = 1 )
{
FolderDownloadQueue2(path)
}
else
{
RegExMatch(value, "(?<=server_filename"":"")[^""]+", server_filename)
server_filename := UnicodeDec(server_filename)
FileDownloadQueue2(path, server_filename)
}
}
if ( list.Length() = 1000 )
{
FolderDownloadQueue2(path2, ++page)
}
}
}
else
{
MsgBox, 16, 错误:list, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:list, 出现意外错误。
}
return
}
FileDownloadQueue2(ByRef path, ByRef server_filename)
{
proxy()
Global Cookie
Global t1
Encodepath := UrlEncode(path)
URL := encrypt = 1 ? "https://d.pcs.baidu.com/rest/2.0/pcs/file?app_id=250528&method=locatedownload&check_blue=1&es=1&esl=1&path=" . Encodepath . "&ver=4.0&dtype=1&err_ver=1.0&ehps=0&clienttype=8&channel=00000000000000000000000000000000&version=" . version . "&devuid=" . devuid . "&rand=" . rand . "&time=" . time . "&vip=2" : "http://d.pcs.baidu.com/rest/2.0/pcs/file?app_id=250528&method=locatedownload&check_blue=1&es=1&esl=1&path=" . Encodepath . "&ver=4.0&dtype=1&err_ver=1.0&ehps=0&clienttype=8&channel=00000000000000000000000000000000&version=" . version . "&devuid=" . devuid . "&rand=" . rand . "&time=" . time . "&vip=2"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk;" . version . ";PC;PC-Windows;6.3.9600;WindowsBaiduYunGuanJia")
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
whr.Send(" ")
whr.WaitForResponse()
if ( RegExMatch(whr.ResponseText, "(?<=""error_code"":)-?\d+", error_code) = 0 )
{
RegExMatch(whr.ResponseText, "(?<=\[)[^]]+", urls)
urls := StrSplit(urls, ",{")
if ( urls.Length() = 1 && InStr(whr.ResponseText, "http://issuecdn.baidupcs.com") != 0 )
{
MsgBox, 16, 错误:file, 无法下载 '%server_filename%'。该文件可能已被阻止。
return
}
if ( vip_type != 2 && adjust != 0 )
{
if ( adjust = "" )
{
r := g()
if ( r > 1 )
{
if ( c() != "" )
{
adjust := 0
return, FileDownloadQueue2(path, server_filename)
}
}
else
{
adjust := 1
t1 := A_TickCount
}
}
else if ( adjust = 1 )
{
if ( A_TickCount - t1 > 1000000 )
{
r := g()
if ( r > 1 && c() != "" )
{
adjust := 0
return, FileDownloadQueue2(path, server_filename)
}
}
t1 := A_TickCount
}
}
for key, value in urls
{
RegExMatch(value, """http[^""]+""", t)
dlink .= " --mirror-url " . t . "`n"
}
Sort, dlink, Random
dlink := StrReplace(dlink, "`n")
RegExMatch(dlink, "([^""]+""[^""]+""){1,4}", dlink)
dlink := RegExReplace(dlink, "^ --mirror-url ")
if ( currentpath = "/" )
{
path := RegExReplace(path, "^/")
}
else
{
t := RegExReplace(currentpath, "\.", "\.")
t := RegExReplace(t, "\+", "\+")
t := RegExReplace(t, "\[", "\[")
t := RegExReplace(t, "\{", "\{")
t := RegExReplace(t, "\(", "\(")
t := RegExReplace(t, "\)", "\)")
t := RegExReplace(t, "\^", "\^")
t := RegExReplace(t, "\$", "\$")
path := RegExReplace(path, "^" . t . "/")
}
if ( path = server_filename )
{
dir := ""
}
else
{
t := RegExReplace(server_filename, "\.", "\.")
t := RegExReplace(t, "\+", "\+")
t := RegExReplace(t, "\[", "\[")
t := RegExReplace(t, "\{", "\{")
t := RegExReplace(t, "\(", "\(")
t := RegExReplace(t, "\)", "\)")
t := RegExReplace(t, "\^", "\^")
t := RegExReplace(t, "\$", "\$")
path := RegExReplace(path, "/" . t . "$")
dir := StrReplace(path, "/", "\")
}
if ( dir = "" )
{
FileAppend, -o"%server_filename%" -D"%downloadlocation%" %dlink%`r`n, Temp\~d, UTF-16
}
else
{
if ( InStr(FileExist("%downloadlocation%\%dir%"), "D") = 0 )
{
FileCreateDir, %downloadlocation%\%dir%
if ( ErrorLevel = 1 )
{
MsgBox, 16, %downloadlocation%\%dir%, 无法创建文件夹 '%downloadlocation%\%dir%'
return
}
}
FileAppend, -o"%server_filename%" -D"%downloadlocation%\%dir%" %dlink%`r`n, Temp\~d, UTF-16
}
if ( ErrorLevel = 1 )
{
MsgBox, 16, '%A_ScriptDir%\Temp\~d', 写入文件 '%A_ScriptDir%\Temp\~d' 时出错。
}
}
else
{
RegExMatch(whr.ResponseText, "(?<=""error_msg"":"")[^""]+", error_msg)
MsgBox, 16, 错误:file, %error_msg%。错误代码: %error_code%
}
}
Catch
{
MsgBox, 16, 错误:file, 出现意外错误。
}
return
}
FilesContextMenuDownloadQueue3()
{
SIGINT := 0
r := rpc_status()
if ( r != 0 )
{
Gui +OwnDialogs
r := rpc_start()
if ( r != 0 )
{
return
}
}
Gosub, creating
Gui +OwnDialogs
i := rownumber - 1
Gui, 1:Default
Gui, ListView, file
Loop
{
if ( SIGINT = 1 )
{
return
}
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(type, i, 3)
LV_GetText(path, i, 6)
if ( type = "文件夹" )
{
FolderDownloadQueue3(path)
}
else
{
error_code := FileDownloadQueue3(path, Location)
if ( error_code = 302 )
{
dlink := """" . Location . """"
LV_GetText(server_filename, i)
if ( currentpath = "/" )
{
path := RegExReplace(path, "^/")
}
else
{
t := RegExReplace(currentpath, "\.", "\.")
t := RegExReplace(t, "\+", "\+")
t := RegExReplace(t, "\[", "\[")
t := RegExReplace(t, "\{", "\{")
t := RegExReplace(t, "\(", "\(")
t := RegExReplace(t, "\)", "\)")
t := RegExReplace(t, "\^", "\^")
t := RegExReplace(t, "\$", "\$")
path := RegExReplace(path, "^" . t . "/")
}
if ( path = server_filename )
{
dir := ""
}
else
{
t := RegExReplace(server_filename, "\.", "\.")
t := RegExReplace(t, "\+", "\+")
t := RegExReplace(t, "\[", "\[")
t := RegExReplace(t, "\{", "\{")
t := RegExReplace(t, "\(", "\(")
t := RegExReplace(t, "\)", "\)")
t := RegExReplace(t, "\^", "\^")
t := RegExReplace(t, "\$", "\$")
path := RegExReplace(path, "/" . t . "$")
dir := StrReplace(path, "/", "\")
}
dir := ( dir = "" ? downloadlocation : downloadlocation . "\" . dir )
dir := StrReplace(dir, "\", "\\")
add(dlink, useragent3, server_filename, dir)
}
}
}
Gui, 1:-Disabled
Gui, 5:Destroy
return
}
FolderDownloadQueue3(path2, page := 1)
{
Global Cookie
Encodepath := UrlEncode(path2)
URL := encrypt = 1 ? "https://pan.baidu.com/api/list?dir=" . Encodepath . "&page=" . page . "&num=1000" : "http://pan.baidu.com/api/list?dir=" . Encodepath . "&page=" . page . "&num=1000"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=\[).*(?=])", list)
if ( list != "" )
{
list := StrSplit(list, ",{""")
for key, value in list
{
if ( SIGINT = 1 )
{
return
}
RegExMatch(value, "(?<=isdir"":)\d", isdir)
RegExMatch(value, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
if ( isdir = 1 )
{
FolderDownloadQueue3(path)
}
else
{
error_code := FileDownloadQueue3(path, Location)
if ( error_code = 302 )
{
dlink := """" . Location . """"
RegExMatch(value, "(?<=server_filename"":"")[^""]+", server_filename)
server_filename := UnicodeDec(server_filename)
if ( currentpath = "/" )
{
path := RegExReplace(path, "^/")
}
else
{
t := RegExReplace(currentpath, "\.", "\.")
t := RegExReplace(t, "\+", "\+")
t := RegExReplace(t, "\[", "\[")
t := RegExReplace(t, "\{", "\{")
t := RegExReplace(t, "\(", "\(")
t := RegExReplace(t, "\)", "\)")
t := RegExReplace(t, "\^", "\^")
t := RegExReplace(t, "\$", "\$")
path := RegExReplace(path, "^" . t . "/")
}
if ( path = server_filename )
{
dir := ""
}
else
{
t := RegExReplace(server_filename, "\.", "\.")
t := RegExReplace(t, "\+", "\+")
t := RegExReplace(t, "\[", "\[")
t := RegExReplace(t, "\{", "\{")
t := RegExReplace(t, "\(", "\(")
t := RegExReplace(t, "\)", "\)")
t := RegExReplace(t, "\^", "\^")
t := RegExReplace(t, "\$", "\$")
path := RegExReplace(path, "/" . t . "$")
dir := StrReplace(path, "/", "\")
}
dir := ( dir = "" ? downloadlocation : downloadlocation . "\" . dir )
dir := StrReplace(dir, "\", "\\")
add(dlink, useragent3, server_filename, dir)
}
}
}
if ( list.Length() = 1000 )
{
FolderDownloadQueue3(path2, ++page)
}
}
}
else
{
MsgBox, 16, 错误:list, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:list, 出现意外错误。
}
return
}
FileDownloadQueue3(ByRef path, ByRef Location)
{
Global Cookie
Encodepath := UrlEncode(path)
URL := encrypt = 1 ? "https://pcs.baidu.com/rest/2.0/pcs/file?app_id=" . app_id . "&method=download&path=" . Encodepath : "http://pcs.baidu.com/rest/2.0/pcs/file?app_id=" . app_id . "&method=download&path=" . Encodepath
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", useragent3)
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""error_code"":)-?\d+", error_code)
if ( error_code = 302 )
{
Location := whr.GetResponseHeader("Location")
}
else
{
RegExMatch(whr.ResponseText, "(?<=""error_msg"":"")[^""]+", error_msg)
MsgBox, 16, 错误:file, %error_msg%。错误代码: %error_code%
}
return, error_code
}
Catch
{
MsgBox, 16, 错误:file, 出现意外错误。
}
return
}
FilesContextMenuDownloadQueue4()
{
SIGINT := 0
Global input := ""
r := rpc_status()
if ( r != 0 )
{
Gui +OwnDialogs
r := rpc_start()
if ( r != 0 )
{
return
}
}
Gosub, creating
Gui +OwnDialogs
pwd := random()
i := rownumber - 1
Gui, 1:Default
Gui, ListView, file
Loop
{
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(fs_id, i, 8)
fid_list .= fs_id . "%2C"
}
fid_list := RegExReplace(fid_list, "%2C$")
errno := share2(pwd, fid_list, link)
if ( errno = 0 )
{
if ( SIGINT = 1 )
{
if ( stop33 = 1 )
{
cancel2()
}
return
}
errno := openshare(link, Location)
if ( errno = 0 )
{
if ( SIGINT = 1 )
{
if ( stop33 = 1 )
{
cancel2()
}
return
}
errno := verify(Location, pwd)
switch errno
{
case 0:
if ( SIGINT = 1 )
{
if ( stop33 = 1 )
{
cancel2()
}
return
}
errno := openshare302(link)
if ( errno = 0 )
{
if ( SIGINT = 1 )
{
if ( stop33 = 1 )
{
cancel2()
}
return
}
fid_list := ""
errno := opensharelistroot2(fid_list)
if ( errno = 0 )
{
if ( SIGINT = 1 )
{
if ( stop33 = 1 )
{
cancel2()
}
return
}
sharedownload4(fid_list, 12)
}
}
case "":
MsgBox, 16, 错误:verify, 出现意外错误。
default:
MsgBox, 16, 错误:verify, 错误代码: %errno%
}
}
if ( stop33 = 1 )
{
cancel2()
}
}
Gui, 1:-Disabled
Gui, 5:Destroy
return
}
share2(ByRef pwd, ByRef fid_list, ByRef link)
{
Global Cookie
URL := encrypt = 1 ? "https://pan.baidu.com/share/set?clienttype=6" : "http://pan.baidu.com/share/set?clienttype=6"
Body := "schannel=4&channel_list=%5B%5D&period=" . period33 . "&pwd=" . pwd . "&fid_list=%5B" . fid_list . "%5D"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=""link"":"")[^""]+", link)
link := StrReplace(link, "\")
}
else
{
RegExMatch(whr.ResponseText, "(?<=""show_msg"":"")[^""]+", show_msg)
show_msg := UnicodeDec(show_msg)
MsgBox, 16, 错误:set, %show_msg%。错误代码: %errno%
}
return, errno
}
Catch
{
MsgBox, 16, 错误:set, 出现意外错误。
}
return
}
opensharelistroot2(ByRef fid_list)
{
proxy()
Global BDCLND
Global uk
Global shareid
URL := encrypt = 1 ? "https://pan.baidu.com/share/list?uk=" . uk . "&shareid=" . shareid . "&root=1" : "http://pan.baidu.com/share/list?uk=" . uk . "&shareid=" . shareid . "&root=1"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", "BDCLND=" . BDCLND)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=\[).+(?=])", list)
list := StrSplit(list, ",{""")
for key, value in list
{
if ( SIGINT = 1 )
{
return
}
RegExMatch(value, "(?<=isdir"":"")\d", isdir)
if ( isdir = 1 )
{
RegExMatch(value, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
FolderDownloadQueue4(path, fid_list)
}
else
{
RegExMatch(value, "(?<=fs_id"":"")\d+", fs_id)
fid_list .= fs_id . "%2C"
}
}
fid_list := RegExReplace(fid_list, "%2C$")
}
else
{
MsgBox, 16, 错误:list, 错误代码: %errno%
}
return, errno
}
Catch
{
MsgBox, 16, 错误:list, 出现意外错误。
}
return
}
FolderDownloadQueue4(path2, ByRef fid_list, page := 1)
{
Global BDCLND
Global uk
Global shareid
Encodepath := UrlEncode(path2)
URL := encrypt = 1 ? "https://pan.baidu.com/share/list?uk=" . uk . "&shareid=" . shareid . "&page=" . page . "&num=100" . "&dir=" . Encodepath : "http://pan.baidu.com/share/list?uk=" . uk . "&shareid=" . shareid . "&page=" . page . "&num=100" . "&dir=" . Encodepath
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", "BDCLND=" . BDCLND)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=\[).+(?=])", list)
if ( list != "" )
{
list := StrSplit(list, ",{""")
for key, value in list
{
if ( SIGINT = 1 )
{
return
}
RegExMatch(value, "(?<=isdir"":)\d", isdir)
if ( isdir = 1 )
{
RegExMatch(value, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
FolderDownloadQueue4(path, fid_list)
}
else
{
RegExMatch(value, "(?<=fs_id"":)\d+", fs_id)
fid_list .= fs_id . "%2C"
}
}
if ( list.Length() = 100 )
{
FolderDownloadQueue4(path2, fid_list, ++page)
}
}
}
else
{
MsgBox, 16, 错误:list, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:list, 出现意外错误。
}
return
}
sharedownload4(ByRef fid_list, clienttype := 0, backup := 0)
{
proxy()
Global sign
Global timestamp
Global BDCLND
Global uk
Global shareid
Global input
Global vcode
URL := encrypt = 1 ? "https://pan.baidu.com/api/sharedownload?sign=" . sign . "&timestamp=" . timestamp . "&clienttype=" . clienttype : "http://pan.baidu.com/api/sharedownload?sign=" . sign . "&timestamp=" . timestamp . "&clienttype=" . clienttype
Body := "encrypt=0&extra=%7B%22sekey%22%3A%22" . BDCLND . "%22%7D&product=share&uk=" . uk . "&primaryid=" . shareid . "&fid_list=%5B" . fid_list . "%5D" . ( input = "" ? "" : "&vcode_input=" . input . "&vcode_str=" . vcode )
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("Cookie", Cookie2)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
switch errno
{
case 0:
RegExMatch(whr.ResponseText, "(?<=\[).+(?=])", list)
list := StrSplit(list, ",{""")
for key, value in list
{
if ( SIGINT = 1 )
{
return
}
RegExMatch(value, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
RegExMatch(value, "(?<=server_filename"":"")[^""]+", server_filename)
server_filename := UnicodeDec(server_filename)
RegExMatch(value, "(?<=dlink"":"")[^""]+", dlink)
dlink := StrReplace(dlink, "\")
if ( currentpath = "/" )
{
path := RegExReplace(path, "^/")
}
else
{
t := RegExReplace(currentpath, "\.", "\.")
t := RegExReplace(t, "\+", "\+")
t := RegExReplace(t, "\[", "\[")
t := RegExReplace(t, "\{", "\{")
t := RegExReplace(t, "\(", "\(")
t := RegExReplace(t, "\)", "\)")
t := RegExReplace(t, "\^", "\^")
t := RegExReplace(t, "\$", "\$")
path := RegExReplace(path, "^" . t . "/")
}
if ( path = server_filename )
{
dir := ""
}
else
{
t := RegExReplace(server_filename, "\.", "\.")
t := RegExReplace(t, "\+", "\+")
t := RegExReplace(t, "\[", "\[")
t := RegExReplace(t, "\{", "\{")
t := RegExReplace(t, "\(", "\(")
t := RegExReplace(t, "\)", "\)")
t := RegExReplace(t, "\^", "\^")
t := RegExReplace(t, "\$", "\$")
path := RegExReplace(path, "/" . t . "$")
dir := StrReplace(path, "/", "\")
}
if ( backup = 0 )
{
error_code := d6(dlink, Location)
if ( error_code = 302 )
{
dir := ( dir = "" ? downloadlocation : downloadlocation . "\" . dir )
dir := StrReplace(dir, "\", "\\")
add19(Location, server_filename, dir)
}
}
else
{
RegExMatch(value, "(?<=size"":)\d+", size)
if ( size > 52428800 )
{
RegExMatch(dlink, "(?<=file/).+", path)
path := StrReplace(path, "?", "&")
d4(path, server_filename, dir)
}
else
{
d8(dlink, server_filename, dir)
}
}
}
case -20:
input := ""
error := getvcode()
if ( error = 0 )
{
Gosub, getvcode4
if ( input != "" )
{
return, sharedownload4(fid_list, clienttype, backup)
}
}
default:
MsgBox, 16, 错误:d, 错误代码: %errno%
}
return, errno
}
Catch
{
MsgBox, 16, 错误:d, 出现意外错误。
}
return
}
getvcode4:
Gui, 5:+Disabled
Gui, 11:Default
Gui, +Owner5 +Hwndgui11hwnd
Gui, Margin, 0, 0
Gui, Add, Picture, x10 y10 w120 h40 vgenimage, Temp\genimage.jpg
FileDelete, Temp\genimage.jpg
Gui, Add, Button, x+5 y+-23 grefresh10, 刷新
Gui, Add, Text, x10 y+10, 请输入验证码:
Gui, Add, Edit, x10 y+5 h22 w100 vinput
Gui, Add, Text, x+5 y+-17 w200 cRed vinfo
Gui, Add, Button, x225 y+20 w80 Default gconfirm11, 确定
Gui, Add, Button, x+5 w80 gcancel11, 取消
Gui, Show, h147 w400, 请输入验证码
GuiControl, Focus, input
WinWaitClose ahk_id %gui11hwnd%
return
11GuiClose:
cancel11:
Gui, 5:-Disabled
Gui, Destroy
return
confirm11:
Gui, Submit, NoHide
if ( input != "" )
{
Gui, 5:-Disabled
Gui, Destroy
}
else
{
GuiControl,, info, 此信息为必填项
}
return
FilesContextMenuDownloadQueue5()
{
SIGINT := 0
Global input := ""
Gosub, creating
Gui +OwnDialogs
pwd := random()
i := rownumber - 1
Gui, 1:Default
Gui, ListView, file
Loop
{
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(fs_id, i, 8)
fid_list .= fs_id . "%2C"
}
fid_list := RegExReplace(fid_list, "%2C$")
errno := share2(pwd, fid_list, link)
if ( errno = 0 )
{
if ( SIGINT = 1 )
{
if ( stop33 = 1 )
{
cancel2()
}
return
}
errno := openshare(link, Location)
if ( errno = 0 )
{
if ( SIGINT = 1 )
{
if ( stop33 = 1 )
{
cancel2()
}
return
}
errno := verify(Location, pwd)
switch errno
{
case 0:
if ( SIGINT = 1 )
{
if ( stop33 = 1 )
{
cancel2()
}
return
}
errno := openshare302(link)
if ( errno = 0 )
{
if ( SIGINT = 1 )
{
if ( stop33 = 1 )
{
cancel2()
}
return
}
fid_list := ""
errno := opensharelistroot2(fid_list)
if ( errno = 0 )
{
if ( SIGINT = 1 )
{
if ( stop33 = 1 )
{
cancel2()
}
return
}
errno := sharedownload4(fid_list,, 1)
if ( errno = 0 )
{
Run, cmd.exe /Q /K cd /d "%A_ScriptDir%" && for /F "tokens=*" `%i in ('type Temp\~d') do saldl\saldl.exe -CC -r -s%chunksize% -c%connections2% -R%connectionmaxrate% --skip-TLS-verification `%i,, UseErrorLevel, PID
if ( ErrorLevel = 0 )
{
Gui, 1:Default
Gui, ListView, download
LV_Add("icon11", "队列任务",,,, PID)
Sleep, 3000
FileDelete, Temp\~d
}
else
{
MsgBox, 16, %A_ScriptDir%\saldl\saldl.exe, 启动 %A_ScriptDir%\saldl\saldl.exe 时出现意外错误。
}
}
}
}
case "":
MsgBox, 16, 错误:verify, 出现意外错误。
default:
MsgBox, 16, 错误:verify, 错误代码: %errno%
}
}
if ( stop33 = 1 )
{
cancel2()
}
}
Gui, 1:-Disabled
Gui, 5:Destroy
return
}
FilesContextMenuDownload()
{
Thread, Priority, 1
Gui +OwnDialogs
r := rpc_status()
if ( r != 0 )
{
r := rpc_start()
if ( r != 0 )
{
return
}
}
Gui, ListView, file
LV_GetText(path, rownumber, 6)
r := file1(path, dlink)
if ( r = 0 )
{
useragent := "netdisk;" . version . ";PC;PC-Windows;6.3.9600;WindowsBaiduYunGuanJia"
LV_GetText(server_filename, rownumber)
dir := StrReplace(downloadlocation, "\", "\\")
add(dlink, useragent, server_filename, dir)
}
return
}
file1(ByRef path, ByRef dlink)
{
proxy()
Global Cookie
Global t1
Encodepath := UrlEncode(path)
URL := encrypt = 1 ? "https://d.pcs.baidu.com/rest/2.0/pcs/file?app_id=250528&method=locatedownload&check_blue=1&es=1&esl=1&path=" . Encodepath . "&ver=4.0&dtype=1&err_ver=1.0&ehps=0&clienttype=8&channel=00000000000000000000000000000000&version=" . version . "&devuid=" . devuid . "&rand=" . rand . "&time=" . time . "&vip=2" : "http://d.pcs.baidu.com/rest/2.0/pcs/file?app_id=250528&method=locatedownload&check_blue=1&es=1&esl=1&path=" . Encodepath . "&ver=4.0&dtype=1&err_ver=1.0&ehps=0&clienttype=8&channel=00000000000000000000000000000000&version=" . version . "&devuid=" . devuid . "&rand=" . rand . "&time=" . time . "&vip=2"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk;" . version . ";PC;PC-Windows;6.3.9600;WindowsBaiduYunGuanJia")
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
whr.Send(" ")
whr.WaitForResponse()
if ( RegExMatch(whr.ResponseText, "(?<=""error_code"":)-?\d+", error_code) = 0 )
{
RegExMatch(whr.ResponseText, "(?<=\[)[^]]+", urls)
urls := StrSplit(urls, ",{")
if ( urls.Length() = 1 && InStr(whr.ResponseText, "http://issuecdn.baidupcs.com") != 0 )
{
MsgBox, 16, 错误:file, 无法下载 '%server_filename%'。该文件可能已被篡改。
return
}
if ( vip_type != 2 && adjust != 0 )
{
if ( adjust = "" )
{
r := g()
if ( r > 1 )
{
if ( c() != "" )
{
adjust := 0
return, file1(path, dlink)
}
}
else
{
adjust := 1
t1 := A_TickCount
}
}
else if ( adjust = 1 )
{
if ( A_TickCount - t1 > 1000000 )
{
r := g()
if ( r > 1 && c() != "" )
{
adjust := 0
return, file1(path, dlink)
}
}
t1 := A_TickCount
}
}
for key, value in urls
{
RegExMatch(value, """http[^""]+""", t)
dlink .= t . ","
}
dlink := RegExReplace(dlink, ",$")
return, 0
}
else
{
RegExMatch(whr.ResponseText, "(?<=""error_msg"":"")[^""]+", error_msg)
MsgBox, 16, 错误:file, %error_msg%。错误代码: %error_code%
}
}
Catch
{
MsgBox, 16, 错误:file, 出现意外错误。
}
return
}
add(ByRef dlink, ByRef useragent, ByRef server_filename, ByRef dir)
{
URL := "http://127.0.0.1:6800/jsonrpc"
Body := "{""jsonrpc"":""2.0"",""id"":" . ++id . ",""method"":""aria2.addUri"",""params"":[[" . dlink . "],{""dir"":""" . dir  . """,""user-agent"":""" . useragent . """,""out"":""" . server_filename . """}]}"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Open("POST", URL, true)
whr.Send(Body)
whr.WaitForResponse()
}
return
}
rpc_status()
{
URL := "http://127.0.0.1:6800/jsonrpc"
Body := "{""jsonrpc"":""2.0"",""id"":1,""method"":""aria2.getVersion""}"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Open("POST", URL, true)
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""version"":"")[^""]+", r)
if ( r != "" )
{
return, 0
}
}
return
}
rpc_start()
{
Run, cmd.exe /K cd /d "%A_ScriptDir%" && aria2\aria2c.exe --enable-rpc --conf-path=aria2\aria2.conf,, UseErrorLevel
if ( ErrorLevel != 0 )
{
MsgBox, 16, %A_ScriptDir%\aria2\aria2c.exe, 启动 %A_ScriptDir%\aria2\aria2c.exe 时出现意外错误。
}
return, ErrorLevel
}
g(i := 0)
{
Global Cookie
for key, value in originalfilename
{
Process, Exist, % value
if ( ErrorLevel != 0 )
{
return
}
}
for key, value in productname
{
if ( WinExist(value) != 0 )
{
return
}
}
URL := "https://pan.baidu.com/rest/2.0/membership/speeds/freqctrl?method=get"
if ( encrypt = 1 && i = 0 )
{
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""freq_cnt"":)\d", r)
return, r
}
Catch
{
return, g(1)
}
}
else
{
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe -H User-Agent: -b %Cookie% --noproxy * -s -o Temp\~t %URL%,, Hide
if ( ErrorLevel = 0 )
{
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
FileDelete, Temp\~t
RegExMatch(r, "(?<=""freq_cnt"":)\d", r)
return, r
}
else
{
FileDelete, Temp\~t
}
}
}
return
}
c(i := 0)
{
Global Cookie
for key, value in originalfilename
{
Process, Exist, % value
if ( ErrorLevel != 0 )
{
return
}
}
for key, value in productname
{
if ( WinExist(value) != 0 )
{
return
}
}
URL := "https://pan.baidu.com/rest/2.0/membership/speeds/freqctrl?method=consume"
if ( encrypt = 1 && i = 0 )
{
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""timestamp"":)\d+", r)
return, r
}
Catch
{
return, c(1)
}
}
else
{
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe -H User-Agent: -b %Cookie% --noproxy * -s -o Temp\~t %URL%,, Hide
if ( ErrorLevel = 0 )
{
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
FileDelete, Temp\~t
RegExMatch(r, "(?<=""timestamp"":)\d+", r)
return, r
}
else
{
FileDelete, Temp\~t
}
}
}
return
}
FilesContextMenuDownload2()
{
Thread, Priority, 1
Gui +OwnDialogs
Gui, ListView, file
LV_GetText(server_filename, rownumber)
LV_GetText(sizeKB, rownumber, 4)
LV_GetText(path, rownumber, 6)
LV_GetText(ext, rownumber, 7)
LV_GetText(md5, rownumber, 9)
if ( ext != "文件" )
{
type(ext, index)
}
else
{
index := 4
}
file2(path, index, server_filename, sizeKB, md5)
return
}
file2(ByRef path, ByRef index, ByRef server_filename, ByRef sizeKB, ByRef md5)
{
proxy()
Global Cookie
Global t1
Encodepath := UrlEncode(path)
URL := encrypt = 1 ? "https://d.pcs.baidu.com/rest/2.0/pcs/file?app_id=250528&method=locatedownload&check_blue=1&es=1&esl=1&path=" . Encodepath . "&ver=4.0&dtype=1&err_ver=1.0&ehps=0&clienttype=8&channel=00000000000000000000000000000000&version=" . version . "&devuid=" . devuid . "&rand=" . rand . "&time=" . time . "&vip=2" : "http://d.pcs.baidu.com/rest/2.0/pcs/file?app_id=250528&method=locatedownload&check_blue=1&es=1&esl=1&path=" . Encodepath . "&ver=4.0&dtype=1&err_ver=1.0&ehps=0&clienttype=8&channel=00000000000000000000000000000000&version=" . version . "&devuid=" . devuid . "&rand=" . rand . "&time=" . time . "&vip=2"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk;" . version . ";PC;PC-Windows;6.3.9600;WindowsBaiduYunGuanJia")
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
whr.Send(" ")
whr.WaitForResponse()
if ( RegExMatch(whr.ResponseText, "(?<=""error_code"":)-?\d+", error_code) = 0 )
{
RegExMatch(whr.ResponseText, "(?<=\[)[^]]+", urls)
urls := StrSplit(urls, ",{")
if ( urls.Length() = 1 && InStr(whr.ResponseText, "http://issuecdn.baidupcs.com") != 0 )
{
MsgBox, 16, 错误:file, 无法下载 '%server_filename%'。该文件可能已被篡改。
return
}
if ( vip_type != 2 && adjust != 0 )
{
if ( adjust = "" )
{
r := g()
if ( r > 1 )
{
if ( c() != "" )
{
adjust := 0
return, file2(path, index, server_filename, sizeKB, md5)
}
}
else
{
adjust := 1
t1 := A_TickCount
}
}
else if ( adjust = 1 )
{
if ( A_TickCount - t1 > 1000000 )
{
r := g()
if ( r > 1 && c() != "" )
{
adjust := 0
return, file2(path, index, server_filename, sizeKB, md5)
}
}
t1 := A_TickCount
}
}
for key, value in urls
{
RegExMatch(value, """http[^""]+""", t)
dlink .= " --mirror-url " . t . "`n"
}
Sort, dlink, Random
dlink := StrReplace(dlink, "`n")
RegExMatch(dlink, "([^""]+""[^""]+""){1,4}", dlink)
dlink := RegExReplace(dlink, "^ --mirror-url ")
Run, cmd.exe /K cd /d "%A_ScriptDir%" && saldl\saldl.exe -CC -r -s%chunksize% -c%connections% -o"%server_filename%" -D"%downloadlocation%" -R%connectionmaxrate% --skip-TLS-verification -unetdisk;%version%;PC;PC-Windows;6.3.9600;WindowsBaiduYunGuanJia %dlink%,, UseErrorLevel, PID
if ( ErrorLevel = 0 )
{
Gui, ListView, download
LV_Add("icon" . index, server_filename, sizeKB, path, md5, PID)
}
else
{
MsgBox, 16, %A_ScriptDir%\saldl\saldl.exe, 启动 %A_ScriptDir%\saldl\saldl.exe 时出现意外错误。
}
}
else
{
RegExMatch(whr.ResponseText, "(?<=""error_msg"":"")[^""]+", error_msg)
MsgBox, 16, 错误:file, %error_msg%。错误代码: %error_code%
}
}
Catch
{
MsgBox, 16, 错误:file, 出现意外错误。
}
return
}
FilesContextMenuDownload3()
{
Thread, Priority, 1
Gui +OwnDialogs
r := rpc_status()
if ( r != 0 )
{
r := rpc_start()
if ( r != 0 )
{
return
}
}
Gui, ListView, file
LV_GetText(server_filename, rownumber)
LV_GetText(path, rownumber, 6)
error_code := file3(path, Location)
if ( error_code = 302 )
{
dlink := """" . Location . """"
dir := StrReplace(downloadlocation, "\", "\\")
add(dlink, useragent3, server_filename, dir)
}
return
}
file3(ByRef path, ByRef Location)
{
proxy()
Global Cookie
path := UrlEncode(path)
URL := encrypt = 1 ? "https://pcs.baidu.com/rest/2.0/pcs/file?app_id=" . app_id . "&method=download&path=" . path : "http://pcs.baidu.com/rest/2.0/pcs/file?app_id=" . app_id . "&method=download&path=" . path
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", useragent3)
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""error_code"":)-?\d+", error_code)
if ( error_code = 302 )
{
Location := whr.GetResponseHeader("Location")
}
else
{
RegExMatch(whr.ResponseText, "(?<=""error_msg"":"")[^""]+", error_msg)
MsgBox, 16, 错误, %error_msg%。错误代码: %error_code%
}
return, error_code
}
Catch
{
MsgBox, 16, 错误:file, 出现意外错误。
}
return
}
FilesContextMenuDownload4()
{
Gui +OwnDialogs
Global input := ""
r := rpc_status()
if ( r != 0 )
{
r := rpc_start()
if ( r != 0 )
{
return
}
}
pwd := random()
Gui, ListView, file
LV_GetText(server_filename, rownumber)
LV_GetText(fs_id, rownumber, 8)
errno := share(pwd, fs_id, link)
if ( errno = 0 )
{
errno := openshare(link, Location)
if ( errno = 0 )
{
errno := verify(Location, pwd)
switch errno
{
case 0:
errno := openshare302(link)
if ( errno = 0 )
{
errno := sharedownload3(fs_id, dlink, 12)
if ( errno = 0 )
{
error_code := d5(dlink, Location)
if ( error_code = 302 )
{
dir := StrReplace(downloadlocation, "\", "\\")
add19(Location, server_filename, dir)
}
}
}
case "":
MsgBox, 16, 错误:verify, 出现意外错误。
default:
MsgBox, 16, 错误:verify, 错误代码: %errno%
}
}
if ( stop33 = 1 )
{
cancel2()
}
}
return
}
share(ByRef pwd, ByRef fs_id, ByRef link)
{
Global Cookie
URL := encrypt = 1 ? "https://pan.baidu.com/share/set?clienttype=6" : "http://pan.baidu.com/share/set?clienttype=6"
Body := "schannel=4&channel_list=%5B%5D&period=" . period33 . "&pwd=" . pwd . "&fid_list=%5B" . fs_id . "%5D"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=""link"":"")[^""]+", link)
link := StrReplace(link, "\")
}
else
{
RegExMatch(whr.ResponseText, "(?<=""show_msg"":"")[^""]+", show_msg)
show_msg := UnicodeDec(show_msg)
MsgBox, 16, 错误:set, %show_msg%。错误代码: %errno%
}
return, errno
}
Catch
{
MsgBox, 16, 错误:set, 出现意外错误。
}
return
}
openshare(ByRef URL, ByRef Location, i := 0)
{
if ( encrypt = 1 && i = 0 )
{
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
switch whr.Status
{
case 200:
RegExMatch(whr.ResponseText, "(?<=""errortype"":)-?\d+", errortype)
switch errortype
{
case 0:
MsgBox, 16, 错误:o, 分享的项目不存在。
case 1, 10:
MsgBox, 16, 错误:o, 该分享已失效。
case 3:
MsgBox, 16, 错误:o, 拒绝访问。请用浏览器打开此链接以查看原因。
default:
MsgBox, 16, 错误:o, errortype: %errortype%
}
case 302:
Location := whr.GetResponseHeader("Location")
if ( Location != "/error/404.html" )
{
return, 0
}
else
{
MsgBox, 16, 错误:o, HTTP 错误 404 - 文件或目录未找到。
}
case 404:
MsgBox, 16, 错误:o, HTTP 错误 404 - 文件或目录未找到。
default:
MsgBox, 16, 错误:o, % "HTTP 状态代码: " . whr.Status
}
}
Catch
{
return, openshare(URL, Location, 1)
}
}
else
{
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe -H User-Agent: -i --noproxy * -s -o Temp\~t %URL%,, Hide
if ( ErrorLevel = 0 )
{
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
FileDelete, Temp\~t
RegExMatch(r, "\d{3}", code)
switch code
{
case 200:
RegExMatch(r, "(?<=""errortype"":)-?\d+", errortype)
switch errortype
{
case 0:
MsgBox, 16, 错误:o, 分享的项目不存在。
case 1, 10:
MsgBox, 16, 错误:o, 该分享已失效。
case 3:
MsgBox, 16, 错误:o, 拒绝访问。请用浏览器打开此链接以查看原因。
default:
MsgBox, 16, 错误:o, errortype: %errortype%
}
case 302:
RegExMatch(r, "(?<=Location: )[^\n]+", Location)
if ( Location != "/error/404.html" )
{
return, 0
}
else
{
MsgBox, 16, 错误:o, HTTP 错误 404 - 文件或目录未找到。请检查拼写并重试。
}
case 404:
MsgBox, 16, 错误:o, HTTP 错误 404 - 文件或目录未找到。请检查拼写并重试。
default:
MsgBox, 16, 错误:o, % "HTTP 状态代码: " . code
}
}
else
{
FileDelete, Temp\~t
MsgBox, 16, %A_ScriptDir%\Temp\~t, 读取文件 '%A_ScriptDir%\Temp\~t' 时出错。
}
}
else
{
MsgBox, 16, 错误:curl, 出现意外错误。
}
}
return
}
openshare302(ByRef URL, i := 0)
{
Global BDCLND
Global uk
Global timestamp
Global shareid
Global sign
if ( encrypt = 1 && i = 0 )
{
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", "BDCLND=" . BDCLND)
whr.Send()
whr.WaitForResponse()
switch whr.Status
{
case 200:
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=""uk"":)\d+", uk)
RegExMatch(whr.ResponseText, "(?<=""timestamp"":)\d+", timestamp)
RegExMatch(whr.ResponseText, "(?<=""shareid"":)\d+", shareid)
RegExMatch(whr.ResponseText, "(?<=""sign"":"")[^""]+", sign)
}
else
{
MsgBox, 16, 错误:o, 出现意外错误。
}
return, errno
case 302:
if ( whr.GetResponseHeader("Location") = "/error/404.html" )
{
MsgBox, 16, 错误:o, HTTP 错误 404 - 文件或目录未找到。
}
else
{
MsgBox, 16, 错误:o, 出现意外错误。
}
default:
MsgBox, 16, 错误:o, % "HTTP 状态代码: " . whr.Status
}
}
Catch
{
return, openshare302(URL, 1)
}
}
else
{
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe -H User-Agent: -b BDCLND=%BDCLND% -i --noproxy * -s -o Temp\~t %URL%,, Hide
if ( ErrorLevel = 0 )
{
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
FileDelete, Temp\~t
RegExMatch(r, "\d{3}", code)
switch code
{
case 200:
RegExMatch(r, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(r, "(?<=""uk"":)\d+", uk)
RegExMatch(r, "(?<=""timestamp"":)\d+", timestamp)
RegExMatch(r, "(?<=""shareid"":)\d+", shareid)
RegExMatch(r, "(?<=""sign"":"")[^""]+", sign)
}
else
{
MsgBox, 16, 错误:o, 出现意外错误。
}
return, errno
case 302:
RegExMatch(r, "(?<=Location: )[^\n]+", Location)
if ( Location = "/error/404.html" )
{
MsgBox, 16, 错误:o, HTTP 错误 404 - 文件或目录未找到。请检查拼写并重试。
}
else
{
MsgBox, 16, 错误:o, 出现意外错误。
}
case 404:
MsgBox, 16, 错误:o, HTTP 错误 404 - 文件或目录未找到。请检查拼写并重试。
default:
MsgBox, 16, 错误:o, % "HTTP 状态代码: " . code
}
}
else
{
FileDelete, Temp\~t
MsgBox, 16, %A_ScriptDir%\Temp\~t, 读取文件 '%A_ScriptDir%\Temp\~t' 时出错。
}
}
else
{
MsgBox, 16, 错误:curl, 出现意外错误。
}
}
return
}
sharedownload3(ByRef fs_id, ByRef dlink, clienttype := 0)
{
proxy()
Global sign
Global timestamp
Global BDCLND
Global uk
Global shareid
Global input
Global vcode
URL := encrypt = 1 ? "https://pan.baidu.com/api/sharedownload?sign=" . sign . "&timestamp=" . timestamp . "&clienttype=" . clienttype : "http://pan.baidu.com/api/sharedownload?sign=" . sign . "&timestamp=" . timestamp . "&clienttype=" . clienttype
Body := "encrypt=0&extra=%7B%22sekey%22%3A%22" . BDCLND . "%22%7D&product=share&uk=" . uk . "&primaryid=" . shareid . "&fid_list=%5B" . fs_id . "%5D" . ( input = "" ? "" : "&vcode_input=" . input . "&vcode_str=" . vcode )
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("Cookie", Cookie2)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
switch errno
{
case 0:
RegExMatch(whr.ResponseText, "(?<=""dlink"":"")[^""]+", dlink)
dlink := StrReplace(dlink, "\")
case -20:
input := ""
error := getvcode()
if ( error = 0 )
{
Gosub, getvcode3
if ( input != "" )
{
return, sharedownload3(fs_id, dlink, clienttype)
}
}
default:
MsgBox, 16, 错误:d, 错误代码: %errno%
}
return, errno
}
Catch
{
MsgBox, 16, 错误:d, 出现意外错误。
}
return
}
getvcode3:
Gui, 1:+Disabled
Gui, 26:Default
Gui, +Owner1 +Hwndgui26hwnd
Gui, Margin, 0, 0
Gui, Add, Picture, x10 y10 w120 h40 vgenimage, Temp\genimage.jpg
FileDelete, Temp\genimage.jpg
Gui, Add, Button, x+5 y+-23 grefresh10, 刷新
Gui, Add, Text, x10 y+10, 请输入验证码:
Gui, Add, Edit, x10 y+5 h22 w100 vinput
Gui, Add, Text, x+5 y+-17 w200 cRed vinfo
Gui, Add, Button, x225 y+20 w80 Default gconfirm26, 确定
Gui, Add, Button, x+5 w80 gcancel26, 取消
Gui, Show, h147 w400, 请输入验证码
GuiControl, Focus, input
WinWaitClose ahk_id %gui26hwnd%
return
26GuiClose:
cancel26:
Gui, 1:-Disabled
Gui, Destroy
return
confirm26:
Gui, Submit, NoHide
if ( input != "" )
{
Gui, 1:-Disabled
Gui, Destroy
}
else
{
GuiControl,, info, 此信息为必填项
}
return
cancel2()
{
Global shareid
Global Cookie
URL := encrypt = 1 ? "https://pan.baidu.com/share/cancel" : "http://pan.baidu.com/share/cancel"
Body := "shareid_list=[""" . shareid . """]"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno != 0 )
{
MsgBox, 16, 错误:cancel, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:cancel, 出现意外错误。
}
return
}
FilesContextMenuDownload5()
{
Gui +OwnDialogs
Global input := ""
pwd := random()
Gui, ListView, file
LV_GetText(server_filename, rownumber)
LV_GetText(sizeKB, rownumber, 4)
LV_GetText(size, rownumber, 5)
LV_GetText(ext, rownumber, 7)
LV_GetText(fs_id, rownumber, 8)
LV_GetText(md5, rownumber, 9)
if ( ext != "文件" )
{
type(ext, index)
}
else
{
index := 4
}
errno := share(pwd, fs_id, link)
if ( errno = 0 )
{
errno := openshare(link, Location)
if ( errno = 0 )
{
errno := verify(Location, pwd)
switch errno
{
case 0:
errno := openshare302(link)
if ( errno = 0 )
{
errno := sharedownload3(fs_id, dlink)
if ( errno = 0 )
{
if ( size > 52428800 )
{
RegExMatch(dlink, "(?<=file/).+", path)
path := StrReplace(path, "?", "&")
d3(path, index, server_filename, sizeKB, md5)
}
else
{
d7(dlink, index, server_filename, sizeKB, md5)
}
}
}
case "":
MsgBox, 16, 错误:verify, 出现意外错误。
default:
MsgBox, 16, 错误:verify, 错误代码: %errno%
}
}
if ( stop33 = 1 )
{
cancel2()
}
}
return
}
FilesContextMenuDownload6()
{
Thread, Priority, 1
Gui +OwnDialogs
r := rpc_status()
if ( r != 0 )
{
r := rpc_start()
if ( r != 0 )
{
return
}
}
Global Cookie
errno := gettemplatevariable(sign1, sign3, timestamp)
if ( errno != 0 )
{
return
}
r := s(sign3, sign1)
r := sign(r, sign)
if ( r != 0 )
{
return
}
i := rownumber - 1
Gui, ListView, file
LV_GetText(server_filename, rownumber)
LV_GetText(path, rownumber, 6)
Loop
{
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(fs_id, i, 8)
fidlist .= fs_id . "%2C"
}
fidlist := RegExReplace(fidlist, "%2C$")
URL := encrypt = 1 ? "https://pan.baidu.com/api/download?sign=" . sign . "&timestamp=" . timestamp . "&fidlist=%5B" . fidlist . "%5D&type=batch" : "http://pan.baidu.com/api/download?sign=" . sign . "&timestamp=" . timestamp . "&fidlist=%5B" . fidlist . "%5D&type=batch"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=""dlink"":)""[^""]+""", dlink)
dlink := StrReplace(dlink, "\")
useragent := "netdisk"
server_filename .= ".zip"
dir := StrReplace(downloadlocation, "\", "\\")
add(dlink, useragent, server_filename, dir)
}
else
{
MsgBox, 16, 错误:download, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:download, 出现意外错误。
}
return
}
gettemplatevariable(ByRef sign1, ByRef sign3, ByRef timestamp)
{
Global Cookie
URL := encrypt = 1 ? "https://pan.baidu.com/api/gettemplatevariable?fields=[%22sign1%22,%22sign2%22,%22sign3%22,%22timestamp%22]" : "http://pan.baidu.com/api/gettemplatevariable?fields=[%22sign1%22,%22sign2%22,%22sign3%22,%22timestamp%22]"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=""sign1"":"")[^""]+", sign1)
RegExMatch(whr.ResponseText, "(?<=""sign3"":"")[^""]+", sign3)
RegExMatch(whr.ResponseText, "(?<=""timestamp"":)\d+", timestamp)
}
else
{
MsgBox, 16, 错误:gettemplatevariable, 错误代码: %errno%
}
return, errno
}
Catch
{
MsgBox, 16, 错误:gettemplatevariable, 出现意外错误。
}
return
}
s(ByRef j, ByRef r)
{
a := []
p := []
v := StrLen(j)
u := 0
i := 0
Loop, 256
{
a[A_Index - 1] := Asc(SubStr(j, Mod(A_Index - 1, v) + 1, 1))
p[A_Index - 1] := A_Index - 1
}
Loop, 256
{
u := Mod(u + p[A_Index - 1] + a[A_Index - 1], 256)
t := p[A_Index - 1]
p[A_Index - 1] := p[u]
p[u] := t
}
u := 0
Loop, % StrLen(r)
{
i := Mod(i + 1, 256)
u := Mod(u + p[i], 256)
t := p[i]
p[i] := p[u]
p[u] := t
k := p[Mod(p[i] + p[u], 256)]
o .= Chr(Asc(SubStr(r, A_Index, 1)) ^ k)
}
return, o
}
sign(ByRef r, ByRef sign)
{
FileAppend, % r, Temp\~s, CP28591
if ( ErrorLevel = 0 )
{
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && OpenSSL\bin\openssl.exe enc -a -A -in Temp\~s -out Temp\~t,, Hide
if ( ErrorLevel = 0 )
{
FileDelete, Temp\~s
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
sign := UrlEncode(r)
}
else
{
MsgBox, 16, %A_ScriptDir%\Temp\~t, 读取文件 '%A_ScriptDir%\Temp\~t' 时出错。
}
FileDelete, Temp\~t
return, ErrorLevel
}
else
{
FileDelete, Temp\~s
MsgBox, 16, 错误:OpenSSL, 出现意外错误。
}
}
else
{
MsgBox, 16, '%A_ScriptDir%\Temp\~s', 写入文件 '%A_ScriptDir%\Temp\~s' 时出错。
}
return
}
FilesContextMenuShare:
Gui, 1:+Disabled
Gui, 4:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Font, S10
Gui, Add, Checkbox, x10 y10 gsetperiod vsetperiod, 设置过期日期:
Gui, Font, S9
Gui, Add, DropDownList, x+0 y+-17 w70 Hwndddlhwnd4 Choose1 Disabled vperiod, 1|7
PostMessage, 0x153, 0, 19,, ahk_id %ddlhwnd4%
Gui, Add, Text, x+5 y+-16, 天
Gui, Font, S10
Gui, Add, Checkbox, x10 y+15 Checked gsetpwd vsetpwd, 设置密码:
Gui, Font, S9
Gui, Add, Edit, x+27 y+-17 h22 w70 Limit4 vpwd
Gui, Add, Text, x10 y+30, 地址:
Gui, Add, Edit, x+5 y+-17 h22 w360 ReadOnly vlink
Gui, Add, Button, x+5 w80 gcopy4, 复制
Gui, Add, Button, x325 y+20 w80 Default gset, 分享
Gui, Add, Button, x+5 w80 gclose4, 关闭
Gui, Show, h156 w500, 分享
GuiControl,, pwd, % random()
return
4GuiClose:
close4:
Gui, 1:-Disabled
Gui, Destroy
return
setperiod:
GuiControlGet, setperiod
if ( setperiod = 1 )
{
GuiControl, Enable, period
}
else
{
GuiControl, Disable, period
}
return
setpwd:
GuiControlGet, setpwd
if ( setpwd = 1 )
{
GuiControl, Enable, pwd
GuiControl,, pwd, % random()
}
else
{
GuiControl, Disable, pwd
}
GuiControl,, link
return
random()
{
charset := "0123456789abcdefghijklmnopqrstuvwxyz"
Loop, 4
{
Random, rnd, 1, 36
r .= SubStr(charset, rnd, 1)
}
return, r
}
set()
{
Thread, Priority, 1
Gui +OwnDialogs
Global setperiod
Global period
Global setpwd
Global pwd
Global Cookie
Global link
Gui, Submit, NoHide
if ( setpwd = 1 )
{
if ( pwd = "" )
{
MsgBox, 16, 错误, 密码不能为空。
return
}
if ( StrLen(pwd) < 4 || RegExMatch(pwd, "[^0-9a-zA-Z]") != 0 )
{
MsgBox, 16, 错误, 密码只可以包含字母和数字，且必须为 4 个字符。
return
}
}
if ( setperiod = 0 )
{
period := 0
}
if ( setpwd = 0 )
{
pwd := ""
}
URL := encrypt = 1 ? "https://pan.baidu.com/share/set?clienttype=6" : "http://pan.baidu.com/share/set?clienttype=6"
i := rownumber - 1
Gui, 1:Default
Gui, ListView, file
Loop
{
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(fs_id, i, 8)
fid_list .= fs_id . "%2C"
}
fid_list := RegExReplace(fid_list, "%2C$")
Body := "schannel=" . ( pwd = "" ? 0 : 4 ) . "&channel_list=%5B%5D&period=" . period33 . ( pwd = "" ? "" : "&pwd=" . pwd ) . "&fid_list=%5B" . fid_list . "%5D"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=""link"":"")[^""]+", link)
link := StrReplace(link, "\")
Gui, 4:Default
GuiControl,, link, % link
Gui, 1:Default
record()
}
else
{
RegExMatch(whr.ResponseText, "(?<=""show_msg"":"")[^""]+", show_msg)
show_msg := UnicodeDec(show_msg)
MsgBox, 16, 错误:set, %show_msg%。错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:set, 出现意外错误。
}
return
}
copy4:
if ( link != "" )
{
Clipboard := link . ( pwd = "" ? "" : " " . pwd )
}
return
FilesContextMenuShare2()
{
Thread, Priority, 1
Gui +OwnDialogs
Global Cookie
period := setperiod31 = 0 ? 0 : period31
if ( setpwd31 = 0 )
{
pwd := ""
}
else if ( custom31 = 0 )
{
pwd := random()
}
else
{
pwd := pwd31
}
URL := encrypt = 1 ? "https://pan.baidu.com/share/set?clienttype=6" : "http://pan.baidu.com/share/set?clienttype=6"
i := rownumber - 1
Gui, ListView, file
Loop
{
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(fs_id, i, 8)
fid_list .= fs_id . "%2C"
}
fid_list := RegExReplace(fid_list, "%2C$")
Body := "schannel=" . ( pwd = "" ? 0 : 4 ) . "&channel_list=%5B%5D&period=" . period33 . ( pwd = "" ? "" : "&pwd=" . pwd ) . "&fid_list=%5B" . fid_list . "%5D"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=""link"":"")[^""]+", link)
link := StrReplace(link, "\")
Clipboard := link . ( pwd = "" ? "" : " " . pwd )
record()
}
else
{
RegExMatch(whr.ResponseText, "(?<=""show_msg"":"")[^""]+", show_msg)
show_msg := UnicodeDec(show_msg)
MsgBox, 16, 错误:set, %show_msg%。错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:set, 出现意外错误。
}
return
}
FilesContextMenuCut:
Thread, Priority, 1
opera := "move"
source()
return
source()
{
Global source
i := rownumber - 1
Gui, ListView, file
Loop
{
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(path, i, 6)
path := UrlEncode2(path)
filelist .= "{""path"":""" . path . """,""dest"":""""},"
}
filelist := RegExReplace(filelist, ",$")
source := "filelist=[" . filelist . "]"
return
}
FilesContextMenuCopy:
Thread, Priority, 1
opera := "copy"
source()
return
FilesContextMenuDelete()
{
Thread, Priority, 1
Gui +OwnDialogs
rows := []
Global Cookie
URL := encrypt = 1 ? "https://pan.baidu.com/api/filemanager?opera=delete" : "http://pan.baidu.com/api/filemanager?opera=delete"
i := rownumber - 1
Gui, ListView, file
Loop
{
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(path, i, 6)
path := UrlEncode2(path)
path_list .= """" . path . ""","
rows.Push(i)
}
path_list := RegExReplace(path_list, ",$")
Body := "filelist=[" . path_list . "]"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
GuiControl, -Redraw, file
for key, value in rows
{
LV_Delete(value + 1 - A_Index)
}
GuiControl, +Redraw, file
quota()
recyclelist()
}
else
{
MsgBox, 16, 错误:delete, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:delete, 出现意外错误。
}
return
}
FilesContextMenuRename:
Gui, 1:+Disabled
Gui, 22:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 新名称:
Gui, Add, Edit, x10 y+5 h22 w480 vEdit221, % server_filename
Gui, Add, Button, x325 y+30 w80 Default gconfirm22, 确定
Gui, Add, Button, x+5 w80 gcance22, 取消
Gui, Show, h112 w500, 重命名
return
22GuiClose:
cance22:
Gui, 1:-Disabled
Gui, Destroy
return
confirm22:
Gui +OwnDialogs
Gui, Submit, NoHide
if ( Edit221 = server_filename || Edit221 = "" )
{
Gui, 1:-Disabled
Gui, Destroy
return
}
if ( RegExMatch(Edit221, "[\\/:\*\?""<>\|]") != 0 )
{
MsgBox, 16, 错误, 文件名不能包含下列任何字符:`r`n\ / : * ? " < > |
return
}
Gui, 1:-Disabled
Gui, Destroy
Gui, 1:Default
Gui, ListView, file
LV_GetText(path, rownumber, 6)
Encodepath := UrlEncode2(path)
Encodenewname := UrlEncode(Edit221)
Body := "filelist=[{""path"":""" . Encodepath . """,""newname"":""" . Encodenewname . """}]"
rename(Body, rownumber, path, Edit221)
return
rename(ByRef Body, ByRef rownumber, ByRef path, ByRef newname)
{
Thread, Priority, 1
Global Cookie
Global server_filename
URL := encrypt = 1 ? "https://pan.baidu.com/api/filemanager?opera=rename" : "http://pan.baidu.com/api/filemanager?opera=rename"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
path := RegExReplace(path, "[^/]+$", newname)
Gui, ListView, file
LV_Modify(rownumber,, newname,,,,, path)
}
else
{
if ( errno = 12 )
{
RegExMatch(whr.ResponseText, "(?<=\[\{""errno"":)-?\d+", errno)
switch errno
{
case -8:
MsgBox, 16, 错误:rename, 此位置已经包含同名文件。
case -9:
MsgBox, 16, 错误:rename, 源文件不存在。
default:
MsgBox, 16, 错误:rename, 错误代码: %errno%
}
}
else
{
MsgBox, 16, 错误:rename, 错误代码: %errno%
}
}
}
Catch
{
MsgBox, 16, 错误:rename, 出现意外错误。
}
return
}
FilesContextMenuOpenFileLocation()
{
Thread, Priority, 1
Gui +OwnDialogs
Gui, ListView, file
LV_GetText(server_filename, focused)
LV_GetText(path, focused, 6)
path := RegExReplace(path, "/[^/]+$")
if ( path = "" )
{
path := "/"
}
list(path)
Loop, % LV_GetCount()
{
LV_GetText(t, A_Index)
if ( t = server_filename )
{
LV_Modify(A_Index, "Select")
return
}
}
MsgBox,, 没有找到项目, 找不到该项目。
return
}
FilesContextMenuRefresh()
{
Thread, Priority, 1
Gui +OwnDialogs
if ( pathlast = """" . currentpath . """中的搜索结果" )
{
GuiControl, Text, currentpath, % pathlast
GuiControl, Text, search, % search
search(currentpath, search)
}
else if ( pathlast = """" . currentpath . """中的重复的文件" )
{
SIGINT := 1
Gosub, duplicate
}
else
{
list(currentpath)
}
quota()
return
}
FilesContextMenuPaste()
{
Thread, Priority, 1
Gui +OwnDialogs
Global opera
Global source
Global Cookie
URL := encrypt = 1 ? "https://pan.baidu.com/api/filemanager?opera=" . opera : "http://pan.baidu.com/api/filemanager?opera=" . opera
dest := UrlEncode2(currentpath)
Body := RegExReplace(source, "(?<=""dest"":"")[^""]{0}", dest)
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
switch errno
{
case 0:
if ( opera = "copy" )
{
quota()
}
else
{
source := ""
}
RegExMatch(whr.ResponseText, "(?<=\[).+(?=])", info)
info := StrSplit(info, ",{""")
for key, value in info
{
RegExMatch(value, "[^/]+(?=""}$)", server_filename)
server_filename := UnicodeDec(server_filename)
file_list .= server_filename . "|"
}
file_list := RegExReplace(file_list, "\|$")
file_list := StrSplit(file_list, "|")
list(currentpath)
Gui, ListView, file
GuiControl, -Redraw, file
Loop, % LV_GetCount()
{
LV_GetText(server_filename, A_Index)
rownumber := A_Index
for key, value in file_list
{
if ( server_filename = value )
{
LV_Modify(rownumber, "Select")
break
}
}
}
GuiControl, +Redraw, file
case 12:
source := ""
RegExMatch(whr.ResponseText, "(?<=\[).+(?=])", info)
info := StrSplit(info, ",{""")
for key, value in info
{
RegExMatch(value, "(?<=errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(value, "[^/]+(?=""}$)", server_filename)
server_filename := UnicodeDec(server_filename)
file_list .= server_filename . "|"
}
else
{
break
}
}
if ( file_list != "" )
{
file_list := RegExReplace(file_list, "\|$")
file_list := StrSplit(file_list, "|")
list(currentpath)
Gui, ListView, file
GuiControl, -Redraw, file
Loop, % LV_GetCount()
{
LV_GetText(server_filename, A_Index)
rownumber := A_Index
for key, value in file_list
{
if ( server_filename = value )
{
LV_Modify(rownumber, "Select")
break
}
}
}
GuiControl, +Redraw, file
}
switch errno
{
case -8:
MsgBox, 16, 错误:%opera%, 目标已包含同名文件。
case -9:
MsgBox, 16, 错误:%opera%, 源文件不存在。
case -32:
MsgBox, 16, 错误:复制, 空间不足。
case 31076:
MsgBox, 16, 错误:%opera%, 目标文件夹是源文件夹的子文件夹。
default:
MsgBox, 16, 错误:%opera%, 错误代码: 12 %errno%
}
default:
source := ""
MsgBox, 16, 错误:%opera%, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:%opera%, 出现意外错误。
}
return
}
FilesContextMenuNewFolder()
{
Thread, Priority, 1
Gui +OwnDialogs
Global Cookie
URL := encrypt = 1 ? "https://pan.baidu.com/api/create" : "http://pan.baidu.com/api/create"
path := UrlEncode2(currentpath . "/新建文件夹")
Body := "path=" . path . "&isdir=1"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=""path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
list(currentpath)
Gui, ListView, file
Loop, % LV_GetCount()
{
LV_GetText(t, A_Index, 6)
if ( t = path )
{
LV_Modify(A_Index, "Select")
return
}
}
}
else
{
MsgBox, 16, 错误:create, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:create, 出现意外错误。
}
return
}
DownloadsContextMenuView()
{
Thread, Priority, 1
Gui +OwnDialogs
i := rownumber - 1
Gui, ListView, download
Loop
{
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(PID, i, 5)
Process, Exist, % PID
if ( ErrorLevel != 0 )
{
WinGet, filename, ProcessName, ahk_pid %PID%
if ( filename = "cmd.exe" )
{
WinActivate, ahk_pid %PID%
}
}
else
{
error := 1
}
}
if ( error = 1 )
{
MsgBox,, 提示, cmd.exe 进程不存在。这可能是由于命令提示符窗口已被关闭。
}
return
}
DownloadsContextMenuDelete()
{
i := rownumber - 1
Gui, ListView, download
Loop
{
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_Delete(i)
}
return
}
DownloadsContextMenuOpenFileLocation()
{
Thread, Priority, 1
Gui +OwnDialogs
Gui, ListView, download
LV_GetText(path, rownumber, 3)
LV_GetText(server_filename, rownumber)
path := RegExReplace(path, "/[^/]+$")
if ( path = "" )
{
path := "/"
}
GuiControl, Choose, tab, 1
tab := "文件"
if ( back != "/" )
{
GuiControl, Enable, back
}
if ( forward != "" )
{
GuiControl, Enable, forward
}
GuiControl, Enable, up
GuiControl, Enable, root
GuiControl, Enable, search
Menu, File, Enable, 导出当前路径的文件夹结构(&M)...
Menu, Find, Enable, 查找当前路径下的重复文件(&F)
list(path)
Gui, ListView, file
Loop, % LV_GetCount()
{
LV_GetText(t, A_Index)
if ( t = server_filename )
{
LV_Modify(A_Index, "Select")
return
}
}
MsgBox,, 没有找到项目, 找不到该项目。
return
}
DownloadsContextMenuOpenFolder()
{
if ( RegExMatch(downloadlocation, "^%USERPROFILE%") = 0 )
{
Run, % downloadlocation
}
else
{
EnvGet, t, USERPROFILE
t := StrReplace(downloadlocation, "%USERPROFILE%", t)
Run, % t
}
return
}
DownloadsContextMenuEmpty:
Gui, ListView, download
LV_Delete()
return
SharedContextMenuCopy()
{
Clipboard := ""
i := rownumber - 1
Gui, ListView, shared
Loop
{
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(link, i, 3)
LV_GetText(pwd, i, 4)
Clipboard .= link . ( pwd = "" ? "" : " " . pwd ) . "`r`n"
}
return
}
SharedContextMenuRemove()
{
Thread, Priority, 1
Gui +OwnDialogs
rows := []
i := rownumber - 1
Gui, ListView, shared
Loop
{
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(shareId, i, 8)
shareid_list .= """" . shareId . ""","
rows.Push(i)
}
shareid_list := RegExReplace(shareid_list, ",$")
Body := "shareid_list=[" . shareid_list . "]"
cancel(Body, rows)
return
}
cancel(ByRef Body, ByRef r)
{
Global Cookie
URL := encrypt = 1 ? "https://pan.baidu.com/share/cancel" : "http://pan.baidu.com/share/cancel"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
GuiControl, -Redraw, shared
for key, value in r
{
LV_Delete(value + 1 - A_Index)
}
GuiControl, +Redraw, shared
}
else
{
MsgBox, 16, 错误:cancel, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:cancel, 出现意外错误。
}
return
}
SharedContextMenuOpenFileLocation()
{
Thread, Priority, 1
Gui +OwnDialogs
Gui, ListView, shared
focused := LV_GetNext(, "F")
LV_GetText(path, focused, 2)
if ( path != "" )
{
LV_GetText(server_filename, focused)
path := RegExReplace(path, "/[^/]+$")
if ( path = "" )
{
path := "/"
}
GuiControl, Choose, tab, 1
tab := "文件"
if ( back != "/" )
{
GuiControl, Enable, back
}
if ( forward != "" )
{
GuiControl, Enable, forward
}
GuiControl, Enable, up
GuiControl, Enable, root
GuiControl, Enable, search
Menu, File, Enable, 导出当前路径的文件夹结构(&M)...
Menu, Find, Enable, 查找当前路径下的重复文件(&F)
list(path)
Gui, ListView, file
Loop, % LV_GetCount()
{
LV_GetText(t, A_Index)
if ( t = server_filename )
{
LV_Modify(A_Index, "Select")
return
}
}
MsgBox,, 没有找到项目, 找不到该项目。
}
return
}
SharedContextMenuRefresh:
Thread, Priority, 1
Gui +OwnDialogs
record()
return
SharedContextMenuRemoveExpired()
{
Thread, Priority, 1
Gui +OwnDialogs
i := 0
rows := []
Gui, ListView, shared
Loop, % LV_GetCount()
{
LV_GetText(path, A_Index, 2)
if ( path = "" )
{
LV_GetText(shareId, A_Index, 8)
shareid_list .= """" . shareId . ""","
rows.Push(A_Index)
++i
if ( i = 100 )
{
break
}
}
}
if ( shareid_list != "" )
{
shareid_list := RegExReplace(shareid_list, ",$")
Body := "shareid_list=[" . shareid_list . "]"
cancel(Body, rows)
if ( i = 100 )
{
SharedContextMenuRemoveExpired()
}
}
return
}
RecycleBinContextMenuRestore()
{
Thread, Priority, 1
Gui +OwnDialogs
rows := []
Global Cookie
URL := encrypt = 1 ? "https://pan.baidu.com/api/recycle/restore" : "http://pan.baidu.com/api/recycle/restore"
i := rownumber - 1
Gui, ListView, recyclebin
Loop
{
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(fs_id, i, 8)
fid_list .= """" . fs_id . ""","
rows.Push(i)
}
fid_list := RegExReplace(fid_list, ",$")
Body := "fidlist=[" . fid_list . "]"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
switch errno
{
case 0:
GuiControl, -Redraw, RecycleBin
for key, value in rows
{
LV_Delete(value + 1 - A_Index)
}
GuiControl, +Redraw, RecycleBin
quota()
case -8:
MsgBox, 16, 错误:restore, 目标已包含同名文件。
case -9:
MsgBox, 16, 错误:restore, 源文件不存在。
default:
MsgBox, 16, 错误:restore, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:restore, 出现意外错误。
}
return
}
RecycleBinContextMenuDelete()
{
Thread, Priority, 1
Gui +OwnDialogs
rows := []
Global Cookie
i := rownumber - 1
Gui, ListView, recyclebin
Loop
{
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(fs_id, i, 8)
fid_list .= """" . fs_id . ""","
rows.Push(i)
}
fid_list := RegExReplace(fid_list, ",$")
Body := "fidlist=[" . fid_list . "]"
n := rows.Length()
if ( n = 1 )
{
LV_GetText(type, rownumber, 6)
if ( type = "文件夹" )
{
MsgBox, 52, 删除文件夹, 确实要永久性地删除此文件夹吗?
}
else
{
MsgBox, 52, 删除文件, 确实要永久性地删除此文件吗?
}
}
else
{
MsgBox, 52, 删除多个项目, 确实要永久删除这 %n% 项吗?
}
IfMsgBox, Yes
{
URL := encrypt = 1 ? "https://pan.baidu.com/api/recycle/delete" : "http://pan.baidu.com/api/recycle/delete"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
switch errno
{
case 0:
GuiControl, -Redraw, RecycleBin
for key, value in rows
{
LV_Delete(value + 1 - A_Index)
}
GuiControl, +Redraw, RecycleBin
case -9:
MsgBox, 16, 错误:delete, 源文件不存在。
default:
MsgBox, 16, 错误:delete, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:delete, 出现意外错误。
}
}
return
}
RecycleBinContextMenuRefresh:
Thread, Priority, 1
Gui +OwnDialogs
recyclelist()
return
RecycleBinContextMenuEmpty()
{
Thread, Priority, 1
Gui +OwnDialogs
Global Cookie
MsgBox, 52, 删除多个项目, 确实要将这些项全部永久删除吗?
IfMsgBox, Yes
{
URL := encrypt = 1 ? "https://pan.baidu.com/api/recycle/clear" : "http://pan.baidu.com/api/recycle/clear"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
LV_Delete()
}
else
{
MsgBox, 16, 错误:clear, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:clear, 出现意外错误。
}
}
return
}
signin()
{
Gui +OwnDialogs
Global BAIDUID
if ( loginstate = 0 )
{
baiduid()
getapi()
loginhistory()
viewlog()
Gosub, signin1
}
else
{
signout()
}
return
}
baiduid()
{
Global BAIDUID
URL := "https://pan.baidu.com/"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("HEAD", URL, true)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.GetResponseHeader("Set-Cookie"), "BAIDUID=[^;]+", BAIDUID)
}
Catch
{
MsgBox, 16, 错误:pan, 出现意外错误。
}
return
}
getapi()
{
Global BAIDUID
Global HOSUPPORT
Global token
Cookie := BAIDUID
URL := encrypt = 1 ? "https://passport.baidu.com/v2/api/?getapi&tpl=netdisk&apiver=v3" : "http://passport.baidu.com/v2/api/?getapi&tpl=netdisk&apiver=v3"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Referer", "https://pan.baidu.com/")
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""no"": "")-?\d+", no)
if ( no = 0 )
{
RegExMatch(whr.GetResponseHeader("Set-Cookie"), "HOSUPPORT=[^;]+", HOSUPPORT)
RegExMatch(whr.ResponseText, "(?<=""token"" : "")[^""]+", token)
}
else
{
MsgBox, 21, 错误:api, 出现意外错误。请重试。
IfMsgBox, Retry
{
getapi()
}
}
}
Catch
{
MsgBox, 16, 错误:api, 出现意外错误。
}
return
}
loginhistory()
{
Global token
Global BAIDUID
Global UBI
Cookie := BAIDUID
URL := encrypt = 1 ? "https://passport.baidu.com/v2/api/?loginhistory&token=" . token . "&tpl=netdisk" : "http://passport.baidu.com/v2/api/?loginhistory&token=" . token . "&tpl=netdisk"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""no"": "")-?\d+", no)
if ( no = 0 )
{
RegExMatch(whr.GetAllResponseHeaders(), "UBI=[^;]+", UBI)
}
else
{
MsgBox, 16, 错误:api, 出现意外错误。
}
}
Catch
{
MsgBox, 16, 错误:api, 出现意外错误。
}
return
}
viewlog()
{
Global pplogid
URL := encrypt = 1 ? "https://passport.baidu.com/viewlog?ak=1e3f2dd1c81f2075171a547893391274" : "http://passport.baidu.com/viewlog?ak=1e3f2dd1c81f2075171a547893391274"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""code"":)-?\d+", code)
if ( code = 0 )
{
RegExMatch(whr.GetAllResponseHeaders(), "pplogid=[^;]+", pplogid)
}
else
{
MsgBox, 21, 错误:viewlog, 请重试。
IfMsgBox, Retry
{
viewlog()
}
}
}
Catch
{
MsgBox, 16, 错误:viewlog, 出现意外错误。
}
return
}
signin1:
Gui, 1:+Disabled
Gui, 2:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 用户名/邮箱/手机号码:
Gui, Add, Text, x+5 w306 cRed vinfo1, 请暂用其他 3 种方式登录
Gui, Add, Edit, x10 y+5 h22 w200 gusername vusername
Gui, Add, Text, x10 y+10, 密码:
Gui, Add, Link, x+5 w402 cRed vinfo2
Gui, Add, Edit, x10 y+5 h22 w200 Password gpassword vpassword
Gui, Font, S10
Gui, Add, Checkbox, x+5 y+-17 gshow vshow, 显示
Gui, Add, Checkbox, x10 y+15 Checked vremember, 记住我的凭据
Gui, Font, S9
Gui, Add, Picture, x10 y+10 h40 w100 vgenimage
Gui, Add, Button, x+5 y+-23 w40 Hidden grefresh2 vrefresh2, 刷新
Gui, Add, Text, x10 y+10 w287 vverify
Gui, Add, Edit, x10 y+5 h22 w100 Hidden gverifycode vverifycode
Gui, Add, Text, x+5 y+-17 w332 cRed vinfo3
Gui, Add, Text, x10 y226, 使用其他方式登录:
Gui, Add, Button, x10 y+10 w80 Disabled, 账号
Gui, Add, Button, x+5 w80 gsms, 短信
Gui, Add, Button, x+5 w80 gqrcode, 二维码
Gui, Add, Button, x+5 w80 gcookie, Cookie
Gui, Add, Button, x410 y+20 w80 Default gsignin2, 登录
Gui, Show, h324 w500, 登录
return
2GuiClose:
authtoken := ""
Gui, 1:-Disabled
Gui, Destroy
return
username:
codeString := ""
GuiControl,, info1
GuiControl,, info2
GuiControl, Hide, genimage
GuiControl, Hide, refresh2
GuiControl,, verify
GuiControl, Hide, verifycode
GuiControl,, verifycode
GuiControl,, info3
GuiControlGet, username
if ( username != "" )
{
logincheck()
}
return
logincheck()
{
Global username
Global Encodeusername
Global UBI
Global codeString
Global vcodetype
GuiControl,, info1
Encodeusername := UrlEncode(username)
URL := encrypt = 1 ? "https://passport.baidu.com/v2/api/?logincheck&apiver=v3&username=" . Encodeusername : "http://passport.baidu.com/v2/api/?logincheck&apiver=v3&username=" . Encodeusername
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""no"": "")-?\d+", no)
if ( no = 0 )
{
if ( InStr(whr.GetAllResponseHeaders(), "UBI") != 0 )
{
RegExMatch(whr.GetAllResponseHeaders(), "UBI=[^;]+", UBI)
}
RegExMatch(whr.ResponseText, "(?<=""codeString"" : "")[^""]+", codeString)
RegExMatch(whr.ResponseText, "(?<=""vcodetype"" : "")[^""]+", vcodetype)
if ( codeString != "" )
{
vcodetype := StrReplace(vcodetype, "\")
vcodetype := UrlEncode(vcodetype)
GuiControl, Show, refresh2
GuiControl,, verify, 输入验证码:
GuiControl, Show, verifycode
error := genimage()
if ( error = 0 )
{
GuiControl, Show, genimage
GuiControl,, genimage, Temp\genimage.png
FileDelete, Temp\genimage.png
}
}
}
else
{
GuiControl,, info1, 错误:api。错误代码: %no%
}
}
Catch
{
GuiControl,, info1, 错误:api, 出现意外错误。
}
return
}
genimage()
{
Global codeString
URL := encrypt = 1 ? "https://passport.baidu.com/cgi-bin/genimage?" . codeString : "http://passport.baidu.com/cgi-bin/genimage?" . codeString
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe -H User-Agent: --noproxy * -s -o Temp\genimage.png %URL%,, Hide
if ( ErrorLevel != 0 )
{
GuiControl,, info3, 错误:genimage, 出现意外错误。
MsgBox, 16, 错误:curl, 出现意外错误。
}
return, ErrorLevel
}
password:
GuiControl,, info2
return
refresh2()
{
GuiControl,, info3
no := reggetcodestr()
if ( no = 0 )
{
error := genimage()
if ( error = 0 )
{
GuiControl, Show, genimage
GuiControl,, genimage, Temp\genimage.png
FileDelete, Temp\genimage.png
}
}
return
}
reggetcodestr()
{
Global vcodetype
Global codeString
URL := encrypt = 1 ? "https://passport.baidu.com/v2/?reggetcodestr&apiver=v3&vcodetype=" . vcodetype : "http://passport.baidu.com/v2/?reggetcodestr&apiver=v3&vcodetype=" . vcodetype
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""no"": "")-?\d+", no)
if ( no = 0 )
{
RegExMatch(whr.ResponseText, "(?<=""verifyStr"" : "")[^""]+", codeString)
}
else
{
GuiControl,, info3, 错误:v2。错误代码: %no%
}
return, no
}
Catch
{
GuiControl,, info3, 错误:v2, 出现意外错误。
}
return
}
verifycode:
GuiControlGet, verifycode
if ( verifycode != "" )
{
checkvcode()
}
return
checkvcode()
{
Global verifycode
Global codeString
verifycode := UrlEncode(verifycode)
URL := encrypt = 1 ? "https://passport.baidu.com/v2/?checkvcode&verifycode=" . verifycode . "&codestring=" . codeString : "http://passport.baidu.com/v2/?checkvcode&verifycode=" . verifycode . "&codestring=" . codeString
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""no"": "")-?\d+", no)
switch no
{
case 0:
GuiControl,, info3
case 500002:
GuiControl,, info3, 验证码错误。
default:
GuiControl,, info3, 错误:v2。错误代码: %no%
}
}
Catch
{
GuiControl,, info3, 错误:v2, 出现意外错误。
}
return
}
show:
GuiControlGet, show
if ( show = 1 )
{
GuiControl, -Password, password
}
else
{
GuiControl, +Password, password
}
return
signin2()
{
Gui +OwnDialogs
Global username
Global remember
Global BDUSS
Global password
Global verifycode
Global codeString
Global errno
Global authtoken
Gui, Submit, NoHide
if ( username != "" && FileExist("etc\passwd") != "" )
{
uname := UnicodeEnc(currentuser)
IniRead, BDUSS, etc\passwd, Config, % uname, % A_Space
if ( BDUSS != "" )
{
remember := 0
Gui, 1:-Disabled
Gui, Destroy
signining()
return
}
}
GuiControlGet, visible, Visible, verifycode
if ( visible = 0 )
{
if ( username = "" || password = "" )
{
if ( username = "" )
{
GuiControl,, info1, 此信息为必填项
}
if ( password = "" )
{
GuiControl,, info2, 此信息为必填项
}
return
}
}
else
{
if ( username = "" || password = "" || verifycode = "" )
{
if ( username = "" )
{
GuiControl,, info1, 此信息为必填项
}
if ( password = "" )
{
GuiControl,, info2, 此信息为必填项
}
if ( verifycode = "" )
{
GuiControl,, info3, 此信息为必填项
}
return
}
verifycode := UrlEncode(verifycode)
}
errno := getpublickey()
if ( errno = 0 )
{
r := RSAencrypt()
if ( r = 0 )
{
err_no := login()
if ( err_no = 0 )
{
Gui, 1:-Disabled
Gui, Destroy
signining()
}
else
{
if ( codeString != "" )
{
GuiControl, Show, refresh2
GuiControl,, verify, 请输入验证码:
GuiControl, Show, verifycode
error := genimage()
if ( error = 0 )
{
GuiControl, Show, genimage
GuiControl,, genimage, Temp\genimage.png
FileDelete, Temp\genimage.png
}
}
switch err_no
{
case 1:
GuiControl,, info1, 输入的账号无效。
case 2:
GuiControl,, info1, 该账号不存在
case 4, 7:
GuiControl,, info2, 密码不正确。请重试。
case 5:
GuiControl,, info2, 请更换 IP 地址后重试。
case 6:
case 120021:
authwidgetverify_getapi()
errno := ""
Gosub, authwidgetverify
Gui, 2:Default
if ( errno = 110000 )
{
no := loginproxy()
if ( no = 0 )
{
authtoken := ""
Gui, 1:-Disabled
Gui, Destroy
signining()
}
}
case 120019:
authwidgetverify_getapi()
errno := ""
Gosub, authwidgetverify
Gui, 2:Default
if ( errno = 110000 )
{
errno := auththaw()
if ( errno = 0 )
{
GuiControl,, info2, 密码不正确。请重试。<a href="https://passport.baidu.com/?getpassindex&account=%username%">重置密码</a>
}
}
case 50029:
GuiControl,, info2, 使用不正确的密码尝试登录的次数太多。请 3 小时之后再试。<a href="https://passport.baidu.com/?getpassindex&account=%username%">重置密码</a>
default:
MsgBox, 16, 错误:api, 错误代码: %err_no%
}
}
}
}
errno := ""
return
}
getpublickey()
{
Global rsakey
URL := encrypt = 1 ? "https://passport.baidu.com/v2/getpublickey" : "http://passport.baidu.com/v2/getpublickey"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":')[^']+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=""pubkey"":')[^']+", pubkey)
RegExMatch(whr.ResponseText, "(?<=""key"":')[^']+", rsakey)
pubkey := StrReplace(pubkey, "\n", "`r`n")
pubkey := StrReplace(pubkey, "\")
FileAppend, % pubkey, Temp\public.pem
if ( ErrorLevel = 1 )
{
MsgBox, 16, '%A_ScriptDir%\Temp\public.pem', 写入文件 '%A_ScriptDir%\Temp\public.pem' 时出错。
}
return, ErrorLevel
}
else
{
MsgBox, 16, 错误:getpublickey, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:getpublickey, 出现意外错误。
}
return
}
RSAencrypt()
{
Global password
FileAppend, % password, Temp\password
if ( ErrorLevel = 0 )
{
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && OpenSSL\bin\openssl.exe rsautl -encrypt -in Temp\password -inkey Temp\public.pem -pubin -out Temp\ciphertext,, Hide
if ( ErrorLevel = 0 )
{
FileDelete, Temp\public.pem
FileDelete, Temp\password
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && OpenSSL\bin\openssl.exe enc -a -in Temp\ciphertext -out Temp\ciphertextbase64,, Hide
if ( ErrorLevel = 0 )
{
FileDelete, Temp\ciphertext
FileRead, password, Temp\ciphertextbase64
if ( ErrorLevel = 0 )
{
password := StrReplace(password, "`n")
password := UrlEncode(password)
}
else
{
MsgBox, 16, '%A_ScriptDir%\Temp\ciphertextbase64', 读取文件 '%A_ScriptDir%\Temp\ciphertextbase64' 时出错。
}
FileDelete, Temp\ciphertextbase64
return, ErrorLevel
}
else
{
FileDelete, Temp\ciphertext
MsgBox, 16, 错误:OpenSSL, 出现意外错误。
}
}
else
{
FileDelete, Temp\public.pem
FileDelete, Temp\password
MsgBox, 16, 错误:OpenSSL, 出现意外错误。
}
}
else
{
MsgBox, 16, '%A_ScriptDir%\Temp\password', 写入文件 '%A_ScriptDir%\Temp\password' 时出错。
}
return
}
login()
{
Gui +OwnDialogs
Global token
Global codeString
Global Encodeusername
Global password
Global rsakey
Global verifycode
Global BAIDUID
Global BDUSS
Global codeString
Global vcodetype
Global authtoken
Global lstr
Global ltoken
Cookie := BAIDUID
URL := encrypt = 1 ? "https://passport.baidu.com/v2/api/?login" : "http://passport.baidu.com/v2/api/?login"
Body := "token=" . token . "&tpl=netdisk&apiver=v3" . ( codeString = "" ? "" : "&codestring=" . codeString ) . "&u=https%3A%2F%2Fpan.baidu.com%2Fdisk%2Fhome&loginmerge=true&username=" . Encodeusername . "&password=" . password . ( codeString = "" ? "" : "&verifycode=" . verifycode ) . "&rsakey=" . rsakey . "&crypttype=12"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=err_no=)-?\d+", err_no)
if ( err_no = 0 || err_no = 19 || err_no = 400037 )
{
RegExMatch(whr.GetAllResponseHeaders(), "(?<=BDUSS=)[^;]+", BDUSS)
}
else
{
RegExMatch(whr.ResponseText, "(?<=codeString=)[^&]+", codeString)
if ( codeString != "" )
{
RegExMatch(whr.ResponseText, "(?<=vcodetype=)[^&]+", vcodetype)
vcodetype := StrReplace(vcodetype, "\")
vcodetype := UrlEncode(vcodetype)
}
if ( err_no = 120021 )
{
RegExMatch(whr.ResponseText, "(?<=authtoken=)[^&]+", authtoken)
RegExMatch(whr.ResponseText, "(?<=lstr=)[^&]+", lstr)
RegExMatch(whr.ResponseText, "(?<=ltoken=)[^&]+", ltoken)
}
}
return, err_no
}
Catch
{
MsgBox, 16, 错误:api, 出现意外错误。
}
return
}
authwidgetverify_getapi()
{
Global authtoken
Global mobile
Global email
URL := encrypt = 1 ? "https://passport.baidu.com/v2/sapi/authwidgetverify?authtoken=" . authtoken . "&jsonp=1&action=getapi" : "http://passport.baidu.com/v2/sapi/authwidgetverify?authtoken=" . authtoken . "&jsonp=1&action=getapi"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":')[^']+", errno)
if ( errno = 110000 )
{
RegExMatch(whr.ResponseText, "(?<=""mobile"":')[^']+", mobile)
RegExMatch(whr.ResponseText, "(?<=""email"":')[^']+", email)
}
else
{
MsgBox, 16, 错误:authwidgetverify, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:authwidgetverify, 出现意外错误。
}
return
}
authwidgetverify:
Gui, 2:+Disabled
Gui, 15:Default
Gui, +Owner2 +Hwndgui15hwnd
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 验证方式:
if ( mobile = "" )
{
Gui, Add, DropDownList, x10 y+5 Hwndddlhwnd15 vtype, %email%||
}
else if ( email = "" )
{
Gui, Add, DropDownList, x10 y+5 Hwndddlhwnd15 vtype, %mobile%||
}
else
{
Gui, Add, DropDownList, x10 y+5 Hwndddlhwnd15 vtype, %mobile%||%email%
}
PostMessage, 0x153, 0, 19,, ahk_id %ddlhwnd15%
Gui, Add, Text, x10 y+10, 请输入验证码:
Gui, Add, Edit, x10 y+5 h22 w100 Limit6 Number gvcode15 vvcode
Gui, Add, Text, x+5 y+-17 w250 cRed vinfo
Gui, Add, Button, x10 y+20 w80 gsend vsend, 发送
Gui, Add, Button, x310 y+20 w80 Default gcheck, 验证
Gui, Show, h187 w400, 安全验证
WinWaitClose ahk_id %gui15hwnd%
return
15GuiClose:
Gui, 2:-Disabled
Gui, Destroy
return
vcode15:
GuiControlGet, vcode
if ( StrLen(vcode) < 6 )
{
GuiControl,, info, 请输入6位验证码。该验证码仅包含数字。
}
else
{
GuiControl,, info
}
return
send()
{
Gui +OwnDialogs
Global type
Global mobile
Global email
Global authtoken
Gui, Submit, NoHide
if ( type = mobile )
{
type := "mobile"
}
else if ( type = email )
{
type := "email"
}
URL := encrypt = 1 ? "https://passport.baidu.com/v2/sapi/authwidgetverify?authtoken=" . authtoken . "&type=" . type . "&jsonp=1&action=send" : "http://passport.baidu.com/v2/sapi/authwidgetverify?authtoken=" . authtoken . "&type=" . type . "&jsonp=1&action=send"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":')[^']+", errno)
switch errno
{
case 110000:
GuiControl,, send, 重新发送
GuiControl,, info
case 62003:
GuiControl,, info, 请求获取验证码次数太多。请 24 小时后再试。
default:
RegExMatch(whr.ResponseText, "(?<=""msg"":')[^']+", msg)
GuiControl,, info, 错误 %errno%: %msg%。
}
}
Catch
{
GuiControl,, info, 错误:authwidgetverify, 出现意外错误。
}
return
}
check:
Gui +OwnDialogs
Gui, Submit, NoHide
if ( vcode != "" )
{
GuiControlGet, info
if ( info = "" )
{
errno := authwidgetverify_check()
if ( errno = 110000 )
{
Gui, 2:-Disabled
Gui, Destroy
}
}
}
else
{
GuiControl,, info, 此信息为必填项
}
return
authwidgetverify_check()
{
Global type
Global mobile
Global email
Global authtoken
Global vcode
Global authsid
if ( type = mobile )
{
type := "mobile"
}
else if ( type = email )
{
type := "email"
}
URL := encrypt = 1 ? "https://passport.baidu.com/v2/sapi/authwidgetverify?authtoken=" . authtoken . "&type=" . type . "&jsonp=1&action=check&vcode=" . vcode : "http://passport.baidu.com/v2/sapi/authwidgetverify?authtoken=" . authtoken . "&type=" . type . "&jsonp=1&action=check&vcode=" . vcode
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":')[^']+", errno)
switch errno
{
case 110000:
RegExMatch(whr.ResponseText, "(?<=""authsid"":')[^']+", authsid)
case 62004:
GuiControl,, info, 验证码错误。
case 62006, 62007:
GuiControl,, info, 请重新获取验证码
default:
RegExMatch(whr.ResponseText, "(?<=""msg"":')[^']+", msg)
GuiControl,, info, 错误 %errno%: %msg%。
}
return, errno
}
Catch
{
GuiControl,, info, 错误:authwidgetverify, 出现意外错误。
}
return
}
loginproxy()
{
Global ltoken
Global lstr
Global BAIDUID
Global BDUSS
Cookie := BAIDUID
URL := encrypt = 1 ? "https://passport.baidu.com/v2/?loginproxy&u=https%3A%2F%2Fpan.baidu.com%2Fdisk%2Fhome&tpl=netdisk&ltoken=" . ltoken . "&lstr=" . lstr . "&apiver=v3" : "http://passport.baidu.com/v2/?loginproxy&u=https%3A%2F%2Fpan.baidu.com%2Fdisk%2Fhome&tpl=netdisk&ltoken=" . ltoken . "&lstr=" . lstr . "&apiver=v3"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""no"": "")[^""]+", no)
switch no
{
case 0:
RegExMatch(whr.GetAllResponseHeaders(), "(?<=BDUSS=)[^;]+", BDUSS)
case 120018:
GuiControl,, info, 尝试更换 IP 地址后重试。错误代码: 120018
default:
GuiControl,, info, 登录时出错。错误代码: %no%
}
return, no
}
Catch
{
GuiControl,, info, 错误:v2, 出现意外错误。
}
return
}
auththaw()
{
Gui +OwnDialogs
Global ltoken
Global lstr
Global authsid
Global BAIDUID
Cookie := BAIDUID
URL := encrypt = 1 ? "https://passport.baidu.com/v2/auththaw?u=https%3A%2F%2Fpan.baidu.com%2Fdisk%2Fhome&tpl=netdisk&ltoken=" . ltoken . "&lstr=" . lstr . "&authsid=" . authsid : "http://passport.baidu.com/v2/auththaw?u=https%3A%2F%2Fpan.baidu.com%2Fdisk%2Fhome&tpl=netdisk&ltoken=" . ltoken . "&lstr=" . lstr . "&authsid=" . authsid
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":')[^']+", errno)
if ( errno != 0 )
{
RegExMatch(whr.ResponseText, "(?<=""msg"":')[^']+", msg)
MsgBox, 16, 错误:auththaw, 错误 %errno%: %msg%。
}
return, errno
}
Catch
{
GuiControl,, info, 错误:auththaw, 出现意外错误。
}
return
}
account:
SIGINT := 1
Gui, 1:-Disabled
Gui, Destroy
Gosub, signin1
return
sms:
SIGINT := 1
Gui, 1:-Disabled
Gui, Destroy
Gosub, SMSsignin
return
qrcode:
SIGINT := 1
Gui, 1:-Disabled
Gui, Destroy
Gosub, QRcodesignin
return
cookie:
SIGINT := 1
Gui, 1:-Disabled
Gui, Destroy
Gosub, Cookiesignin
return
SMSsignin:
Gui, 1:+Disabled
Gui, 16:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 手机号码:
Gui, Add, Text, x+5 w421 cRed vinfo1
Gui, Add, Edit, x10 y+5 h22 w100 Limit11 Number gphone vphone
Gui, Add, Text, x10 y+10, 输入验证码:
Gui, Add, Text, x+5 w409 cRed vinfo2
Gui, Add, Edit, x10 y+5 h22 w100 gvcode16 vpassword
Gui, Add, Button, x+5 w80 gsend16 vsend, 发送
Gui, Add, Text, x+5 y+-17 w20 cBlue Right vcountdown
Gui, Font, S10
Gui, Add, Checkbox, x10 y+15 Checked vremember, 记住我的凭据
Gui, Font, S9
Gui, Add, Text, x10 y226, 使用其他方式登录:
Gui, Add, Button, x10 y+10 w80 gaccount, 账号
Gui, Add, Button, x+5 w80 Disabled, 短信
Gui, Add, Button, x+5 w80 gqrcode, 二维码
Gui, Add, Button, x+5 w80 gcookie, Cookie
Gui, Add, Button, x410 y+20 w80 Default gsignin16, 登录
Gui, Show, h324 w500, 登录
return
16GuiClose:
Gui, 1:-Disabled
Gui, Destroy
return
phone:
GuiControl,, info1
GuiControl,, info2
SetTimer, countdown, Delete
GuiControl,, countdown
GuiControl,, send, 发送
GuiControl, Enable, send
GuiControlGet, phone
if ( phone != "" )
{
if ( StrLen(phone) < 11 )
{
GuiControl,, info1, 手机号必须包含 11 位数字。
}
else if ( SubStr(phone, 1, 1) != 1 )
{
GuiControl,, info1, 输入的手机号无效。
}
else
{
secondbit := SubStr(phone, 2, 1)
if ( secondbit = 0 || secondbit = 1 || secondbit = 2 )
{
GuiControl,, info1, 输入的手机号无效。
}
}
}
return
vcode16:
GuiControl,, info2
return
send16:
Gui +OwnDialogs
vcodestr := ""
if ( phone != ""  )
{
GuiControlGet, info1
if ( info1 = "" )
{
GuiControl,, info2
Gui, Submit, NoHide
no := getphonestatus()
if ( no = 0 )
{
senddpass()
}
}
}
else
{
GuiControl,, info1, 此信息为必填项
}
return
getphonestatus()
{
Global phone
URL := encrypt = 1 ? "https://passport.baidu.com/v2/?getphonestatus&phone=" . phone : "http://passport.baidu.com/v2/?getphonestatus&phone=" . phone
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""no"": "")[^""]+", no)
if ( no != 0 )
{
switch no
{
case 3:
GuiControl,, info1, 该手机号码尚未注册
case 4:
GuiControl,, info1, 此手机号码无效。
default:
ResponseBody := whr.ResponseBody
raw := NumGet(ComObjValue(ResponseBody) + 12)
length := ResponseBody.MaxIndex() + 1
ResponseText := StrGet(raw, length, "UTF-8")
RegExMatch(ResponseText, "(?<=""msg"": "")[^""]*", msg)
GuiControl,, info1, 错误 %errno%: %msg%。
}
}
return, no
}
Catch
{
GuiControl,, info1, 错误:v2, 出现意外错误。
}
return
}
senddpass()
{
Global phone
Global token
Global BAIDUID
Global HOSUPPORT
Global UBI
Global pplogid
Global second := 60
Global vcodestr
Global vcodesign
Global verifycode
Cookie := BAIDUID . "; " . HOSUPPORT . "; " . UBI . "; " . pplogid
URL := encrypt = 1 ? "https://passport.baidu.com/v2/api/senddpass?username=" . phone . "&bdstoken=" . token . "&tpl=netdisk" . ( vcodestr ? "&vcodestr=" . vcodestr . "&vcodesign=" . vcodesign . "&verifycode=" . verifycode : "" ) : "http://passport.baidu.com/v2/api/senddpass?username=" . phone . "&bdstoken=" . token . "&tpl=netdisk" . ( vcodestr ? "&vcodestr=" . vcodestr . "&vcodesign=" . vcodesign . "&verifycode=" . verifycode : "" )
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
switch errno
{
case 0:
GuiControl, Disable, send
GuiControl,, send, 重新发送
SetTimer, countdown, 1000
case 16:
GuiControl,, info2, 请求获取验证码次数太多。请 24 小时后再试。
case 17:
GuiControl,, info2, 请 60 秒后再试。
case 18:
RegExMatch(whr.ResponseText, "(?<=""vcodestr"":"")[^""]+", vcodestr)
RegExMatch(whr.ResponseText, "(?<=""vcodesign"":"")[^""]+", vcodesign)
verifycode := ""
error := genimage20()
if ( error = 0 )
{
Gosub, genimage2
Gui, 16:Default
if ( verifycode != "" )
{
senddpass()
}
}
default:
RegExMatch(whr.ResponseText, "(?<=""msg"":"")[^""]*", msg)
msg := UnicodeDec(msg)
GuiControl,, info2, 错误 %errno%: %msg%。
}
}
Catch
{
GuiControl,, info2, 获取验证码时出错。请重试。
}
return
}
countdown:
--second
if ( second = 0 )
{
SetTimer, countdown, Delete
GuiControl,, countdown
GuiControl, Enable, send
}
else
{
GuiControl,, countdown, % second
}
return
genimage2:
Gui, 16:+Disabled
Gui, 20:Default
Gui, +Owner16 +Hwndgui20hwnd
Gui, Margin, 0, 0
Gui, Add, Picture, x10 y10 h40 w100 vgenimage, Temp\genimage.png
FileDelete, Temp\genimage.png
Gui, Add, Button, x+5 y+-23 grefresh20, 刷新
Gui, Add, Text, x10 y+10, 请输入验证码:
Gui, Add, Edit, x10 y+5 h22 w100 vverifycode
Gui, Add, Text, x+5  y+-17 w200 cRed vinfo
Gui, Add, Button, x225 y+20 w80 Default gconfirm20, 确定
Gui, Add, Button, x+5 w80 gcancel20, 取消
Gui, Show, h147 w400, 验证码错误
GuiControl, Focus, verifycode
WinWaitClose ahk_id %gui20hwnd%
return
20GuiClose:
cancel20:
Gui, 16:-Disabled
Gui, Destroy
return
refresh20()
{
error := genimage20()
if ( error = 0 )
{
GuiControl,, genimage, Temp\genimage.png
FileDelete, Temp\genimage.png
}
return
}
genimage20()
{
proxy()
Gui +OwnDialogs
Global vcodestr
URL := encrypt = 1 ? "https://passport.baidu.com/cgi-bin/genimage?" . vcodestr : "http://passport.baidu.com/cgi-bin/genimage?" . vcodestr
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe -H User-Agent: --noproxy * -s -o Temp\genimage.png %URL%,, Hide
if ( ErrorLevel != 0 )
{
MsgBox, 16, 错误:curl, 出现意外错误。
}
return, ErrorLevel
}
confirm20:
Gui, Submit, NoHide
if ( verifycode != "" )
{
Gui, 16:-Disabled
Gui, Destroy
}
else
{
GuiControl,, info, 此信息为必填项
}
return
signin16()
{
Gui +OwnDialogs
Global phone
Global password
Gui, Submit, NoHide
if ( phone = "" || password = "" )
{
if ( phone = "" )
{
GuiControl,, info1, 此信息为必填项
}
if ( password = "" )
{
GuiControl,, info2, 此信息为必填项
}
return
}
err_no := login2()
if ( err_no = 0 )
{
Gui, 1:-Disabled
Gui, Destroy
signining()
}
return
}
login2()
{
Gui +OwnDialogs
Global BAIDUID
Global token
Global phone
Global password
Global BDUSS
Cookie := BAIDUID
URL := encrypt = 1 ? "https://passport.baidu.com/v2/api/?login" : "http://passport.baidu.com/v2/api/?login"
Body := "token=" . token . "&tpl=netdisk&apiver=v3&isdpass=1&username=" . phone . "&password=" . password
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("Cookie", Cookie)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=err_no=)-?\d+", err_no)
switch err_no
{
case 0:
RegExMatch(whr.GetAllResponseHeaders(), "(?<=BDUSS=)[^;]+", BDUSS)
case 3:
GuiControl,, info1, 请重新获取验证码。
case 4:
GuiControl,, info2, 验证码错误。
case 500010:
GuiControl,, info2, 使用不正确的密码尝试登录的次数太多。请 24 小时后再试。
default:
GuiControl,, info2, 错误:api。错误代码: %err_no%
}
return, err_no
}
Catch
{
MsgBox, 16, 错误:api, 出现意外错误。
}
return
}
QRcodesignin:
SIGINT := 0
remember := 1
Gui, 1:+Disabled
Gui, 18:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Add, Picture, x10 y10 h164 w164 vqrcode
Gui, Add, Text, x52 y91 w86 cBlue Hidden gsignin18 vrefresh18, 点击刷新
Gui, Add, Text, x184 y10, 使用手机 app 扫描此二维码
Gui, Add, Text, x184 y+20 w306 cRed vinfo1
Gui, Add, Text, x184 y+10 w306 cRed vinfo2
Gui, Font, S10
Gui, Add, Checkbox, x10 y189 Checked gremember vremember, 记住我的凭据
Gui, Font, S9
Gui, Add, Text, x10 y226, 使用其他方式登录:
Gui, Add, Button, x10 y+10 w80 gaccount, 账号
Gui, Add, Button, x+5 w80 gsms, 短信
Gui, Add, Button, x+5 w80 Disabled, 二维码
Gui, Add, Button, x+5 w80 gcookie, Cookie
Gui, Show, h324 w500, 登录
signin18()
return
18GuiClose:
SIGINT := 1
Gui, 1:-Disabled
Gui, Destroy
return
signin18()
{
Gui +OwnDialogs
SIGINT := 0
errno := getqrcode()
switch errno
{
case 0:
error := qrcode()
if ( error = 0 )
{
GuiControl, Hide, refresh18
GuiControl, Show, qrcode
GuiControl,, qrcode, Temp\qrcode.png
FileDelete, Temp\qrcode.png
GuiControl,, info1, 正在等待扫描...
GuiControl,, info2
status := unicast()
if ( status = 0 )
{
no := qrbdusslogin()
if ( no = 0 )
{
Gui, 1:-Disabled
Gui, Destroy
signining()
}
}
}
else
{
GuiControl,, info1, 出现意外错误
GuiControl,, info2
GuiControl, Show, refresh18
}
case "":
GuiControl,, info1, 出现意外错误
GuiControl,, info2, 错误代码: getqrcode
GuiControl, Show, refresh18
default:
GuiControl,, info1, getqrcode
GuiControl,, info2, 错误代码: %errno%
GuiControl, Show, refresh18
}
return
}
getqrcode()
{
Global callback
Global imgurl
Global sign
t -= 1970010108, s
t *= 1000
t += A_MSec
callback := "tangram_guid_" . t
URL := encrypt = 1 ? "https://passport.baidu.com/v2/api/getqrcode?lp=pc&callback=" . callback : "http://passport.baidu.com/v2/api/getqrcode?lp=pc&callback=" . callback
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=""imgurl"":"")[^""]+", imgurl)
imgurl := StrReplace(imgurl, "\")
imgurl := encrypt = 1 ? "https://" . imgurl : "http://" . imgurl
RegExMatch(whr.ResponseText, "(?<=""sign"":"")[^""]+", sign)
}
return, errno
}
return
}
qrcode()
{
Global imgurl
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe -H User-Agent: --noproxy * -s -o Temp\qrcode.png "%imgurl%",, Hide
if ( ErrorLevel != 0 )
{
MsgBox, 16, 错误:curl, 出现意外错误。
}
return, ErrorLevel
}
unicast()
{
Global sign
Global callback
Global v
if ( SIGINT = 1 )
{
return
}
URL := encrypt = 1 ? "https://passport.baidu.com/channel/unicast?channel_id=" . sign . "&callback=" . callback : "http://passport.baidu.com/channel/unicast?channel_id=" . sign . "&callback=" . callback
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse(-1)
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
switch errno
{
case 0:
RegExMatch(whr.ResponseText, "(?<=""status\\"":)\d", status)
switch status
{
case 0:
RegExMatch(whr.ResponseText, "(?<=""v\\"":\\"")[^\\]+", v)
case 1:
GuiControl,, info1, 扫描成功
GuiControl,, info2, 正在等待确认...
return, unicast()
case 2:
GuiControl, Hide, qrcode
GuiControl, Show, refresh18
GuiControl,, info1, 操作已被用户取消
GuiControl,, info2
}
return, status
case 1:
return, unicast()
default:
GuiControl, Hide, qrcode
GuiControl, Show, refresh18
GuiControl,, info1, unicast
GuiControl,, info2, 错误代码: %errno%
}
}
Catch
{
GuiControl, Hide, qrcode
GuiControl, Show, refresh18
GuiControl,, info1, 出现意外错误
GuiControl,, info2, 错误代码: unicast
}
return
}
qrbdusslogin()
{
Global v
Global BDUSS
URL := encrypt = 1 ? "https://passport.baidu.com/v3/login/main/qrbdusslogin?&bduss=" . v : "http://passport.baidu.com/v3/login/main/qrbdusslogin?&bduss=" . v
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""no"": "")[^""]+", no)
if ( no = 0 )
{
RegExMatch(whr.GetAllResponseHeaders(), "(?<=BDUSS=)[^;]+", BDUSS)
}
else
{
RegExMatch(whr.GetAllResponseHeaders(), "(?<=""msg"":"")[^""]+", msg)
GuiControl,, info1, %msg%。
GuiControl,, info2, 错误代码: %errno%
}
return, no
}
Catch
{
GuiControl,, info1, 出现意外错误
GuiControl,, info2, 错误代码: qrbdusslogin
}
return
}
remember:
GuiControlGet, remember
return
Cookiesignin:
Gui, 1:+Disabled
Gui, 17:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 请输入 Cookie:
Gui, Add, Text, x+5 w391 cRed vinfo
Gui, Add, Edit, x10 y+5 h22 w480 vBDUSS
Gui, Font, S10
Gui, Add, Checkbox, x10 y+15 Checked vremember, 记住我的凭据
Gui, Font, S9
Gui, Add, Text, x10 y226, 使用其他方式登录:
Gui, Add, Button, x10 y+10 w80 gaccount, 账号
Gui, Add, Button, x+5 w80 gsms, 短信
Gui, Add, Button, x+5 w80 gqrcode, 二维码
Gui, Add, Button, x+5 w80 Disabled, Cookie
Gui, Add, Button, x410 y+20 w80 Default gsignin17, 登录
Gui, Show, h324 w500, 登录
return
17GuiClose:
Gui, 1:-Disabled
Gui, Destroy
return
signin17()
{
Gui +OwnDialogs
Global BDUSS
Gui, Submit, NoHide
if ( BDUSS != "" )
{
if ( InStr(BDUSS, "BDUSS=") != 0 )
{
RegExMatch(BDUSS, "(?<=BDUSS=)[^;]+", BDUSS)
}
Gui, 1:-Disabled
Gui, Destroy
signining()
}
else
{
GuiControl,, info, 此信息为必填项
}
return
}
signout()
{
Gui +OwnDialogs
Global Cookie
Global BDUSS
r := logout(Cookie)
if ( r = "deleted" )
{
uname := UnicodeEnc(currentuser)
IniDelete, etc\passwd, Config, % uname
if ( FileExist("config\d.ini") != "" )
{
IniDelete, config\d.ini, % BDUSS
}
reset()
}
else
{
MsgBox, 16, 错误:signout, 注销时出现问题。
}
return
}
logout(ByRef Cookie)
{
URL := encrypt = 1 ? "https://passport.baidu.com/?logout" : "http://passport.baidu.com/?logout"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.GetAllResponseHeaders(), "(?<=BDUSS=)[^;]+", r)
return, r
}
Catch
{
MsgBox, 16, 错误:logout, 出现意外错误。
}
return
}
reset()
{
Global BAIDUID
GuiControl, Choose, tab, 1
Menu, File, Disable, 保存(&S)...
Menu, File, Disable, 导出当前路径的文件夹结构(&M)...
Menu, Find, Disable, 查找当前路径下的重复文件(&F)
Menu, Tools, Disable, 下载配置(&N)
GuiControl, Disable, back
GuiControl, Disable, forward
GuiControl, Disable, up
GuiControl, Disable, root
GuiControl, Disable, refresh
GuiControl, Disable, search
GuiControl,, currentuser
GuiControl,, vip_type
GuiControl,, loginstate, 登录
GuiControl,, used
GuiControl,, free
GuiControl,, total
GuiControl, Text, currentpath
GuiControl,, currentpath, |
GuiControl,, refresh, 刷新
GuiControl, Text, search
GuiControl,, search, |
Gui, ListView, file
LV_Delete()
Gui, ListView, download
LV_Delete()
Gui, ListView, shared
LV_Delete()
Gui, ListView, recyclebin
LV_Delete()
loginstate := 0
refresh := 1
back := []
forward := []
backtop := 0
forwardtop := 0
adjust := ""
BAIDUID := ""
currentpathlist := ""
searchlist := ""
return
}
switch:
Gui, 1:+Disabled
Gui, 3:Default
Gui, +Owner1
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 请选择一个账号:
Gui, Add, DropDownList, x10 y+5 w380 Hwndddlhwnd3 vusername
PostMessage, 0x153, 0, 19,, ahk_id %ddlhwnd3%
Gui, Add, Button, x10 y+40 w80 gremove3, 移除
Gui, Add, Button, x+135 w80 Default gswitch3, 切换
Gui, Add, Button, x+5 w80 gcancel3, 取消
Gui, Show, h120 w400, 切换账号
if ( FileExist("etc\passwd") != "" )
{
usr()
}
return
3GuiClose:
cancel3:
Gui, 1:-Disabled
Gui, Destroy
return
switch3:
Gui, Submit, NoHide
if ( username != "" )
{
if ( username = currentuser )
{
Gui, 1:-Disabled
Gui, Destroy
}
else
{
switch2()
}
}
return
switch2()
{
Global username
Global BDUSS
Global remember := ""
uname := UnicodeEnc(username)
IniRead, BDUSS, etc\passwd, Config, % uname, % A_Space
Gui, 1:-Disabled
Gui, Destroy
if ( loginstate = 1 )
{
Gui, 1:Default
reset()
}
signining()
return
}
remove3:
Gui, Submit, NoHide
if ( username != "" )
{
removeusr()
}
return
removeusr()
{
Global username
Global BDUSS
uname := UnicodeEnc(username)
if ( username = currentuser )
{
t := BDUSS
}
else
{
IniRead, t, etc\passwd, Config, % uname, % A_Space
}
Cookie := "BDUSS=" . t
r := logout(Cookie)
if ( r = "deleted" )
{
IniDelete, etc\passwd, Config, % uname
if ( FileExist("config\d.ini") != "" )
{
IniDelete, config\d.ini, % t
}
if ( username = currentuser )
{
Gui, 1:Default
reset()
Gui, 3:Default
}
usr()
}
return
}
usr()
{
usr := "|"
IniRead, t, etc\passwd, Config
passwd := StrSplit(t, ["=","`n"])
passwd := Object(passwd*)
for key, value in passwd
{
u := UnicodeDec(key)
if ( u != currentuser )
{
usr .= u . "|"
}
else
{
usr .= u  . "||"
username := u
}
}
if ( InStr(usr, "||") = 0 )
{
usr .= "|"
GuiControl,, username, % usr
RegExMatch(t, "[^\|]+(?=\|{2}$)", username)
}
else
{
GuiControl,, username, % usr
}
return
}
signining()
{
Gui, 1:Default
Gui +OwnDialogs
Global user_id
Global Cookie
Global BDUSS
Global remember
errno := getinfo(uname)
if ( errno != 0 || user_id = "" || uname = "" || vip_type = "" )
{
return
}
Cookie := "BDUSS=" . BDUSS
loginstate := 1
currentuser := UnicodeDec(uname)
GuiControl,, currentuser, % currentuser
if ( vip_type = 1 )
{
GuiControl,, vip_type, vip
}
else if ( vip_type = 2 )
{
GuiControl,, vip_type, svip
}
GuiControl,, loginstate, 注销
GuiControl, Enable, refresh
Menu, File, Enable, 保存(&S)...
Menu, Tools, Enable, 下载配置(&N)
if ( remember = 1 &&  uname != "" )
{
IniRead, t, etc\passwd, Config, % uname, % A_Space
if ( t = "" )
{
IniWrite, % BDUSS, etc\passwd, Config, % uname
}
else if ( t != BDUSS )
{
c := "BDUSS=" . t
r := logout(c)
if ( r = "deleted" )
{
IniWrite, % BDUSS, etc\passwd, Config, % uname
if ( FileExist("config\d.ini") != "" )
{
IniDelete, config\d.ini, % t
}
}
}
}
listroot()
quota()
record()
recyclelist()
if ( FileExist("config\d.ini") != "" )
{
getparameter()
}
Menu, File, Enable, 导出当前路径的文件夹结构(&M)...
Menu, Find, Enable, 查找当前路径下的重复文件(&F)
return
}
getinfo(ByRef uname)
{
proxy()
Global BDUSS
Global user_id
URL := encrypt = 1 ? "https://pan.baidu.com/api/user/getinfo?need_selfinfo=1" : "http://pan.baidu.com/api/user/getinfo?need_selfinfo=1"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", "BDUSS=" . BDUSS)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
if ( RegExMatch(whr.ResponseText, "(""records"":\[)[^]]+") != 0 )
{
RegExMatch(whr.ResponseText, "(?<=""uk"":)\d+", user_id)
RegExMatch(whr.ResponseText, "(?<=""uname"":"")[^""]+", uname)
RegExMatch(whr.ResponseText, "(?<=""vip_type"":)\d", vip_type)
}
else
{
MsgBox, 16, 错误:getinfo, 登录时出现意外错误。Cookie 可能已失效。
}
}
else
{
MsgBox, 16, 错误:getinfo, 登录时出现意外错误。错误代码: %errno%
}
return, errno
}
Catch
{
MsgBox, 16, 错误:getinfo, 出现意外错误。
}
return
}
listroot(page := 1)
{
Global Cookie
URL := encrypt = 1 ? "https://pan.baidu.com/api/list?dir=%2F" . "&page=" . page . "&num=1000" : "http://pan.baidu.com/api/list?dir=%2F" . "&page=" . page . "&num=1000"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
if ( page = 1 )
{
currentpath := "/"
pathlast := "/"
back.Push("/")
++backtop
GuiControl,, currentpath, /
GuiControlGet, tab
switch tab
{
case "文件":
GuiControl, Text, currentpath, /
GuiControl, Text, search, 搜索"/"
GuiControl, Enable, up
GuiControl, Enable, root
GuiControl, Enable, search
case "下载":
GuiControl, Text, currentpath, 下载
case "分享":
GuiControl, Text, currentpath, 分享
case "回收站":
GuiControl, Text, currentpath, 回收站
}
GuiControl, -Redraw, file
}
RegExMatch(whr.ResponseText, "(?<=\[).*(?=])", list)
if ( list != "" )
{
list := StrSplit(list, ",{""")
for key, value in list
{
RegExMatch(value, "(?<=isdir"":)\d", isdir)
RegExMatch(value, "(?<=server_filename"":"")[^""]+", server_filename)
server_filename := UnicodeDec(server_filename)
RegExMatch(value, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
RegExMatch(value, "(?<=server_mtime"":)\d+", mtime)
server_mtime := 1970010108
server_mtime += mtime, s
FormatTime, server_mtime, % server_mtime, yyyy/M/d H:mm:ss
RegExMatch(value, "(?<=fs_id"":)\d+", fs_id)
Gui, ListView, file
if ( isdir = 1 )
{
LV_Add("icon10", server_filename, server_mtime, "文件夹",,, path,, fs_id)
}
else
{
RegExMatch(value, "(?<=size"":)\d+", size)
sizeKB := size // 1024
sizeKB := sizeKB != 0 ? RegExReplace(sizeKB, "\d(?=(\d{3})+$)", "$0,") . " KB" : "1 KB"
RegExMatch(value, "(?<=md5"":"")[^""]+", md5)
RegExMatch(server_filename, "\.[^\.]+$", ext)
ext := Format("{:L}", ext)
type := ext = "" ? "文件" : type(ext, index)
LV_Add(ext = "" ? "icon2" : "icon" . index, server_filename, server_mtime, type, sizeKB, size, path, ext, fs_id, md5)
}
}
if ( list.Length() = 1000 )
{
listroot(++page)
}
else
{
GuiControl, +Redraw, file
}
}
else
{
GuiControl, +Redraw, file
}
}
else
{
MsgBox, 16, 错误:list, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:list, 出现意外错误。
}
return
}
UnicodeEnc(ByRef str)
{
Loop, Parse, str
{
if ( Asc(A_LoopField) < 128 )
{
r .= A_LoopField
}
else
{
r .= "\u" . Format("{:04x}", Asc(A_LoopField))
}
}
return, r
}
UnicodeDec(ByRef str)
{
read := 0
reading := 0
Loop, Parse, str
{
if ( A_LoopField = "\")
{
read := 1
}
else if ( read != 0 )
{
reading := 4
code := ""
--read
}
else if ( reading != 0 )
{
code .= A_LoopField
--reading
if ( reading = 0 )
{
r .= Chr("0x" . code)
}
}
else
{
r .= A_LoopField
}
}
return, r
}
type(ByRef ext, ByRef index)
{
switch ext
{
case ".htm", ".html":
r := "HTML 文档"
index := 1
case ".exe":
r := "应用程序"
index := 3
case ".bmp":
r := "BMP 图像"
index := 4
case ".gif":
r := "GIF 图像"
index := 5
case ".png":
r := "PNG 图像"
index := 6
case ".avi":
r := "视频剪辑"
index := 7
case ".mpeg", ".mpg":
r := "电影剪辑"
index := 7
case ".wmv":
r := "Windows Media 音频/视频文件"
index := 7
case ".mp4":
r := "MP4 视频"
index := 8
case ".iso", ".img":
r := "光盘映像文件"
index := 9
case ".txt":
r := "文本文件"
index := 12
case ".mp3":
r := "MP3 格式声音"
index := 13
case ".wav":
r := "波形声音"
index := 13
case ".jpeg", ".jpg":
r := "JPEG 图像"
index := 16
case ".zip":
r := "压缩(zipped)文件夹"
index := 17
case ".msi":
r := "Windows Installer 程序包"
index := 2
case ".pdf":
r := "Adobe Acrobat Document"
index := 2
case ".rar":
r := "WinRAR 压缩文件"
index := 2
default:
r := RegExReplace(ext, "^\.")
r := Format("{:U}", r) . " 文件"
index := 2
}
return, r
}
quota()
{
Global Cookie
URL := encrypt = 1 ? "https://pan.baidu.com/api/quota" : "http://pan.baidu.com/api/quota"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=""used"":)\d+", used)
RegExMatch(whr.ResponseText, "(?<=""total"":)[^,]+", total)
free := Round(( total - used ) / 1073741824, 1) . " GB"
used := Round(used / 1073741824, 1) . " GB"
total := Round(total / 1073741824, 1) . " GB"
GuiControl,, used, 已用空间:%used%
GuiControl,, free, 可用空间:%free%
GuiControl,, total, 空间大小:%total%
}
else
{
MsgBox, 21, 错误:quota, 错误代码: %errno%
IfMsgBox, Retry
{
quota()
}
}
}
Catch
{
MsgBox, 16, 错误:quota, 出现意外错误。
}
return
}
record(page := 1)
{
Global Cookie
URL := encrypt = 1 ? "https://pan.baidu.com/share/record?clienttype=8&page=" . page : "http://pan.baidu.com/share/record?clienttype=8&page=" . page
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
if ( page = 1 )
{
Gui, ListView, shared
LV_Delete()
GuiControl, -Redraw, shared
}
RegExMatch(whr.ResponseText, "(?<=\[).*(?=])", list)
if ( list != "" )
{
list := StrSplit(list, ",{""")
for key, value in list
{
RegExMatch(value, "(?<=ctime"":)\d+", t)
ctime := 1970010108
ctime += t, s
FormatTime, ctime, % ctime, yyyy/M/d H:mm:ss
RegExMatch(value, "(?<=dCnt"":)\d+", dCnt)
RegExMatch(value, "(?<=passwd"":"")[^""]+", passwd)
if ( passwd = 0 )
{
passwd := ""
}
RegExMatch(value, "(?<=shareId"":)\d+", shareId)
RegExMatch(value, "(?<=shortlink"":"")[^""]+", shortlink)
RegExMatch(value, "(?<=tCnt"":)\d+", tCnt)
RegExMatch(value, "(?<=typicalPath"":"")[^""]+", typicalPath)
if ( RegExMatch(typicalPath, "^/") != 0 )
{
typicalPath := UnicodeDec(typicalPath)
RegExMatch(typicalPath, "(?<=/)[^/]+$", server_filename)
RegExMatch(value, "(?<=expiredType"":)-?\d+", expiredType)
if ( expiredType = 0 )
{
RegExMatch(value, "(?<=expiredTime"":)\d+", expiredTime)
expiredTime := Ceil(expiredTime / 86400)
}
else
{
expiredTime := "永不过期"
}
}
else
{
typicalPath := ""
server_filename := ""
RegExMatch(value, "(?<=expiredType"":)-?\d+", expiredType)
if ( expiredType = -1 )
{
expiredTime := "已过期"
}
else
{
expiredTime := "找不到该项目"
}
}
RegExMatch(value, "(?<=vCnt"":)\d+", vCnt)
Gui, ListView, shared
LV_Add(server_filename = "" ? "icon14" : "icon15", server_filename, typicalPath, shortlink, passwd, vCnt, dCnt, tCnt, shareId, ctime, expiredTime)
}
if ( list.Length() = 100 )
{
record(++page)
}
else
{
GuiControl, +Redraw, shared
}
}
else
{
GuiControl, +Redraw, shared
}
}
else
{
MsgBox, 16, 错误:record, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:record, 出现意外错误。
}
return
}
recyclelist(page := 1)
{
Global Cookie
URL := encrypt = 1 ? "https://pan.baidu.com/api/recycle/list?page=" . page . "&num=1000" : "http://pan.baidu.com/api/recycle/list?page=" . page . "&num=1000"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
if ( page = 1 )
{
Gui, ListView, recyclebin
LV_Delete()
GuiControl, -Redraw, RecycleBin
}
RegExMatch(whr.ResponseText, "(?<=\[).*(?=])", list)
if ( list != "" )
{
list := StrSplit(list, ",{""")
for key, value in list
{
RegExMatch(value, "(?<=fs_id"":)\d+", fs_id)
RegExMatch(value, "(?<=server_filename"":"")[^""]+", server_filename)
server_filename := UnicodeDec(server_filename)
RegExMatch(value, "(?<=server_mtime"":)\d+", mtime)
server_mtime := 1970010108
server_mtime += mtime, s
FormatTime, server_mtime, % server_mtime, yyyy/M/d H:mm:ss
RegExMatch(value, "(?<=isdir"":)\d", isdir)
RegExMatch(value, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
RegExMatch(value, "(?<=leftTime"":)\d+", leftTime)
Gui, ListView, recyclebin
if ( isdir = 1 )
{
LV_Add("icon10", server_filename, path, server_mtime,,, "文件夹",, fs_id,, leftTime)
}
else
{
RegExMatch(value, "(?<=size"":)\d+", size)
sizeKB := size // 1024
sizeKB := sizeKB != 0 ? RegExReplace(sizeKB, "\d(?=(\d{3})+$)", "$0,") . " KB" : "1 KB"
RegExMatch(value, "(?<=md5"":"")[^""]+", md5)
RegExMatch(server_filename, "\.[^\.]+$", ext)
ext := Format("{:L}", ext)
type := ext = "" ? "文件" : type(ext, index)
LV_Add(ext = "" ? "icon2" : "icon" . index, server_filename, path, server_mtime, sizeKB, size, type, ext, fs_id, md5, leftTime)
}
}
if ( list.Length() = 1000 )
{
recyclelist(++page)
}
else
{
GuiControl, +Redraw, RecycleBin
}
}
else
{
GuiControl, +Redraw, RecycleBin
}
}
else
{
MsgBox, 16, 错误:list, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:list, 出现意外错误。
}
return
}
getparameter()
{
Global BDUSS
IniRead, version, config\d.ini, % BDUSS, version, % A_Space
if ( version != "" )
{
IniRead, devuid, config\d.ini, % BDUSS, devuid, % A_Space
IniRead, rand, config\d.ini, % BDUSS, rand, % A_Space
IniRead, time, config\d.ini, % BDUSS, time, % A_Space
}
return
}
list(ByRef path2, bf := 0, page := 1)
{
Global Cookie
Global currentpathlist
Encodepath := UrlEncode(path2)
URL := encrypt = 1 ? "https://pan.baidu.com/api/list?dir=" . Encodepath . "&page=" . page . "&num=1000" : "http://pan.baidu.com/api/list?dir=" . Encodepath . "&page=" . page . "&num=1000"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
if ( page = 1 )
{
Gui, ListView, file
LV_Delete()
pathlast := path2
GuiControl, Text, currentpath, % path2
GuiControl, Text, search, 搜索"%path2%"
if ( currentpath != path2 )
{
currentpath := path2
FIFO(currentpathlist, path2)
GuiControl,, currentpath, % currentpathlist
}
if ( bf = 0  && path2 != back[backtop] )
{
back.Push(path2)
++backtop
GuiControl, Enable, back
if ( forwardtop != 0 )
{
forward.Delete(1, forwardtop)
forwardtop := 0
GuiControl, Disable, forward
}
}
GuiControl, -Redraw, file
}
RegExMatch(whr.ResponseText, "(?<=\[).*(?=])", list)
if ( list != "" )
{
list := StrSplit(list, ",{""")
GuiControl, -Redraw, file
for key, value in list
{
RegExMatch(value, "(?<=isdir"":)\d", isdir)
RegExMatch(value, "(?<=server_filename"":"")[^""]+", server_filename)
server_filename := UnicodeDec(server_filename)
RegExMatch(value, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
RegExMatch(value, "(?<=server_mtime"":)\d+", mtime)
server_mtime := 1970010108
server_mtime += mtime, s
FormatTime, server_mtime, % server_mtime, yyyy/M/d H:mm:ss
RegExMatch(value, "(?<=fs_id"":)\d+", fs_id)
Gui, ListView, file
if ( isdir = 1 )
{
LV_Add("icon10", server_filename, server_mtime, "文件夹",,, path,, fs_id)
}
else
{
RegExMatch(value, "(?<=size"":)\d+", size)
sizeKB := size // 1024
sizeKB := sizeKB != 0 ? RegExReplace(sizeKB, "\d(?=(\d{3})+$)", "$0,") . " KB" : "1 KB"
RegExMatch(value, "(?<=md5"":"")[^""]+", md5)
RegExMatch(server_filename, "\.[^\.]+$", ext)
ext := Format("{:L}", ext)
type := ext = "" ? "文件" : type(ext, index)
LV_Add(ext = "" ? "icon2" : "icon" . index, server_filename, server_mtime, type, sizeKB, size, path, ext, fs_id, md5)
}
}
if ( list.Length() = 1000 )
{
list(path2, bf, ++page)
}
else
{
GuiControl, +Redraw, file
}
}
else
{
GuiControl, +Redraw, file
}
}
else if ( errno = -9 )
{
MsgBox, 16, 错误:list, 找不到 "%path2%"。请检查拼写并重试。
}
else
{
MsgBox, 16, 错误:list, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:list, 出现意外错误。
}
return
}
UrlEncode(ByRef str)
{
Loop, Parse, str
{
if ( RegExMatch(A_LoopField, "[a-zA-Z0-9-_\.~!\(\)']", Reserved) )
{
r .= Reserved
}
else if ( InStr(A_LoopField, " ") != 0 )
{
r .= "+"
}
else
{
dec := Asc(A_LoopField)
if ( dec <= 127 )
{
r .= "%" . Format("{:X}", dec >> 4)
r .= Format("{:X}", dec & 0xF)
}
else if ( dec <= 2047 )
{
r .= "%" . Format("{:X}", ( dec >> 6 | 0xC0 ) >> 4)
r .= Format("{:X}", dec >> 6 & 0xF)
r .= "%" . Format("{:X}", ( dec & 0x3F | 0x80 ) >> 4)
r .= Format("{:X}", dec & 0xF)
}
else if ( dec <= 65535 )
{
r .= "%" . Format("{:X}", ( dec >> 12 | 0xE0 ) >> 4)
r .= Format("{:X}", dec >> 12 & 0xF)
r .= "%" . Format("{:X}", ( dec >> 6 & 0x3F | 0x80 ) >> 4)
r .= Format("{:X}", dec >> 6 & 0xF)
r .= "%" . Format("{:X}", ( dec & 0x3F | 0x80 ) >> 4)
r .= Format("{:X}", dec & 0xF)
}
else
{
r .= "%" . Format("{:X}", ( dec >> 18 | 0xF0 ) >> 4)
r .= Format("{:X}", dec >> 18 & 0xF)
r .= "%" . Format("{:X}", ( dec >> 12 & 0x3F | 0x80 ) >> 4)
r .= Format("{:X}", dec >> 12 & 0xF)
r .= "%" . Format("{:X}", ( dec >> 6 & 0x3F | 0x80) >> 4)
r .= Format("{:X}", dec >> 6 & 0xF)
r .= "%" . Format("{:X}", ( dec & 0x3F | 0x80 ) >> 4)
r .= Format("{:X}", dec & 0xF)
}
}
}
return, r
}
UrlEncode2(ByRef str)
{
Loop, Parse, str
{
if ( RegExMatch(A_LoopField, "[a-zA-Z0-9-_\.~!\(\)'/]", Reserved) )
{
r .= Reserved
}
else if ( InStr(A_LoopField, " ") != 0 )
{
r .= "+"
}
else
{
dec := Asc(A_LoopField)
if ( dec <= 127 )
{
r .= "%" . Format("{:X}", dec >> 4)
r .= Format("{:X}", dec & 0xF)
}
else if ( dec <= 2047 )
{
r .= "%" . Format("{:X}", ( dec >> 6 | 0xC0 ) >> 4)
r .= Format("{:X}", dec >> 6 & 0xF)
r .= "%" . Format("{:X}", ( dec & 0x3F | 0x80 ) >> 4)
r .= Format("{:X}", dec & 0xF)
}
else if ( dec <= 65535 )
{
r .= "%" . Format("{:X}", ( dec >> 12 | 0xE0 ) >> 4)
r .= Format("{:X}", dec >> 12 & 0xF)
r .= "%" . Format("{:X}", ( dec >> 6 & 0x3F | 0x80 ) >> 4)
r .= Format("{:X}", dec >> 6 & 0xF)
r .= "%" . Format("{:X}", ( dec & 0x3F | 0x80 ) >> 4)
r .= Format("{:X}", dec & 0xF)
}
else
{
r .= "%" . Format("{:X}", ( dec >> 18 | 0xF0 ) >> 4)
r .= Format("{:X}", dec >> 18 & 0xF)
r .= "%" . Format("{:X}", ( dec >> 12 & 0x3F | 0x80 ) >> 4)
r .= Format("{:X}", dec >> 12 & 0xF)
r .= "%" . Format("{:X}", ( dec >> 6 & 0x3F | 0x80) >> 4)
r .= Format("{:X}", dec >> 6 & 0xF)
r .= "%" . Format("{:X}", ( dec & 0x3F | 0x80 ) >> 4)
r .= Format("{:X}", dec & 0xF)
}
}
}
return, r
}
FIFO(ByRef queue, ByRef node, number := 9)
{
if ( queue = "" )
{
queue := "|" . node . "||"
}
else
{
queue := RegExReplace(queue, "\|\|$")
queue := StrReplace(queue, "||", "|")
queue := "|" . node . "|" . queue
}
StrReplace(queue , "|",, n)
if ( n > number )
{
queue := RegExReplace(queue , "\|[^\|]+$")
}
return
}
tab:
if ( loginstate = 1 )
{
GuiControlGet, tab
switch tab
{
case "文件":
if ( back.Length() > 1 )
{
GuiControl, Enable, back
}
if ( forward.Length() != 0 )
{
GuiControl, Enable, forward
}
GuiControl, Enable, up
GuiControl, Enable, root
GuiControl, Enable, search
if ( pathlast = """" . currentpath . """中的搜索结果" )
{
GuiControl, Text, currentpath, % pathlast
GuiControl, Text, search, % search
}
else if ( pathlast = """" . currentpath . """中的重复的文件" )
{
GuiControl, Text, currentpath, % pathlast
GuiControl, Text, search, 搜索"%currentpath%"
}
else
{
GuiControl, Text, currentpath, % currentpath
GuiControl, Text, search, 搜索"%currentpath%"
}
Menu, File, Enable, 导出当前路径的文件夹结构(&M)...
Menu, Find, Enable, 查找当前路径下的重复文件(&F)
return
case "下载":
GuiControl, Text, currentpath, 下载
case "分享":
GuiControl, Text, currentpath, 分享
case "回收站":
GuiControl, Text, currentpath, 回收站
}
GuiControl, Text, search
GuiControl, Disable, search
GuiControl, Disable, back
GuiControl, Disable, forward
GuiControl, Disable, up
GuiControl, Disable, root
Menu, File, Disable, 导出当前路径的文件夹结构(&M)...
Menu, Find, Disable, 查找当前路径下的重复文件(&F)
}
return
file()
{
Thread, Priority, 1
Gui +OwnDialogs
Global server_filename
if ( loginstate = 1 )
{
if ( A_EventInfo != 0 )
{
Gui, ListView, file
if ( A_GuiEvent = "DoubleClick" )
{
LV_GetText(type, A_EventInfo, 3)
if ( type = "文件夹" )
{
LV_GetText(path, A_EventInfo, 6)
list(path)
}
}
else if ( A_GuiEvent = "Normal" || A_GuiEvent = "RightClick" )
{
LV_GetText(server_filename, A_EventInfo)
}
}
}
return
}
download()
{
Gui +OwnDialogs
if ( A_EventInfo != 0 &&  A_GuiEvent = "DoubleClick" )
{
Gui, ListView, download
LV_GetText(PID, A_EventInfo, 5)
Process, Exist, % PID
if ( ErrorLevel != 0 )
{
WinGet, filename, ProcessName, ahk_pid %PID%
if ( filename = "cmd.exe" )
{
WinActivate, ahk_pid %PID%
return
}
}
MsgBox,, 提示, cmd.exe 进程不存在。这可能是由于命令提示符窗口已被关闭。
}
return
}
shared()
{
if ( loginstate = 1 && A_EventInfo != 0 && A_GuiEvent = "DoubleClick" )
{
Gui, ListView, shared
LV_GetText(link, A_EventInfo, 3)
LV_GetText(pwd, A_EventInfo, 4)
Clipboard := link . ( pwd = "" ? "" : " " . pwd )
}
return
}
currentpath()
{
if ( loginstate = 1 && refresh = 1 )
{
refresh := 0
GuiControl,, refresh, >
}
return
}
refresh:
Thread, Priority, 1
Gui +OwnDialogs
if ( refresh = 1 )
{
switch tab
{
case "文件":
FilesContextMenuRefresh()
case "分享":
record()
case "回收站":
recyclelist()
}
}
else
{
GuiControlGet, path,, currentpath
if ( path != "" )
{
switch path
{
case "下载":
if ( tab != "下载" )
{
GuiControl, Choose, tab, 2
tab := "下载"
GuiControl, Disable, back
GuiControl, Disable, forward
GuiControl, Disable, up
GuiControl, Disable, root
GuiControl, Disable, search
GuiControl, Text, search
Menu, File, Disable, 导出当前路径的文件夹结构(&M)...
Menu, Find, Disable, 查找当前路径下的重复文件(&F)
}
refresh := 1
GuiControl,, refresh, 刷新
case "分享":
if ( tab != "分享" )
{
GuiControl, Choose, tab, 3
tab := "分享"
GuiControl, Disable, back
GuiControl, Disable, forward
GuiControl, Disable, up
GuiControl, Disable, root
GuiControl, Disable, search
GuiControl, Text, search
Menu, File, Disable, 导出当前路径的文件夹结构(&M)...
Menu, Find, Disable, 查找当前路径下的重复文件(&F)
}
refresh := 1
GuiControl,, refresh, 刷新
case "回收站":
if ( tab != "回收站" )
{
GuiControl, Choose, tab, 4
tab := "回收站"
GuiControl, Disable, back
GuiControl, Disable, forward
GuiControl, Disable, up
GuiControl, Disable, root
GuiControl, Disable, search
GuiControl, Text, search
Menu, File, Disable, 导出当前路径的文件夹结构(&M)...
Menu, Find, Disable, 查找当前路径下的重复文件(&F)
}
refresh := 1
GuiControl,, refresh, 刷新
default:
if ( RegExMatch(path, "^/") = 0 )
{
MsgBox, 16, 错误, 路径必须以"/"开头。
}
else if ( RegExMatch(path, "[\\:\*\?""<>\|]") != 0 )
{
MsgBox, 16, 错误, 路径不能包含下列任何字符:`r`n\ : * ? " < > |
}
else if ( InStr(path, "//") != 0 )
{
MsgBox, 16, 错误, 找不到 "%path%"。请检查拼写并重试。
}
else
{
if ( tab != "文件" )
{
GuiControl, Choose, tab, 1
tab := "文件"
if ( back != "/" )
{
GuiControl, Enable, back
}
if ( forward != "" )
{
GuiControl, Enable, forward
}
GuiControl, Enable, up
GuiControl, Enable, root
GuiControl, Enable, search
Menu, File, Enable, 导出当前路径的文件夹结构(&M)...
Menu, Find, Enable, 查找当前路径下的重复文件(&F)
}
refresh := 1
GuiControl,, refresh, 刷新
path := RegExReplace(path, "/$")
if ( path = "" )
{
path := "/"
}
list(path)
}
}
}
}
return
up:
Thread, Priority, 1
Gui +OwnDialogs
if ( pathlast != "/" )
{
path := RegExReplace(currentpath, "/[^/]+$")
if ( path = "" )
{
path := "/"
}
list(path)
}
return
root:
Thread, Priority, 1
Gui +OwnDialogs
list("/")
return
#if ( WinActive("ahk_id" . mainhwnd) )
{
Enter::openfocus()
^a::selectall()
return
}
openfocus()
{
Gui +OwnDialogs
Global searchlist
GuiControlGet, focus, FocusV
switch focus
{
case "loginstate":
signin()
case "switch":
Gosub, switch
case "back":
Gosub, back
case "forward":
Gosub, forward
case "Up":
Gosub, up
case "root":
Gosub, root
case "currentpath", "refresh":
Gosub, refresh
case "search":
GuiControlGet, keyword,, search
if ( keyword != "" && RegExMatch(keyword, "[\\:""<>\|]") = 0 )
{
pathlast := """" . currentpath . """中的搜索结果"
GuiControl, Text, currentpath, "%currentpath%"中的搜索结果
if ( search != keyword )
{
search := keyword
FIFO(searchlist, keyword, 3)
GuiControl,, search, % searchlist
}
search(currentpath, keyword)
}
}
return
}
selectall()
{
GuiControlGet, focus, FocusV
if ( focus = "download" )
{
Gui, ListView, download
GuiControl, -Redraw, download
Loop, % LV_GetCount()
{
LV_Modify(A_Index, "Select")
}
GuiControl, +Redraw, download
return
}
if ( loginstate = 1 )
{
switch focus
{
case "file":
Gui, ListView, file
GuiControl, -Redraw, file
Loop, % LV_GetCount()
{
LV_Modify(A_Index, "Select")
}
GuiControl, +Redraw, file
case "shared":
Gui, ListView, shared
GuiControl, -Redraw, shared
Loop, % LV_GetCount()
{
LV_Modify(A_Index, "Select")
}
GuiControl, +Redraw, shared
case "recyclebin":
Gui, ListView, recyclebin
GuiControl, -Redraw, recyclebin
Loop, % LV_GetCount()
{
LV_Modify(A_Index, "Select")
}
GuiControl, +Redraw, recyclebin
}
}
return
}
#if ( WinActive("ahk_id" . mainhwnd) && loginstate = 1 )
{
~LButton::
~RButton::
~Tab::
~+Tab::
GuiControlGet, focus, FocusV
if ( focus != "search" )
{
if ( focus = "currentpath" && refresh = 0 )
{
sleep, 1
GuiControlGet, focus, FocusV
if ( focus != "currentpath" && focus != "refresh" )
{
switch tab
{
case "文件":
GuiControlGet, path,, currentpath
if ( path != pathlast )
{
GuiControl, Text, currentpath, % pathlast
}
case "下载":
GuiControl, Text, currentpath, 下载
case "分享":
GuiControl, Text, currentpath, 分享
case "回收站":
GuiControl, Text, currentpath, 回收站
}
refresh := 1
GuiControl,, refresh, 刷新
}
}
sleep, 1
GuiControlGet, focus, FocusV
if ( focus = "search" )
{
GuiControlGet, path,, currentpath
if ( path != """" . currentpath . """中的搜索结果" )
{
GuiControl, Text, search
}
}
}
else
{
sleep, 1
GuiControlGet, focus, FocusV
if ( focus != "search" )
{
GuiControlGet, path,, currentpath
if ( tab = "文件" && path != """" . currentpath . """中的搜索结果" )
{
GuiControl, Text, search, 搜索"%currentpath%"
}
}
}
return
}
search(ByRef path2, ByRef keyword, recursion := 1, page := 1)
{
Global Cookie
Encodepath := UrlEncode(path2)
Encodekeyword := UrlEncode(keyword)
URL := encrypt = 1 ? "https://pan.baidu.com/api/search?" . ( recursion = 1 ? "recursion=1&" : "" ) . "dir=" . Encodepath . "&key=" . Encodekeyword . "&page=" . page . "&num=1000" : "http://pan.baidu.com/api/search?" . ( recursion = 1 ? "recursion=1&" : "" ) . "dir=" . Encodepath . "&key=" . Encodekeyword . "&page=" . page . "&num=1000"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
if ( page = 1 )
{
Gui, ListView, file
LV_Delete()
GuiControl, -Redraw, file
}
RegExMatch(whr.ResponseText, "(?<=\[).*(?=])", list)
if ( list != "" )
{
list := StrSplit(list, ",{""")
for key, value in list
{
RegExMatch(value, "(?<=fs_id"":)\d+", fs_id)
RegExMatch(value, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
RegExMatch(value, "(?<=server_filename"":"")[^""]+", server_filename)
server_filename := UnicodeDec(server_filename)
RegExMatch(value, "(?<=server_mtime"":)\d+", mtime)
server_mtime := 1970010108
server_mtime += mtime, s
FormatTime, server_mtime, % server_mtime, yyyy/M/d H:mm:ss
RegExMatch(value, "(?<=isdir"":)\d", isdir)
Gui, ListView, file
if ( isdir = 1 )
{
LV_Add("icon10", server_filename, server_mtime, "文件夹",,, path,, fs_id)
}
else
{
RegExMatch(value, "(?<=size"":)\d+", size)
sizeKB := size // 1024
sizeKB := sizeKB != 0 ? RegExReplace(sizeKB, "\d(?=(\d{3})+$)", "$0,") . " KB" : "1 KB"
RegExMatch(value, "(?<=md5"":"")[^""]+", md5)
RegExMatch(server_filename, "\.[^\.]+$", ext)
ext := Format("{:L}", ext)
type := ext = "" ? "文件" : type(ext, index)
LV_Add(ext = "" ? "icon2" : "icon" . index, server_filename, server_mtime, type, sizeKB, size, path, ext, fs_id, md5)
}
}
if ( list.Length() = 1000 )
{
search(path2, keyword, recursion, ++page)
}
else
{
GuiControl, +Redraw, file
}
}
else
{
GuiControl, +Redraw, file
}
}
else
{
MsgBox, 16, 错误:search, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:search, 出现意外错误。
}
return
}
back:
Thread, Priority, 1
Gui +OwnDialogs
if ( RegExMatch(pathlast, "^""") != 0 )
{
list(currentpath, 1)
return
}
forward.Push(back[backtop])
++forwardtop
GuiControl, Enable, forward
back.Pop()
--backtop
if ( backtop = 1 )
{
GuiControl, Disable, back
}
list(back[backtop], 1)
return
forward:
Thread, Priority, 1
Gui +OwnDialogs
back.Push(forward[forwardtop])
++backtop
Currentforwardtop := forward[forwardtop]
GuiControl, Enable, back
forward.Pop()
--forwardtop
if ( forwardtop = 0 )
{
GuiControl, Disable, forward
}
list(Currentforwardtop, 1)
return
open:
if ( gui19hwnd != "" )
{
WinActivate, ahk_id %gui19hwnd%
return
}
Gui, 19:Default
Gui, +Resize +Hwndgui19hwnd
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 地址:
Gui, Add, Edit, x+0 y+-17 h22 w576 vlink
Gui, Add, Button, x+5 h22 w60 Default gopen19 vopen, 打开
Gui, Add, Button, x0 y+5 h22 w22 Disabled gup19 vup19, ^
Gui, Add, Button, x+0 h22 w22 Disabled groot19 vroot19, /
Gui, Add, Button, x+0 h22 w40 Disabled grefresh19 vrefresh19, 刷新
Gui, Add, Edit, x+5 w591 h22 ReadOnly vcurrentpath19
Gui, Add, ListView, x0 y+5 h290 w690 0x40 gshared19 vshared19, 名称|修改日期|类型|大小 (KB)|大小 (Byte)|路径|文件扩展名|文件 ID|MD5|
GuiControl, -Redraw, shared19
LV_ModifyCol(1, 270)
LV_ModifyCol(2, 126)
LV_ModifyCol(3, 115)
LV_ModifyCol(4, 90)
LV_ModifyCol(5, 90)
LV_ModifyCol(6, 150)
LV_ModifyCol(7, 80)
LV_ModifyCol(8, 110)
LV_ModifyCol(9, 204)
LV_ModifyCol(2, "Logical")
LV_ModifyCol(4, "Right")
LV_ModifyCol(5, "Logical Right")
LV_ModifyCol(8, "Logical Right")
GuiControl, +Redraw, shared19
LV_SetImageList(icon)
Menu, SharedContextMenuFolder19, Add, 打开(&O), SharedContextMenuOpen19
Menu, SharedContextMenuFolder19, Add
Menu, SharedContextMenuFolder19, Add, 下载(&W), SharedContextMenuDownloadQueue19
Menu, SharedContextMenuFolder19, Add, 备用下载(&A), SharedContextMenuDownloadQueue192
Menu, SharedContextMenuFolder19, Add
Menu, SharedContextMenuFolder19, Add, 保存(&S), SharedContextMenuSave19
Menu, SharedContextMenuFolder19, Default, 打开(&O)
Menu, SharedContextMenuFile19, Add, 下载(&W), SharedContextMenuDownload19
Menu, SharedContextMenuFile19, Add, 备用下载(&A), SharedContextMenuDownload192
Menu, SharedContextMenuFile19, Add
Menu, SharedContextMenuFile19, Add, 保存(&S), SharedContextMenuSave19
Menu, SharedContextMenuFile192, Add, 下载(&W), SharedContextMenuDownloadQueue19
Menu, SharedContextMenuFile192, Add, 备用下载(&A), SharedContextMenuDownloadQueue192
Menu, SharedContextMenuFile192, Add
Menu, SharedContextMenuFile192, Add, 保存(&S), SharedContextMenuSave19
Menu, SharedContextMenuBlankArea19, Add, 刷新(&E), SharedContextMenuRefresh19
refresh19 := 0
Gui, Show,, 打开分享链接
return
19GuiSize:
if ( A_EventInfo != 1 )
{
GuiControl, MoveDraw, link, % "w" A_GuiWidth - 115
GuiControl, MoveDraw, open, % "x" A_GuiWidth - 70
GuiControl, MoveDraw, currentpath19, % "w" A_GuiWidth - 99
GuiControl, MoveDraw, shared19, % "w" A_GuiWidth "h" A_GuiHeight - 59
}
return
19GuiClose:
gui19hwnd := ""
Menu, SharedContextMenuFolder19, DeleteAll
Menu, SharedContextMenuFile19, DeleteAll
Menu, SharedContextMenuFile192, DeleteAll
Menu, SharedContextMenuBlankArea19, DeleteAll
Gui, Destroy
return
open19()
{
Gui +OwnDialogs
proxy()
Global link
Global URL
Global pwd
Global input := ""
Global refresh19 := 0
Global root19 := ""
GuiControl, Disable, up19
GuiControl, Disable, root19
GuiControl, Disable, refresh19
GuiControl,, currentpath19
LV_Delete()
Gui, Submit, NoHide
if ( link != "" )
{
if ( RegExMatch(link, "https://pan\.baidu\.com/s/.+$") = 0 )
{
if ( RegExMatch(link, "http://pan\.baidu\.com/s/.+$") = 0 )
{
if ( RegExMatch(link, "pan\.baidu\.com/s/.+$") = 0 )
{
MsgBox, 16, 错误, 未找到地址。请检查拼写并重试。
return
}
link := "https://" . link
}
else
{
link := StrReplace(link, "http:", "https:")
}
}
RegExMatch(link, "https://pan\.baidu\.com/s/[^\s]+", URL)
if ( RegExMatch(link, "\s\S+[:|：] ?\K[0-9a-zA-Z]{4}", pwd) = 0 )
{
RegExMatch(link, "(?<= )[0-9a-zA-Z]{4}", pwd)
}
link := URL . ( pwd = "" ? "" : " " . pwd )
GuiControl,, link, % URL . ( pwd = "" ? "" : " " . pwd )
errno := openshare19(URL, Location)
if ( errno = "encrypted" )
{
if ( pwd = "" )
{
Gosub, inputpwd
Gui, 19:Default
if ( pwd = "" )
{
return
}
}
errno := verify(Location, pwd)
switch errno
{
case 0:
GuiControl,, link, % URL . " " . pwd
errno := openshare19302(URL)
if ( errno = 0 )
{
errno := opensharelistroot19()
if ( errno = 0 )
{
refresh19 := 1
GuiControl, Enable, up19
GuiControl, Enable, root19
GuiControl, Enable, refresh19
}
}
case "":
MsgBox, 16, 错误:verify, 出现意外错误。
case -9, -12:
MsgBox, 16, 错误:verify, 密码错误。
default:
MsgBox, 16, 错误:verify, 错误代码: %errno%
}
}
else if ( errno = 0 )
{
errno := opensharelistroot19()
if ( errno = 0 )
{
refresh19 := 1
GuiControl, Enable, up19
GuiControl, Enable, root19
GuiControl, Enable, refresh19
}
}
}
return
}
openshare19(ByRef URL, ByRef Location, i := 0)
{
Global BDCLND
Global uk
Global timestamp
Global shareid
Global sign
if ( encrypt = 1 && i = 0 )
{
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
switch whr.Status
{
case 200:
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.GetResponseHeader("Set-Cookie"), "(?<=BDCLND=)[^;]+", BDCLND)
RegExMatch(whr.ResponseText, "(?<=""uk"":)\d+", uk)
RegExMatch(whr.ResponseText, "(?<=""timestamp"":)\d+", timestamp)
RegExMatch(whr.ResponseText, "(?<=""shareid"":)\d+", shareid)
RegExMatch(whr.ResponseText, "(?<=""sign"":"")[^""]+", sign)
}
else
{
RegExMatch(whr.ResponseText, "(?<=""errortype"":)-?\d+", errortype)
switch errortype
{
case 0:
MsgBox, 16, 错误:o, 分享的项目不存在。
case 1, 10:
MsgBox, 16, 错误:o, 该分享已失效。
case 3:
MsgBox, 16, 错误:o, 拒绝访问。请用浏览器打开此链接以查看原因。
default:
MsgBox, 16, 错误:o, errortype: %errortype%
}
}
return, errno
case 302:
Location := whr.GetResponseHeader("Location")
if ( Location != "/error/404.html" )
{
return, "encrypted"
}
else
{
MsgBox, 16, 错误:o, HTTP 错误 404 - 文件或目录未找到。请检查拼写并重试。
}
case 404:
MsgBox, 16, 错误:o, HTTP 错误 404 - 文件或目录未找到。请检查拼写并重试。
default:
MsgBox, 16, 错误:o, % "HTTP 状态代码: " . whr.Status
}
}
Catch
{
return, openshare19(URL, Location, 1)
}
}
else
{
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe -H User-Agent: -i --noproxy * -s -o Temp\~t %URL%,, Hide
if ( ErrorLevel = 0 )
{
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
FileDelete, Temp\~t
RegExMatch(r, "\d{3}", code)
switch code
{
case 200:
RegExMatch(r, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(r, "(?<=BDCLND=)[^;]+", BDCLND)
RegExMatch(r, "(?<=""uk"":)\d+", uk)
RegExMatch(r, "(?<=""timestamp"":)\d+", timestamp)
RegExMatch(r, "(?<=""shareid"":)\d+", shareid)
RegExMatch(r, "(?<=""sign"":"")[^""]+", sign)
}
else
{
RegExMatch(r, "(?<=""errortype"":)-?\d+", errortype)
switch errortype
{
case 0:
MsgBox, 16, 错误:o, 分享的项目不存在。
case 1, 10:
MsgBox, 16, 错误:o, 该分享已失效。
case 3:
MsgBox, 16, 错误:o, 拒绝访问。请用浏览器打开此链接以查看原因。
default:
MsgBox, 16, 错误:o, errortype: %errortype%
}
}
return, errno
case 302:
RegExMatch(r, "(?<=Location: )[^\n]+", Location)
if ( Location != "/error/404.html" )
{
return, "encrypted"
}
else
{
MsgBox, 16, 错误:o, HTTP 错误 404 - 文件或目录未找到。请检查拼写并重试。
}
case 404:
MsgBox, 16, 错误:o, HTTP 错误 404 - 文件或目录未找到。请检查拼写并重试。
default:
MsgBox, 16, 错误:o, % "HTTP 状态代码: " . code
}
}
else
{
FileDelete, Temp\~t
MsgBox, 16, %A_ScriptDir%\Temp\~t, 读取文件 '%A_ScriptDir%\Temp\~t' 时出错。
}
}
else
{
MsgBox, 16, 错误:curl, 出现意外错误。
}
}
return
}
openshare19302(ByRef URL, i := 0)
{
Global BDCLND
Global uk
Global timestamp
Global shareid
Global sign
if ( encrypt = 1 && i = 0 )
{
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", "BDCLND=" . BDCLND)
whr.Send()
whr.WaitForResponse()
switch whr.Status
{
case 200:
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=""uk"":)\d+", uk)
RegExMatch(whr.ResponseText, "(?<=""timestamp"":)\d+", timestamp)
RegExMatch(whr.ResponseText, "(?<=""shareid"":)\d+", shareid)
RegExMatch(whr.ResponseText, "(?<=""sign"":"")[^""]+", sign)
}
else
{
MsgBox, 16, 错误:o, 出现意外错误。
}
return, errno
case 302:
if ( whr.GetResponseHeader("Location") = "/error/404.html" )
{
MsgBox, 16, 错误:o, HTTP 错误 404 - 文件或目录未找到。请检查拼写并重试。
}
else
{
MsgBox, 16, 错误:o, 出现意外错误。
}
case 404:
MsgBox, 16, 错误:o, HTTP 错误 404 - 文件或目录未找到。请检查拼写并重试。
default:
MsgBox, 16, 错误:o, % "HTTP 状态代码: " . whr.Status
}
}
Catch
{
return, openshare19302(URL, 1)
}
}
else
{
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe -H User-Agent: -b BDCLND=%BDCLND% -i --noproxy * -s -o Temp\~t %URL%,, Hide
if ( ErrorLevel = 0 )
{
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
FileDelete, Temp\~t
RegExMatch(r, "\d{3}", code)
switch code
{
case 200:
RegExMatch(r, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(r, "(?<=""uk"":)\d+", uk)
RegExMatch(r, "(?<=""timestamp"":)\d+", timestamp)
RegExMatch(r, "(?<=""shareid"":)\d+", shareid)
RegExMatch(r, "(?<=""sign"":"")[^""]+", sign)
}
else
{
MsgBox, 16, 错误:o, 出现意外错误。
}
return, errno
case 302:
RegExMatch(r, "(?<=Location: )[^\n]+", Location)
if ( Location = "/error/404.html" )
{
MsgBox, 16, 错误:o, HTTP 错误 404 - 文件或目录未找到。请检查拼写并重试。
}
else
{
MsgBox, 16, 错误:o, 出现意外错误。
}
case 404:
MsgBox, 16, 错误:o, HTTP 错误 404 - 文件或目录未找到。请检查拼写并重试。
default:
MsgBox, 16, 错误:o, % "HTTP 状态代码: " . code
}
}
else
{
FileDelete, Temp\~t
MsgBox, 16, %A_ScriptDir%\Temp\~t, 读取文件 '%A_ScriptDir%\Temp\~t' 时出错。
}
}
else
{
MsgBox, 16, 错误:curl, 出现意外错误。
}
}
return
}
inputpwd:
Gui, 19:+Disabled
Gui, 23:Default
Gui, +Owner19 +Hwndgui23hwnd
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 请输入提取码:
Gui, Add, Edit, x10 y+5 h22 w100 vpwd
Gui, Add, Text, x+5 y+-17 w200 cRed vinfo
Gui, Add, Button, x225 y+30 w80 Default gconfirm23, 确定
Gui, Add, Button, x+5 w80 gcancel23, 取消
Gui, Show, h107 w400, 请输入提取码
GuiControl, Focus, pwd
WinWaitClose ahk_id %gui23hwnd%
return
23GuiClose:
cancel23:
Gui, 19:-Disabled
Gui, Destroy
return
confirm23:
Gui, Submit, NoHide
if ( pwd != "" )
{
Gui, 19:-Disabled
Gui, Destroy
}
else
{
GuiControl,, info, 此信息为必填项
}
return
opensharelistroot19()
{
Global uk
Global shareid
Global BDCLND
Global root19
Global currentpath19
URL := encrypt = 1 ? "https://pan.baidu.com/share/list?uk=" . uk . "&shareid=" . shareid . "&root=1" : "http://pan.baidu.com/share/list?uk=" . uk . "&shareid=" . shareid . "&root=1"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", "BDCLND=" . BDCLND)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
LV_Delete()
RegExMatch(whr.ResponseText, "(?<=\[).+(?=])", list)
if ( root19 = "" )
{
RegExMatch(list, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := RegExReplace(path, "/[^/]+$")
if ( path = "" )
{
root19 := "/"
}
else
{
root19 := UnicodeDec(path)
}
}
currentpath19 := root19
GuiControl,, currentpath19, % root19
list := StrSplit(list, ",{""")
GuiControl, -Redraw, shared19
for key, value in list
{
RegExMatch(value, "(?<=fs_id"":"")\d+", fs_id)
RegExMatch(value, "(?<=isdir"":"")\d", isdir)
RegExMatch(value, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
RegExMatch(value, "(?<=server_filename"":"")[^""]+", server_filename)
server_filename := UnicodeDec(server_filename)
RegExMatch(value, "(?<=server_mtime"":"")\d+", mtime)
server_mtime := 1970010108
server_mtime += mtime, s
FormatTime, server_mtime, % server_mtime, yyyy/M/d H:mm:ss
if ( isdir = 1 )
{
LV_Add("icon10", server_filename, server_mtime, "文件夹",,, path,, fs_id)
}
else
{
RegExMatch(value, "(?<=md5"":"")[^""]+", md5)
RegExMatch(value, "(?<=size"":"")\d+", size)
sizeKB := size // 1024
sizeKB := sizeKB != 0 ? RegExReplace(sizeKB, "\d(?=(\d{3})+$)", "$0,") . " KB" : "1 KB"
RegExMatch(server_filename, "\.[^\.]+$", ext)
ext := Format("{:L}", ext)
type := ext = "" ? "文件" : type(ext, index)
LV_Add(ext = "" ? "icon2" : "icon" . index, server_filename, server_mtime, type, sizeKB, size, path, ext, fs_id, md5)
}
}
GuiControl, +Redraw, shared19
}
else
{
MsgBox, 16, 错误:list, 错误代码: %errno%
}
return, errno
}
Catch
{
MsgBox, 16, 错误:list, 出现意外错误。
}
return
}
up19:
Gui +OwnDialogs
proxy()
if ( currentpath19 != root19 )
{
path := RegexReplace(currentpath19, "/[^/]+$")
if ( path = root19 || path = "" )
{
opensharelistroot19()
}
else
{
openpath(path)
}
}
return
root19:
Gui +OwnDialogs
proxy()
opensharelistroot19()
return
refresh19:
Gui +OwnDialogs
proxy()
if ( currentpath19 = root19 )
{
opensharelistroot19()
}
else
{
openpath(currentpath19)
}
return
19GuiContextMenu:
if ( A_GuiControl = "shared19" && A_GuiEvent = "RightClick" )
{
rownumber := LV_GetNext()
if ( rownumber != 0 )
{
focused := LV_GetNext(, "F")
LV_GetText(type, focused, 3)
if ( type = "文件夹" )
{
if ( available = 0 )
{
Menu, SharedContextMenuFolder19, Disable, 下载(&W)
Menu, SharedContextMenuFolder19, Disable, 备用下载(&A)
}
if ( loginstate = 1 )
{
Menu, SharedContextMenuFolder19, Enable, 保存(&S)
}
else
{
Menu, SharedContextMenuFolder19, Disable, 保存(&S)
}
Menu, SharedContextMenuFolder19, Show
}
else if ( LV_GetCount("S") = 1 )
{
if ( available = 0 )
{
Menu, SharedContextMenuFile19, Disable, 下载(&W)
Menu, SharedContextMenuFile19, Disable, 备用下载(&A)
}
if ( loginstate = 1 )
{
Menu, SharedContextMenuFile19, Enable, 保存(&S)
}
else
{
Menu, SharedContextMenuFile19, Disable, 保存(&S)
}
Menu, SharedContextMenuFile19, Show
}
else
{
if ( available = 0 )
{
Menu, SharedContextMenuFile192, Disable, 下载(&W)
Menu, SharedContextMenuFile192, Disable, 备用下载(&A)
}
if ( loginstate = 1 )
{
Menu, SharedContextMenuFile192, Enable, 保存(&S)
}
else
{
Menu, SharedContextMenuFile192, Disable, 保存(&S)
}
Menu, SharedContextMenuFile192, Show
}
}
else if ( refresh19 = 1 )
{
Menu, SharedContextMenuBlankArea19, Show
}
}
return
SharedContextMenuOpen19()
{
Gui, 19:Default
Gui +OwnDialogs
LV_GetText(path, focused, 6)
openpath(path)
return
}
openpath(ByRef path2, page := 1)
{
Global uk
Global shareid
Global BDCLND
Global currentpath19
Encodepath := UrlEncode(path2)
URL := encrypt = 1 ? "https://pan.baidu.com/share/list?uk=" . uk . "&shareid=" . shareid . "&dir=" . Encodepath . "&page=" . page : "http://pan.baidu.com/share/list?uk=" . uk . "&shareid=" . shareid . "&dir=" . Encodepath . "&page=" . page
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", "BDCLND=" . BDCLND)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
if ( page = 1 )
{
LV_Delete()
currentpath19 := path2
GuiControl,, currentpath19, % path2
GuiControl, -Redraw, shared19
}
RegExMatch(whr.ResponseText, "(?<=\[).+(?=])", list)
if ( list != "" )
{
list := StrSplit(list, ",{""")
for key, value in list
{
RegExMatch(value, "(?<=fs_id"":)\d+", fs_id)
RegExMatch(value, "(?<=isdir"":)\d", isdir)
RegExMatch(value, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
RegExMatch(value, "(?<=server_filename"":"")[^""]+", server_filename)
server_filename := UnicodeDec(server_filename)
RegExMatch(value, "(?<=server_mtime"":)\d+", mtime)
server_mtime := 1970010108
server_mtime += mtime, s
FormatTime, server_mtime, % server_mtime, yyyy/M/d H:mm:ss
if ( isdir = 1 )
{
LV_Add("icon10", server_filename, server_mtime, "文件夹",,, path,, fs_id)
}
else
{
RegExMatch(value, "(?<=md5"":"")[^""]+", md5)
RegExMatch(value, "(?<=size"":)\d+", size)
sizeKB := size // 1024
sizeKB := sizeKB != 0 ? RegExReplace(sizeKB, "\d(?=(\d{3})+$)", "$0,") . " KB" : "1 KB"
RegExMatch(server_filename, "\.[^\.]+$", ext)
ext := Format("{:L}", ext)
type := ext = "" ? "文件" : type(ext, index)
LV_Add(ext = "" ? "icon2" : "icon" . index, server_filename, server_mtime, type, sizeKB, size, path, ext, fs_id, md5)
}
}
if ( list.Length() = 100 )
{
openpath(path2, ++page)
}
else
{
GuiControl, +Redraw, shared19
}
}
else
{
GuiControl, +Redraw, shared19
}
}
else
{
MsgBox, 16, 错误:list, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:list, 出现意外错误。
}
return
}
SharedContextMenuSave19()
{
Gui, 19:Default
Gui +OwnDialogs
Global uk
Global user_id
Global shareid
Global Cookie
Global BDCLND
Global URL
if ( uk = user_id )
{
MsgBox, 16, 错误:transfer, 不能保存自己分享的文件。
return
}
URL2 := encrypt = 1 ? "https://pan.baidu.com/share/transfer?shareid=" . shareid . "&from=" . uk : "http://pan.baidu.com/share/transfer?shareid=" . shareid . "&from=" . uk
i := rownumber - 1
Loop
{
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(fs_id, i, 8)
fsidlist .= fs_id . "%2C"
}
fsidlist := RegExReplace(fsidlist, "%2C$")
path := UrlEncode(currentpath)
Body := "fsidlist=%5B" . fsidlist . "%5D" . "&path=" . path
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL2, true)
whr.SetRequestHeader("Cookie", Cookie . "; BDCLND=" . BDCLND)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
whr.SetRequestHeader("Referer", URL)
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno != 0 )
{
if ( errno = 12 )
{
RegExMatch(whr.ResponseText, "(?<=\[).+(?=])", info)
info := StrSplit(info, ",{""")
for key, value in info
{
RegExMatch(value, "(?<=errno"":)-?\d+", errno)
if ( errno != 0 )
{
switch errno
{
case -30:
MsgBox, 16, 错误:transfer, 目标已包含同名文件。
case -32:
MsgBox, 16, 错误:transfer, 空间不足。
case 120:
MsgBox, 16, 错误:transfer, 已超过保存的最大允许数量。
default:
MsgBox, 16, 错误:transfer, 错误代码: 12: %errno%
}
return
}
}
}
else
{
MsgBox, 16, 错误:transfer, 错误代码: %errno%
}
}
}
Catch
{
MsgBox, 16, 错误:transfer, 出现意外错误。
}
return
}
SharedContextMenuDownloadQueue19()
{
Global currentpath19
Global root19
SIGINT3 := 0
Global input := ""
r := rpc_status()
if ( r != 0 )
{
Gui +OwnDialogs
r := rpc_start()
if ( r != 0 )
{
return
}
}
Gosub, creating2
Gui +OwnDialogs
if ( currentpath19 = root19 )
{
isroot := 1
}
i := rownumber - 1
Gui, 19:Default
if ( isroot = 1 )
{
Loop
{
if ( SIGINT3 = 1 )
{
return
}
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(type, i, 3)
if ( type = "文件夹" )
{
isdir := 1
}
else
{
isfile := 1
}
}
}
if ( isroot = 1 && isdir = isfile = 1 )
{
Loop
{
if ( SIGINT3 = 1 )
{
return
}
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(type, i, 3)
if ( type = "文件夹" )
{
LV_GetText(path, i, 6)
FolderDownloadQueue19(path, fid_list2)
}
else
{
LV_GetText(fs_id, i, 8)
fid_list .= fs_id . "%2C"
}
}
fid_list := RegExReplace(fid_list, "%2C$")
errno := sharedownload2(fid_list, 12)
if ( errno = 0 && fid_list2 != "" )
{
fid_list2 := RegExReplace(fid_list2, "%2C$")
sharedownload2(fid_list2, 12)
}
}
else
{
Loop
{
if ( SIGINT3 = 1 )
{
return
}
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(type, i, 3)
if ( type = "文件夹" )
{
LV_GetText(path, i, 6)
FolderDownloadQueue19(path, fid_list)
}
else
{
LV_GetText(fs_id, i, 8)
fid_list .= fs_id . "%2C"
}
}
fid_list := RegExReplace(fid_list, "%2C$")
sharedownload2(fid_list, 12)
}
Gui, 19:-Disabled
Gui, 13:Destroy
return
}
FolderDownloadQueue19(path2, ByRef fid_list, page := 1)
{
Global uk
Global shareid
Global BDCLND
Encodepath := UrlEncode(path2)
URL := encrypt = 1 ? "https://pan.baidu.com/share/list?uk=" . uk . "&shareid=" . shareid . "&dir=" . Encodepath . "&page=" . page : "http://pan.baidu.com/share/list?uk=" . uk . "&shareid=" . shareid . "&dir=" . Encodepath . "&page=" . page
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", "BDCLND=" . BDCLND)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=\[).+(?=])", list)
if ( list != "" )
{
list := StrSplit(list, ",{""")
for key, value in list
{
if ( SIGINT3 = 1 )
{
return
}
RegExMatch(value, "(?<=isdir"":)\d", isdir)
if ( isdir = 1 )
{
RegExMatch(value, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
FolderDownloadQueue19(path, fid_list)
}
else
{
RegExMatch(value, "(?<=fs_id"":)\d+", fs_id)
fid_list .= fs_id . "%2C"
}
}
if ( list.Length() = 100 )
{
FolderDownloadQueue19(path2, fid_list, ++page)
}
}
}
else
{
MsgBox, 16, 错误:list, 错误代码: %errno%
}
}
Catch
{
MsgBox, 16, 错误:list, 出现意外错误。
}
return
}
sharedownload2(ByRef fid_list, clienttype := 0, backup := 0)
{
proxy()
Global sign
Global timestamp
Global BDCLND
Global uk
Global shareid
Global input
Global vcode
Global currentpath19
URL := encrypt = 1 ? "https://pan.baidu.com/api/sharedownload?sign=" . sign . "&timestamp=" . timestamp . "&clienttype=" . clienttype : "http://pan.baidu.com/api/sharedownload?sign=" . sign . "&timestamp=" . timestamp . "&clienttype=" . clienttype
Body := "encrypt=0&extra=%7B%22sekey%22%3A%22" . BDCLND . "%22%7D&product=share&uk=" . uk . "&primaryid=" . shareid . "&fid_list=%5B" . fid_list . "%5D" . ( input = "" ? "" : "&vcode_input=" . input . "&vcode_str=" . vcode )
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("Cookie", Cookie2)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
switch errno
{
case 0:
RegExMatch(whr.ResponseText, "(?<=\[).+(?=])", list)
list := StrSplit(list, ",{""")
for key, value in list
{
if ( SIGINT3 = 1 )
{
return
}
RegExMatch(value, "(?<=path"":"")[^""]+", path)
path := StrReplace(path, "\/", "/")
path := UnicodeDec(path)
RegExMatch(value, "(?<=server_filename"":"")[^""]+", server_filename)
server_filename := UnicodeDec(server_filename)
RegExMatch(value, "(?<=dlink"":"")[^""]+", dlink)
dlink := StrReplace(dlink, "\")
if ( currentpath19 = "/" )
{
path := RegExReplace(path, "^/")
}
else
{
t := RegExReplace(currentpath19, "\.", "\.")
t := RegExReplace(t, "\+", "\+")
t := RegExReplace(t, "\[", "\[")
t := RegExReplace(t, "\{", "\{")
t := RegExReplace(t, "\(", "\(")
t := RegExReplace(t, "\)", "\)")
t := RegExReplace(t, "\^", "\^")
t := RegExReplace(t, "\$", "\$")
path := RegExReplace(path, "^" . t . "/")
}
if ( path = server_filename )
{
dir := ""
}
else
{
t := RegExReplace(server_filename, "\.", "\.")
t := RegExReplace(t, "\+", "\+")
t := RegExReplace(t, "\[", "\[")
t := RegExReplace(t, "\{", "\{")
t := RegExReplace(t, "\(", "\(")
t := RegExReplace(t, "\)", "\)")
t := RegExReplace(t, "\^", "\^")
t := RegExReplace(t, "\$", "\$")
path := RegExReplace(path, "/" . t . "$")
dir := StrReplace(path, "/", "\")
}
if ( backup = 0 )
{
error_code := d6(dlink, Location)
if ( error_code = 302 )
{
dir := ( dir = "" ? downloadlocation : downloadlocation . "\" . dir )
dir := StrReplace(dir, "\", "\\")
add19(Location, server_filename, dir)
}
}
else
{
RegExMatch(value, "(?<=size"":)\d+", size)
if ( size > 52428800 )
{
RegExMatch(dlink, "(?<=file/).+", path)
path := StrReplace(path, "?", "&")
d4(path, server_filename, dir)
}
else
{
d8(dlink, server_filename, dir)
}
}
}
case -20:
input := ""
error := getvcode()
if ( error = 0 )
{
Gosub, getvcode2
if ( input != "" )
{
return, sharedownload2(fid_list, clienttype, backup)
}
}
case 112:
MsgBox, 16, 错误:d, 会话已过期。尝试重新打开该地址。
default:
MsgBox, 16, 错误:d, 错误代码: %errno%
}
return, errno
}
Catch
{
MsgBox, 16, 错误:d, 出现意外错误。
}
return
}
d6(ByRef URL, ByRef Location)
{
URL := encrypt = 1 ? URL : StrReplace(URL, "https:", "http:")
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "LogStatistic")
whr.SetRequestHeader("Cookie", Cookie2)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""error_code"":)-?\d+", error_code)
if ( error_code = 302 )
{
Location := whr.GetResponseHeader("Location")
}
else
{
RegExMatch(whr.ResponseText, "(?<=""error_msg"":"")[^""]+", error_msg)
MsgBox, 16, 错误, %error_msg%。错误代码: %error_code%
}
return, error_code
}
Catch
{
MsgBox, 16, 错误:d, 出现意外错误。
}
return
}
creating2:
Gui, 19:+Disabled
Gui, 13:Default
Gui, +Owner19
Gui, Margin, 0, 0
Gui, Add, Text, x10 y10, 正在创建下载队列任务...
Gui, Add, Button, x310 y+40 w80 Default gcancel13, 取消
Gui, Show, h95 w400, 正在创建下载队列任务
return
13GuiClose:
cancel13:
SIGINT3 := 1
Gui, 19:-Disabled
Gui, 13:Destroy
return
getvcode2:
Gui, 13:+Disabled
Gui, 21:Default
Gui, +Owner13 +Hwndgui21hwnd
Gui, Margin, 0, 0
Gui, Add, Picture, x10 y10 w120 h40 vgenimage, Temp\genimage.jpg
FileDelete, Temp\genimage.jpg
Gui, Add, Button, x+5 y+-23 grefresh10, 刷新
Gui, Add, Text, x10 y+10, 请输入验证码:
Gui, Add, Edit, x10 y+5 h22 w100 vinput
Gui, Add, Text, x+5 y+-17 w200 cRed vinfo
Gui, Add, Button, x225 y+20 w80 Default gconfirm21, 确定
Gui, Add, Button, x+5 w80 gcancel21, 取消
Gui, Show, h147 w400, 请输入验证码
GuiControl, Focus, input
WinWaitClose ahk_id %gui21hwnd%
return
21GuiClose:
cancel21:
Gui, 13:-Disabled
Gui, Destroy
return
confirm21:
Gui, Submit, NoHide
if ( input != "" )
{
Gui, 13:-Disabled
Gui, Destroy
}
else
{
GuiControl,, info, 此信息为必填项
}
return
SharedContextMenuDownloadQueue192()
{
Global currentpath19
Global root19
SIGINT3 := 0
Global input := ""
Gosub, creating2
Gui +OwnDialogs
if ( currentpath19 = root19 )
{
isroot := 1
}
i := rownumber - 1
Gui, 19:Default
if ( isroot = 1 )
{
Loop
{
if ( SIGINT3 = 1 )
{
return
}
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(type, i, 3)
if ( type = "文件夹" )
{
isdir := 1
}
else
{
isfile := 1
}
}
}
if ( isroot = 1 && isdir = isfile = 1 )
{
Loop
{
if ( SIGINT3 = 1 )
{
return
}
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(type, i, 3)
if ( type = "文件夹" )
{
LV_GetText(path, i, 6)
FolderDownloadQueue19(path, fid_list2)
}
else
{
LV_GetText(fs_id, i, 8)
fid_list .= fs_id . "%2C"
}
}
fid_list := RegExReplace(fid_list, "%2C$")
errno := sharedownload2(fid_list,, 1)
if ( errno = 0 && fid_list2 != "" )
{
fid_list2 := RegExReplace(fid_list2, "%2C$")
errno := sharedownload2(fid_list2,, 1)
}
}
else
{
Loop
{
if ( SIGINT3 = 1 )
{
return
}
i := LV_GetNext(i)
if ( i = 0 )
{
break
}
LV_GetText(type, i, 3)
if ( type = "文件夹" )
{
LV_GetText(path, i, 6)
FolderDownloadQueue19(path, fid_list)
}
else
{
LV_GetText(fs_id, i, 8)
fid_list .= fs_id . "%2C"
}
}
fid_list := RegExReplace(fid_list, "%2C$")
errno := sharedownload2(fid_list,, 1)
}
if ( errno = 0 )
{
Run, cmd.exe /Q /K cd /d "%A_ScriptDir%" && for /F "tokens=*" `%i in ('type Temp\~d') do saldl\saldl.exe -CC -r -s%chunksize% -c%connections2% -R%connectionmaxrate% --skip-TLS-verification `%i,, UseErrorLevel, PID
if ( ErrorLevel = 0 )
{
Gui, 1:Default
Gui, ListView, download
LV_Add("icon11", "队列任务",,,, PID)
Sleep, 3000
FileDelete, Temp\~d
}
else
{
MsgBox, 16, %A_ScriptDir%\saldl\saldl.exe, 启动 %A_ScriptDir%\saldl\saldl.exe 时出现意外错误。
}
}
Gui, 19:-Disabled
Gui, 13:Destroy
return
}
d4(ByRef path, ByRef server_filename, ByRef dir)
{
URL := encrypt = 1 ? "https://d.pcs.baidu.com/rest/2.0/pcs/file?app_id=250528&method=locatedownload&check_blue=1&es=1&esl=1&path=" . path . "&ver=4.0&dtype=1&err_ver=1.0&ehps=0&clienttype=8&channel=00000000000000000000000000000000" . Body2 . "&vip=2" : "http://d.pcs.baidu.com/rest/2.0/pcs/file?app_id=250528&method=locatedownload&check_blue=1&es=1&esl=1&path=" . path . "&ver=4.0&dtype=1&err_ver=1.0&ehps=0&clienttype=8&channel=00000000000000000000000000000000" . Body2 . "&vip=2"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("User-Agent", useragent2)
whr.SetRequestHeader("Cookie", Cookie2)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
whr.Send(" ")
whr.WaitForResponse()
if ( RegExMatch(whr.ResponseText, "(?<=""error_code"":)-?\d+", error_code) != 0 )
{
RegExMatch(whr.ResponseText, "(?<=""error_msg"":"")[^""]+", error_msg)
MsgBox, 16, 错误:file, %error_msg%。错误代码: %error_code%
return
}
RegExMatch(whr.ResponseText, "(?<=\[)[^]]+", urls)
urls := StrSplit(urls, ",{")
for key, value in urls
{
RegExMatch(value, """http[^""]+""", t)
dlink .= " --mirror-url " . t . "`n"
}
Sort, dlink, Random
dlink := StrReplace(dlink, "`n")
RegExMatch(dlink, "([^""]+""[^""]+""){1,4}", dlink)
dlink := RegExReplace(dlink, "^ --mirror-url ")
if ( dir = "" )
{
FileAppend, -o"%server_filename%" -D"%downloadlocation%" -u%useragent2% %dlink%`r`n, Temp\~d, UTF-16
}
else
{
if ( InStr(FileExist("%downloadlocation%\%dir%"), "D") = 0 )
{
FileCreateDir, %downloadlocation%\%dir%
if ( ErrorLevel = 1 )
{
MsgBox, 16, %downloadlocation%\%dir%, 无法创建文件夹 '%downloadlocation%\%dir%'
return
}
}
FileAppend, -o"%server_filename%" -D"%downloadlocation%\%dir%" -u%useragent2% %dlink%`r`n, Temp\~d, UTF-16
}
if ( ErrorLevel = 1 )
{
MsgBox, 16, '%A_ScriptDir%\Temp\~d', 写入文件 '%A_ScriptDir%\Temp\~d' 时出错。
}
}
Catch
{
MsgBox, 16, 错误:file, 出现意外错误。
}
return
}
d8(ByRef URL, ByRef server_filename, ByRef dir)
{
URL := encrypt = 1 ? URL : StrReplace(URL, "https:", "http:")
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", useragent4)
whr.SetRequestHeader("Cookie", Cookie2)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""error_code"":)-?\d+", error_code)
if ( error_code = 302 )
{
dlink := whr.GetResponseHeader("Location")
if ( dir = "" )
{
FileAppend, -o"%server_filename%" -D"%downloadlocation%" -u"%useragent4%" "%dlink%"`r`n, Temp\~d, UTF-16
}
else
{
if ( InStr(FileExist("%downloadlocation%\%dir%"), "D") = 0 )
{
FileCreateDir, %downloadlocation%\%dir%
if ( ErrorLevel = 1 )
{
MsgBox, 16, %downloadlocation%\%dir%, 无法创建文件夹 '%downloadlocation%\%dir%'
return
}
}
FileAppend, -o"%server_filename%" -D"%downloadlocation%\%dir%" -u"%useragent4%" "%dlink%"`r`n, Temp\~d, UTF-16
}
if ( ErrorLevel = 1 )
{
MsgBox, 16, '%A_ScriptDir%\Temp\~d', 写入文件 '%A_ScriptDir%\Temp\~d' 时出错。
}
}
else
{
RegExMatch(whr.ResponseText, "(?<=""error_msg"":"")[^""]+", error_msg)
MsgBox, 16, 错误, %error_msg%。错误代码: %error_code%
}
}
Catch
{
MsgBox, 16, 错误:d, 出现意外错误。
}
return
}
SharedContextMenuDownload19()
{
Gui, 19:Default
Gui +OwnDialogs
r := rpc_status()
if ( r != 0 )
{
r := rpc_start()
if ( r != 0 )
{
return
}
}
Global input := ""
LV_GetText(server_filename, rownumber)
LV_GetText(fs_id, rownumber, 8)
errno := sharedownload(fs_id, dlink, 12)
if ( errno = 0 )
{
error_code := d5(dlink, Location)
if ( error_code = 302 )
{
dir := StrReplace(downloadlocation, "\", "\\")
add19(Location, server_filename, dir)
}
}
return
}
sharedownload(ByRef fs_id, ByRef dlink, clienttype := 0)
{
proxy()
Global sign
Global timestamp
Global BDCLND
Global uk
Global shareid
Global input
Global vcode
URL := encrypt = 1 ? "https://pan.baidu.com/api/sharedownload?sign=" . sign . "&timestamp=" . timestamp . "&clienttype=" . clienttype : "http://pan.baidu.com/api/sharedownload?sign=" . sign . "&timestamp=" . timestamp . "&clienttype=" . clienttype
Body := "encrypt=0&extra=%7B%22sekey%22%3A%22" . BDCLND . "%22%7D&product=share&uk=" . uk . "&primaryid=" . shareid . "&fid_list=%5B" . fs_id . "%5D" . ( input = "" ? "" : "&vcode_input=" . input . "&vcode_str=" . vcode )
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("Cookie", Cookie2)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
switch errno
{
case 0:
RegExMatch(whr.ResponseText, "(?<=""dlink"":"")[^""]+", dlink)
dlink := StrReplace(dlink, "\")
case -20:
input := ""
error := getvcode()
if ( error = 0 )
{
Gosub, getvcode
if ( input != "" )
{
return, sharedownload(fs_id, dlink, clienttype)
}
}
case 112:
MsgBox, 16, 错误:d, 会话已过期。尝试重新打开该地址。
default:
MsgBox, 16, 错误:d, 错误代码: %errno%
}
return, errno
}
Catch
{
MsgBox, 16, 错误:d, 出现意外错误。
}
return
}
d5(ByRef URL, ByRef Location)
{
URL := encrypt = 1 ? URL : StrReplace(URL, "https:", "http:")
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "LogStatistic")
whr.SetRequestHeader("Cookie", Cookie2)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""error_code"":)-?\d+", error_code)
if ( error_code = 302 )
{
Location := whr.GetResponseHeader("Location")
}
else
{
RegExMatch(whr.ResponseText, "(?<=""error_msg"":"")[^""]+", error_msg)
MsgBox, 16, 错误, %error_msg%。错误代码: %error_code%
}
return, error_code
}
Catch
{
MsgBox, 16, 错误:d, 出现意外错误。
}
return
}
add19(ByRef Location, ByRef server_filename, ByRef dir)
{
URL := "http://127.0.0.1:6800/jsonrpc"
Body := "{""jsonrpc"":""2.0"",""id"":" . ++id . ",""method"":""aria2.addUri"",""params"":[[""" . Location . """],{""dir"":""" . dir  . """,""max-connection-per-server"":""" . maxconnection2 . """,""split"":""" . split2 . """,""user-agent"":""LogStatistic"",""out"":""" . server_filename . """}]}"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Open("POST", URL, true)
whr.Send(Body)
whr.WaitForResponse()
}
return
}
getvcode()
{
Gui +OwnDialogs
Global vcode
URL := encrypt = 1 ? "https://pan.baidu.com/api/getvcode?prod=pan" : "http://pan.baidu.com/api/getvcode?prod=pan"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=""vcode"":"")[^""]+", vcode)
img := "https://pan.baidu.com/genimage?" . vcode
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe -H User-Agent: --noproxy * -s -o Temp\genimage.jpg %img%,, Hide
if ( ErrorLevel != 0 )
{
MsgBox, 16, 错误:curl, 出现意外错误。
}
return, ErrorLevel
}
}
Catch
{
MsgBox, 16, 错误:getvcode, 出现意外错误。
}
return
}
getvcode:
Gui, 19:+Disabled
Gui, 10:Default
Gui, +Owner19 +Hwndgui10hwnd
Gui, Margin, 0, 0
Gui, Add, Picture, x10 y10 w120 h40 vgenimage, Temp\genimage.jpg
FileDelete, Temp\genimage.jpg
Gui, Add, Button, x+5 y+-23 grefresh10, 刷新
Gui, Add, Text, x10 y+10, 请输入验证码:
Gui, Add, Edit, x10 y+5 h22 w100 vinput
Gui, Add, Text, x+5 y+-17 w200 cRed vinfo
Gui, Add, Button, x225 y+20 w80 Default gconfirm10, 确定
Gui, Add, Button, x+5 w80 gcancel10, 取消
Gui, Show, h147 w400, 请输入验证码
GuiControl, Focus, input
WinWaitClose ahk_id %gui10hwnd%
return
10GuiClose:
cancel10:
Gui, 19:-Disabled
Gui, Destroy
return
refresh10()
{
error := getvcode()
if ( error = 0 )
{
GuiControl,, genimage, Temp\genimage.jpg
FileDelete, Temp\genimage.jpg
}
return
}
confirm10:
Gui, Submit, NoHide
if ( input != "" )
{
Gui, 19:-Disabled
Gui, Destroy
}
else
{
GuiControl,, info, 此信息为必填项
}
return
SharedContextMenuDownload192()
{
Gui, 19:Default
Gui +OwnDialogs
Global input := ""
LV_GetText(server_filename, rownumber)
LV_GetText(sizeKB, rownumber, 4)
LV_GetText(size, rownumber, 5)
LV_GetText(ext, rownumber, 7)
LV_GetText(fs_id, rownumber, 8)
LV_GetText(md5, rownumber, 9)
if ( ext != "文件" )
{
type(ext, index)
}
else
{
index := 4
}
errno := sharedownload(fs_id, dlink)
if ( errno = 0 )
{
if ( size > 52428800 )
{
RegExMatch(dlink, "(?<=file/).+", path)
path := StrReplace(path, "?", "&")
d3(path, index, server_filename, sizeKB, md5)
}
else
{
d7(dlink, index, server_filename, sizeKB, md5)
}
}
return
}
d3(ByRef path, ByRef index, ByRef server_filename, ByRef sizeKB, ByRef md5)
{
URL := encrypt = 1 ? "https://d.pcs.baidu.com/rest/2.0/pcs/file?app_id=250528&method=locatedownload&check_blue=1&es=1&esl=1&path=" . path . "&ver=4.0&dtype=1&err_ver=1.0&ehps=0&clienttype=8&channel=00000000000000000000000000000000" . Body2 . "&vip=2" : "http://d.pcs.baidu.com/rest/2.0/pcs/file?app_id=250528&method=locatedownload&check_blue=1&es=1&esl=1&path=" . path . "&ver=4.0&dtype=1&err_ver=1.0&ehps=0&clienttype=8&channel=00000000000000000000000000000000" . Body2 . "&vip=2"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("User-Agent", useragent2)
whr.SetRequestHeader("Cookie", Cookie2)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
whr.Send(" ")
whr.WaitForResponse()
if ( RegExMatch(whr.ResponseText, "(?<=""error_code"":)-?\d+", error_code) != 0 )
{
RegExMatch(whr.ResponseText, "(?<=""error_msg"":"")[^""]+", error_msg)
MsgBox, 16, 错误:file, %error_msg%。错误代码: %error_code%
return
}
RegExMatch(whr.ResponseText, "(?<=\[)[^]]+", urls)
urls := StrSplit(urls, ",{")
for key, value in urls
{
RegExMatch(value, """http[^""]+""", t)
dlink .= " --mirror-url " . t . "`n"
}
Sort, dlink, Random
dlink := StrReplace(dlink, "`n")
RegExMatch(dlink, "([^""]+""[^""]+""){1,4}", dlink)
dlink := RegExReplace(dlink, "^ --mirror-url ")
Run, cmd.exe /K cd /d "%A_ScriptDir%" && saldl\saldl.exe -CC -r -s%chunksize% -c%connections2% -o"%server_filename%" -D"%downloadlocation%" -R%connectionmaxrate% --skip-TLS-verification -u%useragent2% %dlink%,, UseErrorLevel, PID
if ( ErrorLevel = 0 )
{
Gui, 1:Default
Gui, ListView, download
LV_Add("icon" . index, server_filename, sizeKB,, md5, PID)
}
else
{
MsgBox, 16, %A_ScriptDir%\saldl\saldl.exe, 启动 %A_ScriptDir%\saldl\saldl.exe 时出现意外错误。
}
}
Catch
{
MsgBox, 16, 错误:file, 出现意外错误。
}
return
}
d7(ByRef URL, ByRef index, ByRef server_filename, ByRef sizeKB, ByRef md5)
{
URL := encrypt = 1 ? URL : StrReplace(URL, "https:", "http:")
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", useragent4)
whr.SetRequestHeader("Cookie", Cookie2)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""error_code"":)-?\d+", error_code)
if ( error_code = 302 )
{
dlink := whr.GetResponseHeader("Location")
Run, cmd.exe /K cd /d "%A_ScriptDir%" && saldl\saldl.exe -CC -r -c%connections2% -o"%server_filename%" -D"%downloadlocation%" -R%connectionmaxrate% --skip-TLS-verification -u"%useragent4%" "%dlink%",, UseErrorLevel, PID
if ( ErrorLevel = 0 )
{
Gui, 1:Default
Gui, ListView, download
LV_Add("icon" . index, server_filename, sizeKB,, md5, PID)
}
else
{
MsgBox, 16, %A_ScriptDir%\saldl\saldl.exe, 启动 %A_ScriptDir%\saldl\saldl.exe 时出现意外错误。
}
}
else
{
RegExMatch(whr.ResponseText, "(?<=""error_msg"":"")[^""]+", error_msg)
MsgBox, 16, 错误, %error_msg%。错误代码: %error_code%
}
}
Catch
{
MsgBox, 16, 错误:d, 出现意外错误。
}
return
}
SharedContextMenuRefresh19:
Gui, 19:Default
Gui +OwnDialogs
proxy()
if ( currentpath19 = root19 )
{
opensharelistroot19()
}
else
{
openpath(currentpath19)
}
return
shared19:
Gui +OwnDialogs
if ( refresh19 = 1 && A_GuiEvent = "DoubleClick" )
{
LV_GetText(type, A_EventInfo, 3)
if ( type = "文件夹" )
{
LV_GetText(path, A_EventInfo, 6)
openpath(path)
}
}
return
#if ( WinActive("ahk_id" . gui19hwnd) )
{
^a::selectall19()
return
}
selectall19()
{
Gui, 19:Default
GuiControlGet, focus, FocusV
if ( focus = "shared19" )
{
GuiControl, -Redraw, shared19
Loop, % LV_GetCount()
{
LV_Modify(A_Index, "Select")
}
GuiControl, +Redraw, shared19
}
return
}
save:
if ( gui6hwnd != "" )
{
WinActivate, ahk_id %gui6hwnd%
return
}
Gui, 6:Default
Gui, +Resize +Hwndgui6hwnd
Gui, Margin, 0, 0
Gui, Add, Text, x5 y10, 地址:
Gui, Add, Text, x+5 w635 cBlue vstatus
Gui, Add, Edit, x0 y+5 h242 w690 -Wrap HScroll vlink
Gui, Add, Text, x10 y+10 vsaveto, 保存到:
Gui, Add, Edit, x+5 y+-17 h22 w623 vpath, % currentpath
Gui, Add, Button, x10 y+30 w80 gexample6 vexample, 示例...
Gui, Add, Button, x+425 w80 Default gsave6 vsave, 保存
Gui, Add, Button, x+5 w80 gclose6 vclose, 关闭
Gui, Show, h349, 保存
return
6GuiSize:
if ( A_EventInfo != 1 )
{
GuiControl, MoveDraw, status, % "w" A_GuiWidth - 55
GuiControl, MoveDraw, link, % "w" A_GuiWidth "h" A_GuiHeight - 107
GuiControl, MoveDraw, saveto, % "y" A_GuiHeight - 70
GuiControl, MoveDraw, path, % "y" A_GuiHeight - 75 "w" A_GuiWidth - 67
GuiControl, MoveDraw, example, % "y" A_GuiHeight - 33
GuiControl, MoveDraw, save, % "x" A_GuiWidth - 175 "y" A_GuiHeight - 33
GuiControl, MoveDraw, close, % "x" A_GuiWidth - 90 "y" A_GuiHeight - 33
}
return
6GuiClose:
close6:
SIGINT2 := 1
Gui6hwnd := ""
VarSetCapacity(link, 0)
Gui, Destroy
return
example6:
Gui +OwnDialogs
MsgBox,, 示例, https://XXX.XXXXX.XXX/X/XXXXXXXXXXXXXXXXXXXXXXX XXXX
return
save6()
{
Gui +OwnDialogs
Global link
Global path
Gui, Submit, NoHide
if ( link != "" )
{
if ( RegExMatch(path, "^/") = 0 )
{
MsgBox, 16, 错误, 路径必须以"/"开头。
return
}
if ( RegExMatch(path, "[\\:\*\?""<>\|]") != 0 )
{
MsgBox, 16, 错误, 路径不能包含下列任何字符:`r`n\ : * ? " < > |
return
}
if ( InStr(path, "//") != 0 )
{
MsgBox, 16, 错误, 找不到 "%path%"。请检查拼写并重试。
return
}
if ( path != "/" )
{
path := RTrim(path, " /")
GuiControl,, path, % path
errno := checkpath(path)
if ( errno != 0 )
{
return
}
}
link := RegExReplace(link, "m`n).*(?=https?:)")
link := RegExReplace(link, "(?<= )\n?\S+[:|：] ?")
link := RegExReplace(link, "m`n)\s\S{5,}$")
link := RegExReplace(link, "m`n)^\s+")
link := RegExReplace(link, "`n$")
link := StrReplace(link, "http:", "https:")
GuiControl,, link, % link
if ( FileExist("Logs") = "" )
{
FileCreateDir, Logs
if ( ErrorLevel = 1 )
{
MsgBox, 16, %A_ScriptDir%\Logs, 找不到文件夹 '%A_ScriptDir%\Logs'。请确定文件名是否正确后，再试一次。
return
}
}
if ( FileExist("Logs\Yixun.log") != "" )
{
FileGetSize, size, Logs\Yixun.log, K
if ( size > maxlogsize )
{
FileDelete, Logs\Yixun.log
Menu, Tools, Disable, 查看日志(&V)
Menu, Tools, Disable, 删除日志(&D)
}
}
save2()
}
return
}
checkpath(ByRef path)
{
Global Cookie
Encodepath := UrlEncode(path)
URL := encrypt = 1 ? "https://pan.baidu.com/api/list?dir=" . Encodepath : "http://pan.baidu.com/api/list?dir=" . Encodepath
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("User-Agent", "netdisk")
whr.SetRequestHeader("Cookie", Cookie)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno != 0 )
{
switch errno
{
case "":
MsgBox, 16, 错误:list, 出现意外错误。
case -9:
MsgBox, 16, 错误:list, 找不到 "%path%"。请检查拼写并重试。
default:
MsgBox, 16, 错误:list, 错误代码: %errno%
}
}
return, errno
}
return
}
save2()
{
Global link
SIGINT2 := 0
success := 0
failure := 0
Global input
Global user_id
FormatTime, Time, % A_Now, yyyy/M/d H:mm:ss
FileAppend, >>> %Time%`n, Logs\Yixun.log
if ( ErrorLevel = 0 )
{
Menu, Tools, Enable, 查看日志(&V)
Menu, Tools, Enable, 删除日志(&D)
}
else
{
MsgBox, 16, '%A_ScriptDir%\Logs\Yixun.log', 写入文件 '%A_ScriptDir%\Logs\Yixun.log' 时出错。
}
Loop, Parse, link, `n
{
if ( SIGINT2 = 1 )
{
FormatTime, Time, % A_Now, yyyy/M/d H:mm:ss
FileAppend,
			( LTrim
			% "操作已被用户取消
			共计 " . success + failure . " 个 , 成功 " . success . " 个 , 失败 " . failure . " 个
			<<< " . Time . "`n`n"
), Logs\Yixun.log
return
}
GuiControl,, status, % "正在保存第 " . 1 + success + failure . " 个 , 成功 " . success . " 个 , 失败 " . failure . " 个 ..."
if ( RegExMatch(A_LoopField, "^https://pan\.baidu\.com/s/[\S]+", URL) = 0 )
{
FileAppend, % "  " . A_LoopField . "        错误        未找到地址。请检查拼写并重试。`n", Logs\Yixun.log
++failure
continue
}
RegExMatch(A_LoopField, "(?<= )[0-9a-z]{4}", pwd)
r := openshare6(URL, uk, shareid, Location)
if ( r = "encrypted" )
{
if ( pwd = "" )
{
FileAppend, % "  " . URL . "        错误        缺少提取码`n", Logs\Yixun.log
++failure
continue
}
input := ""
errno := verify(Location, pwd)
if ( errno != 0 )
{
switch errno
{
case -9, -12:
FileAppend, % "  " . URL . " " . pwd . "        错误:verify        提取码错误`n", Logs\Yixun.log
case -62:
FileAppend, % "  " . URL . " " . pwd . "        信息:verify        操作已被用户取消`n", Logs\Yixun.log
case "":
FileAppend, % "  " . URL . " " . pwd . "        错误:verify        出现意外错误`n", Logs\Yixun.log
default:
FileAppend, % "  " . URL . " " . pwd . "        错误:verify        错误代码: " . errno . "`n", Logs\Yixun.log
}
++failure
continue
}
errno := openshare6302(URL, uk, shareid)
if ( errno != 0 )
{
switch errno
{
case "/error/404.html":
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:o        HTTP 错误 404 - 文件或目录未找到。请检查拼写并重试。`n", Logs\Yixun.log
case "":
FileAppend, % "  " . URL . " " . pwd . "        错误:o        出现意外错误`n", Logs\Yixun.log
default:
FileAppend, % "  " . URL . " " . pwd . "        错误:o        错误代码: " . errno . "`n", Logs\Yixun.log
}
++failure
continue
}
}
else if ( r != 0 )
{
if ( RegExMatch(r, "(?<=""errortype"":)-?\d+", errortype) != 0 )
{
switch errortype
{
case 0:
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:o        分享的项目不存在`n", Logs\Yixun.log
case 1, 10:
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:o        该分享已失效`n", Logs\Yixun.log
case 3:
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:o        拒绝访问`n", Logs\Yixun.log
default:
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:o        errortype: " . errortype . "`n", Logs\Yixun.log
}
}
else if ( r = "/error/404.html" )
{
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:o        HTTP 错误 404 - 文件或目录未找到。请检查拼写并重试。`n", Logs\Yixun.log
}
else if ( r = "" )
{
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:o        出现意外错误`n", Logs\Yixun.log
}
else
{
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:o        HTTP 状态代码: " . r . "`n", Logs\Yixun.log
}
++failure
continue
}
if ( uk = user_id )
{
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:o        不能保存自己分享的文件`n", Logs\Yixun.log
++failure
continue
}
errno := opensharelistroot6(uk, shareid, Body)
if ( errno != 0 )
{
if ( errno = "" )
{
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:list        出现意外错误`n", Logs\Yixun.log
}
else
{
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:list        错误代码: " . errno . "`n", Logs\Yixun.log
}
++failure
continue
}
errno := saving(shareid, uk, Body, URL)
if ( errno != 0 )
{
if ( errno = "" )
{
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:transfer        出现意外错误`n", Logs\Yixun.log
}
else if ( RegExMatch(errno, "(?<=12:).+", errno) != 0 )
{
switch errno
{
case -32:
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:transfer        空间不足。`n", Logs\Yixun.log
++failure
FormatTime, Time, % A_Now, yyyy/M/d H:mm:ss
FileAppend,
						( LTrim
						% "共计 " . success + failure . " 个 , 成功 " . success . " 个 , 失败 " . failure . " 个
						<<< " . Time . "`n`n"
), Logs\Yixun.log
GuiControl,, status, % "空间不足 , 成功 " . success . " 个 , 失败 " . failure . " 个 , 共计 " . success + failure . " 个"
return
case -30:
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:transfer        目标已包含同名文件。`n", Logs\Yixun.log
case 120:
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:transfer        已超过保存的最大允许数量。`n", Logs\Yixun.log
default:
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:transfer        错误代码: 12: " . errno . "`n", Logs\Yixun.log
}
}
else
{
FileAppend, % "  " . URL . ( pwd = "" ? "" : " " . pwd ) . "        错误:transfer        错误代码: " . errno . "`n", Logs\Yixun.log
}
++failure
continue
}
++success
}
FormatTime, Time, % A_Now, yyyy/M/d H:mm:ss
FileAppend,
	( LTrim
	% "共计 " . success + failure . " 个 , 成功 " . success . " 个 , 失败 " . failure . " 个
	<<< " . Time . "`n`n"
), Logs\Yixun.log
GuiControl,, status, % "保存完毕 , 成功 " . success . " 个 , 失败 " . failure . " 个 , 共计 " . success + failure . " 个"
return
}
openshare6(ByRef URL, ByRef uk, ByRef shareid, ByRef Location, i := 0)
{
if ( encrypt = 1 && i = 0 )
{
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Option(6) := false
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
switch whr.Status
{
case 200:
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.GetResponseHeader("Set-Cookie"), "(?<=BDCLND=)[^;]+", BDCLND)
RegExMatch(whr.ResponseText, "(?<=""uk"":)\d+", uk)
RegExMatch(whr.ResponseText, "(?<=""shareid"":)\d+", shareid)
return, 0
}
else
{
RegExMatch(whr.ResponseText, """errortype"":[^,]+", errortype)
return, errortype
}
case 302:
Location := whr.GetResponseHeader("Location")
if ( Location != "/error/404.html" )
{
return, "encrypted"
}
else
{
return, "/error/404.html"
}
default:
return, whr.Status
}
}
Catch
{
return, openshare6(URL, uk, shareid, Location, 1)
}
}
else
{
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe -H User-Agent: -i --noproxy * -s -o Temp\~t %URL%,, Hide
if ( ErrorLevel = 0 )
{
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
FileDelete, Temp\~t
RegExMatch(r, "\d{3}", code)
switch code
{
case 200:
RegExMatch(r, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(r, "(?<=BDCLND=)[^;]+", BDCLND)
RegExMatch(r, "(?<=""uk"":)\d+", uk)
RegExMatch(r, "(?<=""shareid"":)\d+", shareid)
return, 0
}
else
{
RegExMatch(r, """errortype"":[^,]+", errortype)
return, errortype
}
case 302:
RegExMatch(r, "(?<=Location: )[^\n]+", Location)
if ( Location != "/error/404.html" )
{
return, "encrypted"
}
else
{
return, "/error/404.html"
}
default:
return, code
}
}
}
FileDelete, Temp\~t
}
return
}
verify(ByRef Location, ByRef pwd)
{
Global BDCLND
Global input
Global vcode
RegExMatch(Location, "surl=.+$", surl)
URL := encrypt = 1 ? "https://pan.baidu.com/share/verify?" . surl : "http://pan.baidu.com/share/verify?" . surl
Body := "pwd=" . pwd . ( input = "" ? "" : "&vcode=" . input . "&vcode_str=" . vcode )
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL, true)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
whr.SetRequestHeader("Referer", Location)
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.GetResponseHeader("Set-Cookie"), "(?<=BDCLND=)[^;]+", BDCLND)
}
else
{
if ( errno = -62 )
{
input := ""
error := getcaptcha12()
if ( error = 0 )
{
Gosub, getcaptcha
Gui, 6:Default
if ( input != "" )
{
return, verify(Location, pwd)
}
}
}
}
return, errno
}
return
}
getcaptcha12()
{
Gui +OwnDialogs
Global vcode
URL := encrypt = 1 ? "https://pan.baidu.com/api/getcaptcha?prod=shareverify" : "http://pan.baidu.com/api/getcaptcha?prod=shareverify"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=""vcode_str"":"")[^""]+", vcode)
img := "https://pan.baidu.com/genimage?" . vcode
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe -H User-Agent: --noproxy * -s -o Temp\genimage.jpg %img%,, Hide
if ( ErrorLevel != 0 )
{
MsgBox, 16, 错误:curl, 出现意外错误。
}
return, ErrorLevel
}
}
Catch
{
MsgBox, 16, 错误:getcaptcha, 出现意外错误。
}
return
}
getcaptcha:
Gui, 6:+Disabled
Gui, 12:Default
Gui, +Owner6 +Hwndgui12hwnd
Gui, Margin, 0, 0
Gui, Add, Picture, x10 y10 w120 h40 vgenimage, Temp\genimage.jpg
FileDelete, Temp\genimage.jpg
Gui, Add, Button, x+5 y+-23 grefresh12, 刷新
Gui, Add, Text, x10 y+10, 请输入验证码:
Gui, Add, Edit, x10 y+5 h22 w100 vinput
Gui, Add, Text, x+5 y+-17 w200 cRed vinfo
Gui, Add, Button, x225 y+20 w80 Default gconfirm12, 确定
Gui, Add, Button, x+5 w80 gcancel12, 取消
Gui, Show, h147 w400, 请输入验证码
GuiControl, Focus, input
WinWaitClose ahk_id %gui12hwnd%
return
12GuiClose:
cancel12:
Gui, 6:-Disabled
Gui, Destroy
return
refresh12()
{
error := getcaptcha12()
if ( error = 0 )
{
GuiControl,, genimage, Temp\genimage.jpg
FileDelete, Temp\genimage.jpg
}
return
}
confirm12:
Gui, Submit, NoHide
if ( input != "" )
{
Gui, 6:-Disabled
Gui, Destroy
}
else
{
GuiControl,, info, 此信息为必填项
}
return
openshare6302(ByRef URL, ByRef uk, ByRef shareid, i := 0)
{
Global BDCLND
if ( encrypt = 1 && i = 0 )
{
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", "BDCLND=" . BDCLND)
whr.Send()
whr.WaitForResponse()
switch whr.Status
{
case 200:
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=""uk"":)\d+", uk)
RegExMatch(whr.ResponseText, "(?<=""shareid"":)\d+", shareid)
return, 0
}
case 302:
if ( whr.GetResponseHeader("Location") = "/error/404.html" )
{
return, "/error/404.html"
}
default:
return, whr.Status
}
}
Catch
{
return, openshare6302(URL, uk, shareid, 1)
}
}
else
{
RunWait, cmd.exe /C cd /d "%A_ScriptDir%" && curl\bin\curl.exe -H User-Agent: -b BDCLND=%BDCLND% -i --noproxy * -s -o Temp\~t %URL%,, Hide
if ( ErrorLevel = 0 )
{
FileRead, r, Temp\~t
if ( ErrorLevel = 0 )
{
FileDelete, Temp\~t
RegExMatch(r, "\d{3}", code)
switch code
{
case 200:
RegExMatch(r, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(r, "(?<=""uk"":)\d+", uk)
RegExMatch(r, "(?<=""shareid"":)\d+", shareid)
return, 0
}
case 302:
RegExMatch(r, "(?<=Location: )[^\n]+", Location)
if ( Location = "/error/404.html" )
{
return, "/error/404.html"
}
default:
return, code
}
}
}
FileDelete, Temp\~t
}
return
}
opensharelistroot6(ByRef uk, ByRef shareid, ByRef Body)
{
Global BDCLND
Global path
URL := encrypt = 1 ? "https://pan.baidu.com/share/list?uk=" . uk . "&shareid=" . shareid . "&root=1" : "http://pan.baidu.com/share/list?uk=" . uk . "&shareid=" . shareid . "&root=1"
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("GET", URL, true)
whr.SetRequestHeader("Cookie", "BDCLND=" . BDCLND)
whr.Send()
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 0 )
{
RegExMatch(whr.ResponseText, "(?<=\[).+(?=])", list)
list := StrSplit(list, ",{""")
for key, value in list
{
RegExMatch(value, "(?<=fs_id"":"")\d+", fs_id)
fsidlist .= fs_id . "%2C"
}
fsidlist := RegExReplace(fsidlist, "%2C$")
path := UrlEncode(path)
Body := "fsidlist=%5B" . fsidlist . "%5D" . "&path=" . path
}
return, errno
}
return
}
saving(ByRef shareid, ByRef uk, ByRef Body, ByRef URL)
{
Global Cookie
Global BDCLND
URL2 := encrypt = 1 ? "https://pan.baidu.com/share/transfer?shareid=" . shareid . "&from=" . uk : "http://pan.baidu.com/share/transfer?shareid=" . shareid . "&from=" . uk
Try
{
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetProxy(1)
whr.Option(4) := 0x3300
whr.Open("POST", URL2, true)
whr.SetRequestHeader("Cookie", Cookie . "; BDCLND=" . BDCLND)
whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
whr.SetRequestHeader("Referer", URL)
whr.Send(Body)
whr.WaitForResponse()
RegExMatch(whr.ResponseText, "(?<=""errno"":)-?\d+", errno)
if ( errno = 12 )
{
RegExMatch(whr.ResponseText, "(?<=\[).+(?=])", info)
info := StrSplit(info, ",{""")
for key, value in info
{
RegExMatch(value, "(?<=errno"":)-?\d+", errno)
if ( errno != 0 )
{
return, "12:" . errno
}
}
}
return, errno
}
return
}