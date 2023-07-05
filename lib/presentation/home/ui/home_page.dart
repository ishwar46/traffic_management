// import 'package:flutter/material.dart';

// class TrafficLight {
//   String id;
//   Color color;
//   bool isOn;

//   TrafficLight({required this.id, required this.color, required this.isOn});
// }

// class TrafficLightManagementSystem extends StatefulWidget {
//   @override
//   _TrafficLightManagementSystemState createState() =>
//       _TrafficLightManagementSystemState();
// }

// class _TrafficLightManagementSystemState
//     extends State<TrafficLightManagementSystem> {
//   List<TrafficLight> trafficLights = [
//     TrafficLight(id: '1', color: Colors.red, isOn: true),
//     TrafficLight(id: '2', color: Colors.green, isOn: false),
//     TrafficLight(id: '3', color: Colors.yellow, isOn: false),
//   ];

//   void toggleLight(String id) {
//     setState(() {
//       trafficLights.forEach((light) {
//         if (light.id == id) {
//           light.isOn = !light.isOn;
//         } else {
//           light.isOn = false;
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Smart Traffic Light Management System'),
//       ),
//       body: HomePage(), // Replaced with HomePage widget
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Total Vehicles',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             '1,234',
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Active Routes',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             '567',
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }
