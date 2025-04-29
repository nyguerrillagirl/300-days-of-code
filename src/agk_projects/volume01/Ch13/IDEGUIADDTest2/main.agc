// Project: IDEGUIADDTest2
// Created: 19-05-01

type Coords2DType
	x as float
	y as float
endtype

type ColourType
	x 	as float
	y 	as float
	z 	as float
	w	as float
endtype

global dir as string = "raw:E:/AGKStudio/All Media/"//[IDEGUIADD],selectfolder,Sprite folder
global image as string = "alice.png"//[IDEGUIADD],selectfile,Sprite image
global colour as ColourType //[IDEGUIADD],vec4color,Sprite Tint
colour.x = 0.975806 //[IDEGUIADD],variable,
colour.y = 0.960766//[IDEGUIADD],variable,
colour.z = 0.952198 //[IDEGUIADD],variable,
colour.w = 1.000000	//[IDEGUIADD],variable,
global post as Coords2DType //[IDEGUIADD],vec3,Sprite Position
post.x = 36.119812 ////[IDEGUIADD],variable,
post.y = 42.590405 ////[IDEGUIADD],variable,


// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle("//[IDEGUIADD] Test2")
SetWindowSize(1024, 768, 0)
SetWindowAllowResize(1) // allow the user to resize the window

// set display properties
SetDisplayAspect(1.33)
SetOrientationAllowed(1, 1, 1, 1) // allow both portrait and landscape on mobile devices
SetSyncRate(30, 0) // 30fps instead of 60 to save battery
SetScissor(0, 0, 0, 0) // use the maximum available screen space, no black borders
UseNewDefaultFonts(1)


//*** Create sprite ***
imgID = LoadImage(image)
sprID = CreateSprite(imgID)
SetSpriteSize(sprID,10,-1)
SetSpritePosition(sprID,post.x,post.y)
previmage as string = "" //Name of last image file
do
	Print(image)
	//*** IF the image file name has changed ***
	if image <> previmage
		//*** If the old image file is currently loaded ***
		if GetImageExists(imgID)
			//*** Delete it from memory ***
			DeleteImage(imgID)
		endif
		//*** Load the new image and apply it to sprite ***
		imgID = LoadImage(image)
		SetSpriteImage(sprID,imgID)
		SetSpriteSize(sprID,10,-1)
		//*** Save latest image name as previous image name ***
		previmage = image
	endif
	//*** Set sprite colour tint and position ***
	SetSpriteColor(sprID, colour.x*256, colour.y*256, colour.z*256,colour.w*256)
	SetSpritePosition(sprID,post.x,post.y)
	Sync()
loop


