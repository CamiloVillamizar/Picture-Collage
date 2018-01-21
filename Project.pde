Picture [] pictures = new Picture[121];// 1D array stories all th picture objects
String main = " ";
String name = "target";
PImage image;
color red = color(255, 0, 0);
color green = color(0, 255, 0);
color blue = color(0, 0, 255);
int [][] numbers = new int[1333][749];
Pixel [][] pixel = new Pixel[1333][749];
String colors [][] = new String[1333][749];
String [] brightness = new String[256];
PImage [] bpics = new PImage[256];
int [] bvalues = new int[121];
void setup() {
  for (int a = 0; a < 256; a++) {
    brightness[a] = "null";
  }
  noStroke();
  size(2666, 1498);
  background(0);

  loadTarget();
  loadPictures();//loads all the pictures in the data folder and gets their main color
}


void draw() {
  println("Draw Reached");
  PImage image = loadImage("target.JPG");
  image.loadPixels();

  image(image, 0, 750); //draws the image normally


  for ( int a = 0; a < 1333; a++) {//draws the picture out of RGB pixels
    for ( int b = 0; b < 749; b++) {

      if (pixel[a][b].getColor() == "red") {
        fill(255, 0, 0);
      } else if (pixel[a][b].getColor() == "green") {
        fill(0, 255, 0);
      } else if (pixel[a][b].getColor() == "blue") {
        fill(0, 0, 255);
      } else {
        fill(255);
      }
      //println(pixel[a][b].getRgb()); 
      rect(a, b, 1, 1);
    }
  }


  //int bright = 0;
  //int r = 0;
  //String name = " ";
  //println("target reached");
  //for ( int a = 0; a < 1333; a+= 10) {//draws the picture from the array
  //  for ( int b = 0; b < 749; b+= 10) {
  //    println(a + " " + b);
  //    //color c = pixel[a][b].getColor();
  //    //fill((int)red(image.get(a, b)),(int)green(image.get(a, b)),(int)blue(image.get(a, b)));
  //    color c = image.get(a, b);
  //    bright = (int)brightness(c);

  //    r = (int)random(121);
  //    PImage image2 = pictures[r].getImage();

  //    //println(bright);
  //    name = brightness[bright];
  //    //println(name);
  //    image2 = loadImage(name);


  //    //do {
  //    //if (bright == pictures[r].getBrightness()) {
  //    //r = (int)random(121);
  //    //image2 = pictures[r].getImage();
  //    //} else
  //    //bright--;
  //    //}while (bright != pictures[r].getBrightness());

  //    image(image2, a + 1333, b + 750, 10, 10);


  //    //fill(brightness(c));
  //    //rect(a + 1333, b + 750, 10, 10);
  //  }
  //}

  //int bright = 0;
  //int r = 0;
  //String name = " ";
  PImage image2;
  //println("target reached");
  //for ( int a = 0; a < 1333; a+= 10) {//draws the picture from the array
  //  for ( int b = 0; b < 749; b+= 10) {
  //    bright = (int)brightness(image.get(a, b));
  //    name = brightness[bright];
  //    int x = 0;
  //    while(name != pictures[x].getName()) {
  //      x++;
  //    }
  //    image2 = pictures[x].getImage();
  //    //String image2 = brightness[(int)brightness(image.get(a, b))];
  //    image(image2, a + 1333, b + 750, 10, 10);
  //  }
  //}
  
  
  //String name = " ";
  //for(int i = 0; i < 121; i++) {
  //      name = brightness[(int)brightness()];
  //      if (pictures[i].getName() == name) {
  //         image2 = pictures[i].getImage();
  //      }
  //    }
  //  }
  //}
  
  for ( int a = 0; a < 1333; a+= 10) {//draws the picture from the brightness array
    for ( int b = 0; b < 749; b+= 10) {
      println(a + " " + b);
      image2 = loadImage(brightness[(int)brightness(image.get(a, b))]);
      image(image2, a + 1333, b + 750, 10, 10);
    }
  }
  

  for ( int a = 0; a < 1333; a+= 5) {//draws the picture out of itself
    for ( int b = 0; b < 749; b+= 5) {
      //println(a + " " + b);
      int r = (int)random(121);
      image2 = pictures[r].getImage();
      if (pixel[a][b].getColor() == "red") {
        tint(255, 175, 175);
        image(image2, a + 1334, b, 5, 5);
        tint(255, 255, 255);
      } else if (pixel[a][b].getColor() == "green") {
        tint(175, 255, 175);
        image(image2, a + 1334, b, 5, 5);
        tint(255, 255, 255);
      } else if (pixel[a][b].getColor() == "blue") {
        tint(175, 175, 255);
        image(image2, a + 1334, b, 5, 5);
        tint(255, 255, 255);
      } else {
        image(image2, a + 1334, b, 5, 5);
      }
      //println(pixel[a][b].getRgb()); 
      rect(a, b, 3, 3);
    }
  }

  noLoop();
}//end of draw

