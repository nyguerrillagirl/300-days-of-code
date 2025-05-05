//***************************************
//***      Sprite Line Functions      ***
//***************************************
//*** Contents ***

//DrawSpriteLine(x1#,y1#,x2#,y2#,th#,col,op)
//     	Draws a line created using a sprite between 
//     	(x1#,y1#) and (x2#,y2#). The line is th# %
//      thick and of colour col with opacity op

//RedrawSpriteLine(id,x1#,y1#,x2#,y2#,th#,col,op)
//     	Redraws an existing line using the values given

//DeleteSpriteLine(id)
//		Deletes sprite whose ID is id



//DrawSpriteBox(x1#,y1#,x2#,y2#,th#,col,op)
//     	Draws a box created using four line sprites between 
//     	top-left(x1#,y1#) and bottom-right (x2#,y2#).
//      The lines are th# % thick and of colour col with opacity op
//		Returns id assigned

//RedrawSpriteBox(id,x1#,y1#,x2#,y2#,th#,col,op)
//     	Redraws an existing box using the values given

//DeleteSpriteBox(id)
//		Deletes the four sprites used to create the box
//		The sprites involved have IDs id to id+3



//DrawSpriteCircle(x#,y#,rad#,th#,col,op)
//     	Draws a circle created using 60 line sprites with 
//     	centre (x#,y#) and radius rad#.
//      The lines are th# % thick and of colour col with opacity op

//RedrawSpriteCircle(id,x#,y#,rad#,th#,col,op)
//     	Redraws an existing circle using the values given

//DeleteSpriteCircle(id)
//		Deletes the 60 sprites used to create the circle
//		The sprites involved have IDs id to id+59



//DrawSpritePolygon(pts#[],th#,col,op)
//     	Draws a polygon created using with pts#.length/2
//     	vertices. pts#[] contains coords in x,y,x,y order
//      The lines are th# % thick and of colour col with opacity op

//RedrawSpritePolygon(id,pts#[],th#,col,op)
//     	Redraws an existing polygon using the values given

//DeleteSpritePolygon(id, num)
//		Deletes the sprites used to create the polygon
//		The sprites involved have IDs id to id+num-1




//int CreateBCurve(sx#,sy#,fx#,fy#,cx#,cy#)
//		Creates a Bezier curve and returns its ID.
// 		Curve start (sx#,sy#), end point (fx#,fy#)
//      Control point (cx#, cy#).
//		Defaults:: colour: black, thickness:0.25
//		segments:20

//SetBCurveControl(id,cx#,cy#)
//		Moves control point of B curve id to (cx#,cy#)
//		Redraws curve

//SetBCurveStart(id,sx#,sy#)
//		Moves start point of B curve id to (sx#,sy#)
//		Redraws curve

//SetBCurveEnd(id,ex#,ey#)
//		Moves end point of B curve id to (ex#,ey#)
//		Redraws curve

//SetBCurveColour(id,col)
//		Sets colour of B curve id to col
//		Redraws curve

//SetBCurveThickness(id, th)
//		Sets thickness of B curve id's lines to th
//		Redraws curve

//SetBCurveSegments(id, num)
//		Sets number of lines used to draw B curve id to num
//		Redraws curve

//DrawBCurve(id)
//		Draws B curve id


//*** There are additional Bezier curve Helper functions ***








//*** Create a line using a sprite. The sprite's ***
//*** ID is returned by the function.            ***
function DrawSpriteLine(x1 as float, y1 as float, x2 as float, y2 as float, thick as float, col as integer, opacity as integer)   
	distance 	as float	//Distance between two points
	angle 		as float	//Angle between two points
	
	//*** Create sprite ***
	id = CreateSprite(0)
	//*** Set the sprite's colour *** 
	SetSpriteColor(id,(col&&0xFF0000)>>16, (col&&0xFF00)>>8, (col&&0xFF),opacity) 
	//*** Calculate the length of the line ***
	distance = Sqrt((x2-x1)^2 + ((y2-y1)/GetDisplayAspect())^2)
	//*** Set dimensions of sprite ***
	SetSpriteSize(id,distance,thick)
	//***Set the sprite's offset point to left middle ***
	SetSpriteOffset(id,0,thick/2.0)
	//*** Position at start point ***
	SetSpritePositionByOffset(id,x1,y1)
	//*** Calculate angle of rotation needed***
	angle = ATan2((y2-y1)/GetDisplayAspect(),x2-x1)
	SetSpriteAngle(id,angle)	
