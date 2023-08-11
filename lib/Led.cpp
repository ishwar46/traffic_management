#define EAST_RED 23
#define EAST_YELLOW 25
#define EAST_GREEN 27
#define WEST_RED 29
#define WEST_YELLOW 31
#define WEST_GREEN 33
#define NORTH_RED 35
#define NORTH_YELLOW 37
#define NORTH_GREEN 39
#define SOUTH_RED 41
#define SOUTH_YELLOW 43
#define SOUTH_GREEN 45

void setup() {
  Serial.begin(115200);
  pinMode(EAST_RED, OUTPUT);
  pinMode(EAST_YELLOW, OUTPUT);
  pinMode(EAST_GREEN, OUTPUT);
  pinMode(WEST_RED, OUTPUT);
  pinMode(WEST_YELLOW, OUTPUT);
  pinMode(WEST_GREEN, OUTPUT);
  pinMode(NORTH_RED, OUTPUT);
  pinMode(NORTH_YELLOW, OUTPUT);
  pinMode(NORTH_GREEN, OUTPUT);
  pinMode(SOUTH_RED, OUTPUT);
  pinMode(SOUTH_YELLOW, OUTPUT);
  pinMode(SOUTH_GREEN, OUTPUT);
}


// function to delimit the string
String delimit_string(String data, char separator, int index) {
  int found = 0;
  int strIndex[] = { 0, -1 };
  int maxIndex = data.length() - 1;

  for (int i = 0; i <= maxIndex && found <= index; i++) {
    if (data.charAt(i) == separator || i == maxIndex) {
      found++;
      strIndex[0] = strIndex[1] + 1;
      strIndex[1] = (i == maxIndex) ? i + 1 : i;
    }
  }
  return found > index ? data.substring(strIndex[0], strIndex[1]) : "-1";
}

int east = -1;
int west = -1;
int north = -1;
int south = -1;

void colorLed(int red_pin, int green_pin, int yellow_pin, int val) {
  if (val == 1) {
    digitalWrite(red_pin, 1);
    digitalWrite(green_pin, 0);
    digitalWrite(yellow_pin, 0);
    return;
  }
  if (val == 2) {
    digitalWrite(red_pin, 0);
    digitalWrite(green_pin, 1);
    digitalWrite(yellow_pin, 0);
    return;
  }
  if (val == 3) {
    digitalWrite(red_pin, 0);
    digitalWrite(green_pin, 0);
    digitalWrite(yellow_pin, 1);
    return;
  }

  if (val == -1 || val == 0) {

    digitalWrite(red_pin, 0);
    digitalWrite(green_pin, 0);
    digitalWrite(yellow_pin, 0);
    return;
  }
}

/**
   Main loop.
*/
void loop() {

  unsigned long currentMillis = millis();

  if (Serial.available() > 0) {
    if (Serial.read() == '#') {
      String data = Serial.readStringUntil('\n');
      Serial.println(data);
      east = delimit_string(data, ',', 0).toInt();
      // east, north, south west incoming data
      // 1, 2, 3 => red, green, yellow
      north = delimit_string(data, ',', 1).toInt();
      south = delimit_string(data, ',', 2).toInt();
      west = delimit_string(data, ',', 3).toInt();
    }
  }

  colorLed(EAST_RED, EAST_GREEN, EAST_YELLOW, east);
  colorLed(WEST_RED, WEST_GREEN, WEST_YELLOW, west);
  colorLed(NORTH_RED, NORTH_GREEN, NORTH_YELLOW, north);
  colorLed(SOUTH_RED, SOUTH_GREEN, SOUTH_YELLOW, south);
  Serial.print(" east: ");
  Serial.print(east);
  Serial.print(" north: ");
  Serial.print(north);

  Serial.print(" west: ");
  Serial.print(west);
  Serial.print(" south: ");
  Serial.println(south);
  delay(125.5);
}
