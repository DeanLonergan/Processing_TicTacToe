public class Square {

  private float xCoord, yCoord;
  private float xWidth, yHeight;
  private float squareFill, squareStroke, squareStrokeWeight;

  Square() {
  }

  Square(float xCoord, float yCoord, float xWidth, float yHeight) {
    this.xCoord = xCoord;
    this.yCoord = yCoord;
    this.xWidth = xWidth;
    this.yHeight = yHeight;
  }

  public void display() {
    rect(xCoord, yCoord, xWidth, yHeight);
    stroke(squareStroke);
    strokeWeight(squareStrokeWeight);
    fill(squareFill);
  }

  //Getters//
  public float getXCoord() {
    return xCoord;
  }

  public float getYCoord() {
    return yCoord;
  }

  public float getXWidth() {
    return xWidth;
  }

  public float getYHeight() {
    return yHeight;
  }

  public float getSquareStroke() {
    return squareStroke;
  }

  public float getSquareStrokeWeight() {
    return squareStrokeWeight;
  }

  public float getSquareFill() {
    return squareFill;
  }


  //Setters//
  public void setXCoord(float xCoord) {
    this.xCoord = xCoord;
  }
  public void setYCoord(float yCoord) {
    this.yCoord = yCoord;
  }

  public void setXWidth(float xWidth) {
    this.xWidth = xWidth;
  }

  public void setYHeight(float yHeight) {
    this.yHeight = yHeight;
  }

  public void setSquareStroke(float squareStroke) {
    this.squareStroke = squareStroke;
  }

  public void setSquareStrokeWeight(float squareStrokeWeight) {
    this.squareStrokeWeight = squareStrokeWeight;
  }

  public void setSquareFill(float squareFill) {
    this.squareFill = squareFill;
  }
}
