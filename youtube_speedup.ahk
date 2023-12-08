Toggle := false ; Variable to track the toggle state

^:: ; Triggered when Ctrl key is pressed
    Toggle := !Toggle ; Toggle the state
    if (Toggle)
        Click Down ; Simulate left-click down
    else
        Click Up ; Simulate left-click up
    return
