#define LEFT_RED 23
#define LEFT_YELLOW 25
#define LEFT_GREEN 27





#define RIGHT_RED 29
#define RIGHT_YELLOW 31
#define RIGHT_GREEN 33





#define TOP_RED 35
#define TOP_YELLOW 37
#define TOP_GREEN 39


#define BOTTOM_RED 41
#define BOTTOM_YELLOW 43
#define BOTTOM_GREEN 45








void setup() {
  // Define pin modes
  pinMode(LEFT_RED, OUTPUT);
  pinMode(LEFT_YELLOW, OUTPUT);
  pinMode(LEFT_GREEN, OUTPUT);





  pinMode(RIGHT_RED, OUTPUT);
  pinMode(RIGHT_YELLOW, OUTPUT);
  pinMode(RIGHT_GREEN, OUTPUT);





  pinMode(TOP_RED, OUTPUT);
  pinMode(TOP_YELLOW, OUTPUT);
  pinMode(TOP_GREEN, OUTPUT);


  pinMode(BOTTOM_RED, OUTPUT);
  pinMode(BOTTOM_YELLOW, OUTPUT);
  pinMode(BOTTOM_GREEN, OUTPUT);


  // Start with Left green and others red
  digitalWrite(LEFT_YELLOW, HIGH);
  digitalWrite(RIGHT_RED, HIGH);
  digitalWrite(TOP_RED, HIGH);
  digitalWrite(BOTTOM_RED,HIGH);
}





void loop() {
  delay(5000);
    digitalWrite(LEFT_RED, LOW);
  digitalWrite(LEFT_YELLOW, LOW);
  digitalWrite(LEFT_GREEN,HIGH);
  digitalWrite(TOP_RED, LOW);
   digitalWrite(TOP_YELLOW,HIGH);
    digitalWrite(TOP_GREEN,LOW);
  digitalWrite(RIGHT_RED,HIGH);
  digitalWrite(RIGHT_YELLOW,LOW);
  digitalWrite(RIGHT_GREEN,LOW);
   digitalWrite(BOTTOM_RED,HIGH);
  digitalWrite(BOTTOM_YELLOW,LOW);
  digitalWrite(BOTTOM_GREEN,LOW);
  delay(5000);
      digitalWrite(LEFT_RED, HIGH);
  digitalWrite(LEFT_YELLOW, LOW);
  digitalWrite(LEFT_GREEN,LOW);
  digitalWrite(TOP_RED, LOW);
   digitalWrite(TOP_YELLOW,LOW);
    digitalWrite(TOP_GREEN,HIGH);
  digitalWrite(RIGHT_RED,HIGH);
  digitalWrite(RIGHT_YELLOW,LOW);
  digitalWrite(RIGHT_GREEN,LOW);
   digitalWrite(BOTTOM_RED,HIGH);
  digitalWrite(BOTTOM_YELLOW,LOW);
  digitalWrite(BOTTOM_GREEN,LOW);
  delay(5000);
        digitalWrite(LEFT_RED, HIGH);
  digitalWrite(LEFT_YELLOW, LOW);
  digitalWrite(LEFT_GREEN,LOW);
  digitalWrite(TOP_RED, HIGH);
   digitalWrite(TOP_YELLOW,LOW);
    digitalWrite(TOP_GREEN,LOW);
  digitalWrite(RIGHT_RED,LOW);
  digitalWrite(RIGHT_YELLOW,HIGH);
  digitalWrite(RIGHT_GREEN,LOW);
   digitalWrite(BOTTOM_RED,HIGH);
  digitalWrite(BOTTOM_YELLOW,LOW);
  digitalWrite(BOTTOM_GREEN,LOW);
  delay(5000);
         digitalWrite(LEFT_RED, HIGH);
  digitalWrite(LEFT_YELLOW, LOW);
  digitalWrite(LEFT_GREEN,LOW);
  digitalWrite(TOP_RED, HIGH);
   digitalWrite(TOP_YELLOW,LOW);
    digitalWrite(TOP_GREEN,LOW);
  digitalWrite(RIGHT_RED,LOW);
  digitalWrite(RIGHT_YELLOW,LOW);
  digitalWrite(RIGHT_GREEN,HIGH);
   digitalWrite(BOTTOM_RED,LOW);
  digitalWrite(BOTTOM_YELLOW,HIGH);
  digitalWrite(BOTTOM_GREEN,LOW);

  delay(5000);
           digitalWrite(LEFT_RED, LOW);
  digitalWrite(LEFT_YELLOW, HIGH);
  digitalWrite(LEFT_GREEN,LOW);
  digitalWrite(TOP_RED, HIGH);
   digitalWrite(TOP_YELLOW,LOW);
    digitalWrite(TOP_GREEN,LOW);
  digitalWrite(RIGHT_RED,LOW);
  digitalWrite(RIGHT_YELLOW,LOW);
  digitalWrite(RIGHT_GREEN,HIGH);
   digitalWrite(BOTTOM_RED,LOW);
  digitalWrite(BOTTOM_YELLOW,LOW);
  digitalWrite(BOTTOM_GREEN,HIGH);

  delay(5000);
             digitalWrite(LEFT_RED, LOW);
  digitalWrite(LEFT_YELLOW,LOW );
  digitalWrite(LEFT_GREEN,HIGH);
  digitalWrite(TOP_RED, HIGH);
   digitalWrite(TOP_YELLOW,LOW);
    digitalWrite(TOP_GREEN,LOW);
  digitalWrite(RIGHT_RED,LOW);
  digitalWrite(RIGHT_YELLOW,LOW);
  digitalWrite(RIGHT_GREEN,HIGH);
   digitalWrite(BOTTOM_RED,LOW);
  digitalWrite(BOTTOM_YELLOW,LOW);
  digitalWrite(BOTTOM_GREEN,HIGH);

  delay(5000);



}