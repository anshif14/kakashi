

import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/src/framework.dart';

import '../mode;s/name model.dart';

final nameProvider = StateProvider((ref) async {

  return FirebaseFirestore.instance.collection('users').snapshots();


} ) ;

final pinProvider = FutureProvider.family((ref,String pin)async {

  // pin.runtimeType;

// Timer.periodic(Duration(seconds: 1), (timer) async {
  final response = await http.get(Uri.parse('https://www.postpincode.in/api/getPostalArea.php?pincode=$pin'));

  if (response.statusCode == 200) {
    // Parse the JSON response and return the data as a List<MyData>
    // Replace MyData with your data model.
    final data = json.decode(response.body);

    // print(data);
    return data;


  } else {
    throw Exception('Failed to load data');
  }



// });


}

);







Future<QuerySnapshot<Map<String, dynamic>>> getBag() {
  return FirebaseFirestore.instance.collection('users').get();
}

final userProvider=Provider((ref) => UserRepository());


class UserRepository{
   Stream getUser(){

   return  FirebaseFirestore.instance.collection('users').snapshots();
  }
}



