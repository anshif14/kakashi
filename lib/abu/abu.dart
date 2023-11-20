import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class abuTask extends StatefulWidget {
  const abuTask({super.key});

  @override
  State<abuTask> createState() => _abuTaskState();
}

class _abuTaskState extends State<abuTask> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // height: 100,
            width: 100,
            height: 30,
            color: Colors.yellowAccent,
            child: AutoSizeText("ansbahdsjsbdhjasbdhsbhsbhbhdbhsbfhdsbfdshb",
            style: TextStyle(

            ),

            ),
          )
        ],
      ),

    );
  }
}
