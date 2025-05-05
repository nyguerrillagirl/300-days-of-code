//***************************************
//***          Changes                ***
//***************************************
//10 June 2019
//GUIPopUpMenu change to make all options
// have text of same size.

//17 Sept 2019
//AddTextToGUIFrame has extra parameter for 
//text alignment


//5 Aug 2020
//Major changes to code for GUIButton
//with added functions and rewrite of
//BuildDefaultGUIButton()
//Redefined GUIDialogBox data and how
//button filenames are defined

//8 Aug 2020
//Updated checkbox and radiobutton creation
//to use width parameter

// Oct 2020
// Major update. New widgets (Spinner. Dropdown. Keypad)
// New ops to existing widgets
// Code changes to handle viewoffsets and zooming
// Removed use of SpriteLineLibrary.agc

// Nov 2020
// Added TrafficLights widget


//***************************************
//***      GUIButton Description      ***
//***************************************
// Used to create a three-framed button. 
// frame 1 default, frame 2: mouse over
// frame 3: mouse pressed over

// int 	CreateGUIButton(x#,y#,w#,h#,img$,leg$) 	
//     	Creates a button with top-left at (x#,y#)
//     	dimensions w# by h#. If an image name is
//     	supplied (img$) it is used to create
//     	the three frames of the button.
//     	If img$ blank, a default image is created.
//     	leg$ shows in button centre(fr1:grey, fr2:black, fr3:yellow)
//     	Returns the ID assigned to the button

// int	DeleteGUIButton(id)
//    	Deletes the visuals of button id
//    	and marks button as deleted in GUIButtons array.
//     	Returns 1 if successful, else zero

// int	GetGUIButtonEnabled(id)
//		Returns 1 if button enabled
//		Returns 0 if button disabled
//		Returns -1 if invalid id

// int 	GetGUIButtonExists(id)
//	   	Returns 1 if GUIButton with ID "id" exists
//     	Returns 0 if button does not exist

// int	GetGUIButtonVisible(id)
//		Returns 1 if button visible
//		Returns 0 if button invisible
//		Returns -1 if invalid id
	
// int 	HandleGUIButton(id)
//    	Visual updates button depending on
//    	mouse
//		Returns 1 if button pressed (LMB clicked)
//		Returns zero if LMB not clicked over button

// int 	SetGUIButtonDepth(id, lay)
//     	Sets button layer to lay
//     	Returns 1 if successful 
//		Returns 0 if operation fails
	
// int 	SetGUIButtonEnabled(id,f)
//     	Enables (f=1)/disables(f=0) button
//	   	Returns 1 if successful 
//		Returns 0 if opertion fails

// int 	SetGUIButtonPosition(id, x#, y#)
//     	Sets button position to (x#,y#) 
//     	Returns 1 if successful
//		Returns 0 if id is invalid

// int 	SetGUIButtonSize(id, w#, h#)
//     	Sets button size to w# by h# 
//     	Returns 1 if successful 
//		Returns 0 if id is invalid
	
// int	SetGUIButtonVisible(id, f)
//		Makes button invisible (0) or visible (1).
//		Enabled/disabled unchanged
//		Returns 1 if successful
//		Returns 0 if operation fails




//***************************************
//***     GUICheckbox Description     ***
//***************************************
// Used to create a checkbox 

// int 	CreateGUICheckbox(x#, y#, img$, leg$)
//    	Positions checkbox at (x#,y#)
//    	If an image name is
//    	supplied (img$) it is used to create
//    	the two frames of the checkbox graphic.
//    	If img$ blank, a default image is created
//    	leg$ text is shown to right of graphic
//   	 Returns the ID assigned to the button 

// int	DeleteGUICheckbox(id)
//    	Deletes checkbox whose ID is id
//		Returns 1 if successful
//		Returns 0 if id invalid

// int	GetGUICheckboxExists(id)
//		Returns 1 if checkbox with ID "id" exists
//		Returns 0 if the checkbox does not exist
	
// int 	GetGUICheckboxState(id)
//    	Returns the checkbox's current frame (1,2)
//		Returns 0 if checkbox is disabled
//		Returns -1 if id is invalid

// int 	HandleGUICheckbox(id)
//	  	Switch between checked/unchecked graphic
//	  	when graphic or text clicked
//    	Returns the number of the frame shown
//		Returns 0 if checkbox disabled, invalid, or not clicked
	
// int 	SetGUICheckboxDepth(id, lay)
//     	Sets checkbox layer to lay
//     	Returns 1 if successful 
//		Returns 0 if operation fails

// int 	SetGUICheckboxEnabled(id,f)
//     	Enables (f=1)/disables(f=0) checkbox
//	   	Returns 1 if successful 
//		Returns 0 if opertion fails
	
// int	SetGUICheckboxPosition(id, x#, y#)
//	  	Repositions checkbox to (x#,y#)
//		Returns 1 if successful
//		Returns 0 if id is invalid
	
// int	SetGUICheckboxState(id, s)
//		Sets the checkbox frame showing to s (1 or 2)
//		Returns 1 if successful
//		Returns 0 if id is invalid
	
// int	SetGUICheckboxTextAlignment(id, al)
//    	Changes checkbox's text alignment to al
//		(0:left, 1:centre, 2:right)
//		Returns 1 if successful
//		Returns 0 if command is invalid
	
// int	SetGUICheckboxTextColor(id, col)
//   	Changes checkbox's text colour to col
//		Returns 1 if successful
//		Returns 0 if id is invalid

// int	SetGUICheckboxTextSize(id, sz#)
//    	Changes checkbox's text size to sz#
//		Returns 1 if successful
//		Returns 0 if id is invalid




//***************************************
//***   GUIColorPicker Description    ***
//***************************************
//Used to select a colour from an image
//Only one ColorPicker widget can exist
	
// 		CreateGUIColorPicker(x#, y#, w#, h#, img$)
//		Creates a ColorPicker widget at (x#,y#)
//		Dimensions: w# by h#
//		Sprite created shows image img$ or a
//		default image

// int	DeleteGUIColorPicker()
//		Deletes the existing ColorPicker visuals
//		and allows a new ColorPicker to be
//		created
//		Returns 1 if successful
//		Returns 0 if operation fails (no ColorPicker exists)
	
// int	GetGUIColorPickerBlue()
//		Returns the blue component of the colour
//		last picked.
//		Returns -1 if operation fails
	
// int	GetGUIColorPickerExists()
//		Returns 1 if a ColorPicker currently exists
//		Returns 0 if no ColorPicker exists
	
// int 	GetGUIColorPickerGreen()
//		Returns the green component of the colour
//		last picked.
//		Returns -1 if operation fails
	
// int 	GetGUIColorPickerRed()
//		Returns the red component of the colour
//		last picked.
//		Returns -1 if operation fails
	
// int	HandleGUIColorPicker()
//		Detects user mouse click over ColorPicker
//		and returns the colour selected (0XFFBBGGRR)
//		This is the colour format used by some
//		AGK commands
//		Returns -1 is none selected or invalid

