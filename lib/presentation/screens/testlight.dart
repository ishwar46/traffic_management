import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class TrafficLightNew extends StatefulWidget {
  @override
  _TrafficLightNewState createState() => _TrafficLightNewState();
}

class _TrafficLightNewState extends State<TrafficLightNew> {
  bool _isGreenOn = false;
  bool _isRedOn = false;
  bool _isYellowOn = false;
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref('threelights');

  @override
  void initState() {
    super.initState();
    _database.child('traffic_lights').onValue.listen((event) {
      final lights = event.snapshot.value
          as Map<dynamic, dynamic>?; // Add null check using 'as' operator
      setState(() {
        _isGreenOn =
            lights?['green'] ?? false; // Make the call conditional using '?'
        _isRedOn = lights?['red'] ?? false;
        _isYellowOn = lights?['yellow'] ?? false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              activeColor: Colors.green,
              inactiveThumbColor: Colors.grey,
              value: _isGreenOn,
              onChanged: (bool newValue) {
                setState(() {
                  _isGreenOn = newValue;
                  if (newValue) {
                    _isRedOn = false;
                    _isYellowOn = false;
                  }
                  _postLightStatusToDatabase();
                });
              },
            ),
            SizedBox(height: 15.0),
            Text(
              _isGreenOn ? 'Green Light ON' : 'Green Light OFF',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 30.0),
            Switch(
              activeColor: Colors.red,
              inactiveThumbColor: Colors.grey,
              value: _isRedOn,
              onChanged: (bool newValue) {
                setState(() {
                  _isRedOn = newValue;
                  if (newValue) {
                    _isGreenOn = false;
                    _isYellowOn = false;
                  }
                  _postLightStatusToDatabase();
                });
              },
            ),
            SizedBox(height: 15.0),
            Text(
              _isRedOn ? 'Red Light ON' : 'Red Light OFF',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 30.0),
            Switch(
              activeColor: Colors.yellow,
              inactiveThumbColor: Colors.grey,
              value: _isYellowOn,
              onChanged: (bool newValue) {
                setState(() {
                  _isYellowOn = newValue;
                  if (newValue) {
                    _isGreenOn = false;
                    _isRedOn = false;
                  }
                  _postLightStatusToDatabase();
                });
              },
            ),
            SizedBox(height: 15.0),
            Text(
              _isYellowOn ? 'Yellow Light ON' : 'Yellow Light OFF',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  void _postLightStatusToDatabase() {
    _database.child('traffic_lights').set({
      'green': _isGreenOn,
      'red': _isRedOn,
      'yellow': _isYellowOn,
    }).then((_) {
      print('Status posted to database!');
    }).catchError((error) {
      print('Failed to post status: $error');
    });
  }
}
