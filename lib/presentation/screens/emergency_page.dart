import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

class ModePage extends StatefulWidget {
  const ModePage({Key? key}) : super(key: key);

  @override
  _ModePageState createState() => _ModePageState();
}

class _ModePageState extends State<ModePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  //    void showSuccessMessage(String message) {
  //   ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       backgroundColor: Colors.green,
  //       content: Text(message),
  //       duration: const Duration(seconds: 2),
  //     ),
  //   );
  // }
  void showSuccessMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success"),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Feature Under Development'),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/system.png",
                          height: 100,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          "AUTO MODE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              fontFamily: GoogleFonts.nunito().fontFamily),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () {
                      showSuccessMessage("Successfully entered manual mode");
                    
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     backgroundColor: Colors.red,
                      //     content: Text('Feature Under Development'),
                      //   ),
                      // );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/policeman.png",
                          height: 100,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          "MANUAL MODE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              fontFamily: GoogleFonts.nunito().fontFamily),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
