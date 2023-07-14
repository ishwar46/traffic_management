import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/west.png',
                          height: 100,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          "WEST",
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
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/east.png',
                          height: 100,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          "EAST",
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/north.png',
                          height: 100,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          "NORTH",
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
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/south.png',
                          height: 100,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          "SOUTH",
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
