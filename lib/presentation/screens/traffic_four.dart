import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TrafficLight {
  final String color;
  final int duration;

  TrafficLight({required this.color, required this.duration});

  factory TrafficLight.fromJson(Map<dynamic, dynamic> json) {
    return TrafficLight(
      color: json['color'],
      duration: json['duration'],
    );
  }
}

class TrafficLightPostScreen extends StatefulWidget {
  @override
  _TrafficLightPostScreenState createState() => _TrafficLightPostScreenState();
}

class _TrafficLightPostScreenState extends State<TrafficLightPostScreen> {
  final databaseReference = FirebaseDatabase.instance.reference();

  final TextEditingController durationController = TextEditingController();
  String selectedColor = 'Red';

  void postTrafficLight() {
    final int duration = int.tryParse(durationController.text) ?? 0;

    if (duration > 0) {
      final newTrafficLight = databaseReference.child('traffic_lights').push();
      newTrafficLight.set({
        'color': selectedColor,
        'duration': duration,
      });

      durationController.clear();
    } else {
      print('Invalid input');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedColor,
              onChanged: (String? newValue) {
                setState(() {
                  selectedColor = newValue!;
                });
              },
              items: <String>['Red', 'Yellow', 'Green']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: durationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Duration',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: postTrafficLight,
              child: Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}
