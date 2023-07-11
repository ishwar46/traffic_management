import 'package:flutter/material.dart';
import 'package:smartftraffic/presentation/login/login_page.dart';
import 'package:geolocator/geolocator.dart';


import '../../../utils/app_colors.dart';
Future<Position> _getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    // Location permissions are permanently denied
    return Future.error('Location permissions are permanently denied.');
  }

  if (permission == LocationPermission.denied) {
    // Location permissions are denied, ask for permission
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      // Location permissions are denied
      return Future.error('Location permissions are denied.');
    }
  }

  return await Geolocator.getCurrentPosition();
}


enum LightState {
  red,
  yellow,
  green,
}

class TrafficLight {
  String id;
  LightState state;
  bool isOn;

  TrafficLight({required this.id, required this.state, required this.isOn});
}

class TrafficLight_One extends StatefulWidget {
  @override
  _TrafficLight_OneState createState() =>
      _TrafficLight_OneState();
}

class _TrafficLight_OneState
    extends State<TrafficLight_One> {
  List<TrafficLight> trafficLights = [
    TrafficLight(id: '1', state: LightState.red, isOn: true),
    TrafficLight(id: '2', state: LightState.green, isOn: false),
    TrafficLight(id: '3', state: LightState.yellow, isOn: false),
  ];

  //Toggle light
  void toggleLight(String id) {
    setState(() {
      trafficLights.forEach((light) {
        if (light.id == id) {
          light.isOn = !light.isOn;
        } else {
          light.isOn = false;
        }
      });
    });
  }

//Get next light state
  LightState getNextLightState(LightState currentState) {
    switch (currentState) {
      case LightState.red:
        return LightState.green;
      case LightState.yellow:
        return LightState.red;
      case LightState.green:
        return LightState.yellow;
    }
  }

  //Change light state

  void changeLightState(String id) {
    setState(() {
      trafficLights.forEach((light) {
        if (light.id == id) {
          light.state = getNextLightState(light.state);
        }
      });
    });
  }

  //Get light icon
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

  //Get light color
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

  @override
  Widget build(BuildContext context) {
    bool isCodeEntered = false; 
    TextEditingController searchController = TextEditingController();
    List<TrafficLight> filteredTrafficLights =
        List<TrafficLight>.from(trafficLights);

        void handleCodeEntry(String code) {
  if (code == "123") {
    setState(() {
      isCodeEntered = true;

      trafficLights[2].isOn = true;
      trafficLights[0].isOn = false;
      trafficLights[1].isOn = false;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Code Entered"),
          content: Text("Emergency code accepted. Green light turned on."),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryColor,
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
                primary: AppColors.primaryColor,
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


    void filterTrafficLights(String query) {
      setState(() {
        filteredTrafficLights = trafficLights.where((light) {
          final idLower = light.id.toLowerCase();
          final queryLower = query.toLowerCase();
          return idLower.contains(queryLower);
        }).toList();
      });
    }

    Future<void> refreshTrafficLights() async {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        trafficLights = [
          TrafficLight(id: '1', state: LightState.red, isOn: true),
          TrafficLight(id: '2', state: LightState.green, isOn: false),
          TrafficLight(id: '3', state: LightState.yellow, isOn: false),
        ];
        filteredTrafficLights = List<TrafficLight>.from(trafficLights);
      });
    }
  return Scaffold(
  body: RefreshIndicator(
    onRefresh: refreshTrafficLights,
    child: Column(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: filteredTrafficLights.length,
            itemBuilder: (context, index) {
              final light = filteredTrafficLights[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: getLightColor(light.state),
                  radius: 20,
                  child: Icon(
                    getLightIcon(light.state),
                    color: Colors.white,
                  ),
                ),
                title: Text('Light ${light.id}'),
                subtitle: Text('${light.state.toString().split('.').last}'),
                trailing: Switch(
                  value: light.isOn,
                  onChanged: (value) => toggleLight(light.id),
                ),
                onTap: () => changeLightState(light.id),
              );
            },
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    try {
                      Position position = await _getCurrentLocation();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Location Info"),
                            content: Text(
                              "Latitude: ${position.latitude}\nLongitude: ${position.longitude}",
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Location Error"),
                            content: Text("Failed to retrieve location. Please try again."),
                            actions: [
                              ElevatedButton(
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
                  },
                  child: Text("Get Current Location"),
                ),
              ],
            ),
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
            title: Text("Enter Code"),
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
    child: Icon(Icons.add),
    backgroundColor: AppColors.primaryColor,
  ),
);


  }
  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const CustomCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
      ),
    );
  }
}

