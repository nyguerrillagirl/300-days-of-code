// Project: PhysicsScene
// Created: 19-04-17

//*** Include required libraries ***
#include "../Function Library/CoreLibrary.agc"

type GameType
	done as integer
endtype

//*** Global Variables ***
global g as GameType

//**************************************
//***        Main program            ***
//**************************************
InitialiseScreen(1024,768,"Physics in the Scene Editor",0xA8A8A8,%1111)
repeat
	in = GetUserInput()
	HandleUserInput(in)
	HandleOther()
	Sync()
until g.done = 1
do
	Sync()
loop

//**************************************
//***          Functions             ***
//**************************************
function GetUserInput()
endfunction

function HandleUserInput()
	result = 0
endfunction result

function HandleOther(in as integer)
endfunction