endfunction id


//*** Redraws an existing line sprite. The start ***
//*** and end points, the thickness, colour and  ***
//*** opacity can be changed.                    ***
function RedrawSpriteLine(id as integer, x1 as float, y1 as float, x2 as float, y2 as float, thick as float, col as integer, opacity as integer)
	distance 	as float	//Distance between two points
	angle 		as float	//Angle between two points
	
	//*** If sprite does not exist, exit ***
	if NOT GetSpriteExists(id)
		exitfunction
	endif
	//*** Set the sprite's colour *** 
	SetSpriteColor(id,(col&&0xFF0000)>>16, (col&&0xFF00)>>8, (col&&0xFF),opacity) 
	//*** Calculate the length of the line ***
	distance = Sqrt((x2-x1)^2 + ((y2-y1)/GetDisplayAspect())^2)
	//*** Set dimensions of sprite ***
	SetSpriteSize(id,distance,thick)
	//*** Position at start point ***
	SetSpritePositionByOffset(id,x1,y1)
	//*** Calculate angle of rotation needed***
	angle = ATan2((y2-y1)/GetDisplayAspect(),x2-x1)
	SetSpriteAngle(id,angle)	
endfunction


//*** Deletes sprite used in sprite line ***
function DeleteSpriteLine(id as integer)
	//*** If sprite exists, delete it ***
	if GetSpriteExists(id)
		DeleteSprite(id)
	endif
endfunction




//*** Creates a rectangle using four sprite  ***
//*** The top-left and bottom-right coords   ***
//*** are supplied along with line thickness ***
//*** colour and opacity                     ***
function DrawSpriteBox(x1 as float, y1 as float, x2 as float, y2 as float, thick as float, col as integer, opacity as integer)
	//*** Draw top horizontal ***
	id = DrawSpriteLine(x1-(thick*0.5/GetDisplayAspect()),y1,x2+(thick*0.5/GetDisplayAspect()),y1,thick,col,opacity)
	//*** Draw right vertical ***
	DrawSpriteLine(x2,y1,x2,y2,thick,col,opacity)
	//*** Draw bottom horizontal ***
	DrawSpriteLine(x2+(thick*0.5/GetDisplayAspect()),y2,x1-(thick*0.5/GetDisplayAspect()),y2,thick,col,opacity)
	//*** Draw left vertical ***
	DrawSpriteLine(x1,y2,x1,y1,thick,col,opacity)
endfunction id


//*** Redraws an existing rectangle allowing ***
//*** size, position, colour line thickness  ***
//*** and opacity to be changed              ***
function RedrawSpriteBox(id as integer, x1 as float, y1 as float, x2 as float, y2 as float, thick as float, col as integer, opacity as integer)
	distance 	as float	//Distance between two points
	
	//*** If sprite does not exist, exit ***
	if NOT GetSpriteExists(id)
		exitfunction
	endif
	
	//*** Redraw lines in rectangle ***
	RedrawSpriteLine(id, x1-(thick*0.5/GetDisplayAspect()),y1,x2+(thick*0.5/GetDisplayAspect()),y1,thick,col,opacity)
	RedrawSpriteLine(id+1, x2,y1,x2,y2,thick,col,opacity)
	RedrawSpriteLine(id+2, x2+(thick*0.5/GetDisplayAspect()),y2,x1-(thick*0.5/GetDisplayAspect()),y2,thick,col,opacity)
	RedrawSpriteLine(id+3, x1,y2,x1,y1,thick,col,opacity)
endfunction


//*** Deletes the four lines used to construct ***
//*** the rectangle                            ***
function DeleteSpriteBox(id)
	for c = 0 to 3
		DeleteSpriteLine(id+c)
	next c
endfunction


