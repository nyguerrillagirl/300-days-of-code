<? 
	function fail( $msg ) 
	{ 
		echo $msg; 
		exit(); 
	} 

	//uploaded file 
	if ($_FILES["myfile"]["tmp_name"] == "") 
		fail( "No file uploaded." ); 
	if ($_FILES["myfile"]["error"] > 0) 
	{ 
		switch ($_FILES['myfile']['error']) 
		{ 
			case 1: 
				fail( 'File exceeded maximum server upload size.');
 				break; 
			case 2:
				fail( 'File exceeded maximum file size.' ); 
				break; 
			case 3: //partial file 
			case 4: //no file
				fail( 'An error occurred during file upload, please try again' ); 
				break;
		} 
	}
	$filename = basename($_FILES["myfile"]['name']); 
	$size = (int) $_FILES["myfile"]["size"]; 
	//check file does not exist and place it in its new location 
	$filepath = "gamesfolder/$filename"; 
	if ( file_exists($filepath) ) 
		fail("That file has already been uploaded. If this should not be the case please contact support quoting the filename."); 			
		if (@move_uploaded_file( $_FILES["myfile"]["tmp_name"],$filepath) == FALSE ) 
			fail("Could not move uploaded file, please try again."); 
	if (@chmod( $filepath, 0744 ) == FALSE) 
		fail("Could not modify uploaded file, please contact support.");
?>
