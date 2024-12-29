; =============================================
; = Macro Created By Eazy                     =
; = Contact me if any issues _eazy.           =
; =============================================


#Requires AutoHotkey v2.0

#Include "%A_ScriptDir%\Lib\FindText.ahk"
#Include "%A_ScriptDir%\Lib\Helpers.ahk"
#Include "%A_ScriptDir%\Lib\FindText_Pic.ahk"

SendMode "Event"
CoordMode("Mouse", "Window")
Roblox := "ahk_exe RobloxPlayerBeta.exe"

global WinX := 0
global WinY := 0
global WinWidthX := 0
global WinWidthY := 0

^Esc:: ExitApp

F1:: Start_Macro()

Start_Macro()
{
    ;Lobby Walk
    Roblox_Screen()

    Click(405, 40)

    global WinX, WinY, WinWidthX, WinWidthY

    WinGetPos(&WinX, &WinY, &WinWidthX, &WinWidthY, Roblox)

    Lobby_Check()
}

Lobby_Check()
{
    sleep 1000
    if (ok := FindText(&X, &Y, (WinX + 70), WinY + 300, WinX + 120, WinY + 350, 0, 0, PlayButton))
    {
        Lobby_Walk(X - WinX, Y - WinY)
    }
    return
}

Lobby_Walk(X, Y)
{
    ; Click Play button
    CloseLeader()
    sleep 50
    Close_Chat()
    sleep 500
    Click(X, Y)
    sleep 50
    Click(405, 40)
    Sleep 1000
    SendInput("{a down}")
    sleep 5000
    SendInput("{a up}")
    sleep 50
    KeyWait "a"

    if (ok := FindText(&X, &Y, (WinX + 315), (WinY + 245), (WinX + 560), (WinY + 290), 10, 10, MatchMaking))
    {
        sleep 500
        Click(470, 350)
        CaptchaBeat()
        Load_Stage()
    }
    else
    {
        MsgBox("Dont")
        Lobby_Check()
    }
}

CaptchaBeat()
{
    ; MsgBox(WinX " ," WinY)

    CoordMode("Pixel", "Window")

    sleep 500
    if (ok := FindText(&X, &Y, (WinX + 340), (WinY + 225), (WinX + 473), (WinY + 254), 0, 0, Captcha))
    {
        Run("SnippingTool.exe")
        WinWait("ahk_exe SnippingTool.exe")
        Sleep 2000

        CoordMode("Mouse", "Screen")
        Sleep 500
        WinMove(985, 165, 516, 239, "ahk_exe SnippingTool.exe")
        sleep 100
        Click(1036, 220)
        sleep 500
        MouseClickDrag("L", 410, 410, 762, 465, 15)
        Sleep 2000
        WinMove(985, 165, 516, 239, "ahk_exe SnippingTool.exe")
        sleep 500
        Click(1310, 460)
        sleep 3000
        Click(1150, 275)
        sleep 2000
        Click(560, 175)
        sleep 50
        CoordMode("Mouse", "Window")
        sleep 50
        Click(406, 370)
        sleep 50
        Click(406, 370)
        sleep 500
        A_Clipboard := StrReplace(A_Clipboard, " ", "") ; Chatgpt Goes BRRRR
        sleep 100
        SendInput("{Ctrl down}v{Ctrl up}")
        WinClose("ahk_exe SnippingTool.exe")
        sleep 1000
        Click(310, 415)
    }

    sleep 50

    ; if (ok := FindText(&X, &Y, (WinX + 170), (WinY + 460), (WinX + 300), (WinY + 505), 0, 0, IncorrectCaptcha)) {
    ;     MsgBox("Why went into here?")
    ;     Sleep 40000
    ;     Lobby_Check()
    ; }

    ; loop 40
    ; {
    ;     if (ok := FindText(&X, &Y, (WinX + 170), (WinY + 460), (WinX + 300), (WinY + 505), 20, 10, IncorrectCaptcha)) {
    ;         MsgBox("Why went into here?")
    ;         Sleep 40000
    ;         Lobby_Check()
    ;     }

    ;     sleep 100
    ; }


    loop 40
    {
        if PixelSearch(&X, &Y, (175), (475), (300), (500), 0xFF494C, 25)
        {
            Sleep 40000
            Lobby_Check()
        }

        sleep 100
    }

    sleep 50
}


Load_Stage()
{

    CoordMode("Pixel", "Screen")
    loop
    {

        if (ok := FindText(&X, &Y, (WinX + 360), (WinY + 70), (WinX + 460), (WinY + 95), 0, 0, VoteStartv2))
        {
            ; MsgBox(X " , " Y)
            Click(360, 135)
            CloseLeader()
            Close_Chat()
            Set_Up()
            break
        }

        sleep 100
    }

    ; Set_Up()
}

Set_Up()
{
    LastPressed := A_TickCount
    loop
    {
        if (A_TickCount - LastPressed >= 150000)
        {
            SendInput("{Space}")
            SendInput("{a}")

            LastPressed := A_TickCount
        }

        if (ok := FindText(&X, &Y, (WinX + 270), (WinY + 405), (WinX + 385), (WinY + 445), 0, 0, Next))
        {
            Click(360, 425)
            sleep 1000
            Click(420, 315)
            sleep 1000
            Click(295, 145)
            ; sleep 20000
            ; Lobby_Check()
        }

        Lobby_Check()
        sleep 1000
    }
}