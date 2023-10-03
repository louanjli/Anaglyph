/**
 * Anaglyph 3D Image Effect
 * 
 * Artist: Mohamed Louanjli
 * Date: August 10, 2023
 * 
 * This work is licensed under the Creative Commons Zero v1.0 Universal License.
 * To view a copy of this license, visit https://creativecommons.org/publicdomain/zero/1.0/ or 
 * send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
 */

PImage img;

void setup() {
  size(800, 600); // Adjust to ratio
  img = loadImage("your_black_and_white_image.jpg"); // Load your grayscale image
  imageMode(CENTER);
  noLoop();
}

void draw() {
  background(255);

  // Draw red channel for left eye
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      float brightnessValue = brightness(img.get(x, y));
      set(x - 2, y, color(brightnessValue, 0, 0)); // Shift a little to the left
    }
  }

  // Draw green and blue channels for right eye
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      float brightnessValue = brightness(img.get(x, y));
      color currentPixel = get(x + 2, y);
      float rCurrent = red(currentPixel);
      set(x + 2, y, color(rCurrent, brightnessValue, brightnessValue)); // Shift a little to the right
    }
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    save("anaglyph_output.png");
    println("Image saved as anaglyph_output.png");
  }
}
