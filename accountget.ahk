ListLines, Off
#KeyHistory 0
#NoEnv
#SingleInstance Off
#NoTrayIcon
Global ver
Global acc
Global i
Global URL

Gui, Add, Text, x10 y10, 选择api:
Gui, Add, DropDownList, x+0 y+-16 w100 vapi, api.npoint.io|jsonbox.io
Gui, Add, Button, x10 y40 Default w80 gconfirmapi, 确定
Gui, Add, Button, x200 y40 w80 gcencel, 退出
                     
Gui, Show, h75 w300, 账号提取器
return

confirmapi:
GuiControlGet,api
if (api = "api.npoint.io")
{
    i = 0
    getmain()
return
    
}
else
if (api = "jsonbox.io")
{
    i = 1
    getmain()
    return
}
else{
MsgBox, 16,错误：,请选择api！
}
return


getmain()
{
Gui, Destroy
Gui, Add, Text, x10 y10, 选择亿寻版本:
Gui, Add, DropDownList, x+0 y+-16 w100 vver, 春节版|湖南版|b2|b2湖南版
Gui, Add, Button, x10 y40 Default w80 gconfirm, 确定
Gui, Add, Button, x200 y40 w80 gcencel, 退出
                     
Gui, Show, h75 w300, 账号提取器
return

confirm:
GuiControlGet,ver
if (ver = "春节版")
{
  if ( i = 0 )
{
URL := "https://api.npoint.io/c40d013198d9cb72b0f6"
}
else
{
URL := "https://jsonbox.io/box_4db33f1b89c83a597228"
}  
getaccount()
    
}
else
{
if (ver = "湖南版")
{
    if ( i = 0 )
    {
        URL := "https://api.npoint.io/02deb6ea7c329f04de0a"
    }
        else
    {
        URL := "https://jsonbox.io/box_199a1ef519292b29f373"
    }
    getaccount()
}else{
    if (ver = "b2")
{
    if ( i = 0 )
    {
        URL := "https://api.npoint.io/2bd185b46411dcfeb49a"
    }
        else
    {
        URL := "https://jsonbox.io/box_c981dc25c810786bc94a"
    }
    getaccount()
}else{
    if(ver = "b2湖南版")
    {
    if ( i = 0 )
    {
        URL := "https://api.npoint.io/fff10be7d4b30046f4a5"
    }
        else
    {
        URL := "https://jsonbox.io/box_cb8d5a28bb2a5b2979cd"
    }
    getaccount()
}
    else{
MsgBox, 16,错误：,请选择版本！
}
Return
}
return
}
return
}
return
}




getaccount()
{
    r := sd()
FileDelete, etc\4
FileAppend, % r, etc\4
Try
{
    RunWait, C:\Windows\System32\cmd.exe /C OpenSSL\bin\openssl.exe enc -d -aes-256-cbc -a -A -pbkdf2 -pass file:etc\accountdecryptkey -in etc\4 | clip,, Hide
}
Catch
{
    
    failure := 1
    MsgBox, 48, 错误:OpenSSL, 出现意外错误。
    return
}

r := Clipboard
Clipboard := t
FileDelete, vipaccount
FileAppend, % r, vipaccount
MsgBox, 68 ,已提取,账号提取成功！账号信息已保存在：vipaccount

    return
}

sd(i := 0, j := 0)
{
   
    if ( i = 0 )
    {
        
        
            whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
            Try
            {
                whr.SetProxy(1)
                whr.Option(6) := false
                whr.Open("GET", URL, true)
                whr.Send()
                whr.WaitForResponse()
                if ( RegExMatch(whr.ResponseText, "(?<=""d"":"")[^""]+", r) = 0 )
                {
                    if ( i = 0 )
                    {
                        return, sd(1)
                    }
                }
                else
                {
                    return, r
                }
            }
            Catch
            {
            return,sd(, 1)
        
    }
    }
    else
    {
        t := Clipboard
        Try
        {
            RunWait, C:\Windows\System32\cmd.exe /C curl\bin\curl.exe --noproxy * -s %URL% | clip,, Hide
        }
        Catch
        {
            MsgBox, 48, 错误:curl, 出现意外错误。
            return
        }
        r := Clipboard
        Clipboard := t
        if ( RegExMatch(r, "(?<=""d"":"")[^""]+", r) = 0 )
        {
            if ( i = 0 )
            {
            return, sd(1, 1)
        }
    }
    else
    {
        return, r
    }
}
}


cencel:
Exitapp

GuiClose:
Exitapp
