import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakashi/API%20INTEGRATION.dart';
import 'package:kakashi/circle%20graph.dart';
import 'package:kakashi/guzto%20vendor.dart';
import 'package:kakashi/guztyMbu.dart';
import 'package:kakashi/hida.dart';
import 'package:kakashi/login%20signup.dart';
import 'package:kakashi/progressGraph.dart';
import 'package:kakashi/radar.dart';
import 'package:kakashi/raniya/notification.dart';
import 'package:kakashi/raniya/paymentReciept.dart';
// import 'package:kakashi/raniya%20home.dart';
import 'package:kakashi/sagar%20test.dart';
import 'package:kakashi/screens/pincode%20Riverpod.dart';
import 'package:kakashi/screens/postalApiRiverPond.dart';
import 'package:kakashi/screens/riverpod1.dart';
import 'package:kakashi/screens/soulknobe%20date.dart';
import 'package:kakashi/students/home.dart';
// import 'package:kakashi/studentAchievements.dart';
// import 'package:kakashi/studentProfile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}
var a;

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var b;
  @override
  Widget build(BuildContext context) {
    var c;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: doctorSlotBooking(

      )
    );
  }
}

//
// Positioned(
// bottom: width*0.05,
// right: 0,
// child: Container(
// height: width*0.08,
// width: width*0.3,
//
// decoration: BoxDecoration(
// color: Color(0xffE83B66)
// ),
// ),
// )
