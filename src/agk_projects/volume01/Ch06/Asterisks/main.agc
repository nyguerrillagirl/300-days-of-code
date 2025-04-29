// Project: Asterisks
// Created: 19-04-29

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle("Asterisks")
SetWindowSize(1024, 768, 0)
SetWindowAllowResize(1) // allow the user to resize the window

// set display properties
SetVirtualResolution(1024, 768) // doesn't have to match the window
SetOrientationAllowed(1, 1, 1, 1) // allow both portrait and landscape on mobile devices
SetSyncRate(30, 0) // 30fps instead of 60 to save battery
SetScissor(0, 0, 0, 0) // use the maximum available screen space, no black borders
UseNewDefaultFonts(1)

//[IDEGUIADD],header,Variable Adjuster
//[IDEGUIADD],message,Line size
//[IDEGUIADD],separator,

global num = 5 //[IDEGUIADD],integer,num
do
	for c = 1 to num
		PrintC("*")
	next c 
	Print("")
	Sync()
loop