//*** Draws a circle whose centre is at (x,y) with  ***
//*** radius rad. The outline thickness, colour and ***
//*** opacity can also be specified                 ***
function DrawSpriteCircle(x as float, y as float, rad as float, thick as float, col as integer, opacity as integer)
	lastx as float: lasty as float
	newx as float: newy as float
	//*** Calculate first two points on circumfrence ***
	lastx = Cos(0)*rad+x
	lasty = Sin(0)*rad*GetDisplayAspect()+y
	newx = Cos(6)*rad+x
	newy = Sin(6)*rad*GetDisplayAspect()+y
	//*** Draw first line ***
	id = DrawSpriteLine(lastx,lasty,newx,newy,thick, col, opacity)	
	for c = 2 to 60
		lastx = newx
		lasty = newy
		newx = Cos(6*c)*rad+x
		newy = Sin(6*c)*rad*GetDisplayAspect()+y
		DrawSpriteLine(lastx,lasty,newx,newy,thick, col, opacity)
	next c
endfunction id


//*** Redraws an existing circle allowing centre,   ***
//*** radius, line thickness, colour and opacity    ***
//*** and opacity to be changed                     ***
function RedrawSpriteCircle(id as integer,x as float, y as float, rad as float, thick as float, col as integer, opacity as integer) 
	lastx as float: lasty as float
	newx as float: newy as float
	//*** Calculate first two points on circumfrence ***
	lastx = Cos(0)*rad+x
	lasty = Sin(0)*rad*GetDisplayAspect()+y
	newx = Cos(6)*rad+x
	newy = Sin(6)*rad*GetDisplayAspect()+y
	//*** Draw first line ***
	RedrawSpriteLine(id,lastx,lasty,newx,newy,thick, col, opacity)	
	for c = 2 to 60
		lastx = newx
		lasty = newy
		newx = Cos(6*c)*rad+x
		newy = Sin(6*c)*rad*GetDisplayAspect()+y
		RedrawSpriteLine(id+c-1,lastx,lasty,newx,newy,thick, col, opacity)
	next c
endfunction id


//*** Deletes the lines which were used to construct ***
//*** the circle                                    ***
function DeleteSpriteCircle(id as integer)
	for c = 0 to 59
		DeleteSpriteLine(id+c)
	next c
endfunction


//*** Draws a polygon whose vertices are given in pnts[] ***
//*** The outline is of specified thicknes, colour and   ***
//*** opacity                                            ***
function DrawSpritePolygon(pnts as float[], thick as float, col as integer, opacity as integer)
	//*** Draw first line ***
	id = DrawSpriteLine(pnts[0],pnts[1], pnts[2], pnts[3], thick,col,opacity)
	//*** Craw remaining lines ... ***
	for c = 2 to pnts.length-3 step 2
		DrawSpriteLine(pnts[c],pnts[c+1], pnts[c+2], pnts[c+3], thick,col,opacity)
	next c
	//*** ... including line between last and first point ***
	DrawSpriteLine(pnts[0],pnts[1], pnts[pnts.length-1],pnts[pnts.length], thick,col,opacity)
endfunction id



//*** Redraws an existing polygon allowing          ***
//*** size, vertex position, colour line thickness  ***
//*** and opacity to be changed                     ***
function RedrawSpritePolygon(id as integer, pnts as float[], thick as float, col as integer, opacity as integer)
	for c = 0 to pnts.length/2 - 1
		RedrawSpriteLine(id+c,pnts[c*2],pnts[c*2+1], pnts[c*2+2], pnts[c*2+3],thick,col,opacity)
	next c
	RedrawSpriteLine(id+pnts.length/2,pnts[0],pnts[1], pnts[pnts.length-1],pnts[pnts.length],thick,col,opacity)
endfunction


//*** Deletes the lines which were used to construct ***
//*** the polygon                                    ***
function DeleteSpritePolygon(id as integer, vert as integer)
	for c = 0 to vert-1
		DeleteSpriteLine(id+c)
	next c
endfunction











//***************************************
//***          Bezier Curve           ***
//***************************************

type PointType
	x as float
	y as float
endtype

type LineType
	start 	as PointType
	fin 	as PointType
endtype

