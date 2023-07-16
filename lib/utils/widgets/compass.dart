import 'dart:math';

import 'package:flutter/material.dart';

class CompassWidget extends StatelessWidget {
  final double angle;

  const CompassWidget({Key? key, required this.angle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
              'assets/compass_background.png'), // Replace with your compass background image
          Transform.rotate(
            angle: -angle *
                (pi / 180), // Convert angle to radians and apply rotation
            child: Image.asset(
                'assets/compass_needle.png'), // Replace with your compass needle image
          ),
        ],
      ),
    );
  }
}