void loadTarget() {
  name = "target";
  image = loadImage("target.JPG");
  for (int a = 0; a < 1333; a++) {
    for (int b = 0; b < 749; b++) {
      pixel[a][b] = new Pixel(name, image, a, b);
      //println(numbers[a][b]);
      main = getClosestColor(pixel[a][b].getRgb());
      pixel[a][b].setColor(main);
      //println("Pixel (" + a + ", " + b + ") closest color is: " + main + ".");
    }
  }
}


void loadPictures() {//Loads and creates objects for each picture in the data folder
  println("Loading Pictures...");
  for (int a = 1; a < 122; a++) {
    String main;
    int red = 0;
    int green = 0;
    int blue = 0;
    float b = 0;
    float bb = 0;
    color c = 0;
    int counter = 0;
    if (a < 10) {
      name = "00"+a;
    } else if ((a >= 10) && (a < 100)) {
      name = "0"+a;
    } else {
      name = ""+a;
    }
    //a = a-1;
    name = "IMG_8"+name + ".JPG";
    image = loadImage(name);
    pictures[a-1] = new Picture(name, image);

    for (int x = 0; x < 1333; x++) {
      for (int y = 0; y < 749; y++) {
        c = (int)image.get(x, y);
        b = brightness(c);
        bb += b;
        counter++;
        main = getClosestColor(pixel[x][y].getRgb());
        if (main == "red") {
          red++;
          //println("R: " + red + " G: " + green + " B: " + blue);
        } else if (main == "green") {
          green++;
          //println("R: " + red + " G: " + green + " B: " + blue);
        } else if (main == "blue") {
          blue++;
          //println("R: " + red + " G: " + green + " B: " + blue);
        }
        //println("R: " + red + " G: " + green + " B: " + blue);
        if ((red>=green)&&(red>=blue))
        {
          main = "red";
        } else if ((green>=red)&&(green>=blue))
        {
          main = "green";
        } else if ((blue>=red)&&(blue>=green))
        {
          main = "blue";
        } else {
          main = "red";
        }
        pictures[a-1].setMain(main);
      }
    }

    b = bb / counter;
    pictures[a-1].setBrightness((int)b);
    //pictures[a-1].getBrightness();
    brightness[pictures[a-1].getBrightness()] = pictures[a-1].getName();

    //println("Loading picture: " + (a-1));
  }


  int start = 0;
  int diff = 0;
  String newBright = " ";
  //for (int i = 0; i < brightness.length; i++) {
  //  println(i);
  //  println(brightness[i]);
  //  while(brightness[i] == "null" && (i - diff) >= 0 && (i + diff) <= 0) {
  //    if (i + diff <= 255 && brightness[i + diff] != "null") {
  //      newBright = brightness[i + diff];
  //    } else if ( i - diff >= 0 && brightness[i - diff] != "null") {
  //      newBright = brightness[i - diff];
  //    } else {
  //      diff++;
  //    }
  //    println("diff = " + diff);
  //  }
  //    brightness[i] = newBright;
  //    println(brightness[i]);
  //    println(diff);
  //  diff = 1;
  //  newBright = " ";


  //if (brightness[i] == "null") {
  //  diff++;
  //} else if (brightness[i] != "null") {
  //  for (int x = start; x <= diff; x++) {
  //    brightness[x] = brightness[i];
  //  }
  //  start = diff;
  //}





  for (int x = 0; x < 31; x++) {
    brightness[x] = brightness[31];
  }
  for (int x = 32; x < 37; x++) {
    brightness[x] = brightness[37];
  }
  for (int x = 40; x < 42; x++) {
    brightness[x] = brightness[42];
  }
  for (int x = 43; x < 44; x++) {
    brightness[x] = brightness[44];
  }
  brightness[46] = brightness[47];
  for (int x = 49; x < 51; x++) {
    brightness[x] = brightness[51];
  }
  brightness[58] = brightness[59];
  brightness[66] = brightness[67];
  brightness[75] = brightness[76];
  brightness[77] = brightness[78];
  brightness[84] = brightness[85];
  brightness[97] = brightness[98];
  brightness[100] = brightness[101];
  for (int x = 104; x < 107; x++) {
    brightness[x] = brightness[107];
  }
  brightness[108] = brightness[109];
  brightness[110] = brightness[111];
  for (int x = 112; x < 114; x++) {
    brightness[x] = brightness[114];
  }
  for (int x = 115; x < 117; x++) {
    brightness[x] = brightness[117];
  }
  for (int x = 118; x < 121; x++) {
    brightness[x] = brightness[51];
  }
  for (int x = 122; x < 124; x++) {
    brightness[x] = brightness[124];
  }
  for (int x = 126; x < 130; x++) {
    brightness[x] = brightness[130];
  }
  for (int x = 131; x < 133; x++) {
    brightness[x] = brightness[133];
  }
  for (int x = 134; x < 136; x++) {
    brightness[x] = brightness[136];
  }
  for (int x = 137; x < 139; x++) {
    brightness[x] = brightness[139];
  }
  for (int x = 140; x < 147; x++) {
    brightness[x] = brightness[147];
  }
  for (int x = 148; x < 152; x++) {
    brightness[x] = brightness[152];
  }
  for (int x = 153; x < 156; x++) {
    brightness[x] = brightness[156];
  }
  for (int x = 158; x < 165; x++) {
    brightness[x] = brightness[165];
  }
  for (int x = 166; x < 256; x++) {
    brightness[x] = brightness[165];
  }

  for(int x = 0; x < bpics.length; x++) {
   String name = brightness[x];
   PImage bimage;
   int counter = 0;
   while(name != pictures[counter].getName()){
   counter++;
   println("counter: " + counter);
   }
   bimage = pictures[counter].getImage();
   bpics[x] = bimage;
  }




  //}



  for (int i = 0; i <= brightness.length - 1; i++) {
    println("i: " + i + " brightness: " + brightness[i]);
  }
  println("Done");
}


