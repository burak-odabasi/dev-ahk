Toggle := false ; Variable to track the toggle state

$Pause:: ; Triggered when Pause key is pressed
    Toggle := !Toggle ; Toggle the state
    if (Toggle)
        Click Down ; Simulate left-click down
    else
        Click Up ; Simulate left-click up
    return