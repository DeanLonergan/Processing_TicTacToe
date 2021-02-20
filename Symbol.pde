public class Symbol {

  private float xCoord, yCoord;
  private float fontSize;

  Symbol() {
  }

  Symbol(float xCoord, float yCoord, float fontSize) {
    this.xCoord = xCoord;
    this.yCoord = yCoord;
    this.fontSize = fontSize;
  }

  public void displayX() {
    fill(0, 0, 255);
    textSize(fontSize);
    text("X", xCoord, yCoord);
  }

  public void displayO() {
    fill(255, 0, 0);
    textSize(fontSize);
    text("O", xCoord, yCoord);
  }

  //Getters//
  public float getXCoord() {
    return xCoord;
  }

  public float getYCoord() {
    return yCoord;
  }

  public float getFontSize() {
    return fontSize;
  }


  //Setters//
  public void setXCoord(float xCoord) {
    this.xCoord = xCoord;
  }
  public void setYCoord(float yCoord) {
    this.yCoord = yCoord;
  }

  public void setFontSize(float fontSize) {
    this.fontSize = fontSize;
  }
}