// int	SetGUIColrPickerDepth(ly)
//		Redraws ColorPicker at depth ly
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int 	SetGUIColorPickerPosition(x#,y#)
//		Redraws ColorPicker at (x#,y#)
//		Returns 1 if successful
//		Returns 0 if operation fails





//***************************************
//***     GUIDialogBox Description    ***
//***************************************
// Used to create a dialog box with at
// least one button
// Only one DialogBox can exist               

//int CreateGUIDialogBox(x#, y#, w#, h#, img$, leg$, buts$, buttxt$)
//   	Creates a dialog box with top-left at (x#,y#)
//   	dimensions w# by h#. If img$ not empty it is
//  		assumed to be a file name which is used to
//   	create the dialog box image. If img$ = ""
//   	a default white image is used with the text in leg$
//   	displayed near the top of the dialog box.
//   	buts$ specifies the image fienames for the buttons 
//   	to be used in the dialog box. Each name is separated
//   	by a pipe (|) character. If but$ is empty, buttxt$
//		is used to create text in each default button. |
//		separates each button's text. 

//int AddButtonsToGUIDialog(bimg$, btxt$)
//		Adds one or more buttons to the dialog box
//		bimg$ is string with file names | separated
//		btxt$ is string of button texts | separated
//		Returns 1 if successful
//		Returns 0 if the operation fails

//int GetGUIDialogBoxExists()
//		Returns 1 if a DialogBox exists
//		Returns 0 if no DialogBox exists

//int HandleGUIDialogBox()
//   	Returns the number of the button pressed
//   	within the dialog box and deletes all
//   	the resources associated with the box
//		Returns 0 if no DialogBox exists or no button selected

//int SetGUIDialogBoxButtonPosition(num, x#, y#)
//    	Repositions top-left corner of
//    	button number num to (x#,y#). 
//    	Returns 1 if successful
//		Returns 0 if the operation fails

//int SetGUIDialBoxButtonSize(num, w#,h#)
//    	Resizes button number num to w# by h#
//  		Returns 1 if successful
//		Returns 0 if the operation fails





//***************************************
//***     GUIDropDown Description     ***
//***************************************
//Used to create an edit-type box where the
//contents is selected from a drop-down list


// int 	CreateGUIDropDown(x#, y#, op$, dwnimg$, lstimg$)
//    	Positions dropdown at (x#,y#) (size automatic)
//    	op$ contains the values to appear in list(| separated)
//    	dwnimg$ is the filename of down button image
//    	lstimg$ is the filename of the list background image
//    	If lstimg$ blank, a default image is created
//   	Returns the ID assigned to the button 

// int	DeleteGUIDropDown(id)
//    	Deletes DropDown whose ID is id
//		Returns 1 if successful
//		Returns 0 if id invalid
	
// int 	GetGUIDropDownEnabled(id)
//    	Returns 1 if checkbox enabled
//		Returns 0 if checkbox is disabled
//		Returns -1 if id is invalid

// int	GetGUIDropDownExists(id)
//		Returns 1 if DropDown with ID "id" exists
//		Returns 0 if DropDown does not exist

// str	GetGUIDropDownValue(id)
//		Returns value in field
//		Returns empty string if DropDown does not exist

// int 	HandleGUIDropDown(id)
//	  	Shows dropdown list when down button clicked
//		Allows selection from the dropdown list (appears in field)
//    	Returns 1 if successful
//		Returns 0 if DropDown disabled, invalid, or not clicked
	
// int 	SetGUIDropDownBorderColor(id, col)
//     	Sets DropDown border colour to col
//     	Returns 1 if successful 
//		Returns 0 if operation fails
	
// int 	SetGUIDropDownDepth(id, lay)
//     	Sets DropDown layer to lay
//     	Returns 1 if successful 
//		Returns 0 if operation fails

// int 	SetGUIDropDownEnabled(id,f)
//     	Enables (f=1)/disables(f=0) DropDown
//	   	Returns 1 if successful 
//		Returns 0 if opertion fails
	
// int 	SetGUIDropDownFieldColor(id, col)
//     	Sets DropDown field colour to col
//     	Returns 1 if successful 
//		Returns 0 if operation fail
	
// int	SetGUIDropDownPosition(id, x#, y#)
//	  	Repositions DropDown to (x#,y#)
//		Returns 1 if successful
//		Returns 0 if id is invalid






//***************************************
//***      GUIFrame Description       ***
//***************************************
//Used to create a frame which can contain other widgets

// int	CreateGUIFrame(x#,y#,w#,h#,img$)
//		Creates a rectangular frame with dimensions w# 
//		by h# with its top-left corner at (x#,y#).
//		Frame is filled with sprite showing image img$
// 		If img$ is an empty string, frame is white.
//		Returns ID of frame

// int	AddButtonToGUIFrame(frm,x#,y#,w#,h#,img$,leg$)
//		Adds a GUIButton to frame frm. The button (w# by
//		h# size) showing image img$ and text leg$, will be 
//		positioned at (x#,y#). This position is relative to the 
//		top-left corner of the frame.
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	AddCheckboxToGUIFrame(frm,x#,y#,w#,img$,txt$)
//		Adds a GUICheckbox to frame frm. The checkbox 
//		displays image img$ and text txt$ and will be 
//		positioned at  (x#,y#). Width: w# (height automatic)
//		Position is relative to top-left corner of frame.	
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	AddColorPickerToGUIFrame(frm,x#,y#,w#,h#,img$)
//		Adds a GUIColorPicker to frame frm. The picker
//		displays image img$ and placed at (x#,y#). 
//		Position is relative to top-left corner of frame.	
//		Size: w# by h#
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	AddDropDownToGUIFrame(frm,x#,y#,ops$,img1$,img2$)
//		Adds a GUIDropdown to frame frm. The dropdown
//		is placed at (x#,y#) - relative to top-left of frame. 
//		Dropdown list contains op$ (| separated)
//		Drop button shows img1$; list backround: img2$
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	AddEditBoxToGUIFrame(frm,x#,y#,w#,h#)
//		Adds a Editbox to frame frm. The editbox
//		is placed at (x#,y#) - relative to top-left of frame. 
//		Dimensions w# by h#
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	AddKeyPadToGUIFrame(frm,x#,y#,k$,kw#,kr,img$)
//		Adds a GUIKeyPad to frame frm. The keypad
//		is placed at (x#,y#) - relative to top-left of frame. 
//		Keys displayed given in k$ (| separated use .. for seq)
//		Key width: kw#, Keys per row:kr, Key image: img$
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	AddRadioButtonToGUIFrame(frm,x#,y#,img$,leg$,grp)
//		Adds a GUIRadioButton to frame frm. The radio 
//		button is assigned to group grp.
//		It displays image img$ (2 frames) and text leg$
//		Positioned at (x#,y#) relative to the 
//		top-left corner of the frame.
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	AddSpinnerToGUIFrame(frm,x#,y#,w#,h#,img$)
//		Adds a GUISpinner to frame frm. 
//		Position: (x#,y#) - relative to top-left of frame. 
//		Size: w# by h#
//		Spinner buttons use image "up"+img$ and "down"+img$
//		(Can handle path info in img$)
//		Returns 1 if successful
//		Returns 0 if operation fails

// int	AddSpriteToGUIFrame(frm,x#,y#,w#,h#,img$)
//		Adds a sprite to frame frm. Sprite size is w# by #h with 
//		its top-left at (x#,y#) relative to top-left of frame.
//		The sprite displays image img$.
//		Returns 1 if successful
//		Returns 0 if operation fails

// int	AddTextToGUIFrame(frm,x#,y#,sz#,txt$,col, al)
//		Adds a text resource to frame frm. The text resource 
//		will contain the string txt$ with characters of 
//		size sz# and colour col. Text alignment:al
//		The text will be positioned at (x#,y#). This position is 
//		relative to the top-left corner of the frame.
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	DeleteGUIFrame(frm)
//		Deletes frame frm and all of its contents.
//		Returns 1 if successful 	
//		Returns 0 if operation fails
	
// int	GetGUIFrameElementDetails(frm,post)
//		Returns restype value(widget type code)
//		 * 100000 + id value from contents[post]

// int	GetGUIFrameExists(frm)
//		Returns 1 if frame frm exists
//		Returns 0 if frm does not exist
	
// int	GetGUIFrameHeight(frm)
//		Returns height of frame frm
//		Returns -1 if frm does not exist
	
// int	GetGUIFrameWidth(frm)
//		Returns width of frame frm
//		Returns -1 if frm does not exist
	
// int	GetGUIFrameX(frm)
//		Returns x-coord of frame frm
//		Returns -1 if frm does not exist
	
// int	GetGUIFrameY(frm)
//		Returns y-coord of frame frm
//		Returns -1 if frm does not exis

// int	HandleGUIFrame(frm)
//		Calls the handle function for each widget within frame frm.
//		post is set to the subscript in contents of any widget 
//		that has been activated by the user.
//		If no widget has been activated, post is set to zero.
	
// int	SetGUIFrameDepth(frm,lay)
//		Redraws frame frm & its contents on depth lay.
//		Returns 1 if operation successful 	
//		Returnse 0 operation fails

// int	SetGUIFramePosition(frm,x#,y#)
//		Moves top-left corner of frame frm to (x#,y#). The contents 
//		of the frame are also moved, retaining their relative 
//		positions within the frame.
//		Returns 1 if operation successful 
//		Returns 0 if operation fails




	
//***************************************
//***     GUIKeyPad Description       ***
//***************************************
//Creates a keypad of specified keys which 
//can be used for user input. Creates a 
//buffer area and last-entry area


// int	CreateGUIKeyPad(x#,y#,k$,kw#,kr,img$)
//		Creates a GUIKeyPad. The keypad is
//		placed at (x#,y#) 
//		Keys displayed given in k$ (| separated use .. for seq)
//		Key width: kw#, Keys per row:kr, Key image: img$
//		Returns 1 if successful
//		Returns 0 if operation fails

// str	GetGUIKeyPadBuffer()
//		Returns contents of keypad buffer
//		Returns empty string if op fails

// int	GetGUIKeyPadEnabled()
//		Returns 1 if keypad enabled
//		Returns 0 if keypad disabled
	
// str	GetGUIKeyPadEntry()
//		Returns the last keypad entry	
//		(Entry made when Enter pressed)
//		Returns empty string if op fails
	
// int	GetGUIKeyPadExists()
//		Returns 1 if keypad exists
//		Returns 0 if keypad does not exist
	
// int	HandleGUIKeyPad()
//		Accepts user presses on keys
//		Builds up buffer. Buffer to last-entry
//		when Enter pressed (buffer emptied)
//		Returns 2 if Enter pressed
//		Returns 1 if other key pressed
//		Returns 0 if no key pressed/fail
	
// int	SetGUIKeyPadDepth(ly)
//		Redraws keypad on layer ly
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int 	SetGUIKeyPadEnabled(fl)
//		Enables(fl=1)/disables(fl=0) keypad
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int 	SetGUIKeyPadKeysEnabled(k$, fl)
//		Enables(fl=1)/disables(fl=0) keys
//		specified by k$ (| separated/.. sequence)
//		Returns 1 if successful
//		Returns 0 if operation fails
	

// int	SetGUIKeyPadPosition(x#,y#)
//		Redraws keypad at (x#,y#)
//		Returns 1 if successful
//		Returns 0 if operation fails	







//***************************************
//***     GUIPopUpMenu Description    ***
//***************************************
//Used to create a popup menu. Draws on layer 0

// int	CreateGUIPopUpMenu(ops$, img$)
//		Creates a sequence of hidden , 
//		off-screen vertical GUIButtons 
//		ops$ contains menu options (| separated)
//		Each entry: text,value
//		img$ is button background image

// int	DeleteGUIPopUpMenu(id)
//		Deletes menu id
//		Returns 1 if successful
//		Returns 0 if operation fails	
	
// int	GetGUIPopUpEnabled(id)
//		Returns 1 if popup enabled
//		Returns 0 if popup disabled
//		Returns -1 if operation fails
	
// int	GetGUIPopUpExists(id)
//		Returns 1 if popup exists
//		Returns 0 if popup does not exist

// int	HandleGUIPopUpMenu(id)
//		Returns the number of the option selected
//		Returns 0 if operation fails

// int 	SetGUIPopUpEnabled(id, fl)
//		Enables(fl=1)/disables(fl=0) popup
//		Disabled popup moved off-screen
//   	and invisible
//		Returns 1 if successful
//		Returns 0 if operation fails
	

// int	SetGUIPopUpPosition(id, x#,y#)
//		Redraws popup at (x#,y#)
//		Returns 1 if successful
//		Returns 0 if operation fails
	
	
	
	
	
//***************************************
//***   GUIRadioButton Description    ***
//***************************************
//Used to create a radio buttons. A RB's ID
//is a combination of its group and position
//in the group (id = grp*100+idx)

// int	CreateGUIRadioButton(x#,y#,w#,img$,leg$,grp) 	
//		Positions radio button at (x#,y#)
//		Width of graphic: w# (height automatic)
//		Radio button uses file img$ as two-framed 
//		sprite for unselected/selected options
//		leg$ text is shown to right of graphic
//		Radio button belongs to group grp
//		Returns the ID assigned to the radio button

// int	DeleteGUIRadioButtonGroup(grp)
//		Deletes all RBs in group grpp
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	GetGUIRadioButtonExists(id)
//		Returns 1 if RB exists
//		Returns 0 if RB does not exist
	
// int	GetGUIRadioButtonSelectedInGroup(grp)	
//		Returns the number of the currently
//		selected RB in group grp
//		Returns -2 if operation fails
//		Returns -1 if group contains no RBs

// int	HandleGUIRadioButtonGroup(grp)
//		Selects RB clicked on
//		all other RBs in group deselected
//		Returns 1 if RB clicked
//		Returns 0 if operation fails/no click

// int	SelectGUIRadioButton(id)
//		Calcs grp and idx from id
//		Selects RB idx in group grp
//		All other RB in group deselected
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	SetGUIRadioButtonDepth(grp, lay)
//		Adjust depth of all radio buttons
//		in group grp to be lay
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	SetGUIRadioButtonEnabled(id,fl)
//		Calcs grp and idx from id
//		En(fl=1)/dis(fl=0)ables RB idx in group grp
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	SetGUIRadioButtonGroupEnabled(grp,fl)
//		En (fl=1)/dis(fl=0)ables every RB in grp
//		Returns 1 if successful
//		Returns 0 if operation fails

// int	SetGUIRadioButtonPosition(id, x#, y#)
//		Redraws RB id at (x#,y#)
//		Returns 1 if successful
//		Returns 0 if operation fail
	
// int	SetGUIRadioButtonTextAlignment(id, al)
//    	Changes RB's text alignment to al
//		(0:left, 1:centre, 2:right)
//		Returns 1 if successful
//		Returns 0 if command is invalid
	
// int	SetGUIRadioButtonTextColor(id, col)
//   	Changes RB's text colour to col
//		Returns 1 if successful
//		Returns 0 if id is invalid

// int	SetGUIRadioButtonTextSize(id, sz#)
//    	Changes RB's text size to sz#
//		Returns 1 if successful
//		Returns 0 if id is invalid





//***************************************
//***      GUISpinner Description      ***
//***************************************
// int	CreateGUISpinner(x#,y#,w#,h#,min,max,f$)
//		Creates a Spinner object at (x#,y#)
//		Dimensions: w# by h#
//		Button images: "up"+f$ and "down"+f$
//		(handles path info in f$)
//		Range min to max (inclusive)
//		Returns ID of Spinner

// int	DeleteGUISpinner(id)
//		Deletes Spinner id
//		Returns 1 if successful
//		Returns 0 if id is invalid
	
// int	GetGUISpinnerEnabled(id)
//		Returns 1 if Spinner enabled
//		Returns 0 if Spinner disabled
//		Returns -1 if id invalid

// int	GetGUISpinnerExists(id)
//		Returns 1 if Spinner id exists 
//		Returns 0 is Spinner does not exist
	
// int 	GetGUISpinnerValue(id)
//		Returns current value of Spinner
//		Returns min-1 if invalid id
	
// int	HandleGUISpinner(id)
//		Changes current value in response
//		to button clicks (+/- increment)
//		Stays within the range min/max
//		Returns 1 if successful
//		Returns 0 if operation fails

// int	SetGUISpinnerBorderColor(id, col)
//		Sets border to colour col
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	SetGUISpinnerDepth(id,ly)
//		Redraws Spinner on layer ly
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	SetGUISpinnerEnabled(id, f)
//		Sets spinner state to f
//		f=1:spinner enabled
//		f=0:spinner disabled (50% opacity)
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	SetGUISpinnerFieldColor(id, col)
//		Sets field area to col
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	SetGUISpinnerLimits(id, min, max)
//		Sets the spinner's range to min to max
//		If current value outside new range,
//		current value changed to min or max 
//		as appropriate.
//		Returns: 
//			 0:op not performed
//			 1:op performed, current value unchanged
//			-2:op performed, currnt value to min
//			-1:op performed, current value to max

// int	SetGUISpinnerPosition(id,x#,y#)
//		Moves existing spinner to (x#,y#)
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	SetGUISpinnerSize(id,w#,h#)
//		Resize spinner to w# by h#
//		All elements of spinner resized
//		Returns 1 if successful
//		Returns 0 if operation fails

// int	SetGUISpinnerValue(id, v)
//		Sets current value to v if valid command
//		If v outside , returns -1
//		Returns 1 if successful
//		Returns 0 if id invalid
//		Returns -1 v outside range min/max range





//***************************************
//***    GUIStopwatch Description     ***
//***************************************
// int	CreateGUIStopwatch(x#,y#,w#,h#,f$)
//		Creates a Stopwatch object at (x#,y#)
//		Dimensions w# by h#
//		f$ split into path$ and file$
//		Watch images: 
//			face:path$+file$
//			start/stop:path$+Left(file$,Len(file$)-4)+"ss"+Right(file$,4)
//			reset:path$+Left(file$,Len(file$)-4)+"reset"+Right(file$,4)
//			hand:path$+Left(file$,Len(file$)-4)+"hand"+Right(file$,4)
//		Returns ID of Stopwatch

// int	DeleteGUIStopwatch(id)
//		Deletes Stopwatch id's elements
//		Returns 1 if successful
//		Returns 0 if id is invalid
	
// int	GetGUIStopwatchExists(id)
//		Returns 1 if Stopwatch id exists
//		Returns 0 if Stopwatch id does not exist
	
// int	GetGUIStopwatchResetEnabled(id)
//		Returns 1 if Stopwatch id's reset button enabled
//		Returns 0 if the button is disabled
//		Returns -1 if operation fails
	
// int	GetGUIStopwatchStartEnabled(id)
//		Returns 1 if Stopwatch id's start/stop button enabled
//		Returns 0 if the button is disabled
//		Returns -1 if operation fails
	
// int	GetGUIStopwatchState(id)
//		Returns 1 if watch is ticking
//		Returns 0 if watch is stopped
//		Returns -1 if operation fails
	
// int	GetGUIStopwatchTime(id)
//		Returns watch's elapsed time (msecs)
//		Returns -1 if operation fails

// int	HandleGUIStopwatch(id)
//		Reacts to user click on watch buttons
//		if they are enabled. Can stop/start
//		and reset watch
//		Returns -1 if watch stopped
//		Returns 0 if no user input/fail
//		Returns 1 if watch started
//		Returns 2 if watch reset
	
// int	ResetGUIStopwatch(id)
//		Resets watch time to 0:00
//		Returns 1 if successful
//		Returns 0 if operation fails

// int	SetGUIStopwatchControls(id,fl)
//		if fl 1 enables start/stop, disables reset
//		if fl 2 enables reset, disables start/stop
//		if fl 3 enables both buttons
//		if fl 0 disables both buttons
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	SetGUIStopwatchDepth(id,ly)
//		Redraws watch at depth ly
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	SetGUIStopwatchPosition(id,x#,y#)
//		Repositions watch at (x#,y#)
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	SetGUIStopwatchSize(id, w#, h#)
//		Resizes watch to w# by h#
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	StartGUIStopwatch(id)
//		Starts watch ticking.
//		Resumes from time already showing
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	StopGUIStopwatch(id)
//		Stops watch ticking. Stays at
//		current time setting
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	UpdateGUIStopwatch(id)
//		Updates time displayed
//		(call this function on each frame)
//		Returns 1 if successful
//		Returns 0 if operation fails
	
	



//***************************************
//***  GUITrafficLights Description   ***
//***************************************
// int	CreateGUITrafficLights(x#,y#,w#,g$)	
//		Creates TrafficLights at (x#,y#)
//		Width : w#, Height: (auto)
//		Image g$ (four vertical frames)
//		Returns TrafficLight ID

// int	DeleteGUITrafficLights(id)
//		Deletes lights id. 
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	FixGUITrafficLightsToScreen(id, fl)
//		Fixes size & position of lights on screen (fl = 1)
//		(stops view-offset and zoom effects)
//		Release fix (fl = 0)
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	GetGUITrafficLightsEnabled(id)
//		Returns 1 if TrafficLights enabled
//		Returns 0 if TrafficLights disabled
//		Returns -1 if operation fails
	
// int	GetGUITrafficLightsExists(id)
//		Returns 1 if TrafficLights id exist
//		Returns 0 if TrafficLights id do not exist
	
// int	GetGUITrafficLightsState(id)
//		Returns number of displayed frame (1,2 or3)
// 		Returns -1: if TrafficLights id do not exist 
//		Returns 0 if TrafficLights id disabled
	
// int	HandleGUITrafficLights(id)
//		Click on widget moves to next frame
//		Returns 1 if clicked
//		Returns 0 if no click/invalid
	
// int	SetGUITrafficLightsColor(id, cf)
//		Sets frame displayed to cf. 
//		Returns 1 if successful
//		Returns 0 if operation fails

// int	SetGUITrafficLightsDepth(id,ly)
//		Redraws lights at depth ly
//		Returns 1 if successful
//		Returns 0 if operation fails
	
// int	SetGUITrafficLightsEnabled(id, fl)		
//		Disables(fl=0) TrafficLights
//		Enables(fl=1) TrafficLights
//		Returns 1 if successful
//		Returns 0 if operation fails

// int	SetGUITrafficLightsPosition(id,x#,y#) 
//		Moves TrafficLights to (x#,y#)
//		Returns 1 if successful
//		Returns 0 if operation fails



//***************************************
//***          GUIButton Code         ***
//***************************************
type ButtonType
	img		as integer		//ID of image used
	spr		as integer		//ID of sprite used
	state	as integer		//Button state (-1,0,1,2,3)
endtype 

global GUIButtons as ButtonType[0]


//*** Creates a button at (x,y) dimensions (w by h) ***
//*** Uses image/default image and overlays legend  ***
function CreateGUIButton(x as float, y as float, w as float, h as float, image as string, legend as string)
	//*** If image and legend empty, exit -1 ***
	if image = "" AND legend = ""
		exitfunction 0
	endif
	//*** Add cell to button list ***
	GUIButtons.length = GUIButtons.length+1
	//*** Last position in array is new button’s ID ***
	id = GUIButtons.length
	//*** If no text, load image, else build button image ***		
	if legend = ""
		//*** Load image ***
		GUIButtons[id].img = LoadImage(image)
		//*** Create sprite with image ***
		GUIButtons[id].spr = CreateSprite(GUIButtons[id].img)
		//*** Convert to an animated sprite (3 frames) ***
		SetSpriteAnimation(GUIButtons[id].spr, GetImageWidth(GUIButtons[id].img),GetImageHeight(GUIButtons[id].img)/3,3)
	else
		result = BuildDefaultGUIButton(w,h,image,legend)
		GUIButtons[id].spr = result
	endif
	//*** Show first frame ***
	SetSpriteFrame(GUIButtons[id].spr,1)
	//*** Size sprite ***
	SetSpriteSize(GUIButtons[id].spr,w,h)
	//*** Position Sprite ***
	SetSpritePosition(GUIButtons[id].spr,x,y)
	//*** Draw on layer 5 ***
	SetSpriteDepth(GUIButtons[id].spr,5)
	//*** Mouse not over ***
	GUIButtons[id].state = 1
	//*** Unaffected by offset and zoom ***
	FixSpriteToScreen(GUIButtons[id].spr,1)
endfunction id

//*** Marks button's state as deleted (-1) ***
//*** and deletes visual elements. 		***
//*** Returns 1 if successful 			***                
function DeleteGUIButton(id as integer)
	//*** If id invalid, exit ***
	if NOT GetGUIButtonExists(id)
		exitfunction 0
	endif
	//*** Set to deleted ***
	GUIButtons[id].state = -1
	//*** Delete visual elements ***
	DeleteSprite(GUIButtons[id].spr)
	DeleteImage(GUIButtons[id].img)
endfunction 1


//*** Returns button enabled status ***
//*** Returns -1 if invalid ID      ***
function GetGUIButtonEnabled(id as integer)
	//*** If invalid id, exit -1 ***
	if NOT GetGUIButtonExists(id)
		exitfunction -1
	endif
	if GUIButtons[id].state > 0
		result = 1
	else
		result = 0
	endif
endfunction result


//*** Returns 1 if button with ID "id" exists ***
function GetGUIButtonExists(id as integer)
	//*** If id invalid, result is zero ***
	if id < 1 OR id > GUIButtons.length 
		result = 0
	elseif GUIButtons[id].state = -1
		result = 0
	else
		result = 1
	endif
endfunction result


//*** Returns button visibility status ***
//*** Returns -1 if invalid ID      ***
function GetGUIButtonVisible(id as integer)
	//*** If invalid id, exit -1 ***
	if NOT GetGUIButtonExists(id)
		exitfunction -1
	endif
	//*** If button visible, result = 1 ***
	if  GetSpriteColorAlpha(GUIButtons[id].spr) > 0
		result = 1
	else
		result = 0
	endif
endfunction result


//*** Get buttons x-coord ***
function GetGUIButtonX(id as integer)
	//*** If id invalid, exit -1 ***
	if NOT GetGUIButtonExists(id)
		exitfunction -1
	endif
	result as float: result = GetSpriteX(GUIButtons[id].spr)
endfunction result


//*** Get buttons y-coord ***
function GetGUIButtonY(id as integer)
	//*** If id invalid, exit -1 ***
	if NOT GetGUIButtonExists(id)
		exitfunction -1
	endif
	result as float: result = GetSpriteY(GUIButtons[id].spr)
endfunction result


//*** Changes button's visual according to the position of  ***
//*** the mouse pointer and the mouse left button           ***
//*** Returns 1 if mouse click over button, else zero       ***
function HandleGUIButton(id as integer)
	//*** If id invalid, exit ***
	if NOT GetGUIButtonExists(id)
		exitfunction 0
	endif
	//*** If button disabled, exit ***
	if GUIButtons[id].state = 0
		exitfunction 0
	endif
	//*** Assume button not pressed ***
	result = 0
	//*** If pointer over button ...
	hit = GetSpriteHit(ScreenToWorldX(GetPointerX()),ScreenToWorldY(GetPointerY()))
	if GetSpriteHit(ScreenToWorldX(GetPointerX()),ScreenToWorldY(GetPointerY())) = GUIButtons[id].spr
		//*** If in state 1, go to state 2
		if GUIButtons[id].state = 1
			GUIButtons[id].state = 2
		endif
		//*** If pointerPressed and in state 2, go to state 3 ***
		if GetPointerPressed() AND GUIButtons[id].state = 2
			GUIButtons[id].state = 3
		endif				
		//*** IF mouse released and in state 3 THEN ***
		if GetPointerReleased() AND GUIButtons[id].state = 3	
			//*** Change to state 2 and return 1 ***
			GUIButtons[id].state = 2
			result = 1
		endif
	else	// mouse not over,set to state 1
		GUIButtons[id].state = 1
	endif
	//*** Set sprite to correct frame ***
	SetSpriteFrame(GUIButtons[id].spr,GUIButtons[id].state)
endfunction result


//*** Sets button’s depth. Returns 1 if successful ***
function SetGUIButtonDepth(id as integer, layer as integer)
	//*** If id invalid, exit ***
	if NOT GetGUIButtonExists(id)
		exitfunction 0
	endif
	//*** If layer invalid, exit ***
	if layer < 0 or layer > 10000
		exitfunction 0
	endif
	//*** Adjust button’s depth ***
	SetSpriteDepth(GUIButtons[id].spr, layer)
endfunction 1



//*** Enables/disables button. Returns 1 if successful ***
function SetGUIButtonEnabled(id as integer, flag as integer)
	//*** If invalid parameters, exit 0 ***
	if NOT GetGUIButtonExists(id) OR (flag <> 0 AND flag <> 1)
		exitfunction 0
	endif
	//*** Set state and adjust transparency ***
	GUIButtons[id].state = flag
	if GetGUIButtonVisible(id)
		SetSpriteColorAlpha(GUIButtons[id].spr,128+128*flag)
	endif
endfunction 1


//*** Repositions button. Returns 1 if successful ***
function SetGUIButtonPosition(id as integer, x as float, y as float)
	//*** If id invalid, exit 0 ***
	if NOT GetGUIButtonExists(id)
		exitfunction 0
	endif
	//*** Reposition button ***
	SetSpritePosition(GUIButtons[id].spr,x,y)
endfunction 1


//*** Resizes button. Returns 1 if successful ***
function SetGUIButtonSize(id as integer, w as float, h as float)
	//*** If id invalid, exit ***
	if NOT GetGUIButtonExists(id)
		exitfunction 0
	endif
	//*** Resize button ***
	SetSpriteSize(GUIButtons[id].spr,w,h)
endfunction 1


//*** Makes button visible/invisible. Returns 1 if successful ***
function SetGUIButtonVisible(id as integer, flag as integer)
	//*** If invalid parameters, exit 0 ***
	if NOT GetGUIButtonExists(id) OR (flag <> 0 AND flag <> 1)
		exitfunction 0
	endif
	//*** If to be invisible, alpha = 0 ***
	if flag = 0
		SetSpriteColorAlpha(GUIButtons[id].spr,0)
	else
		SetSpriteColorAlpha(GUIButtons[id].spr,128+127*GetGUIButtonEnabled(id))
	endif
endfunction 1

//**************************************
//***   GUIButton helper function    ***
//**************************************

//*** Creates a button sprite using either a specified image    ***
//*** overlaid with text or a default grey image overlaid with  ***
//*** with text. Returns ID of button sprite created            ***
function BuildDefaultGUIButton(w as float, h as float, image as string, legend as string)
	//*** If image specified *** 
	if image <> ""
		//*** Create sprite using image ***
		tempimg = LoadImage(image)
		if Mod(GetImageHeight(tempimg),3) <> 0
			Message("Image height not divisible by 3")
			exitfunction 0
		endif
		tempspr = CreateSprite(tempimg)
		SetSpriteAnimation(tempspr,GetImageWidth(tempimg), GetImageHeight(tempimg)/3,3)
		//*** Set size of sprite ***
		SetSpriteSize(tempspr,w,h)
		if h = -1
			h = GetSpriteHeight(tempspr)
		endif
	else
		//*** Else create blank image sprite ***
		if h = -1
			h = w*0.5
		endif
		//** Create white sprite **
		tempspr = CreateSprite(0)
		//** Set size of sprite **
		SetSpriteSize(tempspr,w,h)
		//*** Change from white to grey ***
		SetSpriteColor(tempspr,200,200,200,255)
	endif
	//*** Position text on each frame area ***
	//** First text **
	txt1 = CreateText(legend)
	SetTextSize(txt1,3)
	//*** Resize to fit button ***
	while GetTextTotalWidth(txt1) > w*0.95
		SetTextSize(txt1, GetTextSize(txt1)*0.95)
	endwhile
	//*** Centre align ***
	SetTextAlignment(txt1,1)
	//*** Grey text ***
	SetTextColor(txt1,80,80,80,255)
	//*** Positon text in first button area ***
	adj as float
	adj = GetSpriteHeight(tempspr) - GetTextTotalHeight(txt1)
	SetTextPosition(txt1,w/2,adj/2.0)
	//***Grab first frame ***
	ClearScreen()
	DrawSprite(tempspr)
	DrawText(txt1)
	img1 = GetImage(0,0,w,h)
	ClearScreen()
	if image <> ""
		SetSpriteFrame(tempspr,2)
	endif
	//*** Second copy of text (black) over second button ***
	SetTextColor(txt1,0,0,0,255)
	ClearScreen()
	DrawSprite(tempspr)
	DrawText(txt1)
	img2 = GetImage(0,0,w,h)
	ClearScreen()
	if image <> ""
		SetSpriteFrame(tempspr,2)
	endif
	//*** Third copy of text (black) over third button ***
	SetTextColor(txt1,255,255,0,255)
	ClearScreen()
	DrawSprite(tempspr)
	DrawText(txt1)
	img3 = GetImage(0,0,w,h)
	ClearScreen()
	result = CreateSprite(img1)
	SetSpriteAnimation(result,GetImageWidth(img1), GetImageHeight(img1),1)
	AddSpriteAnimationFrame(result,img2)
	AddSpriteAnimationFrame(result,img3)
	//*** Delete elements used ***
	DeleteSprite(tempspr)
	DeleteImage(tempimg)
	DeleteText(txt1)
endfunction result



//***************************************
//***     GUICheckbox functions       ***
//***************************************
type CheckboxType
	img		as integer	//ID of image in sprite
	spr		as integer	//ID of sprite used
	txt		as integer	//ID of associated text
	state 	as integer	//-1:del,0:dis,1:frame 1,2: frame 2
	align	as integer	//1:text right of graphic; 2: left of graphic
endtype 

global GUICheckboxes as CheckboxType[0]


//*** Creates a checkbox at position (x,y) ***
//*** Constructed from image + legend      ***
//*** If no file name, use default image   ***
function CreateGUICheckbox(x as float, y as float, w as float, image as string, legend as string)
	//*** Add cell to check box list ***
	GUICheckboxes.length = GUICheckboxes.length+1
	//*** Last position in array is new button’s ID ***
	id = GUICheckboxes.length
	//*** If image, load it ***
	if image <>""
		GUICheckboxes[id].img = LoadImage(image)
	else
		GUICheckboxes[id].img = BuildDefaultGUICheckbox()
	endif
	//*** Load image into sprite ***
	GUICheckboxes[id].spr = CreateSprite(GUICheckboxes[id].img)
	//*** Convert to an animated sprite 2 frames)***
	SetSpriteAnimation(GUICheckboxes[id].spr, GetImageWidth(GUICheckboxes[id].img), GetImageHeight(GUICheckboxes[id].img)/2,2)
	//*** Show first frame ***
	SetSpriteFrame(GUICheckboxes[id].spr,1)
	//*** Size sprite ***
	SetSpriteSize(GUICheckboxes[id].spr,w,-1)
	//*** Position sprite ***
	SetSpritePosition(GUICheckboxes[id].spr,x,y)
	//*** Place sprite on layer 5 ***
	SetSpriteDepth(GUICheckboxes[id].spr,5)
	//*** Create and position text ***
	GUICheckboxes[id].txt = CreateText(legend)
	SetTextSize(GUICheckboxes[id].txt,w+0.5)
	SetTextColor(GUICheckboxes[id].txt,0,0,0,255)
	adj as float
	adj = GetSpriteHeight(GUICheckboxes[id].spr)- GetTextTotalHeight(GUICheckboxes[id].txt)
	SetTextPosition(GUICheckboxes[id].txt,x+GetSpriteWidth(GUICheckboxes[id].spr)+w/4.0, y+adj/2.0 )
	SetTextDepth(GUICheckboxes[id].txt,5)
	//*** Checkbox active (frame 1) ***
	GUICheckboxes[id].state = 1
	//*** Align text right of graphic ***
	GUICheckboxes[id].align = 1
	//*** Unaffected by zoom and offset ***
	FixSpriteToScreen(GUICheckboxes[id].spr,1)
	FixTextToScreen(GUICheckboxes[id].txt,1)
endfunction id


//*** Marks a checkbox as deleted and deletes visual   ***
//*** elements                                         ***
//*** Returns 1 if successful, otherwise 0 is returned ***
function DeleteGUICheckbox(id)
	//*** IF invalid ID, exit ***
	if NOT GetGUICheckboxExists(id)
		exitfunction 0
	endif
	//*** Mark as deleted ***
	GUICheckboxes[id].state = -1
	//*** Delete visual elements ***
	DeleteSprite(GUICheckboxes[id].spr)
	DeleteImage(GUICheckboxes[id].img)
	DeleteText(GUICheckboxes[id].txt)
endfunction 1


//*** Returns 1 if checkbox with ID "id" exists ***
function GetGUICheckboxExists(id as integer)
	//*** If id invalid, exit ***
	if id < 1 OR id > GUICheckboxes.length
		result = 0
	elseif GUICheckboxes[id].state = -1
		result = 0
	else
		result = 1
	endif
endfunction result


//*** Returns the state of the checkbox                  ***
//*** 1: unchecked; 2: checked; 0:disabled -1:invalid id ***
function GetGUICheckboxState(id as integer)
	//*** If invalid ID, return 0 ***
	if NOT GetGUICheckboxExists(id)
		exitfunction -1
	elseif GUICheckboxes[id].state = 0
		exitfunction 0
	endif
	result = GetSpriteCurrentFrame(GUICheckboxes[id].spr)
endfunction result


//*** Switches the frame displayed by the checkbox ***
//*** and returns the number of the frame now      ***
//*** showing                                      ***
function HandleGUICheckbox(id as integer)
	//*** If invalid checkbox ID, exit ***
	if NOT GetGUICheckboxExists(id)
		exitfunction 0
	elseif GUICheckboxes[id].state = 0
		exitfunction 0
	endif
	result = 0
	//*** If pointer over checkbox ...
	if GetSpriteHit(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY())) = GUICheckboxes[id].spr OR GetTextHitTest(GUICheckboxes[id].txt,ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
		//*** ... and pointer pressed, change frame ***
		if GetPointerPressed()
			SetSpriteFrame(GUICheckboxes[id].spr,3 - GetSpriteCurrentFrame(GUICheckboxes[id].spr))
			result =  GetSpriteCurrentFrame(GUICheckboxes[id].spr)
		endif
	endif
endfunction result


//*** Sets the checkbox graphic and text depth to layer ***
function SetGUICheckboxDepth(id as integer, ly as integer)
	//*** IF invalid ID or depth, exit ***
	if NOT GetGUICheckboxExists(id) OR ly < 0 OR ly > 10000
		exitfunction 0
	endif
	//*** Set sprite depth ***
	SetSpriteDepth(GUICheckboxes[id].spr,ly)
	//*** Set text depth ***
	SetTextDepth(GUICheckboxes[id].txt,ly)
endfunction 1


//*** Enables/disables checkbox ***
function SetGUICheckboxEnabled(id as integer, fl as integer)
	//*** If invalid ID or fl value, exit 0 ***
	if NOT GetGUICheckboxExists(id) OR (fl <> 0 AND fl <> 1)
		exitfunction 0
	endif
	GUICheckboxes[id].state = fl
	SetSpriteFrame(GUICheckboxes[id].spr,1)
	SetSpriteColorAlpha(GUICheckboxes[id].spr,128 + 128*fl)
	SetTextColorAlpha(GUICheckboxes[id].txt,128+128*fl)
endfunction 1


//*** Repositions checkbox to (x,y) and returns 1 ***
//*** if successful, otherwise 0 is returned      ***
function SetGUICheckboxPosition(id as integer, x as float, y as float)
	//*** IF invalid ID, exit ***
	if NOT GetGUICheckboxExists(id)
		exitfunction 0
	endif
	//*** Position sprite ***
	SetSpritePosition(GUICheckboxes[id].spr,x,y)
	//*** Position text ***
	adj as float
	adj = GetSpriteHeight(GUICheckboxes[id].spr)- GetTextTotalHeight(GUICheckboxes[id].txt)
	if GUICheckboxes[id].align = 1
		SetTextPosition(GUICheckboxes[id].txt,GetSpriteX(GUICheckboxes[id].spr)+GetSpriteWidth(GUICheckboxes[id].spr)+1, GetSpriteY(GUICheckboxes[id].spr)+adj/2.0)
	else
		SetTextPosition(GUICheckboxes[id].txt,GetSpriteX(GUICheckboxes[id].spr)-1,GetSpriteY(GUICheckboxes[id].spr)+adj/2.0)
	endif
endfunction 1


//*** Changes Checkbox state to s ***
function SetGUICheckboxState(id as integer, s as integer)
	//*** IF invalid ID, exit ***
	if NOT GetGUICheckboxExists(id) OR s < 1 OR s > 2
		exitfunction 0
	endif
	SetSpriteFrame(GUICheckboxes[id].spr,s)
	GUICheckboxes[id].state = s
endfunction 1


//*** Sets alignment of checkbox’s text to al ***
function SetGUICheckboxTextAlignment(id as integer, al as integer)
	//*** IF invalid ID, exit ***
	if NOT GetGUICheckboxExists(id) OR (al <> 1 AND al <> 2)
		exitfunction 0
	endif
	//*** Set text alignment ***
	GUICheckboxes[id].align = al
	//*** Reposition text ***
	adj as float
	adj = GetSpriteHeight(GUICheckboxes[id].spr)- GetTextTotalHeight(GUICheckboxes[id].txt)
	if al = 1
		SetTextAlignment(GUICheckboxes[id].txt,0)
		SetTextPosition(GUICheckboxes[id].txt,GetSpriteX(GUICheckboxes[id].spr)+GetSpriteWidth(GUICheckboxes[id].spr)+1, GetSpriteY(GUICheckboxes[id].spr)+adj/2.0)
	else
		SetTextAlignment(GUICheckboxes[id].txt,2)
		SetTextPosition(GUICheckboxes[id].txt,GetSpriteX(GUICheckboxes[id].spr)-1,GetSpriteY(GUICheckboxes[id].spr)+adj/2.0)
	endif
endfunction 1


//*** Sets colour of checkbox’s text to col ***
function SetGUICheckboxTextColor(id as integer, col as integer)
	//*** IF invalid ID, exit ***
	if NOT GetGUICheckboxExists(id)
		exitfunction 0
	endif
	//*** Set text colour ***
	SetTextColor(GUICheckboxes[id].txt,(col&&0xFF0000)>>16,(col&&0xFF00)>>8, (col&&0xFF),255)
endfunction 1


//*** Changes the size of the checkbox’s text to sz ***
function SetGUICheckboxTextSize(id as integer, sz as float)
	//*** IF invalid ID, exit ***
	if NOT GetGUICheckboxExists(id)
		exitfunction 0
	endif
	//*** Set text size ***
	SetTextSize(GUICheckboxes[id].txt,sz)
	//*** Position text ***
	adj as float
	adj = GetSpriteHeight(GUICheckboxes[id].spr)- GetTextTotalHeight(GUICheckboxes[id].txt)
	if GUICheckboxes[id].align = 1
		SetTextPosition(GUICheckboxes[id].txt,GetSpriteX(GUICheckboxes[id].spr)+GetSpriteWidth(GUICheckboxes[id].spr)+1, GetSpriteY(GUICheckboxes[id].spr)+adj/2.0)
	else
		SetTextPosition(GUICheckboxes[id].txt,GetSpriteX(GUICheckboxes[id].spr)-1,GetSpriteY(GUICheckboxes[id].spr)+adj/2.0)
	endif
endfunction 1

//**************************************
//***   GUICheckbox helper function  ***
//**************************************

//*** Creates a default image for button ***
//*** Used when no button image supplied ***		
function BuildDefaultGUICheckbox()
	//*** Create white sprite ***
	//*** This represents the 2 frames ***
	temp = CreateSprite(0)
	SetSpriteSize(temp,5,10)
	SetSpriteColor(temp,255,255,255,255)
	//*** Create inner black sprite in both frames **
	temp2 = CreateSprite(0)
	SetSpriteSize(temp2,4,4)
	SetSpritePosition(temp2,0.5,0.5)
	SetSpriteColor(temp2, 0,0,0,255)
	temp3 = CloneSprite(temp2)
	SetSpritePosition(temp3,0.5,5.5)
	//*** Create X character ***
	txt1 = CreateText("x")
	//*** Centre align ***
	SetTextAlignment(txt1,1)
	//*** Positon text in bottom frame ***
	SetTextPosition(txt1,2.5,5.5)
	ClearScreen()
	DrawSprite(temp)
	DrawSprite(temp2)
	DrawSprite(temp3)
	DrawText(txt1)
	result = GetImage(0,0,5,10)
	ClearScreen()
	//*** Delete create elements ***
	DeleteSprite(temp)
	DeleteSprite(temp2)
	DeleteSprite(temp3)
	DeleteText(txt1)
endfunction result





//***************************************
//***    GUIColorPicker functions     ***
//***************************************
type GUIColorPicker
	spr		as integer	//Sprite ID
	red 		as integer	//Red of last selection
	green 	as integer	//Green of last selection
	blue 	as integer	//Blue of last selection
	state 	as integer	//(0:not showing, 1:showing)
endtype

global GUIColorPicker as GUIColorPicker

//*** Creates a sprite for the ColorPicker ***
function CreateGUIColorPicker(x as float, y as float, w as float, h as float, img as string) 
	//*** Create sprite ***
	if img = ""
		sprID = CreateSprite(BuildDefaultGUIColorPicker())
	else
		sprID = CreateSprite(LoadImage(img))
	endif
	SetSpriteSize(sprID,w,h)
	SetSpritePosition(sprID,x,y)
	SetSpriteDepth(sprID,5)
	//*** Store sprite ID ***
	GUIColorPicker.spr = sprID
	//*** Set selected colour to black ***
	GUIColorPicker.red = 0
	GUIColorPicker.green = 0
	GUIColorPicker.blue = 0
	//*** Mark as exists ***
	GUIColorPicker.state = 1
	//*** Unaffected by offset or zoom ***
	FixSpriteToScreen(sprID,1)
endfunction 


//*** Deletes ColorPicker widget ***
function DeleteGUIColorPicker()
	if NOT GetGUIColorPickerExists()
		exitfunction 0
	endif
	DeleteImage(GetSpriteImageID(GUIColorPicker.spr))
	DeleteSprite(GUIColorPicker.spr)
	GUIColorPicker.state = 0
endfunction 1

//*** Returns the blue value of last selection ***
function GetGUIColorPickerBlue()
	if NOT GetGUIColorPickerExists()
		exitfunction -1
	endif
	result = GUIcolorpicker.blue
endfunction result


//*** Returns 1 if a ColorPicker exists ***
function GetGUIColorPickerExists()
	result = GUIColorPicker.state
endfunction result


//*** Returns the green value of last selection ***
function GetGUIColorPickerGreen()
	if NOT GetGUIColorPickerExists()
		exitfunction -1
	endif
	result = GUIcolorpicker.green
endfunction result


//*** Returns the red value of last selection ***
function GetGUIColorPickerRed()
	if NOT GetGUIColorPickerExists()
		exitfunction -1
	endif
	result = GUIcolorpicker.red
endfunction result


//*** Returns colour under mouse when clicked ***
function HandleGUIColorPicker()
	result = 0
	if NOT GetGUIColorPickerExists()
		exitfunction result
	endif
	//*** If clicked on colour picker ...
	if GetPointerPressed() and GetSpriteHit(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY())) = GUIColorPicker.spr	
		Render()
		//*** Capture this part of screen as an image ***
		imgID = GetImage(GetPointerX(), GetPointerY(),0.1,0.1)
		//*** Convert to a memblock ***
		memID = CreateMemblockFromImage(imgID)
		//*** Get colour of first pixel’s data *** 
		GUIColorPicker.red = GetMemblockByte(memID,12)
		GUIColorPicker.green = GetMemblockByte(memID,13)
		GUIColorPicker.blue = GetMemblockByte(memID,14)
		//*** Create a single number from colours ***
		result = 0xFF000000+(GUIColorPicker.blue<<16) + (GUIColorPicker.green<<8) + GUIColorPicker.red
		//*** Delete the memblock and image***
		DeleteMemblock(memID)
		DeleteImage(imgID)
	endif
endfunction result


//*** Sets layer of ColorPicker sprite ***
function SetGUIColorPickerDepth(ly as integer)
	//*** If invalid depth, exit ***
	if NOT GetGUIColorPickerExists() OR ly < 0 OR ly > 10000
		exitfunction 0
	endif		
	//*** Set sprite depth ***
	SetSpriteDepth(GUIColorPicker.spr,ly)
endfunction 1


//*** Sets position of ColorPicker sprite ***
function SetGUIColorPickerPosition(x as float, y as float)
	//*** If invalid depth, exit ***
	if NOT GetGUIColorPickerExists()
		exitfunction 0
	endif		
	//*** Set sprite position ***
	SetSpritePosition(GUIColorPicker.spr,x,y)
endfunction 1


//**************************************
//*** GUIColorPicker helper function ***
//**************************************

//*** Creates a default image for ColorPicker ***
//*** Used when no image supplied             ***		
function BuildDefaultGUIColorPicker()
	ClearScreen()
	DrawBox(0,0,20,20,0xFF0000FF,0xFF00FF00,0xFFFF0000,0xFF000000,1)
	Render()
	result = GetImage(0,0,20,20)
	ClearScreen()
endfunction result



//***************************************
//***        GUIDialog code           ***
//***************************************
type DialogType
	spr		as  integer		//ID of sprite used
	txt		as 	integer		//ID of text used
	buttons as  integer[0]	//IDs of buttons in box
	state	as 	integer		//Dialog box exist (1) or not (0)
endtype


global GUIDialog as DialogType

//*** Creates a dialog box at (x,y) dimensions (w by h)    ***
//*** Uses image or (default image containing legend)      ***
//*** Includes button images and texts (both | separated   ***
//*** lists                                                ***
function CreateGUIDialogBox(x as float, y as float, w as float, h as float, image as string, legend as string, butimgs as string, buttxts as string)
	//If dialog box already exists, exit ***
	if GetGUIDialogBoxExists()
		exitfunction
	endif
	//*** If no button images or text, exit ***
	if butimgs = "" AND buttxts = ""
		exitfunction 
	endif
	//*** If dialog image, load it ***
	if image <>""
		img = LoadImage(image)
	else // or create default one
		img = BuildDefaultGUIDialog(w,h,legend)
	endif
	//*** Load image into sprite ***
	GUIDialog.spr = CreateSprite(img)
	//*** Size sprite ***
	SetSpriteSize(GUIDialog.spr,w,h)
	//*** Position sprite ***
	SetSpritePosition(GUIDialog.spr,x,y)
	//*** Place dialog on top layer ***
	SetSpriteDepth(GUIDialog.spr,0)
	//*** Make dialog box unselectable ***
	SetSpriteShapeCircle(GUIDialog.spr,0,0,0)
	//*** Fix dialog box position ***
	FixSpriteToScreen(GUIDialog.spr,1)
	if legend <> ""
		//*** Add text ***
		GUIDialog.txt = CreateText(legend)
		//*** Resize to fit dialog box ***
		while GetTextTotalWidth(GUIDialog.txt) > w*0.95
			SetTextSize(GUIDialog.txt, GetTextSize(GUIDialog.txt)*0.95)
		endwhile
		//*** Centre align ***
		SetTextAlignment(GUIDialog.txt,1)
		//*** Black text ***
		SetTextColor(GUIDialog.txt,0,0,0,255)
		//*** Positon text near top of dialog box ***
		SetTextPosition(GUIDialog.txt,x+w/2, y+ GetTextSize(GUIDialog.txt)/2)
		SetTextDepth(GUIDialog.txt,0)
	endif
	//*** Dialog box exists ***
	GUIDialog.state = 1
	//*** Add the buttons to the dialog box ***
	AddButtonsToGUIDialog(butimgs,buttxts)
endfunction 


//*** Returns 1 if the dialog box is showing ***
//*** otherwise returns zero                 ***
function GetGUIDialogBoxExists()
	result = GUIDialog.state
endfunction result


//*** Waits for dialog button press then deletes all parts of ***
//*** the box and returns number (not ID) of button pressed   ***
function HandleGUIDialogBox()
	//*** If dialog box not displayed, exit ***
	if NOT GetGUIDialogBoxExists()
		exitfunction 0
	endif
	result = 0
	//*** Wait for dialog button to be pressed ***
	repeat
		for c = 1 to GUIDialog.buttons.length
			if HandleGUIButton(GUIDialog.buttons[c]) = 1
				result = c
			endif
		next c
		sync()
	until result <> 0
	//*** Delete dialog box elements ***
	for c = 1 to GUIDialog.buttons.length
		DeleteGUIButton(GUIDialog.buttons[c])
	next c
	DeleteImage(GetSpriteImageID(GUIDialog.spr))
	DeleteSprite(GUIDialog.spr)
	DeleteText(GUIDialog.txt)
	//*** Dialog box does not exist ***
	GUIDialog.state = 0
endfunction result


//*** Repositions a dialog box button ***
function SetGUIDialogBoxButtonPosition(num as integer, x as float, y as float)
	//*** If dialog box not displayed, exit ***
	if NOT GetGUIDialogBoxExists()
		exitfunction 0
	endif
	//*** If the button number is invalid, exit ***
	if num < 1 or num > GUIDialog.buttons.length
		exitfunction 0
	endif
	//*** Reposition button ***
	SetGUIButtonPosition(GUIDialog.buttons[num],x+GetSpriteX(GUIDialog.spr),y+GetSpriteY(GUIDialog.spr))
endfunction 1


//*** Resizes a dialog box button ***
function SetGUIDialogBoxButtonSize(num as integer, w as float, h as float)
	//*** If dialog box not displayed, exit 0 ***
	if NOT GetGUIDialogBoxExists()
		exitfunction 0
	endif
	//*** If the button number is invalid, exit ***
	if num < 1 or num > GUIDialog.buttons.length
		exitfunction 0
	endif
	//*** Resize button ***
	SetGUIButtonSize(GUIDialog.buttons[num],w,h)
endfunction 1


//**************************************
//*** GUIDialog Box helper functions ***
//**************************************

//*** Creates a default image for dialog box ***
//*** Used when no dialog box image supplied ***
function BuildDefaultGUIDialog(w as float, h as float,legend as string)
	//*** Create sprite ***
	temp = CreateSprite(0)
	SetSpriteSize(temp,w,h)
	//*** Add text ***
	txt1 = CreateText(legend)
	//*** Resize to fit button ***
	while GetTextTotalWidth(txt1) > w*0.95
		SetTextSize(txt1, GetTextSize(txt1)*0.95)
	endwhile
	//*** Centre align ***
	SetTextAlignment(txt1,1)
	//*** Black text ***
	SetTextColor(txt1,0,0,0,255)
	//*** Positon text near top of dialog box ***
	SetTextPosition(txt1,w/2, GetTextTotalHeight(txt1)/2)
	//*** Render to back buffer ***
	ClearScreen()
	DrawSprite(temp)
	DrawText(txt1)
	result = GetImage(0,0,w,h)
	ClearScreen()
	//*** Delete created elements
	DeleteSprite(temp)
	DeleteText(txt1)
endfunction result


//*** Adds the specified buttons to the dialog box ***
function AddButtonsToGUIDialog(butimgs as string, buttxts as string)
	//*** If dialog box not displayed, exit 0 ***
	if NOT GetGUIDialogBoxExists()
		exitfunction 0
	endif
	//*** Get the number of buttons ***
	if buttxts <> ""
		noOfButtons = CountStringTokens2(buttxts,"|")
	else
		noOfButtons = CountStringTokens2(butimgs,"|")
	endif
	//*** Get number of button images ***
	noOfButtonImages = CountStringTokens2(butimgs,"|")
	//*** Create space for each button ID ***
	GUIDialog.buttons.length = noOfButtons
	//*** Size buttons (max 20% of dialog width) ***
	buttonwidth as float : buttonwidth =  (GetSpriteWidth(GUIDialog.spr)*0.8)/noOfButtons
	if buttonwidth > GetSpriteWidth(GUIDialog.spr)*0.2
		buttonwidth = GetSpriteWidth(GUIDialog.spr)*0.2
	endif
	//*** Image used to create button ***
	butImgCount = 0
	for c = 1 to noOfButtons
		//*** Determine image to be used on this button ***
		if butImgCount < noOfButtonImages
			inc butImgCount
		endif
		//*** Get the image name ***
		butimg as string : butimg = GetStringToken2(butimgs,"|",butImgCount)
		//*** Get button text ***
		buttxt as string : buttxt = GetStringToken2(buttxts,"|",c)
		//*** Determine x-coord of button ***
		startx as float : startx =  (GetSpriteX(GUIDialog.spr)+GetSpriteWidth(GUIDialog.spr))-c*buttonwidth*1.1
		//*** Create button ***
		GUIDialog.buttons[c] = CreateGUIButton(startx, GetSpriteY(GUIDialog.spr)+GetSpriteHeight(GUIDialog.spr)-buttonwidth, buttonwidth,-1,butimg,buttxt)
		SetGUIButtonDepth(GUIDialog.buttons[c],0)
	next c
endfunction 1




//***************************************
//***         DropDown Widget         ***
//***************************************
type GUIDropdownType
	borderID		as integer		//ID of border
	fieldID		as integer		//ID of field 
	fieldtxtID	as integer		//ID of text in field
	butID		as integer	  	//ID of down button
	list			as string[0]		//List of options
	opIDs		as integer[0]	//IDs of dropdown options buttons
	state		as integer		//-1:deleted, 0:disabled, 1:enabled
endtype

	
global GUIDropdown as GUIDropdownType[0]

//*** Creates a dropdown widget. Returns its ID ***
function CreateGUIDropdown(x as float, y as float, ops as string, dropbut as string, opbut as string)
	//*** If no options, exit 0 ***
	if ops = ""
		exitfunction 0
	endif
	//*** New dropdown widget cell ***
	GUIDropdown.length = GUIDropdown.length + 1
	//*** Latest cell index is ID ***
	id = GUIDropdown.length
	//*** Calculate 3 pixels as percentage ***
	threepxw as float : threepxw = 100.0/GetDeviceWidth() * 3.0
	threepxh as float : threepxh = 100.0/GetDeviceHeight() * 3.0
	//*** Split options string ***
	no_opts = CountStringTokens(ops,'|')
	GUIDropdown[id].list.length = no_opts
	for c = 1 to no_opts
		GUIDropdown[id].list[c] = GetStringToken(ops,"|",c)
	next c
	//*** Calculate length of longest option ***
	width as float
	height as float
	temp = CreateText(GUIDropdown[id].list[1])
	height = GetTextTotalHeight(temp)
	SetTextSize(temp,height - 2*threepxh)
	width = GetTextTotalWidth(temp)
	for c = 2 to no_opts
		SetTextString(temp,GUIDropdown[id].list[c])	
		if GetTextTotalWidth(temp) > width
			width = GetTextTotalWidth(temp)
		endif
	next c
	DeleteText(temp)
	width = width*1.05
	//*** Create background sprite ***
	GUIDropdown[id].borderID = CreateSprite(0)
	bID = GUIDropdown[id].borderID
	SetSpriteSize(bID,width+3*threepxw+height,height+2*threepxh)
	SetSpritePosition(bID,x,y)
	SetSpriteShapeCircle(bID,0,0,0)
	SetSpriteDepth(bID,5)
	FixSpriteToScreen(bID,1)
	//*** Create field sprite ***
	GUIDropdown[id].fieldID = CreateSprite(0)
	fID = GUIDropdown[id].fieldID
	SetSpriteSize(fID,width,height)
	SetSpritePosition(fID,x+threepxw,y+threepxh)
	SetSpriteColor(fID,150,150,150,255)
	SetSpriteShapeCircle(fID,0,0,0)
	SetSpriteDepth(fID,5)
	FixSpriteToScreen(fID,1)
	//*** Create field value text ***
	GUIDropdown[id].fieldtxtID = CreateText("")
	tID = GUIDropdown[id].fieldtxtID
	SetTextColor(tID,0,0,0,255)
	SetTextAlignment(tID,2)
	SetTextPosition(tID,x+width,y+1.5*threepxh)
	SetTextSize(tID,height - 2*threepxh)
	SetTextDepth(tID,5)
	SetTextString(tID,GUIDropdown[id].list[1])
	FixTextToScreen(tID,1)
	//*** Create drop button ***
	if dropbut = ""
		GUIDropdown[id].butID = CreateGUIButton(x+2*threepxw+width,y+threepxh,height,height,dropbut,"V")
	else
		GUIDropdown[id].butID = CreateGUIButton(x+2*threepxw+width,y+threepxh,height,height,dropbut,"")
	endif
	//***Create Dropdown list - hidden and disabled ***
	GUIDropdown[id].opIDs.length = no_opts
	for c = 1 to GUIDropdown[id].list.length
		GUIDropdown[id].opIDs[c] = CreateGUIButton(x,y+height+2*threepxh+(c-1)*4,width+height+3*threepxw,4,opbut,GUIDropDown[id].list[c])
		SetGUIButtonEnabled(GUIDropDown[id].opIDs[c],0)
		SetGUIButtonVisible(GUIDropDown[id].opIDs[c],0)
	next c
	//*** Set state to enabled ***
	GUIDropdown[id].state = 1
endfunction id


//*** Deletes Dropdown        ***
//*** Returns 1 if successful ***
function DeleteGUIDropdown(id as integer)
	if NOT GetGUIDropdownExists(id)
		exitfunction 0
	endif
	//*** Record as deleted ***
	GUIDropdown[id].state = -1
	//*** Delete visuals ***
	DeleteSprite(GUIdropdown[id].borderID)
	DeleteSprite(GUIDropdown[id].fieldID)
	DeleteText(GUIDropdown[id].fieldtxtID)
	DeleteGUIButton(GUIDropdown[id].butID)
	for c = 1 to GUIDropdown[id].opIDs.length
		DeleteGUIButton(GUIDropdown[id].opIDs[c])
	next c
endfunction 1


//*** Returns Dropdown's state      ***
//*** Returns -1 if does not exist ***
function GetGUIDropdownEnabled(id as integer)
	if NOT GetGUIDropdownExists(id)
		exitfunction -1
	endif
	result = GUIDropdown[id].state
endfunction result


//*** Returns 1 if dropdown with ID id exists ***
//*** Returns 0 if dropdown does not exist    ***
function GetGUIDropdownExists(id as integer)
	if id < 1 OR id > GUIDropdown.length
		result = 0
	elseif GUIDropdown[id].state = -1
		result = 0
	else
		result = 1
	endif
endfunction result


//*** Returns current value of spinner   ***
//*** Returns empty string if invalid ID ***
function GetGUIDropdownValue(id as integer)
	//*** If invalid ID, exit minimum - 1 ***
	if NOT GetGUIDropdownExists(id)
		exitfunction ""
	elseif GetGUIDropdownEnabled(id) <> 1
		exitfunction ""
	endif
	result as string: result = GetTextString(GUIDropdown[id].fieldtxtID)
endfunction result


//*** Selects a value from the dropdown list and ***
//*** displays it in the main field              ***
function HandleGUIDropDown(id as integer)
	//*** If invalid ID, exit 0 ***
	if NOT GetGUIDropdownExists(id)
		exitfunction 0
	endif
	//*** If disabled, exit 0 ***
	if NOT GetGUIDropdownEnabled(id)
		exitfunction 0
	endif
	result = 0
	//*** Check for drop button pressed ***
	hit1 = HandleGUIButton(GUIDropDown[id].butID)
	//*** If pressed and drop list not visible ***
	if hit1 AND NOT GetGUIButtonVisible(GUIDropDown[id].opIDs[1])
		//*** Display the list ***
		for m = 1 to GUIDropDown[id].opIDs.length	
			SetGUIButtonVisible(GUIDropDown[id].opIDs[m],1)
			SetGUIButtonEnabled(GUIDropDown[id].opIDs[m],1)
		next m
		result = 1
	endif
	//*** Check for entry in drop list hit ***
	for c = 1 to GUIDropDown[id].opIDs.length
		hit2 = HandleGUIButton(GUIDropDown[id].opIDs[c])
		//*** If hit, update displayed entry, hide drop list ***
		if hit2
			SetTextString(GUIDropDown[id].fieldtxtID,GUIDropDown[id].list[c])
			for k = 1 to GUIDropDown[id].opIDs.length
				SetGUIButtonEnabled(GUIDropDown[id].opIDs[k],0)
				SetGUIButtonVisible(GUIDropDown[id].opIDs[k],0)
			next k
			result = 1
			exit		
		endif
	next c
	//*** If clicked outside list, hide list ***
	x1 as float : x1 = GetSpriteX(GUIDropDown[id].borderID)
	x2 as float : x2 = x1+GetSpriteWidth(GUIDropDown[id].borderID)
	y1 as float : y1 = GetSpriteY(GUIDropDown[id].borderID)
	y2 as float : y2 = y1+GetSpriteHeight(GUIDropDown[id].borderID)+GUIDropDown[id].list.length*5
	if GetPointerPressed() AND NOT InsideArea(GetPointerX(),GetPointerY(),x1,y1,x2,y2) 
		for k = 1 to GUIDropDown[id].opIDs.length
			SetGUIButtonEnabled(GUIDropDown[id].opIDs[k],0)
			SetGUIButtonVisible(GUIDropDown[id].opIDs[k],0)
		next k
		result = 0
	endif
endfunction result


//*** Sets Dropdown's border colour ***
//*** Returns 1 if successful      ***
function SetGUIDropdownBorderColor(id as integer, col as integer)
	if NOT GetGUIDropdownExists(id)
		exitfunction 0
	endif
	red = col >> 16
	green = (col && 0X0000FF00) >> 8
	blue = col && 0X000000FF
	SetSpriteColor(GUIDropdown[id].borderID,red,green,blue,128+127*GetGUIDropdownEnabled(id))
endfunction 1


//*** Moves Dropdown to depth ly ***
//*** Returns 1 if successful   ***
function SetGUIDropdownDepth(id as integer, ly as integer)
	//*** If invalid ID, exit 0 ***
	if NOT GetGUIDropdownExists(id) OR ly < 0 OR ly > 10000
		exitfunction 0
	endif
	//*** Modify depth of each element to ly ***
	SetSpriteDepth(GUIDropdown[id].borderID,ly)
	SetSpriteDepth(GUIDropdown[id].fieldID,ly)
	SetTextDepth(GUIDropdown[id].fieldtxtID,ly)
	SetGUIButtonDepth(GUIDropdown[id].butId,ly)
	for c = 1 to GUIDropdown[id].list.length
		SetGUIButtonDepth(GUIDropDown[id].opIDs[c],ly)
	next c
endfunction 1


//*** Enables/disables Dropdown ***
//*** Returns 1 if successful  ***
function SetGUIDropdownEnabled(id as integer, fl as integer)
	if NOT GetGUIDropdownExists(id) OR (fl <> 0 AND fl <> 1)
		exitfunction 0
	endif
	//*** Adjust state ***
	GUIDropdown[id].state = fl
	//*** Adjust visuals and disable buttton ***
	SetSpriteColorAlpha(GUIDropdown[id].borderID,128+127*fl)
	SetSpriteColorAlpha(GUIDropdown[id].fieldID,128+127*fl)
	SetTextColorAlpha(GUIDropdown[id].fieldtxtID,128+127*fl)
	SetGUIButtonEnabled(GUIDropdown[id].butId,fl)
	//*** If dropdown list showing, hide and disable ***
	if GetSpriteVisible(GUIDropdown[id].opIDs[1]) = 1 AND fl = 0
		for c = 1 to GUIDropdown[id].list.length
			SetGUIButtonEnabled(GUIDropDown[id].opIDs[c],0)
			SetGUIButtonVisible(GUIDropDown[id].opIDs[c],0)
		next c
	endif
endfunction 1


//*** Sets Dropdown's data field background colour ***
//*** Returns 1 if successful                     ***
function SetGUIDropdownFieldColor(id as integer, col as integer)
	if NOT GetGUIDropdownExists(id)
		exitfunction 0
	endif
	red = col >> 16
	green = (col && 0X0000FF00) >> 8
	blue = col && 0X000000FF
	SetSpriteColor(GUIDropdown[id].fieldID,red,green,blue,128+127*GetGUIDropdownEnabled(id))
endfunction 1


//*** Repositions Dropdown     ***
//*** Returns 1 if successful ***
function SetGUIDropdownPosition(id as integer, x as float, y as float)
	//*** If invalid ID, exit 0 ***
	if NOT GetGUIDropdownExists(id)
		exitfunction 0
	endif
	SetSpritePosition(GUIDropdown[id].borderID,x,y)
	//*** Calculate % for 3 pixels ***
	threepxw as float : threepxw = 100.0/GetDeviceWidth() * 3.0
	threepxh as float : threepxh = 100.0/GetDeviceHeight() * 3.0
	//*** Reposition down list button ***
	SetGUIButtonPosition(GUIDropdown[id].butId,x+GetSpriteWidth(GUIDropdown[id].fieldID)+2*threepxw,y+threepxh)
	//*** Reposition field ***
	SetSpritePosition(GUIDropdown[id].fieldID,x+threepxw,y+threepxh)
	//*** Reposition text ***
	SetTextPosition(GUIDropdown[id].fieldtxtID,x+GetSpriteWidth(GUIDropdown[id].fieldID),y+1.5*threepxh)
	//*** Get height of border ***
	h as float : h = GetSpriteHeight(GUIDropdown[id].borderID)
	//*** Move dropdown list ***
	for c = 1 to GUIDropdown[id].list.length
		SetGUIButtonPosition(GUIDropdown[id].opIDs[c],x,y+h+(c-1)*4)
	next c
endfunction 1


//**************************************
//*** GUIDialog Box helper functions ***
//**************************************

//*** Returns 1 if (x,y) is within rectangle ***
//*** (x1,y1), (x2,y2)                       ***
function InsideArea(x as float, y as float, x1 as float, y1 as float, x2 as float, y2 as float)
	result = 1
	if x < x1 OR x > x2
		result = 0
	elseif y < y1 OR y > y2
		result = 0
	endif
endfunction result 
	



//***************************************
//***          Frame functions         ***
//***************************************
type ElementType
	restype	as integer //1:sprite, 2: text, 3:button, 4:checkbox, 5:radio button 6: edit box, 7: spinner, 8:dropdown list, 9: keypad 10:colorpicker
	id		as integer //ID of component
endtype

type GUIFrameType
	img		as integer	//ID of frame image
	spr		as integer	//ID of frame sprite
	x1 		as float: y1 as float	//Coords of top-left
	x2 		as float: y2 as float	//Coords of bottom-right
	state 	as integer	//(-1:deleted; 1:active)
	contents	as ElementType[0]
endtype

global GUIFrames as GUIFrameType[0]


//*** Creates a frame using a sprite. Position (x,y) 	***
//*** Dimensions (w by h), image used on sprite: image 	***
function CreateGUIFrame(x as float, y as float, w as float, h as float, image as string)
	//*** Create frame details storage ***
	GUIFrames.length = GUIFrames.length + 1
	//*** Assign a shorter name to this position ***
	post = GUIFrames.length
	//*** If image, load it ***
	if image <>""
		GUIFrames[post].img = LoadImage(image)
	else // or create default one
		GUIFrames[post].img = BuildDefaultGUIFrame(w,h)
	endif
	//*** Load image into sprite ***
	GUIFrames[post].spr = CreateSprite(GUIFrames[post].img)
	//*** Size sprite ***
	SetSpriteSize(GUIFrames[post].spr,w,h)
	//*** Position sprite ***
	SetSpritePosition(GUIFrames[post].spr,x,y)
	SetSpriteDepth(GUIFrames[post].spr,6)
	FixSpriteToScreen(GUIFrames[post].spr,1)
	//*** Record t-l and b-r coords ***
	GUIFrames[post].x1 = ScreenToWorldX(GetSpriteX(GUIFrames[post].spr))
	GUIFrames[post].y1 = ScreenToWorldY(GetSpriteY(GUIFrames[post].spr))
	GUIFrames[post].x2 = GUIFrames[post].x1 + GetSpriteWidth(GUIFrames[post].spr)
	GUIFrames[post].y2 = GUIFrames[post].y1 + GetSpriteHeight(GUIFrames[post].spr)
	//*** Make frame unselectable *** 				
	SetSpriteShapeCircle(GUIFrames[post].spr,0,0,0)
	//*** Frame exists ***
	GUIFrames[post].state = 1
	//*** Make frame's sprite unselectable ***
	SetSpriteShapeCircle(GUIFrames[post].spr,0,0,0)
	//*** Return frame ID ***
endfunction post


//*** Adds a GUIButton to frame frm. Button dimensions are w by h ***
//*** and positioned at (x,y). Button uses image img and shows    ***
//*** text txt                                                    ***
function AddButtonToGUIFrame(frm as integer, x as float, y as float, w as float, h as float, img as string, leg as string)
	//*** If invalid frame, exit ***
	if NOT GetGUIFrameExists(frm)
		exitfunction 0
	endif
	//*** Expand contents array ***
	GUIFrames[frm].contents.length = GUIFrames[frm].contents.length+1
	//*** Save position of new entry ***
	post = GUIFrames[frm].contents.length
	//*** Record as button ***
	GUIFrames[frm].contents[post].restype = 3
	//*** Create button and save ID ***
	GUIFrames[frm].contents[post].id = CreateGUIButton(GUIFrames[frm].x1+x,GUIFrames[frm].y1+y,w,h,img,leg)
	//*** Erase any part outside the frame ***
	SetSpriteScissor(GUIButtons[GUIFrames[frm].contents[post].id].spr,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
endfunction post


//*** Adds a checkbox showing image img and string leg ***
//*** at position (x,y) within the frame               ***
function AddCheckboxToGUIFrame(frm as integer, x as float, y as float,w as float, img as string, leg as string)
	//*** If invalid frame, exit ***
	if NOT GetGUIFrameExists(frm)
		exitfunction 0
	endif
	//*** Expand contents array ***
	GUIFrames[frm].contents.length = GUIFrames[frm].contents.length+1
	//*** Save position of new entry ***
	post = GUIFrames[frm].contents.length
	//*** Record as checkbox ***
	GUIFrames[frm].contents[post].restype = 4
	//*** Create checkbox and save ID ***
	GUIFrames[frm].contents[post].id = CreateGUICheckbox(GUIFrames[frm].x1+x,GUIFrames[frm].y1+y,w,img,leg)
	//*** Erase any part outside the frame (sprite and text) ***
	SetSpriteScissor(GUICheckboxes[GUIFrames[frm].contents[post].id].spr,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
	SetTextScissor(GUICheckboxes[GUIFrames[frm].contents[post].id].txt,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
endfunction post


//*** Adds colour picker to frame ***
function AddColorPickerToGUIFrame(frm as integer, x as float, y as float, w as float, h as float, img as string)
	//*** If invalid frame, exit ***
	if NOT GetGUIFrameExists(frm)
		exitfunction 0
	endif
	//*** Expand contents array ***
	GUIFrames[frm].contents.length = GUIFrames[frm].contents.length+1
	//*** Save position of new entry ***
	post = GUIFrames[frm].contents.length
	//*** Record as colour picker ***
	GUIFrames[frm].contents[post].restype = 10
	//*** Create button and save ID ***
	GUIFrames[frm].contents[post].id = 0
	//*** Place colour picker in frame ***
	CreateGUIColorPicker(GetSpriteX(GUIFrames[frm].spr)+x,GetSpriteY(GUIFrames[frm].spr)+y,w,h,img)
	SetSpriteScissor(GUIColorPicker.spr,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
endfunction post


//*** Add a dropdown list to frame ***
function AddDropdownToGUIFrame(frm as integer, x as float, y as float,opts as string, dimg as string, ddimg as string)
	//*** If invalid frame, exit ***
	if NOT GetGUIFrameExists(frm)
		exitfunction 0
	endif
	//*** Expand contents array ***
	GUIFrames[frm].contents.length = GUIFrames[frm].contents.length+1
	//*** Save position of new entry ***
	post = GUIFrames[frm].contents.length
	//*** Record as dropdown list ***
	GUIFrames[frm].contents[post].restype = 8
	//*** Create dropdown  and save ID ***
	GUIFrames[frm].contents[post].id = CreateGUIDropdown(GUIFrames[frm].x1+x,GUIFrames[frm].y1+y,opts,dimg,ddimg)
	//*** Erase any part outside the frame ***
	spID as GUIDropdownType : spID = GUIDropdown[GUIFrames[frm].contents[post].id]
	SetSpriteScissor(spID.borderID,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
	SetSpriteScissor(spID.fieldID,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
	SetSpriteScissor(GUIButtons[spID.butID].spr,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
	SetTextScissor(spID.fieldtxtID,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
endfunction post


//*** Adds an edit box at (x,y) 		***
//*** Edit box dimensions are w by h    ***
function AddEditboxToGUIFrame(frm as integer, x as float, y as float, w as float, h as float)
	//*** If invalid frame, exit ***
	if NOT GetGUIFrameExists(frm)
		exitfunction 0
	endif
	//*** Expand contents array ***
	GUIFrames[frm].contents.length = GUIFrames[frm].contents.length+1
	//*** Save position of new entry ***
	post = GUIFrames[frm].contents.length
	//*** Record as edit box ***
	GUIFrames[frm].contents[post].restype = 6
	//*** Create edit box  and save ID ***
	GUIFrames[frm].contents[post].id = CreateEditBox()
	//*** Size edit box ***
	SetEditBoxSize(GUIFrames[frm].contents[post].id,w,h)
	//*** Position edit box relative to frame top-left ***
	SetEditBoxPosition(GUIFrames[frm].contents[post].id,GUIFrames[frm].x1+x, GUIFrames[frm].y1+y)
	//*** Erase any part outside the frame ***
	SetEditBoxScissor(GUIFrames[frm].contents[post].id,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
	SetEditBoxBorderSize(GUIFrames[frm].contents[post].id,0.5)
	//*** Not got focus ***
	SetEditBoxFocus(GUIFrames[frm].contents[post].id,0)
	SetEditBoxActive(GUIFrames[frm].contents[post].id,0)
endfunction post


//*** Add keypad to frame ***
function AddKeyPadToGUIFrame(frm as integer, x as float, y as float,keys as string, kw as float, kir as integer, bimg as string)
	//*** If invalid frame, exit ***
	if NOT GetGUIFrameExists(frm)
		exitfunction 0
	endif
	//*** Expand contents array ***
	GUIFrames[frm].contents.length = GUIFrames[frm].contents.length+1
	//*** Save position of new entry ***
	post = GUIFrames[frm].contents.length
	//*** Record as keypad ***
	GUIFrames[frm].contents[post].restype = 9
	//*** Create keypad and save ID ***
	GUIFrames[frm].contents[post].id = CreateGUIKeyPad(GUIFrames[frm].x1+x,GUIFrames[frm].y1+y,keys,kw,kir,bimg)
	//*** Erase any part outside the frame ***
	spID as GUIKeyPadType : spID = GUIKeyPad
	for c = 1 to spID.keyIDs.length
		SetSpriteScissor(GUIButtons[spID.keyIDs[c]].spr,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
	next c
endfunction post


//*** Adds a radio button showing image img and string leg ***
//*** at position (x,y) in group grp within the frame      ***
function AddRadioButtonToGUIFrame(frm as integer, x as float, y as float,w as float, img as string, leg as string, grp as integer)
	//*** If invalid frame or group, exit ***
	if NOT GetGUIFrameExists(frm) OR grp < 1 OR grp > 10
		exitfunction 0
	endif
	//*** Expand contents array ***
	GUIFrames[frm].contents.length = GUIFrames[frm].contents.length+1
	//*** Save position of new entry ***
	post = GUIFrames[frm].contents.length
	//*** Record as radiobutton ***
	GUIFrames[frm].contents[post].restype = 5
	//*** Create radio button and save ID ***
	GUIFrames[frm].contents[post].id = CreateGUIRadioButton(GUIFrames[frm].x1+x,GUIFrames[frm].y1+y,w,img,leg,grp)
	//*** Erase any part outside the frame (sprite and text) ***
	RBid = Mod(GUIFrames[frm].contents[post].id,100)
	SetSpriteScissor(GUIRadioButtons[grp].list[RBid].spr,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
	SetTextScissor(GUIRadioButtons[grp].list[RBid].txt,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
endfunction post


//*** Adds a spinner size w by h at (x,y) ***
//*** Returns its frame ID                ***
function AddSpinnerToGUIFrame(frm as integer, x as float, y as float, w as float, h as float,min as integer, max as integer, bimg as string)
	//*** If invalid frame, exit ***
	if NOT GetGUIFrameExists(frm)
		exitfunction 0
	endif
	//*** Expand contents array ***
	GUIFrames[frm].contents.length = GUIFrames[frm].contents.length+1
	//*** Save position of new entry ***
	post = GUIFrames[frm].contents.length
	//*** Record as spinner ***
	GUIFrames[frm].contents[post].restype = 7
	//*** Create spinner  and save ID ***
	GUIFrames[frm].contents[post].id = CreateGUISpinner(GUIFrames[frm].x1+x,GUIFrames[frm].y1+y,w,h,min,max,bimg)
	//*** Erase any part outside the frame ***
	spID as GUISpinnerType : spID = GUISpinner[GUIFrames[frm].contents[post].id]
	SetSpriteScissor(spID.borderID,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
	SetSpriteScissor(spID.fieldID,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
	SetSpriteScissor(GUIButtons[spID.butIDs[1]].spr,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
	SetSpriteScissor(GUIButtons[spID.butIDs[2]].spr,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
	SetTextScissor(spID.fieldtxtID,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
endfunction post


//*** Adds a sprite containing image img at (x,y) ***
//*** Sprite dimensions are w by h                ***
function AddSpriteToGUIFrame(frm as integer, x as float, y as float, w as float, h as float, img as string)
	//*** If invalid frame, exit ***
	if NOT GetGUIFrameExists(frm)
		exitfunction 0
	endif
	//*** Expand contents array ***
	GUIFrames[frm].contents.length = GUIFrames[frm].contents.length+1
	//*** Save position of new entry ***
	post = GUIFrames[frm].contents.length
	//*** Record as sprite ***
	GUIFrames[frm].contents[post].restype = 1
	//*** Create sprite  and save ID ***
	if img <> ""
		GUIFrames[frm].contents[post].id = CreateSprite(LoadImage(img))
	else
		GUIFrames[frm].contents[post].id = CreateSprite(0)
	endif
	//*** Size sprite ***
	SetSpriteSize(GUIFrames[frm].contents[post].id,w,h)
	//*** Position sprite relative to frame top-left ***
	SetSpritePosition(GUIFrames[frm].contents[post].id,GUIFrames[frm].x1+x, GUIFrames[frm].y1+y)
	SetSpriteDepth(GUIFrames[frm].contents[post].id,5)
	//*** Erase any part outside the frame ***
	SetSpriteScissor(GUIFrames[frm].contents[post].id,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
endfunction post


//*** Adds a text resource to the frame at (x,y)          ***
//*** Text contains string txt, is size sz and colour col ***
//*** Alignment: 0 - left 1 - centre 2 - right            ***
function AddTextToGUIFrame(frm as integer, x as float, y as float,txt as string, sz as float, col as integer, align as integer)
	//*** If invalid frame, exit ***
	if NOT GetGUIFrameExists(frm)
		exitfunction 0
	endif
	//*** Expand contents array ***
	GUIFrames[frm].contents.length = GUIFrames[frm].contents.length+1
	//*** Save position of new entry ***
	post = GUIFrames[frm].contents.length
	//*** Record as text ***
	GUIFrames[frm].contents[post].restype = 2
	//*** Create text and save ID ***
	GUIFrames[frm].contents[post].id = CreateText(txt)
	//*** Size text ***
	SetTextSize(GUIFrames[frm].contents[post].id ,sz)
	//*** Colour text ***
	SetTextColor(GUIFrames[frm].contents[post].id,(col&&0xFF0000)>>16, (col&&0xFF00) >> 8, col&&0xFF,255)
	//*** Set text alignment ***
	SetTextAlignment(GUIFrames[frm].contents[post].id,align)
	//*** Postion text relative to frame top-left ***
	SetTextPosition(GUIFrames[frm].contents[post].id,GUIFrames[frm].x1+x, GUIFrames[frm].y1+y)
	SetTextDepth(GUIFrames[frm].contents[post].id,5)
	//*** Erase any part outside the frame ***
	SetTextScissor(GUIFrames[frm].contents[post].id,GUIFrames[frm].x1,GUIFrames[frm].y1,GUIFrames[frm].x2,GUIFrames[frm].y2)
endfunction post


//*** Deletes a frame and all its contents ***
function DeleteGUIFrame(frm as integer)
	//*** If invalid frame, exit ***
	if NOT GetGUIFrameExists(frm)
		exitfunction 0
	endif
	//*** Delete contents of frame ***
	temp as ElementType
	for c = 1 to GUIFrames[frm].contents.length
		temp = GUIFrames[frm].contents[c]
		select temp.restype
			case 1: // Sprite
				//*** Delete image and sprite ***
				DeleteImage(GetSpriteImageID(temp.id))
				DeleteSprite(temp.id)
			endcase
			case 2: //Text
				//*** Delete text ***
				DeleteText(temp.id)
			endcase
			case 3: //GUIButton
				//*** Delete GUI button ***
				DeleteGUIButton(temp.id)
			endcase
			case 4: //GUICheckbox
				//*** Delete checkbox ***
				DeleteGUICheckbox(temp.id)
			endcase
			case 5: //Radio button 
				//*** Delete radio button group ***
				grp = temp.id / 100
				DeleteGUIRadioButtonGroup(grp)
			endcase
			case 6: // Edit box
				//*** Delete edit box ***
				DeleteEditBox(temp.id)
			endcase
			case 7: //Spinner
				//*** Delete spinner ***
				DeleteGUISpinner(temp.id)
			endcase
			case 8: //Dropdown
				//*** Delete dropdown list ***
				DeleteGUIDropdown(temp.id)
			endcase
			case 9: //Keypad
				//*** Delete keypad ***
				DeleteGUIKeyPad()
			endcase
			case 10: // Color Picker
				//*** Delete color picker ***
				DeleteGUIColorPicker()
			endcase
		endselect
	next c
	//*** Delete the frame itself ***
	DeleteImage(GUIFrames[frm].img)
	DeleteSprite(GUIFrames[frm].spr)
	//*** Mark as deleted ***
	GUIFrames[frm].state = -1
endfunction 1
	

//*** Returns type and ID of the component number post in the frame frm ***
function GetGUIFrameElementDetails(frm as integer, post as integer)
	//*** If invalid frame, exit ***
	if NOT GetGUIFrameExists(frm)
		exitfunction 0
	elseif post < 1 or post > GUIFrames[frm].contents.length
		exitfunction 0
	endif
	result = GUIFrames[frm].contents[post].restype* 1000000 + GUIFrames[frm].contents[post].id
endfunction result



//*** Returns 1 if frm is an active frame ***
function GetGUIFrameExists(frm as integer)
	if frm < 1 OR frm > GUIFrames.length
		result = 0
	elseif GUIFrames[frm].state = -1
		result = 0
	else
		result = 1
	endif
endfunction result


//*** Returns height of frame ***
function GetGUIFrameHeight(frm as integer)
	if NOT GetGUIFrameExists(frm)
		result = -1
	else
		result = GetSpriteHeight(GUIFrames[frm].spr)
	endif
endfunction result


//*** Returns width of frame ***
function GetGUIFrameWidth(frm as integer)
	if NOT GetGUIFrameExists(frm)
		result = -1
	else
		result = GetSpriteWidth(GUIFrames[frm].spr)
	endif
endfunction result


//*** Returns top-left X coord of frame ***
function GetGUIFrameX(frm as integer)
	if NOT GetGUIFrameExists(frm)
		result = -1
	else
		result = GetSpriteX(GUIFrames[frm].spr)
	endif
endfunction result


//*** Returns top-left Y coord of frame ***
function GetGUIFrameY(frm as integer)
	if NOT GetGUIFrameExists(frm)
		result = -1
	else
		result = GetSpriteY(GUIFrames[frm].spr)
	endif
endfunction result


//*** Calls the handle functions for each control   ***
//*** within the frame and returns the number of    ***
//*** any control activated by the user (0 if none) ***
function HandleGUIFrame(frm as integer)
	//*** If invalid frame, exit ***
	if NOT GetGUIFrameExists(frm)
		exitfunction 0
	endif
	//*** Test each element in frame to see if  ***
	//*** it has been dealt with by its handler ***
	result = 0
	temp as ElementType
	for c = 1 to GUIFrames[frm].contents.length
		//MESSAGE("c = " + Str(c))
		temp = GUIFrames[frm].contents[c]
		select temp.restype
			case 1,2,11: //Sprite,text, spriteline - no effect
				//None
			endcase
			case 3:  //Button
				if HandleGUIButton(temp.id)
					result = c
					exit
				endif
			endcase
			case 4: //Checkbox
				if HandleGUICheckbox(temp.id)
					result = c
					exit
				endif
			endcase
			case 5: //Radio button
				if HandleGUIRadioButtonGroup(temp.id/100)
					result = c
					exit
				endif
			endcase
			case 6: //Edit box
				px as float: py as float
				px = GetpointerX()
				py = GetPointerY()
				if GetPointerPressed()
					if px >= GetEditBoxX(temp.id) and px <= GetEditBoxX(temp.id) + GetEditBoxWidth(temp.id) and py >= GetEditBoxY(temp.id) and py <= GetEditBoxY(temp.id) + GetEditBoxHeight(temp.id)
						SetEditBoxActive(temp.id,1)
						SetEditBoxFocus(temp.id,1)
					endif
				endif
			endcase
			case 7: //Spinner
				if HandleGUISpinner(temp.id)
					result = c
					exit
				endif
			endcase
			case 8: //Dropdown
				if HandleGUIDropDown(temp.id)
					result = c
					exit
				endif
			endcase
			case 9: //Keypad
				if HandleGUIKeyPad()
					result = c
					exit
				endif
			endcase
			case 10: //ColorPicker
				if HandleGUIColorPicker()
					result = c
					exit
				endif
			endcase
		endselect
	next c
endfunction result


//*** Sets frame frm to depth layer ***
function SetGUIFrameDepth(frm as integer, layer as integer)
	//*** If invalid frame, exit ***
	if NOT GetGUIFrameExists(frm)
		exitfunction 0
	elseif layer < 0 or layer > 10000
		exitfunction 0
	endif
	SetSpriteDepth(GUIFrames[frm].spr,layer)
	temp as ElementType
	for c = 1 to GUIFrames[frm].contents.length
		temp = GUIFrames[frm].contents[c]
		select temp.restype
			case 1: //Sprite
				SetSpriteDepth(temp.id,layer)
			endcase
			case 2: //Text
				SetTextDepth(temp.id,layer)
			endcase
			case 3:  //Button
				SetGUIButtonDepth(temp.id,layer)
			endcase
			case 4: //Checkbox
				SetGUICheckboxDepth(temp.id,layer)
			endcase
			case 5: //Radio button
				global lastgroup as integer
				RBid = temp.id
				group = RBid / 100
				if group <> lastgroup
					SetGUIRadioButtonGroupDepth(group,layer)
					lastgroup = group
				endif
			endcase
			case 6: //Edit box
				SetEditBoxDepth(temp.id,layer)
			endcase
			case 7: //Spinner
				SetGUISpinnerDepth(temp.id,layer)
			endcase
			case 8: //Dropdown 
				SetGUIDropDownDepth(temp.id, layer)
			endcase
			case 9: //Keypad 
				SetGUIKeyPadDepth(layer)
			endcase
			case 10: //ColorPicker
				SetGUIColorPickerDepth(layer)
			endcase
		endselect
	next c	
endfunction 1


//*** Repositions a frame and its contents at (x,y) ***
function SetGUIFramePosition(frm as integer, x as float, y as float)
	//*** If invalid frame, exit ***
	if NOT GetGUIFrameExists(frm)
		exitfunction 0
	endif
	//*** Save current position ***
	oldx as float : oldx = GetSpriteX(GUIFRames[frm].spr)
	oldy as float : oldy = GetSpriteY(GUIFRames[frm].spr)
	//*** Reposition frame ***
	SetSpritePosition(GUIFRames[frm].spr,x,y)
	//*** Record new bottom-right coords ***
	x2 as float : x2 = x+GetSpriteWidth(GUIFrames[frm].spr)
	y2 as float : y2 = y+GetSpriteHeight(GUIFrames[frm].spr)
	//*** Reposition frame's contents one widget at a time ***
	temp as ElementType
	for c = 1 to GUIFrames[frm].contents.length
		temp = GUIFrames[frm].contents[c]
		select temp.restype
			case 1: //Sprite
				SetSpritePosition(temp.id,x+GetSpriteX(temp.id)-oldx, y+GetSpriteY(temp.id)-oldy)
				SetSpriteScissor(temp.id,x,y,x+GetSpriteWidth(GUIFrames[frm].spr),y+GetSpriteHeight(GUIFrames[frm].spr))
			endcase
			case 2: //Text
				SetTextPosition(temp.id,x+GetTextX(temp.id)-oldx, y+GetTextY(temp.id)-oldy)
				SetTextScissor(temp.id,x,y,x2,y2)
			endcase
			case 3:  //Button
				SetGUIButtonPosition(temp.id,x+GetSpriteX(GUIButtons[temp.id].spr)-oldx,y+GetSpriteY(GUIButtons[temp.id].spr)-oldy)
				SetSpriteScissor(GUIButtons[temp.id].spr,x,y,x2,y2)
			endcase
			case 4: //Checkbox
				SetGUICheckboxPosition(temp.id,x+GetSpriteX(GUICheckboxes[temp.id].spr)-oldx,y+GetSpriteY(GUICheckboxes[temp.id].spr)-oldy)
				SetSpriteScissor(GUICheckboxes[temp.id].spr,x,y,x2,y2)
				SetTextScissor(GUICheckboxes[temp.id].txt,x,y,x2,y2)
			endcase
			case 5: //Radio button
				RBid = temp.id
				group = RBid / 100
				post = Mod(RBid,100)
				SetGUIRadioButtonPosition(temp.id,x+GetSpriteX(GUIRadioButtons[group].list[post].spr)-oldx,y+GetSpriteY(GUIRadioButtons[group].list[post].spr)-oldy)
				SetSpriteScissor(GUIRadioButtons[group].list[post].spr,x,y,x2,y2)
				SetTextScissor(GUIRadioButtons[group].list[post].txt,x,y,x2,y2)
			endcase
			case 6: //Edit box
				SetEditBoxPosition(temp.id,x+GetEditBoxX(temp.id)-oldx, y+GetEditBoxY(temp.id)-oldy)
				SetEditBoxScissor(temp.id,x,y,x2,y2)
			endcase
			case 7: //Spinner
				SetGUISpinnerPosition(temp.id,x+GetSpriteX(GUISpinner[temp.id].borderID)-oldx,y+GetSpriteY(GUISpinner[temp.id].borderID)-oldy)
				SetSpriteScissor(GUISpinner[temp.id].borderID,x,y,x2,y2)
				SetSpriteScissor(GUISpinner[temp.id].fieldID,x,y,x2,y2)
				SetSpriteScissor(GUIButtons[GUISpinner[temp.id].butIDs[1]].spr,x,y,x2,y2)
				SetSpriteScissor(GUIButtons[GUISpinner[temp.id].butIDs[2]].spr,x,y,x2,y2)
				SetTextScissor(GUISpinner[temp.id].fieldtxtID,x,y,x2,y2)
			endcase
			case 8: //Dropdown
				SetGUIDropDownPosition(temp.id,x+GetSpriteX(GUIDropdown[temp.id].borderID)-oldx,y+GetSpriteY(GUIDropdown[temp.id].borderID)-oldy)
				SetSpriteScissor(GUIDropDown[temp.id].borderID,x,y,x2,y2)
				SetSpriteScissor(GUIDropDown[temp.id].fieldID,x,y,x2,y2)
				SetSpriteScissor(GUIButtons[GUIDropDown[temp.id].butID].spr,x,y,x2,y2)
				SetTextScissor(GUIDropDown[temp.id].fieldtxtID,x,y,x2,y2)
			endcase
			case 9: //keypad
				SetGUIKeyPadPosition(x+GetSpriteX(GUIButtons[GUIKeyPad.keyIDs[1]].spr)-oldx,y+GetSpriteY(GUIButtons[GUIKeyPad.keyIDs[1]].spr)-oldy)
				for k = 1 to GUIKeyPad.keyIDs.length
					SetSpriteScissor(GUIButtons[GUIKeyPad.keyIDs[k]].spr,x,y,x2,y2)
				next k
			endcase
			case 10: //Colour picker
				SetGUIColorPickerPosition(x+GetSpriteX(temp.id)-oldx, y+GetSpriteY(temp.id)-oldy)
				SetSpriteScissor(GUIColorPicker.spr,x,y,x+GetEditBoxWidth(GUIFrames[frm].spr),y+GetEditBoxHeight(GUIFrames[frm].spr))
			endcase
		endselect
	next c
endfunction 1


//**************************************
//***    GUIFrame helper function    ***
//**************************************

//*** Creates a default image for frame ***
//*** Used when no frame image supplied ***
function BuildDefaultGUIFrame(w as float, h as float)
	//*** Create sprite ***
	temp = CreateSprite(0)
	SetSpriteSize(temp,w,h)
	//*** Render to back buffer ***
	ClearScreen()
	DrawSprite(temp)
	result = GetImage(0,0,w,h)
	ClearScreen()
	//*** Delete created sprite ***
	DeleteSprite(temp)
endfunction result





//***************************************
//***         Keypad Functions        ***
//***************************************

type GUIKeyPadType
	keyIDs		as integer[0]	//IDs of key buttons
	keysize		as float			//Size of one key
	keysinrow	as integer		//Keys in one row
	buffer		as string		//Chars being entered
	dataEntered 	as string		//Last complete data entered
	keyvalues	as integer[0] 	//UTF-8 value of keys
	state		as integer		//-1: deleted 0: inactive, 1: active
	entryState	as integer		//0: Entry complete, 1 : entering
endtype

global GUIKeyPad as GUIKeyPadType

//*** Creates a frame containing the keyboard.     ***
//*** Dimensions w by h; top-left at (x,y)         ***
//*** Images used face and keys                    ***
function CreateGUIKeyPad(x as float, y as float,keys as string, kw as float, kInR as integer, bimg as string)
	//*** If invalid parameters, exit ***
	if keys = "" OR kw < 1 OR KInR < 1
		exitfunction 0
	endif
	//*** Expand keys string ***
	keys = ExpandTokenSequence(keys)
	//*** Calc arrays' size ***
	keycount = CountStringTokens(keys,"|")
	GUIKeyPad.keyIDs.length = keycount
	GUIKeyPad.keyvalues.length = keycount
	//*** Save key size and number in row ***
	GUIKeyPad.keysize = kw
	GUIKeyPad.keysinrow = kInR
	//*** Position buttons and store key values ***
	legend as string
	keycount = CountStringTokens(keys,"|")
	for c = 1 to keycount
		legend = GetStringToken(keys,"|",c)
		GUIKeyPad.keyIDs[c] = CreateGUIButton(x+kw*(Mod(c-1,kInR)),y+kw*((c-1)/kInR),kw,kw,bimg,legend)
		if Len(legend) = 1
			if Asc(legend) >= 32 AND Asc(legend) <= 126
				GUIKeyPad.keyvalues[c] = Asc(legend)
			endif
		else
			if Upper(legend) = "BACK"
				GUIKeyPad.keyvalues[c] = 8
			elseif Upper(legend) = "ENTER"
				GUIKeyPad.keyvalues[c] = 13
			elseif Upper(legend) = "SPACE"
				GUIKeyPad.keyvalues[c] = 32
			elseif Upper(legend) = "CLEAR"
				GUIKeyPad.keyvalues[c] = 127
			endif
		endif
	next c
	//*** Save key details ***
	GUIKeyPad.keysize = kw
	GUIKeyPad.keysinrow = kInR
	//*** Empty buffer and last entry ***
	GUIKeyPad.buffer = ""
	GUIKeyPad.dataEntered = ""
	//*** No data being entered ***
	GUIKeyPad.entryState = 0
	//*** Key pad active ***
	GUIKeyPad.state = 1
endfunction 1


//*** Deletes keypad ***
function DeleteGUIKeyPad()
	//*** If invalid, exit 0 ***
	if NOT GetGUIKeyPadExists()
		exitfunction 0
	endif
	//*** Delete keys ***
	for c = 1 to GUIKeyPad.keyIDs.length
		DeleteGUIButton(GUIKeyPad.keyIDs[c])
	next c
	//*** Reset arrays size ***
	GUIKeyPad.keyIDs.length = 0
	GUIKeyPad.keyvalues.length = 0
	//*** Empty buffer and last entry ***
	GUIKeyPad.buffer = ""
	GUIKeyPad.dataEntered = ""
	GUIKeyPad.entryState = 0
	//*** Deleted state ***
	GUIKeypad.state = -1
endfunction 1


//*** Returns contents of buffer ***
function GetGUIKeyPadBuffer()
	//*** If invalid, exit "" ***
	if NOT GetGUIKeyPadExists()
		exitfunction ""
	endif
	result as string : result = GUIKeyPad.buffer
endfunction result


//*** Returns keypad's active state ***
function GetGUIKeyPadEnabled()
	result = GUIKeyPad.state
endfunction result


//*** Returns the last complete entry ***
function GetGUIKeyPadEntry()
	//*** If invalid, exit "" ***
	if NOT GetGUIKeyPadExists()
		exitfunction ""
	endif
	result as string : result = GUIKeyPad.dataEntered
endfunction result


//*** Returns 1 if the keypad exists ***
//*** Returns zero if it does not    ***
function GetGUIKeyPadExists()
	if GUIKeypad.state = -1
		result = 0
	else
		result = 1
	endif
endfunction result


function GetGUIKeyPadX()
	//*** If invalid, exit -1 ***
	if NOT GetGUIKeyPadExists()
		exitfunction -1
	endif
	result as float : result = GetGUIButtonX(GUIKeypad.keyIDs[16])
endfunction result


function GetGUIKeyPadY()
	//*** If invalid, exit -1 ***
	if NOT GetGUIKeyPadExists()
		exitfunction -1
	endif
	result as float : result = GetGUIButtonY(GUIKeypad.keyIDs[16])
endfunction result


//*** Stores value of each key pressed in buffer ***
//*** When Enter pressed, buffer data becomes    ***
//*** last-entry and buffer emptied              ***
//*** Returns 1 if successful                    ***
function HandleGUIKeyPad()
	//*** If invalid, exit 0 ***
	if NOT GetGUIKeyPadExists()
		exitfunction 0
	endif
	result = 0
	//*** Accept key presses until "Enter" pressed ***
		for c = 1 to GUIKeyPad.keyIDs.length
			v = HandleGUIButton(GUIKeyPad.keyIDs[c])
			if v <> 0
				v = GUIKeyPad.keyvalues[c]
				result = 1
				exit
			endif
		next c
			select v  
				case 0 //No key pressed
					exitfunction result
				endcase
				case 8	//Remove last character
					if Len(GUIKeyPad.buffer) > 0
						GUIKeyPad.buffer = Left(GUIKeyPad.buffer,Len(GUIKeyPad.buffer)-1)
					endif
				endcase
				case 13 //Enter
					GUIKeyPad.entryState = 0
					GUIKeyPad.dataEntered = GUIKeyPad.buffer
					GUIKeyPad.buffer = ""
					result = 2
				endcase
				case 127 //Clear data entered 
					GUIKeyPad.buffer = ""
					GUIKeyPad.entryState = 0
				endcase
				case default
					if GUIKeyPad.entryState = 0
						GUIKeyPad.entryState = 1
					endif
					GUIKeyPad.buffer = GUIKeyPad.buffer+Chr(v)
				endcase
			endselect
endfunction result


//*** Sets keypad depth ***
function SetGUIKeyPadDepth(ly as integer)
	if NOT GetGUIKeyPadExists() OR (ly < 0 AND ly > 10000)
		exitfunction 0
	endif
	for c = 1 to GUIKeyPad.keyIDs.length
		SetGUIButtonDepth(GUIKeyPad.keyIDs[c],ly)
	next c
endfunction 1


//*** Disables/enables all keys and makes ***
//*** them invisible/visible              ***
function SetGUIKeyPadEnabled(flag as integer)
	//*** If invalid, exit 0 ***
	if NOT GetGUIKeyPadExists() OR (flag <> 0 AND flag <> 1)
		exitfunction 0
	endif
	//*** Set keys  ***
	for c = 1 to GUIKeyPad.keyIDs.length
		SetGUIButtonEnabled(GUIKeyPad.keyIDs[c],flag)
		SetGUIButtonVisible(GUIKeyPad.keyIDs[c],flag)
	next c
	//*** Record new state ***
	GUIKeyPad.state = flag
endfunction 1


//*** Enables/disables specified keys.  ***
//*** Returns 1 if successful           ***
function SetGUIKeyPadKeysEnabled(keys as string, flag as integer)
	if NOT GetGUIKeyPadExists() OR (flag <> 0 AND flag <> 1)
		exitfunction 0
	endif
	keys = ExpandTokenSequence(keys)
	keycount = CountStringTokens(keys,"|")
	for c = 1 to keycount
		post = FindKeyInKeyPad(GetStringToken(keys,"|",c))
		if post <> 0
			SetGUIButtonEnabled(post,flag)
		endif
	next c
endfunction 1


//*** Positions keypad at (x,y) top-left key ***
//*** Returns 1 if successful                ***
function SetGUIKeyPadPosition(x as float, y as float)
	//*** If invalid, exit 0 ***
	if NOT GetGUIKeyPadExists()
		exitfunction 0
	endif
	//*** Assign shorter names ***
	kw as float : kw = GUIKeyPad.keysize
	kInR = GUIKeyPad.keysinrow
	//*** Move each key to new position ***
	for c = 1 to GUIKeyPad.keyIDs.length
		SetGUIButtonPosition(GUIKeyPad.keyIDs[c],x+kw*(Mod(c-1,kInR)),y+kw*((c-1)/kInR))
	next c
endfunction 1


//**************************************
//***    GUIKeyPad helper function   ***
//**************************************

//*** Returns ID of button showing key ***
function FindKeyInKeyPad(key as string)
	//*** If invalid, exit 0 ***
	if NOT GetGUIKeyPadExists()
		exitfunction 0
	endif
	for c = 1 to GUIKeyPad.keyvalues.length
		if Asc(key) = GUIKeyPad.keyvalues[c]
			exitfunction GUIKeyPad.keyIDs[c]
		endif
	next c
	result = 0
endfunction result


//*** Returns an expanded string filling in ***
//*** assumed chars between .. sequence     ***
function ExpandTokenSequence(seq as string)
	result as string : result = ""
	token1 as string : token1 = ""
	token2 as string : token2 = ""
	token3 as string : token3 = ""
	//*** FOR each token ... ***
	count = CountStringTokens(seq,"|")
	for c = 1 to count 
		token2 = GetStringToken(seq,"|",c)
		//*** If valid ".." token, add assumed tokens ***
		if token2 = ".." AND c > 1 AND c < count
			token3 = GetStringToken(seq,"|",c+1)
			for k = Asc(token1)+1 to Asc(token3)
				result = result + Chr(k)+"|"
			next k
			token1 = token3
			inc c
		else
			result = result + token2+"|"
			token1 = token2
		endif
	next c
endfunction result




//***************************************
//***      PopUp Menu Functions       ***
//***************************************
type GUIPopUpMenuType
	borderID	as integer		//ID of border
	butIDs	as integer[0]	//IDs of menu buttons
	options	as string		//Options string at creation
	values 	as integer[0] 	//Value returned by selected option
	state	as integer		//-1: Deleted 0:Inactive 1: Active
endtype

global GUIPopUp as GUIPopUpMenuType[0]

//*** Create a popup menu at (x,y). opts  contains the text to ***
//*** be shown in the menu and associated value (comma         ***
//*** separated). Each option separated by a pipe (|). bimg is ***
//*** the image file used by the buttons in the menu           ***
function CreateGUIPopUp(opts as string,bimg as string)
	//*** If no menu entries, exit 0 ***
	if opts = ""
		exitfunction 0
	endif
	//*** Add new cell for menu details ***
	GUIPopUp.length = GUIPopUp.length + 1
	//*** Short name for current menu id ***
	id = GUIPopUp.length
	//*** Record option string ***
	GUIPopUp[id].options = opts
	//*** Determine how many options ***
	no_opts = CountStringTokens2(opts,"|")
	//*** Find widest option and count separators ***
	longest = 1
	legends as string[0]
	legends.length = no_opts
	sep_count = 0
	for c = 1 to no_opts
		legends[c] = GetStringToken(opts,"|",c)
		if legends[c] = "-"
			inc sep_count
		endif
		if Len(legends[c]) > Len(legends[longest])
			longest = c
		endif
	next c
	//*** Calculate width of longest option ***
	temp = CreateText(legends[longest])
	width as float : width = GetTextTotalWidth(temp)
	height as float : height = GetTextTotalHeight(temp)
	DeleteText(temp)
	//*** Create background sprite ***
	threepxw as float : threepxw = 100.0/GetDeviceWidth() * 3.0
	threepxh as float : threepxh = 100.0/GetDeviceHeight() * 3.0
	GUIPopUp[id].borderID = CreateSprite(0)
	bID = GUIPopUp[id].borderID
	SetSpriteSize(bID,width+2*threepxw,4*(no_opts-sep_count)+(2+sep_count)*threepxh)
	SetSpritePosition(bID,-999,-999)
	SetSpriteShapeCircle(bID,0,0,0)
	SetSpriteDepth(bID,0)
	SetSpriteVisible(bID,0)
	FixSpriteToScreen(bID,1)
	token as string
	//*** Add a button for each option and save value ***
	cury as float : cury = -999+threepxh
	k = 1
	for c = 1 to no_opts
		token = GetStringToken2(opts,"|",c)
		//*** If separator, add gap ***
		if token = "-"
			cury = cury + threepxh
		else 	//add button for this option
			//*** Expand arrays to match ***
			GUIPopUp[id].values.length = GUIPopUp[id].values.length + 1
			GUIPopUp[id].butIDs.length = GUIPopUp[id].butIDs.length + 1
			GUIPopUp[id].butIDs[k] = CreateGUIButton(-999+threepxw,cury,width,4,bimg,GetStringToken2(token,",",1))
			SetGUIButtonEnabled(GUIPopUp[id].butIDs[k],0)
			SetGUIButtonVisible(GUIPopUp[id].butIDs[k],0)
			SetGUIButtonDepth(GUIPopUp[id].butIDs[k],0)
			GUIPopUp[id].values[k] = Val(GetStringToken2(token,",",2))
			inc k
			cury = cury + 4
		endif
	next c
	//*** Popup menu inactive ***
	GUIPopUp[id].state = 0
endfunction id


//*** Deletes the pop-up menu ***
function DeleteGUIPopUp(id as integer)
	if NOT GetGUIPopUpExists(id)
		exitfunction 0
	endif
	//*** Delete menu visuals ***
	for c = 1 to GUIPopUp[id].butIDs.length
		DeleteGUIButton(GUIPopUp[id].butIDs[c])
	next c
	DeleteSprite(GUIPopUp[id].borderID)
	//*** Popup menu does not exist ***
	GUIPopUp[id].state = -1
endfunction 1


//*** Gets current activation state ***
function GetGUIPopUpEnabled(id as integer)
	if NOT GetGUIPopUpExists(id)
		exitfunction -1
	endif
	result = GUIPopUp[id].state
endfunction result


//*** Returns 1 if menu exists, else zero ***
function GetGUIPopUpExists(id as integer)
	//*** If id invalid or deleted, result is 0 ***
	if id < 1 OR id > GUIPopUp.length
		result = 0
	elseif GUIPopUp[id].state = -1
		result = 0
	else
		result = 1
	endif
endfunction result


//*** Returns the value of the menu option selected ***
function HandleGUIPopUp(id as integer)
	if NOT GetGUIPopUpExists(id)
		exitfunction 0
	endif
	result = 0
	//*** Find out which option has been selected ***
	for c = 1 to GUIPopUp[id].butIDs.length
		hit = HandleGUIButton(GUIPopUp[id].butIDs[c])
		if hit
			result = GUIPopUp[id].values[c]
			exit
		endif
	next c
	x1 as float : x1 = ScreenToWorldX(GetSpriteX(GUIPopUp[id].borderID))
	y1 as float : y1 = ScreenToWorldY(GetSpriteY(GUIPopUp[id].borderID))
	x2 as float : x2 = x1+GetSpriteWidth(GUIPopUp[id].borderID)
	y2 as float : y2 = y1+GetSpriteHeight(GUIPopUp[id].borderID)
	if result <> 0 OR (GetPointerPressed() AND NOT InsideArea(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()),x1 ,y1,x2,y2))
		SetGUIPopUpEnabled(id,0)
	endif
endfunction result


//*** Activates/deactivates menu ***
function SetGUIPopUpEnabled(id as integer, fl as integer)
	if NOT GetGUIPopUpExists(id) OR (fl <> 0 AND fl <> 1)
		exitfunction 0
	endif
	for c = 1 to GUIPopUp[id].butIDs.length
		SetGUIButtonEnabled(GUIPopUp[id].butIDs[c],fl)
		SetGUIButtonVisible(GUIPopUp[id].butIDs[c],fl)
	next c
	SetSpriteVisible(GUIPopUp[id].borderID,fl)
	GUIPopUp[id].state = fl
	//*** If disabled, move off screen ***
	if fl = 0
		SetGUIPopUpPosition(id,-999,-999)
	endif
endfunction 1


//*** Positions popup at (x,y) ***
function SetGUIPopUpPosition(id as integer, x as float, y as float)
	//*** If invalid, exit 0 ***
	if NOT GetGUIPopUpExists(id)
		exitfunction 0
	endif
	//*** Calculate change in position ***
	xdiff as float : xdiff = x - GetSpriteX(GUIPopUp[id].borderID)
	ydiff as float : ydiff = y - GetSpriteY(GUIPopUp[id].borderID)
	//*** Reposition all elements of popup ***
	SetSpritePosition(GUIPopUp[id].borderID,GetSpriteX(GUIPopUp[id].borderID)+xdiff, GetSpriteY(GUIPopUp[id].borderID)+ydiff)
	for c = 1 to GUIPopUp[id].butIDs.length
		butID = GUIPopUp[id].butIDs[c]
		SetGUIButtonPosition(butID,GetGUIButtonX(butID)+xdiff,GetGUIButtonY(butID)+ydiff)
	next c
endfunction 1
	




//***************************************
//***     Radio Button functions      ***
//***************************************
type RadioButtonType 
	img		as integer	//Image ID
	spr 		as integer 	//Sprite ID 
	txt 		as integer 	//Text ID 
	align	as integer	//Text alignment
	state	as integer	//Button state 0:disabled, 1: enabled
endtype

type RadioButtonGroupType
	selected	as integer				//subscript of selected button in group
	list		as RadioButtonType[0]	//List of RBs in group
endtype

global GUIRadioButtons as RadioButtonGroupType[10]

//*** Creates a radio button at position (x,y) ***
//*** belonging to group grp. Constructed from ***
//*** image + legend. If no file name, use     ***
//*** default image                            ***
function CreateGUIRadioButton(x as float, y as float, w as float, img as string, legend as string, grp as integer)
	//*** Check group is in range 1 to 10, else exit *** 
	if grp < 1 or grp > 10 
		exitfunction 0 
	endif
	//*** Add to collection of buttons in that group *** 
	GUIRadioButtons[grp].list.length = GUIradiobuttons[grp].list.length + 1
	//*** Assign a shorter name to this position ***
	post = GUIRadioButtons[grp].list.length
	//*** If image, load it ***
	if img <>""
		GUIRadioButtons[grp].list[post].img = LoadImage(img)
	else
		GUIRadioButtons[grp].list[post].img = BuildDefaultGUIRadioButton()
	endif
	//*** Load image into sprite ***
	GUIRadioButtons[grp].list[post].spr = CreateSprite(GUIRadioButtons[grp].list[post].img)
	//*** Convert to an animated sprite 2 frames)***
	SetSpriteAnimation(GUIRadioButtons[grp].list[post].spr, GetImageWidth(GUIRadioButtons[grp].list[post].img) , GetImageHeight(GUIRadioButtons[grp].list[post].img)/2,2)
	//*** Size sprite ***
	SetSpriteSize(GUIRadioButtons[grp].list[post].spr,w,-1)
	//*** Position sprite ***
	SetSpritePosition(GUIRadioButtons[grp].list[post].spr,x,y)
	//*** Sprite to layer 5 ***
	SetSpriteDepth(GUIRadioButtons[grp].list[post].spr,5)
	//*** Fix sprite to screen ***
	FixSpriteToScreen(GUIRadioButtons[grp].list[post].spr,1)
	//*** Create and position text ***
	GUIRadioButtons[grp].list[post].txt = CreateText(legend)
	SetTextSize(GUIRadioButtons[grp].list[post].txt,w+0.5)
	SetTextColor(GUIRadioButtons[grp].list[post].txt,0,0,0,255)
	//*** Fix text to screen ***
	FixTextToScreen(GUIRadioButtons[grp].list[post].txt,1)
	adj as float
	adj = GetSpriteHeight(GUIRadioButtons[grp].list[post].spr)- GetTextTotalHeight(GUIRadioButtons[grp].list[post].txt)
	SetTextPosition(GUIRadioButtons[grp].list[post].txt,x+GetSpriteWidth(GUIRadioButtons[grp].list[post].spr)+w/4.0, y+adj/2.0 )
	//*** Text to layer 5 ***
	SetTextDepth(GUIRadioButtons[grp].list[post].txt,5)
	//*** If first radio button in group ...***
	if post = 1
		//*** Show frame 2 ***
		SetSpriteFrame(GUIRadioButtons[grp].list[post].spr,2)
		//*** Record as selected button ***
		GUIRadioButtons[grp].selected = post
	else
		//*** Show first frame ***
		SetSpriteFrame(GUIRadioButtons[grp].list[post].spr,1)
	endif
	//*** Text to right of graphic ***
	GUIRadioButtons[grp].list[post].align = 1
	//*** Radio button is active ***
	GUIRadioButtons[grp].list[post].state = 1
	//*** Return ID ***
	result = grp*100 + post
endfunction result


//*** Marks a radio button as deleted ***
//*** and deletes visual elements ***
function DeleteGUIRadioButtonGroup(grp as integer)
	//*** If invalid radio button group, exit ***
	if grp < 1 or grp > 10 
		exitfunction 0
	endif
	for c = 0 to GUIRadioButtons[grp].list.length
		//*** Delete visual elements ***
		DeleteSprite(GUIRadioButtons[grp].list[c].spr)
		DeleteImage(GUIRadioButtons[grp].list[c].img)
		DeleteText(GUIRadioButtons[grp].list[c].txt)
	next c
	//*** Delete cells in group ***
	GUIRadioButtons[grp].list.length = -1
	//*** Set selected to zero ***
	GUIRadioButtons[grp].selected = 0
endfunction 1


//*** Returns 1 if radio button exists ***
function GetGUIRadioButtonExists(id as integer)
	grp = id / 100
	post = Mod(id,100)
	if grp < 1 or grp > 10 
		result = 0
	elseif post < 1 or post > GUIRadioButtons[grp].list.length
		result = 0
	else
		result = 1
	endif
endfunction result


//*** Returns the number of the selected radio button   ***
//*** in grp. If grp invalid, -2 is returned; if grp    ***
//*** contains no radio buttons, -1 is returned         ***
function GetGUIRadioButtonSelectedInGroup(grp as integer)
	//*** If invalid radio button ID, exit ***
	if grp < 1 or grp > 10 
		exitfunction -2
	endif
	//*** If no buttons in group ***
	if GUIRadioButtons[grp].list.length = 0
		result = -1
	else
		result = GUIRadioButtons[grp].selected
	endif
endfunction result



//*** Sets the radio button graphic frame         ***
//*** when clicked on. Also returns the subscript ***
//*** of the currently selected RB                ***
function HandleGUIRadioButtonGroup(grp as integer)
	//*** If invalid radio button group, exit ***
	if grp < 1 or grp > 10 
		exitfunction 0
	endif
	result = 0
	//*** Check each radio button in group ***
	for c = 1 to GUIRadioButtons[grp].list.length
		//*** Ignore disabled radio buttons ***
		if GUIRadioButtons[grp].list[c].state = 0
			continue
		endif
		//*** If pointer over radio button ...
		PworldX as float : PworldX = ScreenToWorldX(GetPointerX())
		PworldY as float : PworldY = ScreenToWorldY(GetPointerY())
		if GetSpriteHit(PworldX,PworldY ) = GUIRadioButtons[grp].list[c].spr OR GetTextHitTest(GUIRadioButtons[grp].list[c].txt,PworldX, PworldY)
			//*** ... and pointer pressed, change frame ***
			if GetPointerPressed()
				//*** Reset any previously selected RB in group ***
				if GUIRadioButtons[grp].selected <> 0
					SetSpriteFrame(GUIRadioButtons[grp].list[GUIRadioButtons[grp].selected].spr,1)
				endif
				//*** Select this radio button ***
				SetSpriteFrame(GUIRadioButtons[grp].list[c].spr,2)
				//*** Record as selected ***
				GUIRadioButtons[grp].selected = c
				result = 1
			endif
		endif
	next c	
endfunction result


//*** Selects a radio button in a group ***
function SelectGUIRadioButton(id as integer)
	if NOT GetGUIRadioButtonExists(id)
		exitfunction 0
	endif
	grp = id / 100
	post = Mod(id,100)
	//*** Reset any previously selected RB in group ***
	if GUIRadioButtons[grp].selected <> 0
		SetSpriteFrame(GUIRadioButtons[grp].list[GUIRadioButtons[grp].selected].spr,1)
	endif
	//*** Select this radio button ***
	SetSpriteFrame(GUIRadioButtons[grp].list[post].spr,2)
	//*** Record as selected ***
	GUIRadioButtons[grp].selected = post
endfunction 1


//*** Sets the radio button's graphic and text depth to layer ***
function SetGUIRadioButtonGroupDepth(grp as integer, layer as integer)
	//*** If invalid radio button group, exit ***
	if grp < 1 or grp > 10 
		exitfunction 0
	endif
	//*** If invalid depth, exit ***
	if layer < 0 or layer > 10000
		exitfunction 0
	endif		
	//*** For each radio button in group ***
	for c = 1 to GUIRadioButtons[grp].list.length
		//*** Set sprite depth ***
		SetSpriteDepth(GUIRadioButtons[grp].list[c].spr,layer)
		//*** Set text depth ***
		SetTextDepth(GUIRadioButtons[grp].list[c].txt,layer)
	next c
endfunction 1


//*** Enables/disables radio button ***
function SetGUIRadioButtonEnabled(id as integer, fl as integer)
	//*** If invalid ID or setting, return 0 ***
	if NOT GetGUIRadioButtonExists(id) OR (fl <> 0 AND fl <> 1)
		exitfunction 0
	endif
	grp = id / 100
	post = Mod(id,100)
	GUIRadioButtons[grp].list[post].state = fl
	//*** If RB is the one selected in group ***
	if GetSpriteCurrentFrame(GUIRadioButtons[grp].list[post].spr) = 2
		//*** Unselect RB ***
		SetSpriteFrame(GUIRadioButtons[grp].list[post].spr,1)
		//*** No RB in group selected ***
		GUIRadioButtons[grp].selected = 0
	endif
	SetSpriteColorAlpha(GUIRadioButtons[grp].list[post].spr,128 + 128*fl)
	SetTextColorAlpha(GUIRadioButtons[grp].list[post].txt,128+128*fl)
endfunction 1


//*** Enables/disables all radio buttons in a group ***
function SetGUIRadioButtonGroupEnabled(grp as integer, fl as integer)
	//*** If invalid group or setting, return 0 ***
	if grp < 1 OR grp > 10 OR (fl <> 0 AND fl <> 1)
		exitfunction 0
	endif
	for c = 1 to GUIRadioButtons[grp].list.length
		GUIRadioButtons[grp].list[c].state = fl
		SetSpriteFrame(GUIRadioButtons[grp].list[c].spr,1)
		SetSpriteColorAlpha(GUIRadioButtons[grp].list[c].spr,128 + 128*fl)
		SetTextColorAlpha(GUIRadioButtons[grp].list[c].txt,128+128*fl)
	next c
	//*** If group disabled, none are selected ***
	if fl = 0
		GUIRadioButtons[grp].selected = 0
	endif	
endfunction 1


//*** Repositions radio button to (x,y) and returns 1 ***
//*** if successful, otherwise 0 is returned      ***
function SetGUIRadioButtonPosition(id as integer, x as float, y as float)
	//*** If invalid radio button ID, exit ***
	if NOT GetGUIRadioButtonExists(id)
		exitfunction 0
	endif
	grp = id / 100
	post = Mod(id,100)
	//*** Position sprite ***
	SetSpritePosition(GUIRadioButtons[grp].list[post].spr,x,y)
	//*** Position text ***
	adj as float
	adj = GetSpriteHeight(GUIRadioButtons[grp].list[post].spr)- GetTextTotalHeight(GUIRadioButtons[grp].list[post].txt)
	entry as RadioButtonType
	entry = GUIRadioButtons[grp].list[post]
	if entry.align = 1
		SetTextPosition(entry.txt,GetSpriteX(entry.spr)+GetSpriteWidth(entry.spr)+1, GetSpriteY(entry.spr)+adj/2.0)
	else
		SetTextPosition(entry.txt,GetSpriteX(entry.spr)-1,GetSpriteY(entry.spr)+adj/2.0)
	endif
endfunction 1


//*** Sets colour of radio button’s text to col ***
function SetGUIRadioButtonTextAlignment(id as integer, al as integer)
//*** If invalid radio button ID, exit ***
	if NOT GetGUIRadioButtonExists(ID) OR (al <> 1 AND al <> 2)
		exitfunction 0
	endif
	grp = id / 100
	post = Mod(id,100)
	GUIRadioButtons[grp].list[post].align = al
	adj as float
	adj = GetSpriteHeight(GUIRadioButtons[grp].list[post].spr)- GetTextTotalHeight(GUIRadioButtons[grp].list[post].txt)
	if al = 1
		SetTextAlignment(GUIRadioButtons[grp].list[post].txt,0)
		SetTextPosition(GUIRadioButtons[grp].list[post].txt,GetSpriteX(GUIRadioButtons[grp].list[post].spr)+GetSpriteWidth(GUIRadioButtons[grp].list[post].spr)+1, GetSpriteY(GUIRadioButtons[grp].list[post].spr)+adj/2.0)
	else
		SetTextAlignment(GUIRadioButtons[grp].list[post].txt,2)
		SetTextPosition(GUIRadioButtons[grp].list[post].txt,GetSpriteX(GUIRadioButtons[grp].list[post].spr)-1,GetSpriteY(GUIRadioButtons[grp].list[post].spr)+adj/2.0)
	endif
endfunction 1


//*** Sets colour of radio button's text to col ***
function SetGUIRadioButtonTextColor(id as integer, col as integer)
	//*** If invalid radio button ID, exit ***
	if NOT GetGUIRadioButtonExists(ID)
		exitfunction 0
	endif
	grp = id / 100
	post = Mod(id,100)
	//*** Set text colour ***
	SetTextColor(GUIRadioButtons[grp].list[post].txt,(col&&0xFF0000)>>16, (col&&0xFF00)>>8, (col&&0xFF),255)
endfunction 1


//*** Changes the size of the radio button's text to sz ***
function SetGUIRadioButtonTextSize(id as integer, sz as float)
	//*** If invalid radio button ID, exit ***
	if NOT GetGUIRadioButtonExists(ID)
		exitfunction 0
	endif
	grp = id / 100
	post = Mod(id,100)
	//*** Set text size ***
	SetTextSize(GUIRadioButtons[grp].list[post].txt,sz)
	adj as float
	adj = GetSpriteHeight(GUIRadioButtons[grp].list[post].spr) - GetTextTotalHeight(GUIRadioButtons[grp].list[post].txt)
	if GUIRadioButtons[grp].list[post].align = 1
		SetTextPosition(GUIRadioButtons[grp].list[post].txt,GetSpriteX(GUIRadioButtons[grp].list[post].spr)+GetSpriteWidth(GUIRadioButtons[grp].list[post].spr)+1, GetSpriteY(GUIRadioButtons[grp].list[post].spr)+adj/2.0)
	else
		SetTextPosition(GUIRadioButtons[grp].list[post].txt,GetSpriteX(GUIRadioButtons[grp].list[post].spr)-1,GetSpriteY(GUIRadioButtons[grp].list[post].spr)+adj/2.0)
	endif
endfunction 1



//**************************************
//*** GUIKRadioButton helper function***
//**************************************

//*** Construct default radio button graphic ***
function BuildDefaultGUIRadioButton()
	//*** Create rectangular radio button ***
	//*** This represents the 2 frames ***
	temp1 = CreateSprite(0)
	SetSpriteSize(temp1,5,5)
	SetSpriteColor(temp1,200,200,200,255)
	temp2 = CreateSprite(0)
	SetSpriteSize(temp2,3,3)
	SetSpriteColor(temp2,0,0,0,255)
	SetSpritePosition(temp2,1,1)
	temp1a = CloneSprite(temp1)
	SetSpritePosition(temp1a,0,5)
	temp2a = CloneSprite(temp2)
	SetSpritePosition(temp2a,1,6)
	temp3 = CreateSprite(0)
	SetSpriteSize(temp3,1,1)
	SetSpritePosition(temp3,2,7)
	//*** Capture as an image ***
	ClearScreen()
	DrawSprite(temp1)
	DrawSprite(temp1a)
	DrawSprite(temp2)
	DrawSprite(temp2a)
	DrawSprite(temp3)
	result = GetImage(0,0,5,10)
	//*** Delete all elements used ***
	ClearScreen()
	DeleteSprite(temp1)
	DeleteSprite(temp1a)
	DeleteSprite(temp2)
	DeleteSprite(temp2a)
	DeleteSprite(temp3)
endfunction result




//***************************************
//***        Spinner Functions        ***
//***************************************	
	
type GUISpinnerType
	borderID		as integer		//ID of border
	fieldID		as integer		//Field sprite ID	
	fieldtxtID	as integer		//ID of text
	butIDs		as integer[2]	//ID of buttons
	fieldval		as integer		//Value in field
	fieldmin		as float			//Minimum field value
	fieldmax		as float			//Maximum field value
	state		as integer		//-1:deleted, 0: disabled, 1 :enabled
endtype

global GUISpinner as GUISpinnerType[0]

//*** Creates a new Spinner widget ***
//*** and returns its ID           ***
function CreateGUISpinner(x as float,y as float,w as float,h as float,min as integer, max as integer, butimg as string)
	//*** Add new element to Spinner array ***
	GUISpinner.length = GUISpinner.length + 1
	//*** Create Spinner's borderIDground sprite ***
	GUISpinner[GUISpinner.length].borderID = CreateSprite(0)
	bID = GUISpinner[GUISpinner.length].borderID
	SetSpriteSize(bID,w,h)
	SetSpritePosition(bID,x,y)
	SetSpriteShapeCircle(bID,0,0,0)
	SetSpriteDepth(bID,5)
	FixSpriteToScreen(bID,1)
	//*** Calculate button dimensions ***
	threepxw as float : threepxw = 100.0/GetDeviceWidth() * 3.0
	threepxh as float : threepxh = 100.0/GetDeviceHeight() * 3.0
	butw as float : butw = w * 0.2
	buth as float : buth = (h - (2*threepxh))/2.0 - threepxh/2.0
	//*** Create up and down buttons (allow for path info) ***
	post = FindStringReverse(butimg,"\")
	path as string : path = Left(butimg,post)
	filename as string : filename = Right(butimg,Len(butimg)-post)
	upfile as string : upfile = path+"up"+filename
	downfile as string : downfile = path+"down"+filename
	GUISpinner[GUISpinner.length].butIDs[1] = CreateGUIButton(x+w*0.8-threepxw,y+threepxh,butw,buth,upfile,"")
	GUISpinner[GUISpinner.length].butIDs[2] = CreateGUIButton(x+w*0.8-threepxw,y+2*threepxh+buth,butw,buth,downfile,"")
	//*** Add field sprite ***
	GUISpinner[GUISpinner.length].fieldID = CreateSprite(0)
	innerspr = GUISpinner[GUISpinner.length].fieldID
	SetSpriteSize(innerspr,w*0.8-(3*threepxw),h-(2*threepxh))
	SetSpritePosition(innerspr,x+threepxw,y+threepxh)
	SetSpriteColor(innerspr,150,150,150,255)
	SetSpriteShapeCircle(innerspr,0,0,0)
	SetSpriteDepth(innerspr,5)
	FixSpriteToScreen(innerspr,1)
	GUISpinner[GUISpinner.length].fieldval = 0
	GUISpinner[GUISpinner.length].fieldtxtID = CreateText(Str(GUISpinner[GUISpinner.length].fieldval))
	txtID = GUISpinner[GUISpinner.length].fieldtxtID
	SetTextAlignment(txtID,2)
	SetTextSize(txtID,GetSpriteHeight(innerspr)-2*threepxh)
	SetTextPosition(txtID,x+w*0.8-(3*threepxw),y+threepxh)
	SetTextDepth(txtID,5)
	FixTextToScreen(txtID,1)
	SetTextScissor(txtID,x+2*threepxw,y+threepxh,x+w*0.8-(3*threepxw),y+h-(2*threepxh))
	GUISpinner[GUISpinner.length].fieldmin = min
	GUISpinner[GUISpinner.length].fieldmax = max
	result = GUISpinner.length
	GUISpinner[GUISpinner.length].state = 1
endfunction result


//*** Deletes Spinner          ***
//*** Returns 1 if successful ***
function DeleteGUISpinner(id as integer)
	if NOT GetGUISpinnerExists(id)
		exitfunction 0
	endif
	//*** Record as deleted ***
	GUISpinner[id].state = -1
	//*** Delete visuals ***
	DeleteSprite(GUISpinner[id].borderID)
	DeleteSprite(GUISpinner[id].fieldID)
	DeleteText(GUISpinner[id].fieldtxtID)
	DeleteGUIButton(GUISpinner[id].butIds[1])
	DeleteGUIButton(GUISpinner[id].butIds[2])
endfunction 1


//*** Returns 1 if Spinner of specified ID exists ***
function GetGUISpinnerExists(id as integer)
	if id < 0
		result = 0
	elseif id > GUISpinner.length
		result = 0
	elseif GUISpinner[id].state = -1
		result = 0
	else
		result = 1
	endif
endfunction result


//*** Returns Spinner's state      ***
//*** Returns -1 if does not exist ***
function GetGUISpinnerEnabled(id as integer)
	if NOT GetGUISpinnerExists(id)
		exitfunction -1
	endif
	result = GUISpinner[id].state
endfunction result


//*** Returns current value of spinner ***
//*** Returns -1 if invalid ID         ***
function GetGUISpinnerValue(id as integer)
	//*** If invalid ID, exit minimum - 1 ***
	if NOT GetGUISpinnerExists(id)
		exitfunction GUISpinner[id].fieldmin-1
	elseif GetGUISpinnerEnabled(id) <> 1
		exitfunction GUISpinner[id].fieldmin-1
	endif
	result = GUISpinner[id].fieldval
endfunction result


//*** Interacts with user causing Spinner button  ***
//*** clicks to increment/decrement the displayed ***
//*** value. The value will not move outside the  ***
//*** min/max range                               ***
//*** Returns 1 if interaction occurred           ***
function HandleGUISpinner(id as integer)
	//*** If invalid ID, exit 0 ***
	if NOT GetGUISpinnerExists(id)
		exitfunction 0
	elseif GetGUISpinnerEnabled(id) <> 1
		exitfunction 0
	endif
	//*** Test each button ***
	buthit = 0
	for c = 1 to 2
		hit = HandleGUIButton(GUISpinner[id].butIDs[c])
		if hit
			buthit = c
			exit
		endif
	next c
	//*** Adjust value if button hit ***
	select buthit
		case 1 // Up Button
			if GUISpinner[id].fieldval < GUISpinner[id].fieldmax
				inc GUISpinner[id].fieldval
			endif
		endcase
		case 2 // Down Button
			if GUISpinner[id].fieldval > GUISpinner[id].fieldmin
				dec GUISpinner[id].fieldval
			endif
		endcase
	endselect
	//*** Update the value displayed ***
	if buthit
		SetTextString(GUISpinner[id].fieldtxtID,Str(GUISpinner[id].fieldval))
		result = 1
	else
		result = 0
	endif
endfunction result


//*** Sets Spinner's border colour ***
//*** Returns 1 if successful      ***
function SetGUISpinnerBorderColor(id as integer, col as integer)
	if NOT GetGUISpinnerExists(id)
		exitfunction 0
	elseif GetGUISpinnerEnabled(id) <> 1
		exitfunction 0
	endif
	red = col >> 16
	green = (col && 0X0000FF00) >> 8
	blue = col && 0X000000FF
	SetSpriteColor(GUISpinner[id].borderID,red,green,blue,255)
endfunction 1


//*** Moves Spinner to depth ly ***
//*** Returns 1 if successful   ***
function SetGUISpinnerDepth(id as integer, ly as integer)
	//*** If invalid ID, exit 0 ***
	if NOT GetGUISpinnerExists(id) OR ly < 0 OR ly > 10000
		exitfunction 0
	elseif GetGUISpinnerEnabled(id) <> 1
		exitfunction 0
	endif
	//*** Modify depth of each element to ly ***
	SetSpriteDepth(GUISpinner[id].borderID,ly)
	SetSpriteDepth(GUISpinner[id].fieldID,ly)
	SetTextDepth(GUISpinner[id].fieldtxtID,ly)
	SetGUIButtonDepth(GUISpinner[id].butIds[1],ly)
	SetGUIButtonDepth(GUISpinner[id].butIds[2],ly)
endfunction 1


//*** Enables/disables Spinner ***
//*** Returns 1 if successful  ***
function SetGUISpinnerEnabled(id as integer, fl as integer)
	if NOT GetGUISpinnerExists(id) OR (fl <> 0 AND fl <> 1)
		exitfunction 0
	endif
	//*** Adjust state ***
	GUISpinner[id].state = fl
	//*** Adjust visuals and disable butttons ***
	SetSpriteColorAlpha(GUISpinner[id].borderID,128+128*fl)
	SetSpriteColorAlpha(GUISpinner[id].fieldID,128+128*fl)
	SetTextColorAlpha(GUISpinner[id].fieldtxtID,128+128*fl)
	SetGUIButtonEnabled(GUISpinner[id].butIds[1],fl)
	SetGUIButtonEnabled(GUISpinner[id].butIds[2],fl)
endfunction 1


//*** Sets Spinner's data field background colour ***
//*** Returns 1 if successful                     ***
function SetGUISpinnerFieldColor(id as integer, col as integer)
	if NOT GetGUISpinnerExists(id)
		exitfunction 0
	elseif GetGUISpinnerEnabled(id) <> 1
		exitfunction 0
	endif
	red = col >> 16
	green = (col && 0X0000FF00) >> 8
	blue = col && 0X000000FF
	SetSpriteColor(GUISpinner[id].fieldID,red,green,blue,255)
endfunction 1


//*** Sets Spinner's upper and lower limits                 ***
//*** Returns: 1 if successful, 0 if Spinner does not exist ***
//*** -1: actual value changed to new lower limit           ***
//*** -2: actual value changed to new upper limit           *** 
function SetGUISpinnerLimits(id as integer, min as integer, max as integer)
	//*** If invalid ID, exit 0 ***
	if NOT GetGUISpinnerExists(id)
		exitfunction 0
	elseif GetGUISpinnerEnabled(id) <> 1
		exitfunction 0
	endif
	result = 1
	//*** Set minimum value ***
	if GUISpinner[id].fieldval < min 
		GUISpinner[id].fieldval = min 	
		result = -1
	endif
	GUISpinner[id].fieldmin = min 
	//*** Set maximum value ***
	if GUISpinner[id].fieldval > max  
		GUISpinner[id].fieldval = max 
		result = -2
	endif
	GUISpinner[id].fieldmax = max  
	//*** Update value displayed ***
	SetTextString(GUISpinner[id].fieldtxtID,Str(GUISpinner[id].fieldval))
endfunction result


//*** Repositions Spinner     ***
//*** Returns 1 if successful ***
function SetGUISpinnerPosition(id as integer, x as float, y as float)
	//*** If invalid ID, exit 0 ***
	if NOT GetGUISpinnerExists(id)
		exitfunction 0
	elseif GetGUISpinnerEnabled(id) <> 1
		exitfunction 0
	endif
	SetSpritePosition(GUISpinner[id].borderID,x,y)
	//*** Calculate button dimensions ***
	threepxw as float : threepxw = 100.0/GetDeviceWidth() * 3.0
	threepxh as float : threepxh = 100.0/GetDeviceHeight() * 3.0
	w as float : w = GetSpriteWidth(GUISpinner[id].borderID)
	h as float : h = GetSpriteHeight(GUISpinner[id].borderID)
	butw as float : butw = w * 0.2
	buth as float : buth =  (h - (2*threepxh))/2.0 - threepxh/2.0
	//*** Reposition up and down buttons ***
	SetGUIButtonPosition(GUISpinner[id].butIds[1],x+w*0.8-threepxw,y+threepxh)
	SetGUIButtonPosition(GUISpinner[id].butIds[2],x+w*0.8-threepxw,y+2*threepxh+buth)
	//*** Reposition field ***
	SetSpritePosition(GUISpinner[id].fieldID,x+threepxw,y+threepxh)
	//*** Reposition text ***
	SetTextPosition(GUISpinner[id].fieldtxtID,	x+w*0.8-(3*threepxw),y+threepxh)
	SetTextScissor(GUISpinner[id].fieldtxtID,x+2*threepxw,y+threepxh,x+w*0.8-(3*threepxw),y+h-(2*threepxh))
endfunction 1


//*** Resizes Spinner to w by h ***
//*** Returns 1 if successful   ***
function SetGUISpinnerSize(id as integer, w as float, h as float)
	//*** If invalid ID, exit 0 ***
	if NOT GetGUISpinnerExists(id)
		exitfunction 0
	elseif GetGUISpinnerEnabled(id) <> 1
		exitfunction 0
	endif
	SetSpriteSize(GUISpinner[id].borderID,w,h)
	//*** Calculate button dimensions ***
	threepxw as float
	threepxh as float
	threepxw = 100.0/GetDeviceWidth() * 3.0
	threepxh = 100.0/GetDeviceHeight() * 3.0
	butw as float
	buth as float
	butw = w * 0.2
	buth =  (h - (2*threepxh))/2.0 - threepxh/2.0
	//*** Reposition up and down buttons ***
	x as float: x = GetSpriteX(GUISpinner[id].borderID)
	y as float: y = GetSpriteY(GUISpinner[id].borderID)
	SetGUIButtonSize(GUISpinner[id].butIds[1],butw,buth)
	SetGUIButtonPosition(GUISpinner[id].butIds[1],x+w*0.8-threepxw,y+threepxh)
	SetGUIButtonSize(GUISpinner[id].butIds[2],butw,buth)
	SetGUIButtonPosition(GUISpinner[id].butIds[2],x+w*0.8-threepxw,y+2*threepxh+buth)
	//*** Reposition field ***
	SetSpriteSize(GUISpinner[id].fieldID,w*0.8-(3*threepxw),h-(2*threepxh))
	SetSpritePosition(GUISpinner[id].fieldID,x+threepxw,y+threepxh)
	//*** Resize and reposition text ***
	SetTextSize(GUISpinner[id].fieldtxtID,GetSpriteHeight(GUISpinner[id].fieldID)-2*threepxh)
	SetTextPosition(GUISpinner[id].fieldtxtID,	x+w*0.8-(3*threepxw),y+threepxh)
	SetTextScissor(GUISpinner[id].fieldtxtID,x+2*threepxw,y+threepxh,x+w*0.8-(3*threepxw),y+h-(2*threepxh))
endfunction 1


//*** Set Spinner's value ***
function SetGUISpinnerValue(id as integer, v as integer)
	//*** If invalid ID, exit 0 ***
	if NOT GetGUISpinnerExists(id)
		exitfunction 0
	elseif GetGUISpinnerEnabled(id) <> 1
		exitfunction 0
	endif
	//*** If new value outside limits, exit -1 ***
	if v < GUISpinner[id].fieldmin OR v > GUISpinner[id].fieldmax
		exitfunction -1
	endif
	//*** Update value held and displayed ***
	GUISpinner[id].fieldval = v
	SetTextString(GUISpinner[id].fieldtxtID,Str(GUISpinner[id].fieldval))
endfunction 1





//**************************************
//***   Stopwatch Data & Functions   ***
//**************************************
type StopwatchType
	faceimg		as integer	//ID of face image
	startstopimg	as integer 	//ID for start stop button image
	resetimg		as integer	//ID for reset button image
	handimg 		as integer	//ID of watch hand image
	facespr		as integer	//ID of face sprite
	ssspr		as integer	//ID of start/stop button sprite
	resetspr 	as integer	//ID of reset button sprite
	handspr 		as integer 	//ID of watch hand sprite
	timetxt		as integer	//ID of text showing elapsed time
	time    		as integer 	//Elapsed time since started (msecs)
	stoptime		as integer	//Time on watch when stopped
	laststarted	as integer	//App time of last start
	state		as integer 	//-1: deleted, 0: stopped, 1: running
	startenabled	as integer	//Start/Stop enabled (1:yes, 0:no)
	resetenabled	as integer	//Reset button enabled (1 or 0)
endtype
	
global GUIStopwatches as StopwatchType[0]


//*** Creates stopwatch. Uses images facefile+facefileshad+facefiless+facefilereset+facefilehand ***
//*** The time elapsed is set to zero and the watch is stopped, buttons are enabled              ***
function CreateGUIStopwatch(x as float, y as float, w as float, h as float, facefile as string)
	//*** Add cell to stopwatch list ***
	GUIStopwatches.length = GUIStopwatches.length+1
	//*** Last position in array is new button's ID ***
	id = GUIStopwatches.length
	//*** Construct image file names (allow for path info) ***
	post = FindStringReverse(facefile,"\")
	path as string : path = Left(facefile,post)
	filename as string : filename = Right(facefile,Len(facefile)-post)
	ssfile as string : ssfile = path+Left(filename,Len(filename)-4)+"ss"+Right(filename,4)
	resetfile as string : resetfile = path+Left(filename,Len(filename)-4)+"reset"+Right(filename,4)
	handfile as string : handfile = path+Left(filename,Len(filename)-4)+"hand"+Right(filename,4)
	//*** Load images ***
	GUIStopwatches[id].faceimg = LoadImage(facefile)
	GUIStopwatches[id].startstopimg = LoadImage(ssfile)
	GUIStopwatches[id].resetimg = LoadImage(resetfile)
	GUIStopwatches[id].handimg = LoadImage(handfile)
	//*** Find actual width and height of watch face ***
	temp = CreateSprite(GUIStopwatches[id].faceimg)
	SetSpriteSize(temp,w,h)
	w = GetSpriteWidth(temp)
	h = GetSpriteHeight(temp)
	DeleteSprite(temp)
	//*** Create, size, position and layer start/stop button ***
	GUIStopwatches[id].ssspr = CreateSprite(GUIStopwatches[id].startstopimg)
	ssid = GUIStopwatches[id].ssspr
	SetSpriteSize(ssid,w*0.15,-1)
	SetSpritePositionByOffset(ssid,x+w/2.0,y-h/15.5)
	SetSpriteDepth(ssid,5)
	FixSpriteToScreen(ssid,1)
	//*** Create, size, position and layer reset button ***
	GUIStopwatches[id].resetspr = CreateSprite(GUIStopwatches[id].resetimg)
	resetid = GUIStopwatches[id].resetspr
	SetSpriteSize(resetid,w*0.13,-1)
	SetSpritePositionByOffset(resetid,x+w/1.5,y)
	SetSpriteDepth(resetid,5)
	FixSpriteToScreen(resetid,1)
	//*** Create, size and position face sprite ***
	GUIStopwatches[id].facespr = CreateSprite(GUIStopwatches[id].faceimg)
	faceid = GUIStopwatches[id].facespr
	SetSpriteSize(faceid,w,h)
	SetSpritePosition(faceid,x,y)
	SetSpriteDepth(faceid,5)
	FixSpriteToScreen(faceid,1)
	//*** Create, align, size, position and layer time label ***
	GUIStopwatches[id].timetxt = CreateText("0:00")
	txtid = GUIStopwatches[id].timetxt
	SetTextAlignment(txtid,2)
	SetTextSize(txtid,h*0.08)
	SetTextPosition(txtid,x+w/1.68, y+h/1.747)
	SetTextDepth(txtid,5)
	FixTextToScreen(txtid,1)
	//*** Create, size, position and layer seconds hand ***
	GUIStopwatches[id].handspr = CreateSprite(GUIStopwatches[id].handimg)
	handid = GUIStopwatches[id].handspr
	SetSpriteSize(handid,-1,h*0.22)
	SetSpriteOffset(handid,GetSpriteWidth(handid)/2.0,GetSpriteHeight(handid))
	SetSpritePositionByOffset(handid,GetSpriteX(faceid)+w/2.0,GetSpriteY(faceid)+h/2.0)
	SetSpriteDepth(handid, 4)
	FixSpriteToScreen(handid,1)
	//*** Stopwatch buttons enabled ***
	GUIStopwatches[id].startenabled = 1
	GUIStopwatches[id].resetenabled = 1
	//*** Stopwatch stopped ***
	GUIStopwatches[id].state = 0
	//*** Stopwatch never been started ***
	GUIStopwatches[id].laststarted = 0
endfunction id


//*** Deletes stopwatch and resources ***
function DeleteGUIStopwatch(id as integer)
	//*** If the id is invalid, exit ***
	if NOT GetGUIStopwatchExists(id)
		exitfunction 0
	endif
	//*** Mark as deleted ***
	GUIStopwatches[id].state = -1
	//*** Delete sprites ***
	DeleteSprite(GUIStopwatches[id].facespr)
	DeleteSprite(GUIStopwatches[id].ssspr)
	DeleteSprite(GUIStopwatches[id].resetspr)
	DeleteSprite(GUIStopwatches[id].handspr)
	//*** Delete label ***
	DeleteText(GUIStopwatches[id].timetxt)
	//*** Delete images ***
	DeleteImage(GUIStopwatches[id].faceimg)
	DeleteImage(GUIStopwatches[id].startstopimg)
	DeleteImage(GUIStopwatches[id].resetimg)
	DeleteImage(GUIStopwatches[id].handimg)
endfunction 1


//*** Returns 1 if watch id exists,  ***
//*** else returns zero              ***
function GetGUIStopwatchExists(id as integer)
	result = 1
	//*** If id invalid or watch deleted, exit 0 ***
	if id < 1 or id > GUIStopwatches.length
		result = 0
	elseif GUIStopwatches[id].state = -1
		result = 0
	endif
endfunction result


//*** Returns 1 if user can interact with    ***
//*** stopwatch Reset button, else zero is   ***
//*** returned. -1 if invalid                ***
function GetGUIStopwatchResetEnabled(id as integer)
 	//*** If the id is invalid, exit -1 ***
	if NOT GetGUIStopwatchExists(id)
		exitfunction -1
	endif
	result = GUIStopwatches[id].resetenabled
endfunction result


//*** Returns 1 if user can interact with    ***
//*** stopwatch Start/Stop button, else zero ***
//*** is returned  . -1 if invalid           ***
function GetGUIStopwatchStartEnabled(id as integer)
 	//*** If the id is invalid, exit -1 ***
	if NOT GetGUIStopwatchExists(id)
		exitfunction -1
	endif
	result = GUIStopwatches[id].startenabled
endfunction result


//*** Returns the current state of the ***
//*** stopwatch (running or stopped)   ***
//*** -1 if invalid                    ***
function GetGUIStopwatchState(id as integer)
	//*** If the id is invalid, exit ***
	if NOT GetGUIStopwatchExists(id)
		exitfunction -1
	endif
	//*** Set result to watch current state ***
	result = GUIStopwatches[id].state
endfunction result


//*** Returns the stopwatch's time ***
function GetGUIStopwatchTime(id as integer)
	//*** If the id is invalid, exit -1 ***
	if NOT GetGUIStopwatchExists(id)
		exitfunction -1
	endif
	//*** Return time ***
	result = GUIStopwatches[id].time
endfunction result


//*** Handles user interaction with watch ***
//*** Allows start/stop and reset         ***
//*** Returns a value indicating action   ***
function HandleGUIStopwatch(id as integer)
	//*** If the id is invalid, exit zero ***
	if NOT GetGUIStopwatchExists(id)
		exitfunction 0
	endif
	result = 0
	//*** If watch disabled, exit zero ***
	if GUIStopwatches[id].startenabled = 0 AND GUIStopwatches[id].resetenabled = 0
		exitfunction 0
	endif
	result = 0
	//*** If pointer pressed ***
	if GetPointerPressed()
		hit = GetSpriteHit(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
		//*** If start/stop button pressed ***
		if hit = GUIStopwatches[id].ssspr AND GetGUIStopwatchStartEnabled(id)
			//*** Show start/stop button moving down and back ***
			SetSpriteY(hit, GetSpriteY(hit)+GetSpriteHeight(hit)/2.0)
			Sync()
			Sleep(100)
			SetSpriteY(hit, GetSpriteY(hit)-GetSpriteHeight(hit)/2.0)
			//*** If watch stopped, start it ***
			if GUIStopwatches[id].state = 0
				StartGUIStopwatch(id)
				GUIStopwatches[id].state = 1
				result = 1
			else //If watch running, stop it 
				StopGUIStopwatch(id)
				result = -1
			endif
		//*** If reset pressed ***
		elseif hit = GUIStopwatches[id].resetspr AND GetGUIStopwatchResetEnabled(id)
			//*** Show reset button moving down and back ***
			SetSpritePosition(hit,GetSpriteX(hit)-GetSpriteWidth(hit)/5.0,GetSpriteY(hit)+GetSpriteHeight(hit)/4.0)
			Sync()
			Sleep(100)
			SetSpritePosition(hit,GetSpriteX(hit)+GetSpriteWidth(hit)/5.0,GetSpriteY(hit)-GetSpriteHeight(hit)/4.0)
			ResetGUIStopwatch(id)
			result = 2
		endif
	endif
endfunction result


//*** Resets the time to zero and places ***
//*** the watch in stopped mode          ***
function ResetGUIStopwatch(id as integer)
	//*** If the id is invalid, exit ***
	if NOT GetGUIStopwatchExists(id)
		exitfunction 0
	endif
	//*** Stopwatch stopped ***
	GUIStopwatches[id].state = 0
	//*** No time has been recorded ***
	GUIStopwatches[id].time = 0
	GUIStopwatches[id].stoptime = 0
	//*** Reset second hand and digital time ***
	SetSpriteAngle(GUIStopwatches[id].handspr,0)
	SetTextString(GUIStopwatches[id].timetxt,"0:00")
endfunction 1


//*** Disables user interaction with stopwatch ***
function SetGUIStopwatchControls(id as integer, fl as integer)
	//*** If the id is invalid, exit ***
	if NOT GetGUIStopwatchExists(id)
		exitfunction 0
	endif
	//*** If flag outside 0 to 3, exit ***
	if fl < 0 OR fl > 3
		exitfunction 0
	endif
	//*** Set controls ***
 	GUIStopwatches[id].startenabled = fl && %01
 	GUIStopwatches[id].resetenabled = fl && %10
 endfunction 1
 
 
 //*** Sets the depth of the stopwatch ***
function SetGUIStopwatchDepth(id as integer, ly as integer)
	//*** If the id is invalid, exit ***
	if NOT GetGUIStopwatchExists(id)
		exitfunction 0
	endif
	//*** If depth invalid, exit ***
	if ly < 1 or ly > 10000
		exitfunction 0
	endif
	//*** Create a set of shorter names ***
	faceid = GUIStopwatches[id].facespr
	ssid = GUIStopwatches[id].ssspr
	resetid = GUIStopwatches[id].resetspr
	handid = GUIStopwatches[id].handspr
	txtid = GUIStopwatches[id].timetxt
	//*** Set the depth of each component ***
	SetSpriteDepth(faceid,ly)
	SetSpriteDepth(ssid,ly)
	SetSpriteDepth(resetid,ly)
	SetTextDepth(txtid,ly)
	SetSpriteDepth(handid,ly-1)
endfunction 1
 
 
 //*** Positions stopwatch face top-left at (x,y) ***
function SetGUIStopwatchPosition(id as integer, x as float, y as float)
	//*** If the id is invalid, exit ***
	if NOT GetGUIStopwatchExists(id)
		exitfunction 0
	endif
	//*** Create a set of shorter names ***
	faceid = GUIStopwatches[id].facespr
	ssid = GUIStopwatches[id].ssspr
	resetid = GUIStopwatches[id].resetspr
	handid = GUIStopwatches[id].handspr
	txtid = GUIStopwatches[id].timetxt
	//*** Position face ***
	SetSpritePosition(faceid,x,y)
	//*** Position start/stop button ***
	SetSpritePositionByOffset(ssid,x+GetSpriteWidth(faceid)/2.0,y-GetSpriteHeight(ssid)/2.1)
	//*** Position reset button ***
	SetSpritePositionByOffset(resetid,x+GetSpriteWidth(faceid)/1.5,y)
	//*** Position time label ***
	SetTextPosition(txtid,x+GetSpriteWidth(faceid)/1.68, y+GetSpriteHeight(faceid)/1.747)
	//*** Position seconds hand ***
	SetSpritePositionByOffset(handid,GetSpriteX(faceid)+GetSpriteWidth(faceid)/2.0,GetSpriteY(faceid)+GetSpriteHeight(faceid)/2.0)
endfunction 1


//*** Resizes the specified stopwatch ***
function SetGUIStopwatchSize(id as integer, w as float, h as float)
	//*** If the id is invalid, exit ***
	if NOT GetGUIStopwatchExists(id)
		exitfunction 0
	endif
	//*** Create a set of shorter names ***
	faceid = GUIStopwatches[id].facespr
	ssid = GUIStopwatches[id].ssspr
	resetid = GUIStopwatches[id].resetspr
	handid = GUIStopwatches[id].handspr
	txtid = GUIStopwatches[id].timetxt
	x as float
	x = GetSpriteX(faceid)
	y as float
	y = GetSpriteY(faceid)
	//*** Sizeface sprite ***
	SetSpriteSize(faceid,w,h)
	//*** Size and reposition start/stop button ***
	SetSpriteSize(ssid,w*0.15,-1)
	SetSpritePositionByOffset(ssid,x+GetSpriteWidth(faceid)/2.0,y-GetSpriteHeight(ssid)/2.1)
	//*** Size and reposition reset button ***
	SetSpriteSize(resetid,w*0.13,-1)
	SetSpritePositionByOffset(resetid,x+GetSpriteWidth(faceid)/1.5,y)
	//*** Size and reposition time label ***
	SetTextSize(txtid,GetSpriteHeight(faceid)*0.08)
	SetTextPosition(txtid,x+GetSpriteWidth(faceid)/1.68, y+GetSpriteHeight(faceid)/1.747)
	//*** Size and reposition seconds hand ***
	SetSpriteSize(handid,-1,GetSpriteHeight(faceid)*0.22)
	SetSpriteOffset(handid,GetSpriteWidth(handid)/2,GetSpriteHeight(handid))
	SetSpritePositionByOffset(handid,GetSpriteX(faceid)+GetSpriteWidth(faceid)/2.0,GetSpriteY(faceid)+GetSpriteHeight(faceid)/2.0)
endfunction 1


//*** Starts stopwatch running ***
function StartGUIStopwatch(id as integer)
	//*** If the id is invalid, exit ***
	if NOT GetGUIStopwatchExists(id)
		exitfunction 0
	endif
	//*** Set to running state ***
	GUIStopwatches[id].state = 1
	//*** Record app time when watch started ***
	GUIStopwatches[id].laststarted = GetMilliseconds()
endfunction 1


//*** Stops the stopwatch running ***
function StopGUIStopwatch(id as integer)
	//*** If the id is invalid, exit ***
	if NOT GetGUIStopwatchExists(id)
		exitfunction 0
	endif
	//*** Set to stopped state ***
	GUIStopwatches[id].state = 0
	//*** Save current time on watch ***
	GUIStopwatches[id].stoptime = GUIStopwatches[id].time
endfunction 1


//*** Update the stopwatch visuals, moving   ***
//*** seconds hand and changing digital time ***
function UpdateGUIStopwatch(id as integer)
	//*** If the id is invalid, exit ***
	if NOT GetGUIStopwatchExists(id)
		exitfunction 0
	endif
	//*** If watch stopped, exit ***
	if GUIStopwatches[id].state = 0
		exitfunction 1
	endif
	//*** Record the time passed ***
	GUIStopwatches[id].time = GUIStopwatches[id].stoptime+(GetMilliseconds()-GUIStopwatches[id].laststarted) 
	msecs = GUIStopwatches[id].time
	//*** Modify angle of seconds hand to show seconds into current minute ***
	SetSpriteAngle(GUIStopwatches[id].handspr,msecs*6.0/1000.0)
	//*** Update the digital time on label ***
	SetTextString(GUIStopwatches[id].timetxt,ToMinutesSeconds(msecs))
endfunction 1
	
              
//**************************************
//***   Stopwatch helper function    ***
//**************************************
//*** Returns a formatted time string (m:ss)***
function ToMinutesSeconds(msecs as integer)
	totalsecs = msecs /1000
	mins = totalsecs / 60
	secs = Mod(totalsecs,60)
	result as string
	result = Str(mins)+":"+Right("0"+Str(secs),2)
endfunction result





//**************************************
//*** TrafficLights Data & Functions ***
//**************************************
type TrafficLightsType
	spr		as integer	//Traffic light (4 frame)
	state	as integer	//-1:del, 0:off, 1:red, 2:amber, 3:green
endtype

global GUITrafficLights as TrafficLightsType[0]


//*** Creates a four-frame traffic light (r,a,g,grey)
function CreateGUITrafficLights(x as float, y as float, w as float, img as string)
	//*** Add cell to trafficlights list ***
	GUITrafficLights.length = GUITrafficLights.length+1
	//*** Last position in array is new trafficlight’s ID ***
	id = GUITrafficLights.length
	//*** Create 4-frame sprite using default/specified image ***
	if img = ""
		GUITrafficLights[id].spr = BuildDefaultGUITrafficLights(w)
	else
		GUITrafficLights[id].spr = CreateSprite(LoadImage(img))
		//*** Convert to an animated sprite (4 frames) ***
		imgID = GetSpriteImageID(GUITrafficLights[id].spr)
		SetSpriteAnimation(GUITrafficLights[id].spr, GetImageWidth(imgID),GetImageHeight(imgID)/4,4)
	endif
	//*** Show first frame ***
	SetSpriteFrame(GUITrafficLights[id].spr,1)
	//*** Size sprite ***
	SetSpriteSize(GUITrafficLights[id].spr,w,-1)
	//*** Position Sprite ***
	SetSpritePosition(GUITrafficLights[id].spr,x,y)
	//*** Draw on layer 5 ***
	SetSpriteDepth(GUITrafficLights[id].spr,5)
	//*** Trafficlights state = red showing ***
	GUITrafficLights[id].state = 1
endfunction id
	
	
//*** Deletes trafficlights. Returns 1 if okay ***
//*** else zero returned                       ***
function DeleteGUITrafficLights(id as integer)
	if NOT GetGUITrafficLightsExists(id)
		exitfunction 0
	endif
	//*** Record as deleted ***
	GUITrafficLights[id].state = -1
	//*** Delete visuals ***
	DeleteImage(GetSpriteImageID(GUITrafficLights[id].spr))
	DeleteSprite(GUITrafficLights[id].spr)
endfunction 1


//*** Fixes lights to screen ***
function FixGUITrafficLightsToScreen(id as integer, fl as integer)
	if NOT GetGUITrafficLightsExists(id) OR fl < 0 OR fl > 1
		exitfunction 0
	endif
	FixSpriteToScreen(GUITrafficLights[id].spr,fl)
endfunction 1


//*** Returns 1 if enabled,zero: disabled, -1: fail ***
function GetGUITrafficLightsEnabled(id as integer)
	if NOT GetGUITrafficLightsExists(id)
		result = -1
	elseif  GUITrafficLights[id].state = 0
		result = 0
	else
		result = 1
	endif
endfunction result


//*** Returns 1 if lights exist, else zero ***	
function GetGUITrafficLightsExists(id as integer)
	if id < 1 OR id > GUITrafficLights.length
		result = 0
	elseif  GUITrafficLights[id].state = -1
		result = 0
	else
		result = 1
	endif
endfunction result


//*** Returns state of lights 1:red, 2:amber, 3:green ***
//*** 0: disabled, -1: does not exist                 ***
function GetGUITrafficLightsState(id as integer)
	if NOT GetGUITrafficLightsExists(id)
		result = -1
	else
		result = GUITrafficLights[id].state
	endif
endfunction result



//*** Changes colour on each click ***
//*** Returns 1 if okay, else zero ***
function HandleGUITrafficLights(id as integer)
	if NOT GetGUITrafficLightsExists(id)
		exitfunction 0
	elseif NOT GetGUITrafficLightsEnabled(id)
		exitfunction 0
	endif
	result = 0
	hit = GetSpriteHit(ScreenToWorldX(GetPointerX()),ScreenToWorldY(GetPointerY()))
	if GetPointerPressed() AND hit = GUITrafficLights[id].spr
		GUITrafficLights[id].state = Mod(GUITrafficLights[id].state,3)+1
		SetSpriteFrame(GUITrafficLights[id].spr,GUITrafficLights[id].state)
		result = 1
	endif
endfunction result


//*** Sets the trafficlights' colour(1:red/2:amber/3:green) ***
//*** Returns 1 if okay, otherwise zero                     ***
function SetGUITrafficLightsColor(id as integer, cf as integer)
	if NOT GetGUITrafficLightsExists(id) OR cf < 1 OR cf > 3
		exitfunction 0
	elseif GetGUITrafficLightsEnabled(id) <> 1
		exitfunction 0
	endif
	GUITrafficLights[id].state = cf
	SetSpriteFrame(GUITrafficLights[id].spr,cf)
endfunction 1


//*** Sets lights' depth. Returns 1 if okay ***
//*** else returns zero                     ***
function SetGUITrafficLightsDepth(id as integer, ly as integer)
	if NOT GetGUITrafficLightsExists(id) OR ly < 0 OR ly > 10000
		exitfunction 0
	endif
	SetSpriteDepth(GUITrafficLights[id].spr,ly)
endfunction 1

	
//*** Enables/Disables lights           ***
//*** Returns 1 if okay, otherwise zero ***
function SetGUITrafficLightsEnabled(id as integer, fl as integer)
	if NOT GetGUITrafficLightsExists(id) OR fl < 0 OR fl > 1
		exitfunction 0
	endif
	SetSpriteFrame(GUITrafficLights[id].spr,Mod(fl+3,4)+1)
	GUITrafficLights[id].state = fl
endfunction 1


//*** Positions lights at (x,y). Returns 1 if okay ***
//*** else returns zero                            ***
function SetGUITrafficLightsPosition(id as integer, x as float, y as float)
	if NOT GetGUITrafficLightsExists(id)
		exitfunction 0
	endif
	SetSpritePosition(GUITrafficLights[id].spr,x,y)
endfunction 1


//*** Resizes lights. Returns 1 if okay ***
//*** else returns zero                  ***
function SetGUITrafficLightsSize(id as integer, sz as float)
	if NOT GetGUITrafficLightsExists(id)
		exitfunction 0
	endif
	SetSpriteSize(GUITrafficLights[id].spr,sz,-1)
endfunction 1





//***************************************
//***GUIBTrafficLights helper function***
//***************************************

//*** Creates a trafficlights sprite using default images ***
//*** Returns ID of button sprite created                 ***
function BuildDefaultGUITrafficLights(w as float) 
	//***Create sprite ***
	tempspr = CreateSprite(0)
	//** Set size of sprite **
	h as float : h = w*GetDisplayAspect()
	SetSpriteSize(tempspr,w,h)
	//*** First frame (red) ***
	SetSpriteColor(tempspr,255,0,0,255)
	//***Grab first frame ***
	ClearScreen()
	DrawSprite(tempspr)
	img1 = GetImage(0,0,w,h)
	ClearScreen()
	//*** Second frame (amber) ***
	SetSpriteColor(tempspr,0xFF,0xBF,0,255)
	ClearScreen()
	DrawSprite(tempspr)
	img2 = GetImage(0,0,w,h)
	ClearScreen()
	//*** Third frame (green) ***
	SetSpriteColor(tempspr,0,255,0,255)
	ClearScreen()
	DrawSprite(tempspr)
	img3 = GetImage(0,0,w,h)
	ClearScreen()
	//*** Fourth frame (grey) ***
	SetSpriteColor(tempspr,100,100,100,255)
	ClearScreen()
	DrawSprite(tempspr)
	img4 = GetImage(0,0,w,h)
	result = CreateSprite(img1)
	SetSpriteAnimation(result,GetImageWidth(img1), GetImageHeight(img1),1)
	AddSpriteAnimationFrame(result,img2)
	AddSpriteAnimationFrame(result,img3)
	AddSpriteAnimationFrame(result,img4)
	//*** Delete elements used ***
	DeleteSprite(tempspr)
endfunction result





//**************************************
//***       Counter Widget           ***
//**************************************

type GUICounterType
	sprIDs		as integer[0]	//IDs of counter sprites
	min 			as integer		//Min value of count
	max 			as integer		//Max value of count
	value 		as integer		//Current value setting
	display		as integer		//Current value displayed
	timeInc		as integer		//Time interval between changes
	add 			as integer		//1:Adding to count, 0: subtracting from count
	state		as integer		//-1: deleted, 0:disabled 1: counting
endtype

global GUICounter as GUICounterType[0]

function CreateGUICounter(x as float,y as float,w as float,min as integer,max as integer,img as string)
	if min > max OR img = ""
		exitfunction 0
	endif
	//*** Increase size of GUICounter array ***
	GUICounter.length = GUICounter.length + 1
	//*** Use last element subscript as counter's ID ***
	id = GUICounter.length
	//*** Set up the number of sprites needed ***
	digits = Len(Str(max))
	GUICounter[id].sprIDs.length = digits
	imgID = LoadImage(img)
	//*** Create sprite for each digit ***
	for c = 1 to digits
		GUICounter[id].sprIDs[c] = CreateSprite(imgID)
		SetSpriteAnimation(GUICounter[id].sprIDs[c],GetImageWidth(imgID),GetImageHeight(imgID)/10,10)
		SetSpriteSize(GUICounter[id].sprIDs[c],w,-1)
		SetSpritePosition(GUICounter[id].sprIDs[c],x+(c-1)*w,y)
	next c
	GUICounter[id].max = max
	GUICounter[id].min = min
	GUICounter[id].value = 0
	GUICounter[id].display = 0
	GUICounter[id].timeInc = 0
	GUICounter[id].add = 1
	GUICounter[id].state = 1
endfunction id


function GetGUICounterExists(id as integer)
	if id < 1 OR id > GUICounter.length 
		result = 0
	elseif GUICounter[id].state = -1
		result = 0
	else
		result = 1
	endif
endfunction result

function GetGUICounterDigits(id as integer)
	if NOT GetGUICounterExists(id)
		result = 0
	else
		result = GUICounter[id].sprIDs.length 
	endif
endfunction result

function IncGUICounter(id as integer)
	if NOT GetGUICounterExists(id)
		exitfunction 0
	endif
	inc GUICounter[id].value
	temp = GUICounter[id].value
	digits = GetGUICounterDigits(id)
	for c = 1 to digits
		dig = Mod(temp,10)
		temp = temp / 10
		SetSpriteFrame(GUICounter[id].sprIDs[digits-c+1],dig+1)
	next c
endfunction 1
		
	
	
//**************************************
//***     Tabbed Pages Widget        ***
//**************************************
type GUITabType
	leftID		as integer	//ID of left part of tab sprite
	midID		as integer	//ID of mid part of tab sprite
	rightID		as integer	//ID of right part of tab sprite
	legendID		as integer	//ID of tab's text
	textSize 	as float		//Size of tab's text
	textCol		as integer	//Colour of text
	backCol		as integer	//Colour of tab background
	width		as float		//Width of tab
	x			as float		//Coords of tab
	y			as float
endtype

global GUITabs as GUITabType[0]

function CreateGUITab(x as float, y as float, left as string, mid as string, right as string, leg as string, sz as float)
	//*** Increase size of GUITabs array ***
	GUITabs.length = GUITabs.length + 1
	id = GUITabs.length
	//*** Set up text ***
	GUITabs[id].textSize = sz
	GUITabs[id].textCol = 0
	GUITabs[id].legendID = CreateText(leg)
	SetTextAlignment(GUITabs[id].legendID,0)
	SetTextSize(GUITabs[id].legendID,sz)
	SetTextColor(GUITabs[id].legendID,0,0,0,255)
	txtWidth as float : txtwidth = GetTextTotalWidth(GUITabs[id].legendID)
	txtHeight as float : txtHeight = GetTextTotalHeight(GUITabs[id].legendID)
	px5W as float : px5W = 100.0/GetDeviceWidth() * 5
	px3H as float : px5H = 100.0/GetDeviceHeight() * 3
	SetTextPosition(GUITabs[id].legendID,x+px5W,y+px3H)
	//*** Create tab sprites ***
	GUITabs[id].leftID = CreateSprite(LoadImage(left))
	SetSpriteSize(GUITabs[id].leftID,px5W,txtHeight+2*px3H)
	SetSpritePosition(GUITabs[id].leftID,x,y)
	GUITabs[id].midID = CreateSprite(LoadImage(mid))
	SetSpriteSize(GUITabs[id].midID,txtWidth,txtHeight+2*px5H)
	SetSpritePosition(GUITabs[id].midID,x+px5W,y)
	GUITabs[id].rightID = CreateSprite(LoadImage(right))
	SetSpriteSize(GUITabs[id].rightID,px5W,txtHeight+2*px3H)
	SetSpritePosition(GUITabs[id].rightID,x+px5W+txtWidth,y)
	//*** Set other values ***
endfunction id
	
	












function IsOutsideFrame(frm as integer,x as float, y as float)
	//*** If invalid frame, exit ***
	if NOT GetGUIFrameExists(frm)
		exitfunction -2
	endif
	frmx1 as float
	frmx2 as float
	frmy1 as float
	frmy2 as float
	frmx1 = GetSpriteX(GUIFrames[frm].spr)
	frmy1 = GetSpriteY(GUIFrames[frm].spr)
	frmx2 = frmx1 + GetSpriteWidth(GUIFrames[frm].spr)
	frmy2 = frmy1 + GetSpriteHeight(GUIFrames[frm].spr)
	if x < frmx1 or x > frmx2 or y < frmy1 or y > frmy2
		result = 1
	else
		result = 0
	endif
endfunction result
	

/*
//*** Adds a sprite line ***
function AddSpriteLineToGUIFrame(frm as integer, x1 as float, y1 as float, x2 as float, y2 as float, w as float, col as integer, op as integer)
	//*** If invalid frame, exit ***
	if NOT GetGUIFrameExists(frm)
		exitfunction 0
	endif
	//*** Expand contents array ***
	GUIFrames[frm].contents.length = GUIFrames[frm].contents.length+1
	//*** Save position of new entry ***
	post = GUIFrames[frm].contents.length
	//*** Record as sprite line ***
	GUIFrames[frm].contents[post].restype = 8
	//*** Create line sprite and save ID ***
	GUIFrames[frm].contents[post].id = DrawSpriteLine(GetFrameX(frm)+x1,GetFrameY(frm)+y1,GetFrameX(frm)+x2,GetFrameY(frm)+y2,w,col,op)
endfunction post



//***************************************
//***        Number Pad Code          ***
//***************************************
type GUINumberPadType
	frm 			as integer	//Frame used for menu options
	txtID 		as integer	//ID of text display
	delOnEnter	as integer	//Delete pad when Enter pressed(1)
endtype

global GUINumberPad as GUINumberPadType


//*** Creates a frame containing the keyboard.     ***
//*** Dimensions w by h; top-left at (x,y)         ***
//*** Images used face and keys                    ***
function CreateGUINumberPad(x as float, y as float, w as float, h as float, face as string, keys as string, del as integer)
	//*** Set delete indicator ***
	if del = 0
		GUINumberPad.delOnEnter = 0
	else
		GUINumberPad.delOnEnter = 1
	endif
	//*** Create frame for menu ***
	GUINumberPad.frm = CreateGUIFrame(x,y,w,h,face)
	//*** Add text to display value entered ***
	AddTextToGUIFrame(GUINumberPad.frm,w*0.85,h*0.06,"0",3,0x0,0)
	//*** Store text's ID ***
	GUINumberPad.txtID = Mod(GetGUIFrameElementDetails(GUINumberPad.frm,1),1000000)
	//*** Align text right ***
	SetTextAlignment(GUINumberPad.txtID,2)
	//*** Set button size as % of frame ***
	butsz as float
	butsz = w*0.8/3.0
	//*** Position buttons ***
	AddButtonToGUIFrame(GUINumberPad.frm,w*0.1+butsz,3*butsz+h*0.25,butsz,butsz,keys,"0")
	for c = 1 to 9
		AddButtonToGUIFrame(GUINumberPad.frm,Mod(c-1,3)*butsz+w*0.1,(c-1)/3*butsz+h*0.25,butsz,butsz,keys,Str(c))
	next c
	AddButtonToGUIFrame(GUINumberPad.frm,w*0.1,3*butsz+h*0.25,butsz,butsz,keys,"Back")
	AddButtonToGUIFrame(GUINumberPad.frm,w*0.1+2*butsz,3*butsz+h*0.25,butsz,butsz,keys,"Enter")
endfunction

//*** Moves the text display to a new position ***
function MoveGUINumberPadText(x as float, y as float)
	if GetGUINumberPadExists()
		frmx = GetSpriteX(GUIFrames[GUINumberPad.frm].spr)
		frmy = GetSpriteY(GUIFrames[GUINumberPad.frm].spr)
		SetTextPosition(GUINumberPad.txtID,frmx+x,frmy+y)
	endif
endfunction

//*** Resizes the text display ***
function ResizeGUINumberPadText(sz as float)
	if GetGUINumberPadExists()
		SetTextSize(GUINumberPad.txtID,sz)
	endif
endfunction

//*** Accepts value from the keys. Pressing "Back" ***
//*** deletes the last digit. Pressing "Enter"     ***
//*** returns the value entered and deletes the    ***
//*** keypad                                       ***
function HandleGUINumberPad()
	if NOT GetGUINumberPadExists()
		exitfunction 0
	endif
	num = 0
	//*** Accept key presses until "Enter" pressed ***
	repeat
		v = HandleGUIFrame(GUINumberPad.frm)-2
		if Len(Str(num))< 9 
			select v : //Add numeric digit to value 
				case 0,1,2,3,4,5,6,7,8,9:
					num = num*10+v
				endcase
				case 10: //Remove last digit enterd 
					num = num / 10
				endcase
			endselect
			//*** Update displayed value ***
			SetTextString(GUINumberPad.txtID,Str(num))
		endif
		Sync()
	until v = 11
	//*** Delete or reset keypad ***
	if GUINumberPad.delOnEnter = 1
		DeleteGUINumberPad()
	else
		SetTextString(GUINumberPad.txtID,"0")
	endif
	//*** Return the value entered ***
endfunction num

//*** Deletes the keypad frame ***
function DeleteGUINumberPad()
	if GetGUINumberPadExists()
		DeleteGUIFrame(GUINumberPad.frm)
		GUINumberPad.frm = -1
	endif
endfunction


function GetGUINumberPadExists()
	if GUINumberPad.frm = -1
		result = 0
	else
		result = 1
	endif
endfunction result



//***************************************
//***      Sprite Line Functions      ***
//***************************************

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

//*** Moves existing sprite line relative ***
//*** to its current position             ***
function MoveSpriteLineRel(id as integer, x as float, y as float)
	absx as float
	absy as float
	absx = x + GetSpriteX(id)
	absy = y + GetSpriteY(id)
	SetSpritePosition(id,absx,absy)
endfunction

//*** Sets the depth of the sprite line ***
function SetSpriteLineDepth(id as integer, layer as integer)
	SetSpriteDepth(id,layer)
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

*/

