import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../utils/app_colors.dart';

class SlotLot extends StatefulWidget {
  @override
  _SlotLot createState() => _SlotLot();
}

class _SlotLot extends State<SlotLot> {
  String slotStatus = 'Loading...';

  @override
  void initState() {
    super.initState();
    _getSlotAvailability();
  }

  void _getSlotAvailability() async {
    String url = '';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          slotStatus = 'Slot Left: ${response.body}';
        });
      } else {
        setState(() {
          slotStatus = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        slotStatus = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: AppColors.primaryColor,
      //   automaticallyImplyLeading: false,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     color: AppColors.white,
      //   ),
      //   title: const Text(
      //     "SLOT LOT",
      //     style: TextStyle(
      //         color: AppColors.white,
      //         fontWeight: FontWeight.w500,
      //         fontFamily: "nunito"),
      //   ),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Urban Parking',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(slotStatus),
          ],
        ),
      ),
    );
  }
}
