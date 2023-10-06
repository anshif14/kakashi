import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class apiIntegration extends StatefulWidget {
  const apiIntegration({super.key});

  @override
  State<apiIntegration> createState() => _apiIntegrationState();
}

class _apiIntegrationState extends State<apiIntegration> {
  http.Response? data;

  List details =[];

  bool loading = false;

  getData(String pin)async{

    loading = true;
    setState(() {

    });


     data = await http.get(Uri.parse('https://www.postpincode.in/api/getPostalArea.php?pincode=$pin'));

     print(data!.body);

     details = json.decode(data!.body);

     // api = Api.fromjson(jsonDecode(data!.headers));
     setState(() {
       loading = false;
     });
    return Api.fromjson(data!.body);

    print(data!.statusCode);
    print(data!.body);setState(() {

    });
  }
  TextEditingController pinController = TextEditingController();
  Api? api ;

  @override
  void initState() {
    getData('679322');

    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,



      ),
body: Center(
  child:   Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(


        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Pincode',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder()
              ),
              onChanged: (val){
                getData(val);
                setState(() {

                });

              },
              controller: pinController,
            ),
          ),
// Text(details.toString()),
loading== true?Center(child: CircularProgressIndicator(),):
ListView.separated(
  physics: NeverScrollableScrollPhysics(),

  separatorBuilder: (context, index) => Divider(
      thickness: 5,
      color: Colors.black,
  ),
  shrinkWrap: true,
  itemCount: details.length,
  itemBuilder: (context,index1) {
      return     Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,

          itemCount: details[index1].keys.toList().length,

          itemBuilder: (context, index) {

            Map data = details[index1];

          return Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Text(data.keys.toList()[index].toString(),

              style: TextStyle(

                fontSize: 22

              ),),



              Text(data.values.toList()[index].toString(),

                style: TextStyle(

                    fontSize: 22

                ),),

            ],

          );

        },),
      );
  }
),

// Text(api!.toMap().length.toString()),
//       Text(data!.body.toString()),
              ElevatedButton(onPressed: (){
                // for(var docs in details){
                if(pinController.text.length == 6){
                  FirebaseFirestore.instance.collection('picodes').doc(pinController.text).set({'data':details});

                }


                // }


              }, child: Text('test')),
        ],
      ),
    ),
  ),
),

    );
  }
}

//https://dog.ceo/api/breeds/image/random

class Api{
final String message;
final String status;

//<editor-fold desc="Data Methods">
  const Api({
    required this.message,
    required this.status,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Api &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          status == other.status);

  @override
  int get hashCode => message.hashCode ^ status.hashCode;

  @override
  String toString() {
    return 'Api{' + ' message: $message,' + ' status: $status,' + '}';
  }

  Api copyWith({
    String? message,
    String? status,
  }) {
    return Api(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': this.message,
      'status': this.status,
    };
  }

  factory Api.fromMap(Map<String, dynamic> map) {
    return Api(
      message: map['message'] as String,
      status: map['status'] as String,
    );
  }

  String toJson()=> json.encode(toMap());
  factory Api.fromjson(String source)=> Api.fromMap(jsonDecode(source));

//</editor-fold>
}
