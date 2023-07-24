import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:http/http.dart' as http;

import '../../../utils/app_colors.dart';

class AutomaticTrigger extends StatefulWidget {
  @override
  State<AutomaticTrigger> createState() => _AutomaticTriggerState();
}

class _AutomaticTriggerState extends State<AutomaticTrigger> {
  final String serverUrl = "";

  Future<void> _sendCommand(String command) async {
    final url = Uri.parse("$serverUrl/control");
    final response = await http.post(
      url,
      body: {"command": command},
    );

    if (response.statusCode == 200) {
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
          "Automatic Mode",
          style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontFamily: "nunito"),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              child: Align(
                alignment: Alignment.center,
                child: RoundedButtonWithIcon(
                  onPressed: () {
                    _sendCommand('start');
                  },
                  icon: Icons.play_arrow,
                  title: "Start",
                  buttonColor: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: Align(
                alignment: Alignment.center,
                child: RoundedButtonWithIcon(
                  onPressed: () {
                    _sendCommand('stop');
                  },
                  icon: Icons.stop,
                  title: "Stop",
                  buttonColor: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
