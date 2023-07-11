import 'package:flutter/material.dart';
import 'package:smartftraffic/presentation/home/ui/traffic_light_first.dart';
import 'package:smartftraffic/presentation/home/ui/traffic_light_four.dart';
import 'package:smartftraffic/presentation/home/ui/traffic_light_second.dart';
import 'package:smartftraffic/presentation/home/ui/traffic_light_third.dart';
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

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() =>
      _DashboardState();
}

class _DashboardState
    extends State<Dashboard> {
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
            onPressed: (

            ) {
              _logout();
            },
          ),
        ],
      ),
      body: MyTabbedPage(),
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
class MyTabbedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            Center(
              child: TrafficLight_One(),
            ),
            Center(
              child: TrafficLight_Two(),
            ),
            
            Center(
              child: TrafficLight_Three(),
            ),
            // Content of Tab 4
            Center(
              child: TrafficLight_Four(),
            ),
          ],
        ),
      ),
    );
  }
}