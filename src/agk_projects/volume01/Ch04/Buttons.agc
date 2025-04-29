//***Loads the button images and creates 12 virtual buttons ***
function SetUpButtons()
    //*** Load atlas image ***
    LoadImage(99,"Buttons.png")
    //*** Load subimages used ***
    for id = 1 to 24 step 2
        LoadSubImage(id,99,Str(id/2+1)+"Up.png")
        LoadSubImage(id+1,99,Str(id/2+1)+"Down.png")
    next id
    //*** Set up virtual buttons ***
    for id = 1 to 12
        AddVirtualButton(id,95,8+(id-1)*7,8)
        SetVirtualButtonImageUp(id,(id-1)*2+1)
        SetVirtualButtonImageDown(id,id*2)
    next id
endfunction

//*** Reads a value entered on the buttons ***
function GetButtonEntry()
    //*** No characters input ***
    result$=""
    //*** Input not complete ***
    finish = 0
    //*** Read buttons until Enter button pressed ***
    repeat
        //*** Check each key for being pressed ***
        for button = 1 to 12
            //*** if this button is pressed ***
            if GetVirtualButtonState(button) = 1
                //*** and its a numeric  ***
                if button >= 1 AND button <= 10
                    //*** Add button's value to result ***
                    result$ = result$ + STR(Mod(button, 10))
                endif
                //*** If BACKSPACE button pressed AND result contains digits ***
                if  button = 11 AND len(result$) > 0
                    //*** Remove right-most digit ***
                    result$ = Left(result$,Len(result$)-1)
                endif
                //*** If ENTER button pressed ***
                if button = 12
                    //*** Set finish ***
                    finish = 1
                endif
                //***Wait for current button to be released ***
                repeat
                    Print(result$)
                    Sync()
                until GetVirtualButtonState(button)= 0
            endif
        next button
        //*** Display digits input ***
        Print(result$)
        Sync()
    until finish = 1
    //*** Convert string to value (empty string = 0)***
    if result$=""
        result = 0
    else
        result = Val(result$)
    endif
endfunction result
