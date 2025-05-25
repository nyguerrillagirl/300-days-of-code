package com.brainycode;

import spacesprites.*;
import fang2.core.Game;

public class Meteors extends Game {
	private Ship playersShip;	// Ship = component type for game
	private Meteor rock;		// Meteor = component type for game
	
	// Called (automatically by FANG before the game starts
	@Override
	public void setup() {
		playersShip = new Ship(this);	// get new component from system
		playersShip.setColor(getColor("SCG Red"));
		playersShip.setLocation(0.2, 0.8);	// id.command(parameters)
		
		// what to shoot, what to run into
		playersShip.setTarget(Meteor.class);
		playersShip.addCollision(Meteor.class);
		
		// show the score and remaining life counter
		playersShip.showLives();
		playersShip.showScore();
		addSprite(playersShip);	// add ship to game
		
		rock = new Meteor(this);	// get new component
		rock.setLocation(0.8, 0.8);	// position
		addSprite(rock);	// add rock to game
	}
}