type BezierType
	start 			as PointType	//Start coords of curve
	fin 			as PointType	//end coords of curve
	control			as PointType	//control point coords
	colour			as integer		//Curve colour (RGB)
	thickness		as float		//Curve line thickness
	numPoints		as integer		//Number of segments
	primeControl 	as LineType[2]	//Primary control lines
	secControl		as LineType[-1] //Secondary control lines
	lines			as LineType[-1]	//Lines that make up curve
	lineIDs			as integer[-1]	//IDs of sprite lines used
endtype

global BCurves as BezierType[0]

//***************************************
//***       Bezier Curve Functions    ***
//***************************************

//*** Creates Bezier curve ***
function CreateBCurve(sx as float, sy as float, ex as float, ey as float, cx as float, cy as float)
	temp as BezierType
	//*** Create Bcurve data structure ***
	temp.start.x = sx
	temp.start.y = sy
	temp.fin.x = ex
	temp.fin.y = ey
	temp.control.x = cx
	temp.control.y = cy
	temp.colour = 0
	temp.thickness = 0.25
	temp.numPoints = 20
	temp.secControl.length = temp.numPoints
	temp.lines.length = temp.numPoints+1
	temp.lineIDs.length = temp.numPoints
	
	for c = 1 to temp.lineIDs.length
		temp.lineIDs[c] = DrawSpriteLine(200,200,200,200,0,0,0)
	next c
	//*** Store in BCurves global array ***
	BCurves.insert(temp)
	//*** Return position in array as curve's ID ***
	result = BCurves.length
	SetBCurvePrimary(result)
	SetBCurveSecondary(result)
	SetBCurveLines(result)
	DrawBCurve(result)
endfunction result


//*** Draws the Bezier curve ***
function DrawBCurve(id as integer)
	//*** If ID invalid, exit ***
	if id < 1 or id > BCurves.length
		exitfunction
	endif
	//*** Draw curve ***
	for c = 1 to BCurves[id].numPoints
		RedrawSpriteLine(BCurves[id].lineIDs[c],BCurves[id].lines[c].start.x,BCurves[id].lines[c].start.y ,BCurves[id].lines[c].fin.x ,BCurves[id].lines[c].fin.y,BCurves[id].thickness,BCurves[id].colour,255)  
	next c
endfunction

//*** Reposition control point ***
function SetBCurveControl(id as integer, cx as float, cy as float)
	//*** If ID invalid, exit ***
	if id < 1 or id > BCurves.length
		exitfunction
	endif
	BCurves[id].control.x = cx
	BCurves[id].control.y = cy
	SetBCurvePrimary(id)
	SetBCurveSecondary(id)
	SetBCurveLines(id)
	DrawBCurve(id)
endfunction

//*** Reposition start point ***
function SetBCurveStart(id as integer, sx as float, sy as float)
	//*** If ID invalid, exit ***
	if id < 1 or id > BCurves.length
		exitfunction
	endif
	BCurves[id].start.x = sx
	BCurves[id].start.y = sy
	SetBCurvePrimary(id)
	SetBCurveSecondary(id)
	SetBCurveLines(id)
	DrawBCurve(id)
endfunction

//*** Reposition end point ***
function SetBCurveEnd(id as integer, ex as float, ey as float)
	//*** If ID invalid, exit ***
	if id < 1 or id > BCurves.length
		exitfunction
	endif
	BCurves[id].fin.x = ex
	BCurves[id].fin.y = ey
	SetBCurvePrimary(id)
	SetBCurveSecondary(id)
	SetBCurveLines(id)
	DrawBCurve(id)
endfunction

//*** Change colour ***
function SetBCurveColour(id as integer, col as integer)
	//*** If ID invalid, exit ***
	if id < 1 or id > BCurves.length
		exitfunction
	endif
	BCurves[id].colour = col
	DrawBCurve(id)
endfunction

//*** Change thickness ***
function SetBCurveThickness(id as integer, thick as float)
	//*** If ID invalid, exit ***
	if id < 1 or id > BCurves.length
		exitfunction
	endif
	BCurves[id].thickness = thick
	DrawBCurve(id)
endfunction

