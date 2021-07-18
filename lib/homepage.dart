import "package:flutter/material.dart";
import 'package:flutter_flappybird/bird.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double birdYAxis = 0;

  void jump() {
    setState(() {
      birdYAxis -= 0.1;
    });
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
