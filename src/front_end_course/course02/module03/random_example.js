function testBracketsDynamicAccess() {
    var dynamicKey;
    var randomNumber = Math.random();
    console.log(randomNumber);
    if(randomNumber > 0.5) {
      dynamicKey = "speed";
     }else{
       dynamicKey = "color";
     }
  
      var drone = {
        speed: 15,
        color: "orange"
      }
  
      console.log(drone[dynamicKey]);
  }
  testBracketsDynamicAccess();
  