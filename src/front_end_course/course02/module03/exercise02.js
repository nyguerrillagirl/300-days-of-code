class Train {
    constructor(color, lightsOn) {
        this.color = color;
        this.lightsOn = lightsOn;
    }

    toggleLights() {
        this.lightsOn = !this.lightsOn;
    }

    lightsStatus() {
        console.log('Lights on?', this.lightsOn);
    }

    getSelf() {
        console.log(this);
    }

    getPrototype() {
        var proto = Object.getPrototypeOf(this);
        console.log(proto);
    }


}

//let myFirstTrain = new Train('red', false);

//console.log(myFirstTrain);  // Train { color: 'red', lightsOn: false }

//let train4 = new Train('red', false);
//train4.toggleLights();
//train4.lightsStatus();  // Lights on? true
//train4.getSelf();  // Train { color: 'red', lightsOn: true }
//train4.getPrototype();  // Train {}

class HighSpeedTrain extends Train {
    constructor(passengers, highSpeedOn, color, lightsOn) {
        super(color, lightsOn);
        this.passengers = passengers;
        this.highSpeedOn = highSpeedOn;
    }

    toggleHighSpeed() {
        this.highSpeedOn = !this.highSpeedOn;
        console.log('High speed status:', this.highSpeedOn);
    }

    toggleLights() {
        super.toggleLights();
        super.lightsStatus();
        console.log('Lights are 100% operational.');
    }
}

let train5 = new HighSpeedTrain(200, false, 'green', false);
train5.toggleLights();  // Lights on? true
                        // Lights are 100% operational.

train5.lightsStatus();  // Lights on? true
