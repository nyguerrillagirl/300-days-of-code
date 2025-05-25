package spacesprites;

import java.awt.Color;

import fang2.core.Game;
import fang2.sprites.StringSprite;

/**
 * Keep and display score. The {@link ScoreSprite} is based on the
 * version presented in Chapter09. The score in this version is an
 * integer.
 */
public class ScoreSprite
  extends StringSprite {
  /** scale of the object on the screen */
  public final static double DEFAULT_SCORE_SCALE = 0.1;
  /** color to use for the score */
  public final static Color DEFAULT_SCORE_COLOR 
    = Game.getCurrentGame().getColor("yellow");
  
  /** current score */
  private int score;

  /**
   * Default constructor: 0 is initial score.
   */
  public ScoreSprite() {
    this(0);
  }

  /**
   * Create new ScoreSprite with the given score.
   *
   * @param  score  initial score
   */
  public ScoreSprite(int score) {
    setScore(score);
    setScale(DEFAULT_SCORE_SCALE);
    setColor(DEFAULT_SCORE_COLOR);
    setLocation(getScale()/2, getScale()/2);
  }

  /**
   * Implementation method: display the currently recorded score.
   */
  private void fixTextDisplay() {
    setText(Integer.toString(score));
  }

  public void decrement() {
    decrement(1);
  }

  /**
   * Decrement score by n
   *
   * @param  n  number to subtract from score.
   */
  public void decrement(int n) {
    increment(-n);
  }

  /**
   * Get the current score.
   *
   * @return  the current score
   */
  public int getScore() {
    return score;
  }

  /**
   * Increment the score by 1.
   */
  public void increment() {
    increment(1);
  }

  /**
   * Increment the score by the given value.
   *
   * @param  n  number to add to the current score
   */
  public void increment(int n) {
    setScore(score + n);
  }

  public void setScore(int score) {
    Game game = Game.getCurrentGame();
    if (!game.containsSprite(this)) game.addSprite(this);
    this.score = score;
    fixTextDisplay();
  }
}