//*** Change number of points calculated ***
function SetBCurveSegments(id as integer, pnts as integer)
	//*** If ID invalid, exit ***
	if id < 1 or id > BCurves.length
		exitfunction
	endif
	//*** If number of points outside range 3 to 100, exit ***
	if pnts < 3 or pnts > 100
		exitfunction
	endif
	//*** Delete existing construction lines ***
	for c = 1 to BCurves[id].lineIDs.length
		DeleteSpriteLine(BCurves[id].lineIDs[c])
	next c
	//*** Reset number of points *** 
	BCurves[id].numPoints = pnts
	//*** Resize secondary control arrays sizes 
	BCurves[id].secControl.length = pnts
	BCurves[id].lines.length = pnts+1
	//*** Reset size of line IDs array ***
	BCurves[id].lineIDs.length = pnts
	//*** Create the line sprites offscreen ***
	for c = 1 to BCurves[id].lineIDs.length
		BCurves[id].lineIDs[c] = DrawSpriteLine(200,200,200,200,0,0,0)
	next c
	//*** Recalc secondary control lines ***
	SetBCurveSecondary(id)
	//*** Recalc B curve construction lines ***
	SetBCurveLines(id)
	//*** Draw the construction lines of B curve ***
	DrawBCurve(id)
endfunction




//***************************************
//***  Bezier Curve Helper Functions  ***
//***************************************

//*** Creates Bezier curve primary control lines ***
function SetBCurvePrimary(id as integer)
	//*** If ID invalid, exit ***
	if id < 1 or id > BCurves.length
		exitfunction
	endif
	BCurves[id].primeControl[1].start = BCurves[id].start
	BCurves[id].primeControl[1].fin = BCurves[id].control
	BCurves[id].primeControl[2].start = BCurves[id].control
	BCurves[id].primeControl[2].fin = BCurves[id].fin
endfunction


//*** Creates Bezier curve secondary control lines ***
function SetBCurveSecondary(id as integer)
	c1 as PointType
	c2 as PointType
	//*** If ID invalid, exit ***
	if id < 1 or id > BCurves.length
		exitfunction
	endif
	//*** Calculate step size on each primary control line ***
	c1.x = (BCurves[id].primeControl[1].fin.x - BCurves[id].primeControl[1].start.x)/BCurves[id].numPoints
	c1.y = (BCurves[id].primeControl[1].fin.y - BCurves[id].primeControl[1].start.y)/BCurves[id].numPoints
	c2.x = (BCurves[id].primeControl[2].fin.x - BCurves[id].primeControl[2].start.x)/BCurves[id].numPoints
	c2.y = (BCurves[id].primeControl[2].fin.y - BCurves[id].primeControl[2].start.y)/BCurves[id].numPoints
	//*** Create and store set of secondary control lines ***
	for c = 1 to BCurves[id].numPoints
		BCurves[id].secControl[c].start.x = BCurves[id].primeControl[1].start.x + c*c1.x
		BCurves[id].secControl[c].start.y = BCurves[id].primeControl[1].start.y + c*c1.y
		BCurves[id].secControl[c].fin.x = BCurves[id].primeControl[2].start.x + c*c2.x
		BCurves[id].secControl[c].fin.y = BCurves[id].primeControl[2].start.y + c*c2.y
	next c
endfunction


function SetBCurveLines(id as integer)
	start 	as PointType
	fin		as PointType
	stepx 	as float
	stepy 	as float
	//*** If ID invalid, exit ***
	if id < 1 or id > BCurves.length
		exitfunction
	endif
	
	fin = BCurves[id].start 
	for c = 1 to BCurves[id].numPoints
		start = fin
		stepx = (BCurves[id].secControl[c].fin.x-BCurves[id].secControl[c].start.x)/BCurves[id].numPoints
		stepy = (BCurves[id].secControl[c].fin.y-BCurves[id].secControl[c].start.y)/BCurves[id].numPoints
		fin.x = BCurves[id].secControl[c].start.x + c*stepx
		fin.y = BCurves[id].secControl[c].start.y + c*stepy
		BCurves[id].lines[c].start = start 
		BCurves[id].lines[c].fin = fin
	next c
endfunction
