import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/app_colors.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  void _requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: AppColors.white,
        ),
        title: const Text(
          "Live Traffic",
          style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontFamily: "nunito"),
        ),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(27.7062762, 85.3301396),
          zoom: 18.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        trafficEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        indoorViewEnabled: true,

        // markers: {
        //   const Marker(
        //     markerId: MarkerId('1'),
        //     position: LatLng(27.7062762, 85.3301396),
        //     infoWindow: InfoWindow(
        //       title: 'Ishwar Chaudhary',
        //       snippet: 'This is my location',
        //     ),
        //   ),
        // },
      ),
    );
  }
}
