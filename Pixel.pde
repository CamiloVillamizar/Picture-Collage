class Pixel {
  String name;
  PImage image;
  int x;
  int y;
  //int red;
  //int green;
  //int blue;
  color rgb;
  String Color;
  
  Pixel(String name, PImage image, int x, int y) {
    this.x = x;//assigns the given alues to variables x and y
    this.y = y;
    this.name = name;
    this.image = image;
    
    rgb = image.get(x, y);
    //if(y%10 == 0)
    //println(x, y);
    
    //red = (int)red(image.get(x, y));
    //green = (int)green(image.get(x, y));
    //blue = (int)blue(image.get(x, y));
  }
  
  void setColor(String Color) {
    this.Color = Color;
  }
  
  String getColor() {
    return Color;
  }
  color getRgb() {
    return rgb;
  }
  
  int getRed() {
    return red;
  }
  
  int getGreen() {
    return green;
  }
  
  int getBlue() {
    return blue;
  }
  

}