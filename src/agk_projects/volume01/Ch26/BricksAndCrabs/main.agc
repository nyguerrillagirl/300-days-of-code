// Project: BricksAndCrabs
// Created: 19-04-03
//*** Include required libraries ***
#include "../Function Library/CoreLibrary.agc"

type GameType
	done as integer
endtype

//*** Global Variables ***
g as GameType

//**************************************
//***        Main program            ***
//**************************************
InitialiseScreen(1024,768,"BricksAndCrabs",0xA8A8A8,%1111)
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
	result = 0
endfunction result

function HandleUserInput(in as integer)
endfunction

function HandleOther()
endfunction

