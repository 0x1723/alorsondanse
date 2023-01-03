size(1000, 1000);
colorMode(HSB, 360, 100, 100);
import java.util.*;

float core_hue = 29;
float complementary_hue = 0;
if (core_hue < 180) {
  complementary_hue = 180 + core_hue;
} else {
  complementary_hue = core_hue - 180;
}
int starting_saturation = 40;
int gradient_step = 10;
background(complementary_hue, 100, 100);
//background(core_hue, starting_saturation, starting_saturation);
int i = 0;
int factor = 25;
float g = 40;
//blendMode(EXCLUSION);
float shape = random(10);
String direction = "h";

while ( i < 1000/factor) {
  int j = 0;
  IntList actives = new IntList();
  g = starting_saturation;
  while (j < 1000/factor) {
    if (random(100) > 50) {
      fill(180 + core_hue, starting_saturation, starting_saturation);
      g = starting_saturation;
    } else {
      g = g + gradient_step;
      if (g >= 100) {
        for (int a = j + 1 - ((100 - starting_saturation) / gradient_step); a < j + 1; a = a + 1) {
          actives.append(a);
        }
      }
      fill(core_hue, g, g);
    }
    noStroke();
    if (direction == "v") {
      rect(i * factor, j * factor, factor, factor);
    } else if (direction == "h") {
      rect(j * factor, i * factor, factor, factor);
    }
    j += 1;
  }
  j = 0;
  while (j < 1000/factor) {
    if (actives.hasValue(j) == false) {
      fill(180 + core_hue, starting_saturation, starting_saturation);
      if (direction == "v") {
        rect(i * factor, j * factor, factor, factor);
      } else if (direction == "h") {
        rect(j * factor, i * factor, factor, factor);
      }
    }
    j += 1;
  }
  i += 1;
}

i = 0;
while ( i < 1000) {
  int j = 0;
  while (j < 1000) {
    if (i % 2 == 0) {
      if (j % 4 == 0) {
        fill(180 + core_hue, starting_saturation, starting_saturation);
        rect(j, i, 1, 1);
      }
    }
    if (i % 2 == 1) {
      if (j % 4 == 2) {
        fill(180 + core_hue, starting_saturation, starting_saturation);
        rect(j, i, 1, 1);
      }
    }
    j += 1;
  }
  i += 1;
}


save("img.png");
