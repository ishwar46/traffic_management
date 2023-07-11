import 'package:flutter/material.dart';
import 'package:smartftraffic/presentation/login/login_page.dart';

import '../../../utils/app_colors.dart';

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

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
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
    TextEditingController searchController = TextEditingController();
    List<TrafficLight> filteredTrafficLights =
        List<TrafficLight>.from(trafficLights);

    void filterTrafficLights(String query) {
      setState(() {
        filteredTrafficLights = trafficLights.where((light) {
          final idLower = light.id.toLowerCase();
          final queryLower = query.toLowerCase();
          return idLower.contains(queryLower);
        }).toList();
      });
    }

    void sortTrafficLights(String? sortBy) {
      setState(() {
        if (sortBy != null) {
          switch (sortBy) {
            case 'ID':
              filteredTrafficLights.sort((a, b) => a.id.compareTo(b.id));
              break;
            case 'State':
              filteredTrafficLights
                  .sort((a, b) => a.state.index.compareTo(b.state.index));
              break;
            case 'Alphabetical':
              filteredTrafficLights.sort((a, b) => a.id.compareTo(b.id));
              break;
          }
        }
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
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        title: Text('Dashboard'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: refreshTrafficLights,
          ),
          IconButton(
            icon: Icon(Icons.logout_rounded),
            onPressed: () {
              _logout();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterTrafficLights,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          DropdownButton<String>(
            value: 'ID',
            onChanged: (String? newValue) {
              if (newValue != null) {
                sortTrafficLights(newValue);
              }
            },
            icon: Icon(Icons.arrow_drop_down), // Add an arrow icon
            iconSize: 24, // Set the size of the arrow icon
            elevation: 16,
            style: TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.grey,
            ),
            items: [
              DropdownMenuItem<String>(
                value: 'ID',
                child: Text('Sort by ID'),
              ),
              DropdownMenuItem<String>(
                value: 'State',
                child: Text('Sort by State'),
              ),
              DropdownMenuItem<String>(
                value: 'Alphabetical',
                child: Text('Sort Alphabetically'),
              ),
            ],
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: refreshTrafficLights,
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
          ),
        ],
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
