Toggle := false ; Variable to track the toggle state

^Space:: ; Triggered when ctrl + space key is pressed
    Toggle := !Toggle ; Toggle the state
    if (Toggle)
        Click Down ; Simulate left-click down
    else
        Click Up ; Simulate left-click up
    return
