import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:trafficnepal/utils/app_colors.dart';

class AutomaticTrigger extends StatefulWidget {
  @override
  State<AutomaticTrigger> createState() => _AutomaticTriggerState();
}

class _AutomaticTriggerState extends State<AutomaticTrigger> {
  final DatabaseReference _commandRef =
      FirebaseDatabase.instance.ref().child('automatic');
  bool automaticModeActive = false;

  void _sendCommand(String state) async {
    if (state == 'true' && automaticModeActive) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Automatic mode is already active'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    await _commandRef.set({"state": state});

    if (state == 'true') {
      automaticModeActive = true;
    } else {
      automaticModeActive = false;
    }
  }

  void showInfo(BuildContext context) {
    AwesomeDialog dialog = AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      closeIcon: const Icon(Icons.close),
      title: 'Automatic Mode',
      desc: 'You have started automatic mode',
      onDismissCallback: (type) {
        debugPrint('Dialog Dismiss from callback $type');
      },
    );

    dialog.show();
    Future.delayed(Duration(seconds: 2), () {
      dialog.dismiss();
    });
  }

  void showCaution(BuildContext context) {
    AwesomeDialog dialog = AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      closeIcon: const Icon(Icons.close),
      title: 'Automatic Mode',
      desc: 'You have stopped automatic mode',
      onDismissCallback: (type) {
        debugPrint('Dialog Dismiss from callback $type');
      },
    );

    dialog.show();
    Future.delayed(Duration(seconds: 2), () {
      dialog.dismiss();
    });
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
          "AUTOMATIC TRIGGER",
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
                    if (!automaticModeActive) {
                      _sendCommand('true');
                      print('started');
                      showInfo(context);
                    } else {
                      // Show a message to the user that the automatic mode is already active
                      // For example, you can display a snackbar or another dialog to notify the user.
                    }
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
                    _sendCommand('false');
                    print('stopped');
                    showCaution(context);
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
