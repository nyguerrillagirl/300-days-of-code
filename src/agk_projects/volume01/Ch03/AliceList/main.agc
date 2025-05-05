// Project: AliceList
// Created: 2017-02-11

//*** Include library files ***
#include "../../Function Library/CoreLibrary.agc"
#include "../../Function Library/SpriteLineLibrary.agc"

type DataType 
	key 	as integer //ID of item 
	desc 	as string //Description of item (59 chars) 
	value 	as float 	//Item’s value 
	weight 	as float //Item’s weight
endtype //71 bytes

type GameType 
	images 			as integer[10] //IDs of all images 
	alice 			as integer //ID of alice sprite 
	objText 		as integer //ID of text showing available objects
	aliceText 		as integer 	//ID of text showing Alice’s objects 
	objDetails 		as ListType //Details of available objects 
	aliceDetails 	as ListType //Details of objects held by Alice
endtype

//****** Global Variables ******
global g as GameType

//***************************************
//***          Main program           ***
//***************************************
InitialiseScreen(1024,768,"Using Lists",0xF2D8AA,%1111)
LoadResources()
InitialiseGameVariables()
CreateInitialLayout()
do 
	in = GetUserInput() 
	HandleUserInput(in) 
	Sync()
loop
//***************************************
//***          Main Functions         ***
//***************************************
function LoadResources() 
	global filenames as string[10]= ["alice","bowtie", "cake", "cat", "crown", "cupandsaucer", "dodo","scroll","teapot","tophat","whiterabbit"] 
	//*** Load images *** 
	for c = 0 to 10 
		g.images[c] = LoadImage(filenames[c]+".png") 
	next c
endfunction 

function InitialiseGameVariables() 
	temprec as DataType //Holds record until sent to  memblock 
	//*** Create the list structure *** 
	CreateList(g.objDetails,10,1) 
	//*** Create list of Alice’s objects *** 
	CreateList(g.aliceDetails,5,1) 
	//*** Open file for reading *** 
	fileID = OpenToRead("AliceObjects.txt") 
	//*** Read records into memblocks *** 
	line as string 
	repeat 
		//** Read a line ** 
		line = ReadLine(fileID) 
		//** Convert line to a record ** 
		StringToRecord(temprec,line) 
		//** Store rec in memblock and ** 
		//** memblock ID in list ** 
		AddToList(g.objDetails,RecordToMemblock(temprec)) 
	until FileEOF(fileID) 
	//*** Close the file *** 
	CloseFile(fileID)
endfunction 

function CreateInitialLayout() 
	//*** Size and position details for object sprites *** 
	sizes as integer[9] = [4,8,12,6,5,12,8,8,5,10] 
	xpost as integer[9] = [3,10,20,35,3,10,25,35,12,22] 
	ypost as integer[9] = [40,40,40,40,55,55,55,55,80,70]
	//*** Create Alice sprite *** 
	g.alice = CreateSprite(g.images[0])	
	SetSpriteSize(g.alice,-1,50) 
	SetSpritePosition(g.alice,45,50) 
	//*** Create other sprites *** 
	for c = 0 to 9 
		memID = GetFromList(g.objDetails,c+1) 
		//*** Store the sprite’s ID in DataType’s key field *** 
		SetMemblockInt(memID,0,CreateSprite(g.images[c+1])) 
		//*** Size and position sprite ***
		SetSpriteSize(GetMemblockInt(memID,0),sizes[c],-1) 
		SetSpritePosition(GetMemblockInt(memID,0),xpost[c],ypost[c]) 
	next c 
	//*** Text showing list of objects *** 
	g.objText = CreateText("") 
	SetTextPosition(g.objText,3,1) 
	//*** Text showing Alice’s list ***
	g.aliceText = CreatetExt("") 
	SetTextPosition(g.aliceText,73,1)
endfunction 

function GetUserInput() 
	result = 0 
	//*** return ID of any object clicked *** 
	if GetPointerPressed() 
		result = GetSpriteHit(GetpointerX(), GetPointerY()) 
	endif
endfunction result

function HandleUserInput(in as integer) 
	//*** If no object clicked, exit *** 
	if in = 0 
		exitfunction 
	endif 
	//*** Find sprite ID in list *** 
	post = FindKeyInList(g.objDetails,in) 
	//*** If found and Alice can take more *** 
	if post <> 0 and NOT IsFullList(g.aliceDetails) 
		//*** Add to Alice’s list *** 
		AddToList(g.aliceDetails,GetFromList(g.objDetails,post)) 
		//*** Delete from object list *** 
		DeleteFromList(g.objDetails,post) 
		//*** Reposition it *** 
		SetSpritePosition(in,GetSpriteX(in)+55,
		GetSpriteY(in)) 
		//*** Update text display of each list *** 
		UpdateText() 
	else 
		//*** Find sprite ID in Alice’s list *** 
		post = FindKeyInList(g.aliceDetails,in) 
		if post <> 0 
			//*** Add to object list *** 
			AddToList(g.objDetails,GetFromList(g.aliceDetails,post)) 
			//*** Delete from Alice list *** 
			DeleteFromList(g.aliceDetails,post) 
			//*** Reposition it *** 
			SetSpritePosition(in,GetSpriteX(in)-55, GetSpriteY(in)) 
			//*** Update text display of each list *** 
			UpdateText() 
		endif 
	endif
endfunction

//***************************************
//***        Helper Functions         ***
//***************************************
//*** Returns key’s position in list *** 
function FindKeyInList(list as ListType, key as integer) 
	result = 0 
	for c = 1 to LengthOfList(list) 
		//*** If sprite ID same as key *** 
		if GetMemblockInt(GetFromList(list,c),0)= key 
			result = c 
			exit 
		endif 
	next c
endfunction result 


//*** Updates the text resources contents ***
function UpdateText() 	
	listText as string 
	for c = 1 to LengthOfList(g.objDetails) 
		listText = listText + GetStringToken2(GetMemblockString(GetFromList(g.objDetails,c),4,60),".",1)+'\n' 
	next c 
	SetTextString(g.objText, listText) 
	listText = "" 
	for c = 1 to LengthOfList(g.aliceDetails) 
		listText = listText + GetStringToken2(GetMemblockString(GetFromList(g.aliceDetails,c),4,60),".",1)+'\n' 
	next c 
	SetTextString(g.aliceText, listText)
endfunction 


//*** Converts text to a record ***
function StringToRecord(rec ref as DataType, line as string) 
	//*** Extract and store Object key *** 
	rec.key = Val(GetStringToken2(line,"|",1)) 
	//*** Object desc (49 chars) *** 
	rec.desc = GetStringToken2(line,"|",2) 
	rec.desc = Left(rec.desc,59) 
	rec.desc = rec.desc+Spaces(59 - Len(rec.desc)) 
	//*** Object value *** 
	rec.value = ValFloat(GetStringToken2(line,"|",3)) 
	//*** Object weight *** 
	rec.weight = ValFloat(GetStringToken2(line,"|",4))
endfunction 


//*** Converts a record to a memblock ***
function RecordToMemblock(rec as DataType) 
	//*** Create memblock for record *** 
	result = CreateMemblock(72) 
	//*** Store key *** 
	SetMemblockInt(result,0,rec.key) 
	//*** Store description *** 
	SetMemblockString(result,4,rec.desc) 
	//*** Store value *** 
	SetMemblockFloat(result,64,rec.value) 
	//*** Store weight *** 
	SetMemblockFloat(result,68,rec.Weight)
endfunction result
