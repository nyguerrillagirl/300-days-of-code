package com.brainycode;

import spacesprites.*;		// get all space sprites
import fang2.core.Game;

public class MeteorShower extends Game {

	private Ship playersShip;
	private Meteor rockA;
	private Meteor rockB;
	private Meteor rockC;
	
	@Override
	public void setup() {
		playersShip = new Ship(this);
		playersShip.setLocation(0.2, 0.8);
		
		playersShip.setTarget(Meteor.class);
		playersShip.addCollision(Meteor.class);
		
		playersShip.showLives();
		playersShip.showScore();
		addSprite(playersShip);
		
		rockA = new Meteor(this, 4);
		rockA.setLocation(0.8, 0.2);
		addSprite(rockA);

		rockB = new Meteor(this, 2);
		rockB.setColor(getColor("yellow"));
		rockB.setLocation(0.2, 0.2);
		addSprite(rockB);

		rockC = new Meteor(this);
		rockC.setColor(getColor("misty rose"));
		rockC.setLocation(0.8, 0.8);
		addSprite(rockC);
		
	}
}
