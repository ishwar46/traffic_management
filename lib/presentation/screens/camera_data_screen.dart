// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// class RealtimeDataScreen extends StatefulWidget {
//   @override
//   _RealtimeDataScreenState createState() => _RealtimeDataScreenState();
// }

// class _RealtimeDataScreenState extends State<RealtimeDataScreen> {
//   final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref('CCTV').child('');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Vehicle Data'),
//       ),
//       body: StreamBuilder<Map<dynamic, dynamic>>(
//         stream: _databaseReference.onValue,
//         builder: (context, snapshot) {
//           if (snapshot.hasData && snapshot.data != null) {
//             Map<dynamic, dynamic> data = snapshot.data!.snapshot.value;
//             List<dynamic> dataList = data.values.toList();
//             return ListView.builder(
//               itemCount: dataList.length,
//               itemBuilder: (context, index) {
//                 String objectId = dataList[index]['object_id'];
//                 String cameraId = dataList[index]['camera_id'];
//                 String dateTime = dataList[index]['datetime'];

//                 Map<dynamic, dynamic> dataMap = data as Map<dynamic, dynamic>;

//                 return ListTile(
//                   title: Text('Object ID: $objectId'),
//                   subtitle: Text('Camera ID: $cameraId\nDate: $dateTime'),
//                 );
//               },
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }