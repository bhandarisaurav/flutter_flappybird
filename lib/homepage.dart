import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_flappybird/bird.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double birdYAxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = 0;

  void jump() {
    initialHeight = birdYAxis;
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 5 * time;
      setState(() {
        birdYAxis = initialHeight - height;
      });
    });
    print('The values are: ${[birdYAxis, time, height, initialHeight]}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: jump,
              child: AnimatedContainer(
                alignment: Alignment(0, birdYAxis),
                duration: Duration(milliseconds: 0),
                color: Colors.blue,
                child: MyBird(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
