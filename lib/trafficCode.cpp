#include <Arduino.h>
#if defined(ESP32)
#include <WiFi.h>
#include <FirebaseESP32.h>
#elif defined(ESP8266)
#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>
#elif defined(ARDUINO_RASPBERRY_PI_PICO_W)
#include <WiFi.h>
#include <FirebaseESP8266.h>
#endif

#include <addons/TokenHelper.h>
#include <addons/RTDBHelper.h>

#define WIFI_SSID "asm_pc"
#define WIFI_PASSWORD "asm12345"
/* 2. Define the API Key */
#define API_KEY "AIzaSyAY1Wh35RmLm0_OedEXn7PV0sx4n7kwoJs"

/* 3. Define the RTDB URL */
#define DATABASE_URL "iotproj-55a78-default-rtdb.firebaseio.com"  //<databaseName>.firebaseio.com or <databaseName>.<region>.firebasedatabase.app

/* 4. Define the user Email and password that alreadey registerd or added in your project */
#define USER_EMAIL "admin@admin.com"
#define USER_PASSWORD "password"

// Define Firebase Data object
FirebaseData fbdo;

FirebaseAuth auth;
FirebaseConfig config;

unsigned long sendDataPrevMillis = 0;

unsigned long count = 0;

void setup() {

  Serial.begin(115200);

  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  Serial.printf("Firebase Client v%s\n\n", FIREBASE_CLIENT_VERSION);

  /* Assign the api key (required) */
  config.api_key = API_KEY;

  /* Assign the user sign in credentials */
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;

  /* Assign the RTDB URL (required) */
  config.database_url = DATABASE_URL;

  config.token_status_callback = tokenStatusCallback;  // see addons/TokenHelper.h
  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);

  Firebase.setDoubleDigits(5);
}

void loop() {
  int east = -1; // 1 red, 2 green, 3 yellow;
  int west = -1;
  int north = -1;
  int south = -1;
  // Firebase.ready() should be called repeatedly to handle authentication tasks.

  if (Firebase.ready() && (millis() - sendDataPrevMillis > 1000 || sendDataPrevMillis == 0)) {
    FirebaseJson jVal;
    Firebase.RTDB.getJSON(&fbdo, "/threelights", &jVal);
    FirebaseJsonData result;
    jVal.get(result, "eastlight/red");
    if (result.to<boolean>() == 1) {
      east = 1;
    }
    jVal.get(result, "eastlight/green");
    if (result.to<boolean>() == 1) {
      east = 2;
    }
    jVal.get(result, "eastlight/yellow");
    if (result.to<boolean>() == 1) {
      east = 3;
    }

    
    jVal.get(result, "westlight/red");
    if (result.to<boolean>() == 1) {
      west = 1;
    }
    jVal.get(result, "westlight/green");
    if (result.to<boolean>() == 1) {
      west = 2;
    }
    jVal.get(result, "westlight/yellow");
    if (result.to<boolean>() == 1) {
      west = 3;
    }


    jVal.get(result, "northLight/red");
    if (result.to<boolean>() == 1) {
      north = 1;
    }
    jVal.get(result, "northLight/green");
    if (result.to<boolean>() == 1) {
      north = 2;
    }
    jVal.get(result, "northLight/yellow");
    if (result.to<boolean>() == 1) {
      north = 3;
    }

    jVal.get(result, "southLight/red");
    if (result.to<boolean>() == 1) {
      south = 1;
    }
    jVal.get(result, "southLight/green");
    if (result.to<boolean>() == 1) {
      south = 2;
    }
    jVal.get(result, "southLight/yellow");
    if (result.to<boolean>() == 1) {
      south = 3;
    }

    Serial.print("#");
    Serial.print(east); Serial.print(",");
    Serial.print(north); Serial.print(",");
    Serial.print(south); Serial.print(",");
    Serial.print(west);
    Serial.println();

  }


}