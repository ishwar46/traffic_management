import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../utils/app_colors.dart';

class SlotLot extends StatefulWidget {
  @override
  _SlotLotState createState() => _SlotLotState();
}

class _SlotLotState extends State<SlotLot> {
  String slotStatus = 'Loading...';

  @override
  void initState() {
    super.initState();
    _getSlotAvailability();
  }

  Future<void> _getSlotAvailability() async {
    String url = ''; // Add your URL here
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          slotStatus = 'Remaining Slot: ${response.body}';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Urban Flow Parking',
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
