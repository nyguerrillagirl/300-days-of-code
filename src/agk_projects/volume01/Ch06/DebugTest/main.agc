/// Project: DebugTest
// Created: 19-04-21

SetErrorMode(2)
SetWindowTitle("Debug Test")
SetWindowSize(1024, 768, 0)
SetWindowAllowResize(1) 
SetDisplayAspect(1.33)
SetOrientationAllowed(1, 1, 1, 1) 
SetSyncRate(30, 0) 
SetScissor(0, 0, 0, 0)
UseNewDefaultFonts(1)
no1 = 12
no2 = 3
sum = no1 + no2
do
	Print(sum)
	if sum > 30
		Print("Over thirty")
	else
		Print("Thirty or less")
	endif
	Sync()
loop