String setPicMain(PImage image) {
  String main = " ";
  int red = 0;
  int green = 0;
  int blue = 0;

  for (int a = 0; a < 1333; a++) {
    for (int b = 0; b < 749; b++) {
      main = getClosestColor(image.get(a, b));
      if (main == "red") {
        red++;
      } else if (main == "green") {
        green++;
      } else if (main == "blue") {
        blue++;
      }
    }
  }

  if ((red>=green)&&(red>=blue))
  {
    main = "red";
  } else if ((green>=red)&&(green>=blue))
  {
    main = "green";
  } else if ((blue>=red)&&(blue>=green))
  {
    main = "blue";
  } else {
    main = "red";
  }
  return main;
}




String getClosestColor(color a) {

  String main = " ";
  float r = colorDistance(red, a);
  float g = colorDistance(green, a);
  float b = colorDistance(blue, a);

  if ((r>=g)&&(r>=b))
  {
    main = "red";
  } else if ((g>=r)&&(g>=b))
  {
    main = "green";
  } else if ((b>=r)&&(b>=g))
  {
    main = "blue";
  } else
  {
    main = "none";
  }
  return main;
}



float colorDistance(color a, color b)  
{ 
  float redDiff = red(a) - red(b); 
  float grnDiff = green(a) - green(b); 
  float bluDiff = blue(a) - blue(b); 

  return sqrt( sq(redDiff) + sq(grnDiff) + sq(bluDiff) );
}