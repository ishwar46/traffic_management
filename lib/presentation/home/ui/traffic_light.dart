import 'package:flutter/material.dart';

class TrafficLight {
  String id;
  Color color;
  bool isOn;

  TrafficLight({required this.id, required this.color, required this.isOn});
}

class TrafficLightManagementSystem extends StatefulWidget {
  @override
  _TrafficLightManagementSystemState createState() =>
      _TrafficLightManagementSystemState();
}

class _TrafficLightManagementSystemState
    extends State<TrafficLightManagementSystem> {
  List<TrafficLight> trafficLights = [
    TrafficLight(id: '1', color: Colors.red, isOn: true),
    TrafficLight(id: '2', color: Colors.green, isOn: false),
    TrafficLight(id: '3', color: Colors.yellow, isOn: false),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Dashboard'),
      ),
      body: ListView.builder(
        itemCount: trafficLights.length,
        itemBuilder: (context, index) {
          final light = trafficLights[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: light.color,
              radius: 20,
            ),
            title: Text('Traffic Light ${light.id}'),
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

void main() {
  runApp(MaterialApp(
    home: TrafficLightManagementSystem(),
  ));
}
