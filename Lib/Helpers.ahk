GlobalScreenWidth := A_ScreenWidth / 1920
GlobalScreenHeight := A_ScreenHeight / 1080
RobloxWinSmallWidth := 800
RobloxWinSmallHeight := 600

#Include %A_ScriptDir%\Main.ahk

Roblox_Screen()
{
    if (WinExist(Roblox))
    {
        WinActivate(Roblox)
        Sleep 500
        WinMove(180, 120, 800, 600, Roblox)
        Sleep 100
    }
}


Close_Chat()
{
    SendInput("{/}")
    sleep 50
    SendInput("{Enter}")
    sleep 50
    if (ok := FindText(&X, &Y, (WinX + 10), (WinY + 35), (WinX + 220), (WinY + 85), 0, 0, Chat))
    {
        Click((X - WinX), (Y - WinY))
    }
}

CloseLeader()
{
    SendInput("{Tab}")
}

Movement(toggle)
{
    sleep 500
    SendInput("{Esc}")
    sleep 500
    SendInput("{Tab}")
    sleep 500
    SendInput("{Down}")
    sleep 100
    SendInput("{Down}")
    sleep 100

    if (toggle)
    {
        SendInput("{Left}")
        KeyWait("Left")

    }
    else
    {
        SendInput("{Right}")
        KeyWait("Right")

    }
    sleep 100
    Send("{Esc}")
}

Tp_Spawn()
{
    sleep 50
    Click(37, 600)
    sleep 100
    Click(260, 240)
    sleep 500
    loop 10
    {
        SendInput("{WheelUp}")
        sleep 50
    }

    loop 3
    {
        SendInput("{WheelDown}")
        KeyWait "WheelDown"
        sleep 500
    }

    sleep 50
    Click(530, 455)
    sleep 500
    Click(590, 180)
    sleep 50
}

CameraAngleDown()
{
    loop 15
    {
        SendInput("{WheelUp}")
        sleep 50
    }

    Sleep 1000
    Send("{RButton Down}")
    Sleep 500
    DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", 1080, "UInt", 0, "UPtr", 0) ; Look up
    Sleep 500
    Send("{RButton Up}")
    KeyWait("RButton")

    loop 15
    {
        SendInput("{WheelDown}")
        sleep 50
    }
}


