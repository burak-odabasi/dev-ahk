CoordMode, Mouse, Screen ; Set coordinate mode to Screen 

MButton:: ; Middle mouse button
    ; Store current mouse coordinates
    MouseGetPos, StoredMouseX, StoredMouseY

    ; Block mouse movement
    BlockInput, MouseMove

    ; Move mouse to specified coordinates
    MouseMove, 884, 1050, 0

    ; Click at the specified coordinates
    Click, Left

    Sleep, 25

    ; Unblock mouse movement
    BlockInput, MouseMoveOff
    
    ; Sleep briefly after clicking
    Sleep, 25

    ; Restore mouse coordinates
    MouseMove, %StoredMouseX%, %StoredMouseY%, 0
return
