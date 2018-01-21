class Picture {
  String name;
  String main;
  PImage image;
  int brightness;

  Picture(String name, PImage image) {
    this.name = name;
    this.image = image;
  }
  int getBrightness() {
    return brightness;
  }
  String getName() {
    return name;
  }
  String getMain() {
    return main;
  }
  PImage getImage() {
    return image;
  }
  void setMain(String main) {
    this.main = main;
  }
  void setBrightness(int brightness) {
    this.brightness = brightness;
  }
}