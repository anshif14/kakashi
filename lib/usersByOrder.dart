import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kakashi/models/users_model.dart';

class usersInOrder extends StatefulWidget {
  const usersInOrder({super.key});
  @override
  State<usersInOrder> createState() => _usersInOrderState();
}

class _usersInOrderState extends State<usersInOrder> {

  TextEditingController nameController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  TextEditingController emailController =TextEditingController();

  List a =[1,2,3,4,5,6,7];

  List days =[];

  getdays(){
    for(var docs in a){
      days.add(DateFormat("EEEE").format(DateTime(2023,1,docs)));
    }
    print(days);
  }

  List b=[];
@override
  void initState() {

  getdays();
  // TODO: implement initState
    super.initState();
  }
//TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [



          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
                hintText: "name"
            ),
          ),

          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: "password"
            ),
          ),

          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                hintText: "email"
            ),
          ),

          SizedBox(
            height: 30,
          ),

          InkWell(
            onTap: (){

              UsersModel userModelData = UsersModel
                (userName: nameController.text,
                  password: passwordController.text,
                  email: emailController.text);

              FirebaseFirestore.instance.collection("users1").add(userModelData.toMap());


            },
            child: Container(
              height: 20,
              width: 50,
              color: Colors.blue,
              child: Text("upload"),
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
            itemCount: days.length,
            itemBuilder: (context, index) =>

          InkWell(
            onTap: () {
              print(b);
            },
            child: CheckboxMenuButton(

                value: b.contains(days[index]), onChanged: (value) {
             print(value);
              if(b.contains(days[index])){
                b.remove(days[index]);
              }else{
                b.add(days[index]);
              }
              print(b);
              setState(() {

              });
            },
            child: Text(days[index].toString()),

            ),
          )
          )

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextFormField(
          //     controller: nameController,
          //   ),
          // ),
          // TextButton(onPressed: () async{
          //   var settings = await FirebaseFirestore.instance.collection('settings').doc('settings').get();
          //   int userCount = settings['user'];
          //   print(userCount);
          //
          //   FirebaseFirestore.instance.collection('users').doc('User$userCount').set({
          //     "name":nameController.text,
          //     "id":"User$userCount"
          //   });
          //
          //   FirebaseFirestore.instance.collection('settings').doc('settings').update({
          //     "user":FieldValue.increment(1)
          //   });
          //
          //   nameController.clear();
          //
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User addded")));
          //
          //
          // }, child: Text("Add"))
        ],
      ),
    );
  }
}
