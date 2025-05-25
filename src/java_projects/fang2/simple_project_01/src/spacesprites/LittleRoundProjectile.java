package spacesprites;

import fang2.core.Game;
import fang2.core.Sprite;
import fang2.sprites.OvalSprite;
import fang2.transformers.HitClassTransformer;
import fang2.transformers.HitSpriteTransformer;
import fang2.transformers.HitTarget;
import fang2.transformers.Shootable;
import fang2.transformers.TimeLimitedTransformer;
import fang2.transformers.WrapTransformer;

import java.awt.Color;

/** A standardized projectile. */
public class LittleRoundProjectile
  extends OvalSprite
  implements HitTarget {
  /** the default color for LRP */
  private static final Color DEFAULT_LRP_COLOR = Game.getColor(
      "orange");
  /** the default size of the LRP in screens */
  private static final double DEFAULT_LRP_DIAMETER = 0.02;

  /** the transformer we use to keep track of hitting a target */
  private HitSpriteTransformer targets;

  /**
   * the transformer we use to keep track of specific sprites as targets
   */
  private HitClassTransformer targetClasses;

  /** where this projectile records a score (for a hit) */
  private final ScoreSprite score;
  
  /**
   * Construct a new little round projectile with the given size (in
   * screens) and the given color.
   *
   * @param  diameterInScreens  size, in screens, of the projectile
   * @param  color              the color the projectile should have
   */
  public LittleRoundProjectile(double diameterInScreens, Color color, ScoreSprite score) {
    super(diameterInScreens, diameterInScreens);
    setColor(color);
    this.score = score;
    addTransformer(new WrapTransformer());
  }

  /**
   * Construct a new little round projectile with the given size (in
   * screens) and the default color.
   *
   * @param  diameterInScreens  size, in screens, of the projectile
   */
  public LittleRoundProjectile(double diameterInScreens, ScoreSprite score) {
    this(diameterInScreens, DEFAULT_LRP_COLOR, score);
  }

  /**
   * Construct a new little round projectile with the default
   * appearance: orange, 0.02 screens across.
   */
  public LittleRoundProjectile(ScoreSprite score) {
    this(DEFAULT_LRP_DIAMETER, DEFAULT_LRP_COLOR, score);
  }

  
  /**
   * Add a whole class of sprites as valid targets for this projectile
   * @param targetClass the {@link Sprite} derived class to shoot at
   */
  public void addTarget(Class<? extends Sprite> targetClass) {
    if (targetClasses == null) {
      targetClasses = new HitClassTransformer(this, targetClass);
      addTransformer(targetClasses);
    } else {
      targetClasses.add(targetClass);
    }
  }

  /**
   * Add a specific sprite as a valid target for this projectile
   * @param target the {@link Sprite} to shoot
   */
  public void addTarget(Sprite target) {
    if (targets == null) {
      targets = new HitSpriteTransformer(target);
      addTransformer(targets);
    } else {
      targets.add(target);
    }
  }

  /** 
   * Set it so that this projectile only remains viable for a fixed amount of time.
   * @param seconds
   */
  public void addTimeToLive(double seconds) {
    addTransformer(new TimeLimitedTransformer(0.9));
  }
  
  /**
   * What to do when we hit a target!
   */
  public boolean react(Sprite target) {
    if (target instanceof Shootable) {
      Shootable shootable = (Shootable) target;
      shootable.shot(this);
      score.increment();
    }
    
    removeFromCanvas();
    return true;
  }
}
