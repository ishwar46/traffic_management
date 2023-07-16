import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../data/traffic_light_data.dart';
import '../../../utils/app_colors.dart';

class WestLight extends StatefulWidget {
  @override
  _WestLightState createState() => _WestLightState();
}

class _WestLightState extends State<WestLight> {
  bool _isGreenOn = false;
  bool _isRedOn = false;
  bool _isYellowOn = false;
  bool _isTimerRunning = false;
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref('threelights');
  int _timerDuration = 5;

//Emergnecy Vehicle Code
  void handleCodeEntry(String code) {
    if (code == "123") {
      setState(() {
        _isGreenOn = true;
        _isRedOn = false;
        _isYellowOn = false;
      });
      _postLightStatusToDatabase();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Code Entered"),
            content: Text("Emergency code accepted. Green light turned on."),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid Code"),
            content: Text("Please enter a valid emergency code."),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _database.child('westlight').onValue.listen((event) {
      final lights = event.snapshot.value as Map<dynamic, dynamic>?;
      setState(() {
        _isRedOn = lights?['red'] ?? false;
        _isYellowOn = lights?['yellow'] ?? false;
        _isGreenOn = lights?['green'] ?? false;
      });
    });
  }
  Color getLightColor(LightState state) {
    switch (state) {
      case LightState.red:
        return Colors.red;
      case LightState.yellow:
        return Colors.yellow;
      case LightState.green:
        return Colors.green;
    }
  }
    //light icon
  IconData getLightIcon(LightState state) {
    switch (state) {
      case LightState.red:
        return Icons.trip_origin;
      case LightState.yellow:
        return Icons.trip_origin;
      case LightState.green:
        return Icons.trip_origin;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
    body: RefreshIndicator(
      onRefresh: () async {},
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: getLightColor(LightState.red),
                    radius: 20,
                    child: Icon(
                      getLightIcon(LightState.red),
                      color: Colors.white,
                    ),
                  ),
                  title: Text('Red Light'),
                  subtitle: Text(_isRedOn ? 'ON' : 'OFF'),
                  trailing: Switch(
                    value: _isRedOn,
                    onChanged: (value) {
                      setState(() {
                        _isRedOn = value;
                        if (value) {
                          _isGreenOn = false;
                          _isYellowOn = false;
                        }
                        _postLightStatusToDatabase();
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: getLightColor(LightState.yellow),
                    radius: 20,
                    child: Icon(
                      getLightIcon(LightState.yellow),
                      color: Colors.white,
                    ),
                  ),
                  title: Text('Yellow Light'),
                  subtitle: Text(_isYellowOn ? 'ON' : 'OFF'),
                  trailing: Switch(
                    value: _isYellowOn,
                    onChanged: (value) {
                      setState(() {
                        _isYellowOn = value;
                        if (value) {
                          _isGreenOn = false;
                          _isRedOn = false;
                        }
                        _postLightStatusToDatabase();
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: getLightColor(LightState.green),
                    radius: 20,
                    child: Icon(
                      getLightIcon(LightState.green),
                      color: Colors.white,
                    ),
                  ),
                  title: Text('Green Light'),
                  subtitle: Text(_isGreenOn ? 'ON' : 'OFF'),
                  trailing: Switch(
                    value: _isGreenOn,
                    onChanged: (value) {
                      setState(() {
                        _isGreenOn = value;
                        if (value) {
                          _isRedOn = false;
                          _isYellowOn = false;
                          _startTimer();
                        } else {
                          _stopTimer();
                        }
                        _postLightStatusToDatabase();
                      });
                    },
                  ),
                ),
                if (_isTimerRunning) buildTimerWidget(),
              ],
            ),
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            String enteredCode = "";
            return AlertDialog(
              title: Text("Enter Emergency Code"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      enteredCode = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter code",
                    ),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: () {
                    handleCodeEntry(enteredCode);
                  },
                  child: Text("Enter"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
              ],
            );
          },
        );
      },
      child: Image.asset(
        "assets/img/siren.png",
        height: 30,
      ),
      backgroundColor: Color.fromARGB(255, 207, 232, 235),
    ),
  );
    // return Scaffold(
    //   body: Center(
    //     child: ListView(
    //       padding: EdgeInsets.all(16.0),
    //       children: [
    //         buildSwitchTile(
    //           activeColor: Colors.red,
    //           inactiveThumbColor: Colors.grey,
    //           value: _isRedOn,
    //           onChanged: (bool newValue) {
    //             setState(() {
    //               _isRedOn = newValue;
    //               if (newValue) {
    //                 _isGreenOn = false;
    //                 _isYellowOn = false;
    //               }
    //               _postLightStatusToDatabase();
    //             });
    //           },
    //           title: 'Red Light',
    //         ),
    //         buildSwitchTile(
    //           activeColor: Colors.yellow,
    //           inactiveThumbColor: Colors.grey,
    //           value: _isYellowOn,
    //           onChanged: (bool newValue) {
    //             setState(() {
    //               _isYellowOn = newValue;
    //               if (newValue) {
    //                 _isGreenOn = false;
    //                 _isRedOn = false;
    //               }
    //               _postLightStatusToDatabase();
    //             });
    //           },
    //           title: 'Yellow Light',
    //         ),
    //         buildSwitchTile(
    //           activeColor: Colors.green,
    //           inactiveThumbColor: Colors.grey,
    //           value: _isGreenOn,
    //           onChanged: (bool newValue) {
    //             setState(() {
    //               _isGreenOn = newValue;
    //               if (newValue) {
    //                 _isRedOn = false;
    //                 _isYellowOn = false;
    //                 _startTimer();
    //               } else {
    //                 _stopTimer();
    //               }
    //               _postLightStatusToDatabase();
    //             });
    //           },
    //           title: 'Green Light',
    //         ),
    //         if (_isTimerRunning) buildTimerWidget(),
    //       ],
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       showDialog(
    //         context: context,
    //         builder: (BuildContext context) {
    //           String enteredCode = "";
    //           return AlertDialog(
    //             title: Text("Enter Emergency Code"),
    //             content: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 TextField(
    //                   keyboardType: TextInputType.number,
    //                   onChanged: (value) {
    //                     enteredCode = value;
    //                   },
    //                   decoration: InputDecoration(
    //                     hintText: "Enter code",
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             actions: [
    //               ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                   primary: Colors.green,
    //                 ),
    //                 onPressed: () {
    //                   handleCodeEntry(enteredCode);
    //                 },
    //                 child: Text("Enter"),
    //               ),
    //               ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                   primary: Colors.red,
    //                 ),
    //                 onPressed: () {
    //                   Navigator.of(context).pop();
    //                 },
    //                 child: Text("Cancel"),
    //               ),
    //             ],
    //           );
    //         },
    //       );
    //     },
    //     child: Image.asset(
    //       "assets/img/siren.png",
    //       height: 30,
    //     ),
    //     backgroundColor: Color.fromARGB(255, 207, 232, 235),
    //   ),
    // );
  }

  Widget buildSwitchTile({
    required Color activeColor,
    required Color inactiveThumbColor,
    required bool value,
    required Function(bool) onChanged,
    required String title,
  }) {
    return ListTile(
      tileColor: Color.fromARGB(255, 255, 255, 255),
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

  Widget buildTimerWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        "Light Turns Red In: $_timerDuration",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

//post to database
  void _postLightStatusToDatabase() {
    _database.child('westlight').set({
      'red': _isRedOn,
      'yellow': _isYellowOn,
      'green': _isGreenOn,
    }).then((_) {
      print('Status updated to database!');
    }).catchError((error) {
      print('Failed to update status: $error');
    });

    if (_isRedOn) {
      _database.child('westlight').update({'red': true});
    } else {
      _database.child('westlight').update({'red': false});
    }
  }

  void _startTimer() {
    _isTimerRunning = true;
    _timerDuration = 5;
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timerDuration--;
      });
      if (_timerDuration == 0) {
        timer.cancel();
        _isTimerRunning = false;
        setState(() {
          _isGreenOn = false;
          _isRedOn = true;
        });
        _postLightStatusToDatabase();
      }
    });
  }

  void _stopTimer() {
    _isTimerRunning = false;
  }
}
