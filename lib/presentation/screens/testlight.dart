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
      final lights = event.snapshot.value as Map<dynamic, dynamic>?;
      setState(() {
        _isGreenOn = lights?['green'] ?? false;
        _isRedOn = lights?['red'] ?? false;
        _isYellowOn = lights?['yellow'] ?? false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            buildSwitchTile(
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
              title: 'Green Light',
            ),
            buildSwitchTile(
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
              title: 'Red Light',
            ),
            buildSwitchTile(
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
              title: 'Yellow Light',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwitchTile({
    required Color activeColor,
    required Color inactiveThumbColor,
    required bool value,
    required Function(bool) onChanged,
    required String title,
  }) {
    return ListTile(
      tileColor: Colors.grey[200],
      leading: Switch(
        activeColor: activeColor,
        inactiveThumbColor: inactiveThumbColor,
        value: value,
        onChanged: onChanged,
      ),
      title: Text(
        value ? '$title ON' : '$title OFF',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  void _postLightStatusToDatabase() {
    _database.child('traffic_lights').set({
      'green': _isGreenOn,
      'red': _isRedOn,
      'yellow': _isYellowOn,
    }).then((_) {
      print('Status updated to database!');
    }).catchError((error) {
      print('Failed to updated status: $error');
    });
  }
}
