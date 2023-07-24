import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

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
  void showinfo(BuildContext context) {
    AwesomeDialog dialog = AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      closeIcon: const Icon(Icons.close),
      title: 'Manual Mode',
      desc: 'You have entered manual mode',
      onDismissCallback: (type) {
        debugPrint('Dialog Dismiss from callback $type');
      },
    );

    dialog.show();
    Future.delayed(Duration(seconds: 1), () {
      dialog.dismiss();
    });
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
                      Navigator.pushNamed(context, '/automaticRoute');
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
                      showinfo(context);
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
                SizedBox(width: 20),
                Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/mapsRoute');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/live.png",
                          height: 100,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          "LIVE TRAFFIC",
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
