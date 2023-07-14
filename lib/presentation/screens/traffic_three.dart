import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

// Enum for light state
enum LightState { red, yellow, green }

class TrafficLight {
  final String id;
  LightState state;
  bool isOn;

  TrafficLight({required this.id, required this.state, required this.isOn});
}

class TrafficLightThree extends StatefulWidget {
  @override
  _TrafficLightThreeState createState() => _TrafficLightThreeState();
}

class _TrafficLightThreeState extends State<TrafficLightThree>
    with AutomaticKeepAliveClientMixin<TrafficLightThree> {
  List<TrafficLight> trafficLights = [];
  final DatabaseReference _database =
      FirebaseDatabase.instance.reference().child('traffic_lights');

  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    //_loadTrafficLights();
  }

  // void _loadTrafficLights() {
  //   _database.onValue.listen((event) {
  //     final lights = Map<String, dynamic>.from(event.snapshot.value);
  //     setState(() {
  //       trafficLights = lights.entries
  //           .map(
  //             (entry) => TrafficLight(
  //               id: entry.key,
  //               state: _parseLightState(entry.value['state']),
  //               isOn: entry.value['isOn'],
  //             ),
  //           )
  //           .toList();
  //     });
  //   });
  // }

  LightState _parseLightState(String value) {
    switch (value) {
      case 'red':
        return LightState.red;
      case 'yellow':
        return LightState.yellow;
      case 'green':
        return LightState.green;
      default:
        return LightState.red;
    }
  }

  // Toggle light
  void toggleLight(String id) {
    final light = trafficLights.firstWhere((light) => light.id == id);
    final nextState = getNextLightState(light.state);
    final isOn = nextState == LightState.green;

    _database.child(id).update({
      'state': nextState.toString().split('.').last,
      'isOn': isOn,
    }).then((_) {
      print('Light $id state updated!');
    }).catchError((error) {
      print('Failed to update light state: $error');
    });
  }

  // Next light state
  LightState getNextLightState(LightState currentState) {
    switch (currentState) {
      case LightState.red:
        return LightState.green;
      case LightState.yellow:
        return LightState.red;
      case LightState.green:
        return LightState.yellow;
      default:
        return LightState.red;
    }
  }

  // Light icon
  IconData getLightIcon(LightState state) {
    switch (state) {
      case LightState.red:
        return Icons.trip_origin;
      case LightState.yellow:
        return Icons.trip_origin;
      case LightState.green:
        return Icons.trip_origin;
      default:
        return Icons.trip_origin;
    }
  }

  // Light color
  Color getLightColor(LightState state) {
    switch (state) {
      case LightState.red:
        return Colors.red;
      case LightState.yellow:
        return Colors.yellow;
      case LightState.green:
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: trafficLights.length,
        itemBuilder: (context, index) {
          final light = trafficLights[index];
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
          );
        },
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
