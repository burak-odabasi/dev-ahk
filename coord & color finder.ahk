CoordMode, Mouse, Screen

Paused := 0 ; Initialize a variable to track the script's pause state

; Initialize variables to store last known coordinates and color
lastX := 0
lastY := 0
lastColor := "0x000000"

; Initial tooltip
ToolTip, X: %mouseX%  Y: %mouseY%`nColor: 0x000000  ; Display initial coordinates and color
SetTimer, UpdateTooltip, 100 ; Update tooltip every 100 milliseconds

; Toggle script pause with the ` key
`::
    Paused := !Paused ; Toggle the pause state
    if (Paused) {
        ToolTip, Script Paused`nX: %lastX%  Y: %lastY%`nColor: %lastColor%
        SetTimer, UpdateTooltip, Off ; Turn off the tooltip update timer
    } else {
        SetTimer, UpdateTooltip, 100 ; Restart the tooltip update timer
    }
return

UpdateTooltip:
    MouseGetPos, mouseX, mouseY

    ; Get the active window's position
    WinGetPos, winX, winY, winWidth, winHeight, A

    ; Check if the mouse is inside the active window
    if (mouseX >= winX && mouseX <= (winX + winWidth) && mouseY >= winY && mouseY <= (winY + winHeight)) {
        ; Adjust the coordinates relative to the active window
        adjustedX := mouseX - winX
        adjustedY := mouseY - winY

        ; Get the color of the pixel under the mouse cursor
        PixelGetColor, color, %adjustedX%, %adjustedY%, RGB

        ; Convert the color to a hexadecimal format
        hexColor := "0x" . SubStr(color, 3)  ; Remove the alpha channel and add "0x" prefix

        ; Update the last known coordinates and color
        lastX := adjustedX
        lastY := adjustedY
        lastColor := hexColor

        ; Display coordinates and color in the tooltip
        ToolTip, X: %adjustedX%  Y: %adjustedY%`nColor: %hexColor%
    } else {
        ToolTip ; Clear the tooltip if the mouse is outside the active window
    }
return
