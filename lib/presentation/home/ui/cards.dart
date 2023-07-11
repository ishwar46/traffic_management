import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyCards extends StatefulWidget {
  const MyCards({super.key});

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Placeholder(),
      ),
    );
  }
}