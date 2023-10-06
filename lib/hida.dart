import 'package:flutter/material.dart';

class hida extends StatefulWidget {
  const hida({super.key});

  @override
  State<hida> createState() => _hidaState();
}

class _hidaState extends State<hida> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:
        Container
          (
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xFF231557),
              Color(0xff44107a),
              Color(0xffff1361),
              Color(0xffFFF800),
            ])
          ),
        ),
      ),
    );
  }
}

// background-image: linear-gradient(-225deg, #231557 0%, #44107A 29%, #FF1361 67%, #FFF800 100%);
