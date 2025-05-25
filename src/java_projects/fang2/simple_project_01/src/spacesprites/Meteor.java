package spacesprites;

import java.awt.Color;

import fang2.attributes.Vector2D;
import fang2.core.Game;
import fang2.core.Sprite;
import fang2.core.Transformer;
import fang2.sprites.OvalSprite;
import fang2.transformers.HitTarget;
import fang2.transformers.Shootable;
import fang2.transformers.VelocityTransformer;
import fang2.transformers.WrapTransformer;

/**
 * Demonstration game sprite. Represents a Meteor in a Meteor avoidance
 * game. Has automatic checking for being shot and for hitting a ship.
 * That is why the ship and shots are all kept track of here.
 */
public class Meteor
  extends OvalSprite
  implements HitTarget, Shootable {
  /** the color the meteor is when it is created */
  private static final Color meteorColor = Game.getColor("SCG Red");

  /** ratio of size number to scale */
  private static final double SCALETOSIZE = 0.075;

  /** what size is this meteor? 1-3 are standard values */
  private final int sizeNumber;

  /** the game to which this meteor belongs */
  private final Game myGame;

  /**
   * Construct a new {@link Meteor}. A {@link Meteor} has movement
   * (built in) and knows how to split itself.
   *
   * @param  myGame
   * @param  sizeNumber
   */
  public Meteor(Game myGame, int sizeNumber) {
    super(sizeNumber * SCALETOSIZE, sizeNumber * SCALETOSIZE);
    this.sizeNumber = sizeNumber;
    this.myGame = myGame;
    addTransformer(new WrapTransformer());
    addTransformer(new VelocityTransformer(
        new Vector2D(myGame.randomDouble(-45, 45), myGame.randomDouble(0.05, 0.4))));

  }

  public Meteor(Game myGame) {
    this(myGame, 3);
  }

  public void split() {
    VelocityTransformer v = null;
    for (Transformer transform : transformers) {
      if (transform instanceof VelocityTransformer) {
        v = (VelocityTransformer) transform;
        break;
      }
    }
    if (v != null) {
      split(v.getVelocity());
    }
  }

  private void split(Vector2D travel) {
    double layer = myGame.getLayer(this);
    this.removeFromCanvas();
    disableTransformer();
    Vector2D normal = travel.getNormal();
    if (sizeNumber > 1) {
      Meteor a = new Meteor(myGame, sizeNumber - 1);
      a.setColor(getColor());
      double aVelocity = myGame.randomDouble(0.5, 1.5) * travel.getMagnitude();
      a.addTransformer(new VelocityTransformer(
          normal.multiply(aVelocity)));
      a.setLocation(getLocation());
      myGame.addSprite(layer, a);

      Meteor b = new Meteor(myGame, sizeNumber - 1);
      b.setColor(getColor());
      double bVelocity = myGame.randomDouble(-1.5, -0.5) * travel.getMagnitude();
      b.addTransformer(new VelocityTransformer(
          normal.multiply(bVelocity)));
      b.setLocation(getLocation());
      myGame.addSprite(layer, b);
    }
  }

  public boolean react(Sprite target) {
    split();
    return true;
  }

  public void shot(Sprite shooter) {
    split();
  }
}
