package spacesprites;

import java.awt.Color;
import java.awt.event.KeyEvent;

import fang2.attributes.Location2D;
import fang2.attributes.Vector2D;
import fang2.core.Alarm;
import fang2.core.Game;
import fang2.core.Sprite;
import fang2.sprites.PolygonSprite;
import fang2.transformers.*;

/**
 * A triangular spaceship sprite. It can be positioned on the screen,
 * created in a variety of colors, and the like. By default it is
 * controlled by the keyboard but it can also be constructed as a
 * non-player controlled space craft. Also, by default, it wraps around
 * the screen at the edges.
 */
public class Ship
  extends PolygonSprite
  implements Alarm, HitTarget, Shootable, Shooter {
  /** how much speed up does the acceleration add for the ship? */
  private static final double ACCELERATION_SCREENS_PER_SECOND_SQUARED =
    2.0;

  /** the alarm interval in seconds; used for counting down timers */
  private static final double ALARM_INTERVAL = 0.25;

  /** the turning speed of this ship; in radians/second */
  private static final double ANGULAR_VELOCITY_DEGREES_PER_SECOND = 300;

  /** number of lives a ship gets by default */
  private static final int DEFAULT_LIFE_COUNT = 3;

  /** default size (in screen fraction) of a newly created ship */
  private static final double DEFAULT_SCALE = 0.1;

  /** the color of the ship (if there is no other color specified */
  private static final Color DEFAULT_SHIP_COLOR = Game.getColor(
      "SCG Red");

  /** gun location relative to ship location */
  private static Location2D GUN_LOCATION = new Location2D(0.7, 0);

  /** what is the speed limit for the ship? */
  private static final double MAX_VELOCITY_SCREENS_PER_SECOND = 0.25;
  // ----- Data for individual ships -----
  // ---------- Collision Control

  /** classes of sprites which can hit us tracked here */
  private HitClassTransformer collisionClasses;

  /** specific sprites which can hit us tracked here */
  private HitSpriteTransformer collisions;

  // ---------- Gameplay Variables: use setShootingDelay and
  // setImmunityDelay to change timing; extraLife to
  // add an extra life
  /** seconds, after hit, while ship is immune from damage */
  private double immunityDelay;

  /** time, in seconds, remaining on current immunity */
  private double immunityDelayRemaining;
  // ---------- Score/Lives remaining display

  /** number of remaining lives */
  private final ScoreSprite lives;

  /** game we are part of */
  private final Game myGame;

  /** score (for the projectiles) */
  private final ScoreSprite score;

  /** time, in seconds, between shots */
  private double shootingDelay;

  /** time, in seconds, remaining before we can shoot again */
  private double shootingDelayRemaining;

  // --------- Targeting Data: sprite/class for projectiles
  /** the specific sprite this ship's projectiles hit */
  private Sprite target;

  /** the class of objects this ship's projectiles hit */
  private Class<? extends Sprite> targetClass;

  // ----- Command Definitions (methods) -----
  /**
   * Construct a {@link Ship} associated with the given game.
   *
   * @param  myGame  the game to which this ship belongs
   */
  public Ship(Game myGame) {
    this(myGame, DEFAULT_SHIP_COLOR, DEFAULT_SCALE, DEFAULT_LIFE_COUNT);
    addAllTransformers();
  }

  /**
   * Construct a new {@link Ship} associated with the given game and
   * having the given color.
   *
   * @param  myGame  the {@link Game} to which the ship belongs
   * @param  color   the {@link Color} to display the ship
   */
  public Ship(Game myGame, Color color) {
    this(myGame, color, DEFAULT_SCALE, DEFAULT_LIFE_COUNT);
  }

  /**
   * Construct a new {@link Ship} associated with the given game, using
   * the given scale and color.
   *
   * @param  myGame  the {@link Game} to which it is associated
   * @param  color   the color to fill the ship with
   * @param  scale   the scale (in percentages of a screen)
   * @param  lives   the number of lives the ship has
   */
  public Ship(Game myGame, Color color, double scale, int lives) {
    super(0.5, 0, -0.5, -0.25, -0.5, 0.25);
    this.myGame = myGame;
    this.setScale(scale);
    this.setColor(color);

    this.lives = new ScoreSprite(lives);
    this.lives.hide();
    Game.getCurrentGame().addSprite(lives);

    this.score = new ScoreSprite(0);
    this.score.translateX(0.5);// move score over
    this.score.setColor(myGame.getColor("gray"));
    this.score.hide();

    this.addTransformer(new WrapTransformer());
    this.myGame.scheduleRelative(this, ALARM_INTERVAL);
  }

  public void act() {
    if (immunityDelayRemaining > 0.0) {
      immunityDelayRemaining -= ALARM_INTERVAL;
    }
    if (shootingDelayRemaining > 0.0) {
      shootingDelayRemaining -= ALARM_INTERVAL;
    }
    Game.getCurrentGame().scheduleRelative(this, ALARM_INTERVAL);
  }

  /**
   * Construct all of the transformers that make this ship move
   * according to the keyboard
   */
  public void addAllTransformers() {
    addKeyboardTransformers();
    addShooterTransformers();
  }

  /**
   * Add a whole class of sprites as "rocks" that damages this ship
   *
   * @param  targetClass  the {@link Sprite} derived class to shoot at
   */
  public void addCollision(Class<? extends Sprite> targetClass) {
    if (collisionClasses == null) {
      collisionClasses = new HitClassTransformer(this, targetClass);
      addTransformer(collisionClasses);
    } else {
      collisionClasses.add(targetClass);
    }
  }

  /**
   * Add a specific sprite as a "rock" that damages this ship
   *
   * @param  target  the {@link Sprite} to shoot
   */
  public void addCollision(Sprite target) {
    if (collisions == null) {
      collisions = new HitSpriteTransformer(target);
      addTransformer(collisions);
    } else {
      collisions.add(target);
    }
  }

  /**
   * Associate the ship with rotation and acceleration by pressing the
   * right keys.
   */
  public void addKeyboardTransformers() {
    AccelerationAheadTransformer velocity =
      new AccelerationAheadTransformer(
        ACCELERATION_SCREENS_PER_SECOND_SQUARED);
    velocity.setMaximumMagnitude(MAX_VELOCITY_SCREENS_PER_SECOND);

    KeyboardTransformer driveKeys = new KeyboardTransformer(velocity);
    driveKeys.addPlusKey(KeyEvent.VK_UP);
    driveKeys.addPlusKey(KeyEvent.VK_KP_UP);
    // uncomment (remove "//") following lines to provide backup
    // acceleration driveKeys.addMinusKey(KeyEvent.VK_DOWN);
    // driveKeys.addMinusKey(KeyEvent.VK_KP_DOWN);
    this.addTransformer(driveKeys);

    SpinTransformer turn = new SpinTransformer(
        ANGULAR_VELOCITY_DEGREES_PER_SECOND);
    turn.setResetToNominal(true);

    KeyboardTransformer turnKeys = new KeyboardTransformer(turn);
    turnKeys.addPlusKey(KeyEvent.VK_RIGHT);
    turnKeys.addPlusKey(KeyEvent.VK_KP_RIGHT);
    turnKeys.addMinusKey(KeyEvent.VK_LEFT);
    turnKeys.addMinusKey(KeyEvent.VK_KP_LEFT);
    this.addTransformer(turnKeys);
  }

  /**
   * Associate the ship with shooting by pressing the correct key.
   */
  public void addShooterTransformers() {
    ShooterTransformer bang = new ShooterTransformer();
    KeyboardTransformer shoot = new KeyboardTransformer(bang);
    shoot.addPlusKey(KeyEvent.VK_SPACE);
    this.addTransformer(shoot);
  }

  /**
   * Give the ship an extra life. Usually the player's ship.
   */
  public void extraLife() {
    lives.increment();
  }

  /**
   * @return  the immunityDelay
   */
  public double getImmunityDelay() {
    return immunityDelay;
  }

  /**
   * Get the score sprite holding the life count for this ship.
   *
   * @return  the {@link ScoreSprite} counting lives.
   */
  public ScoreSprite getLives() {
    return lives;
  }

  /**
   * Get a bullet. Used to shoot the guns.
   */
  public LittleRoundProjectile getProjectile() {
    if (shootingDelayRemaining <= 0) {
      // Calculate where the shot should originate.
      // gunLocation is location, relative to original sized sprite
      // rotate, scale, add to our location
      Vector2D rotatedX = getFacingVector().normalize();
      Vector2D rotatedY = rotatedX.getNormal();
      Location2D shotDelta = GUN_LOCATION.multiply(getScale());
      Location2D shotLocation = getLocation().add(rotatedX.multiply(
            shotDelta.getX()).addTo(
            rotatedY.multiply(shotDelta.getY())));

      LittleRoundProjectile projectile = new LittleRoundProjectile(
          score);
      projectile.setLocation(shotLocation);
      projectile.setRotation(getRotation());// shoot straight ahead
      projectile.addTransformer(new SpeedAheadTransformer(1.0));
      projectile.addTimeToLive(0.9);
      projectile.scale(1.5);
      projectile.setColor(Game.getColor("orange red"));
      if (targetClass != null) {
        projectile.addTarget(targetClass);
      }
      if (target != null) {
        projectile.addTarget(target);
      }
      shootingDelayRemaining = shootingDelay;
      return projectile;
    } else {
      return null;
    }
  }

  /**
   * Get the score display sprite
   *
   * @return  the score display
   */
  public ScoreSprite getScore() {
    return score;
  }

  /**
   * @return  the shootingDelay
   */
  public double getShootingDelay() {
    return shootingDelay;
  }

  /**
   * @return  the target
   */
  public Sprite getTarget() {
    return target;
  }

  /**
   * @return  the targetClass
   */
  public Class<? extends Sprite> getTargetClass() {
    return targetClass;
  }

  /**
   * Hide the remaining lives counter
   */
  public void hideLives() {
    lives.hide();
  }

  /**
   * Hide the score display on the screen
   */
  public void hideScore() {
    score.hide();
  }

  /**
   * What happens when this object collides with some other object it is
   * programmed to interact with? Check for immunity; if not immune,
   * make it react to us (so two ships hitting each react once) avoid
   * recursion trap by setting immunityDelay before call to other object
   * (it will make us react but next time we are immune so it only goes:
   * A.react -> B.react -> A.react (when A and B are this and other on
   * the first call.
   */
  public boolean react(Sprite other) {
    if (immunityDelayRemaining <= 0.0) {
      immunityDelayRemaining = 1.0;
      HitTarget ht = (HitTarget) other;
      if (ht != null) {
        ht.react(this);
      }
      subtractALife();
      return true;
    }
    return false;
  }

  /**
   * @param  immunityDelay  the immunityDelay to set
   */
  public void setImmunityDelay(double immunityDelay) {
    this.immunityDelay = immunityDelay;
  }

  /**
   * @param  shootingDelay  the shootingDelay to set
   */
  public void setShootingDelay(double shootingDelay) {
    this.shootingDelay = shootingDelay;
  }

  /**
   * @param  targetClass  the targetClass to set
   */
  public void setTarget(Class<? extends Sprite> targetClass) {
    this.targetClass = targetClass;
  }

  /**
   * @param  target  the target to set
   */
  public void setTarget(Sprite target) {
    this.target = target;
  }

  /**
   * What happens when this ship is shot?
   */
  public void shot(Sprite shooter) {
    subtractALife();
  }

  /**
   * Make the lives counter visible.
   */
  public void showLives() {
    lives.show();
  }

  /**
   * Make the score display visible
   */
  public void showScore() {
    score.show();
  }

  /**
   * Remove a life. Decrement the life counter and if the life count
   * goes to 0, remove the ship from the game. Also reset the immunity
   * timer.
   */
  public void subtractALife() {
    lives.decrement();

    if (lives.getScore() <= 0) {
      lives.removeFromCanvas();
      removeFromCanvas();
    }

    immunityDelayRemaining = immunityDelay;
  }
}
