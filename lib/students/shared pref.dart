import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class sharedPref extends StatefulWidget {
  const sharedPref({super.key});

  @override
  State<sharedPref> createState() => _sharedPrefState();
}

class _sharedPrefState extends State<sharedPref> {
  TextEditingController emailController = TextEditingController();
  TextEditingController emailGetController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String password ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Shared Preference"),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Save",style: GoogleFonts.poppins(
                    fontSize:24
                  ),),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,

                    decoration: InputDecoration(
                      labelText: 'email',

                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,

                    decoration: InputDecoration(
                      labelText: 'Password',

                      border: OutlineInputBorder()
                    ),
                  ),
                ),

                SwipeButton.expand(
                  width: w*0.7,
                  thumb: Icon(
                    Icons.double_arrow_rounded,
                    color: Colors.white,
                  ),
                  child: Text(
                    "Swipe to Save",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),

                  activeThumbColor: Colors.green,
                  activeTrackColor: Colors.grey.shade100,

                  onSwipe: () async {

                    if(emailController.text !=''
                    && passwordController.text !=''

                    ){

                      SharedPreferences prefs =await SharedPreferences.getInstance();

                      prefs.setString(emailController.text, passwordController.text);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Saved"),
                          backgroundColor: Colors.green,
                        ),

                      );
                      emailController.clear();
                      passwordController.clear();
                    }



                  },
                ),

                Divider(),
              ],
            ),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Get",style: GoogleFonts.poppins(
                      fontSize:24
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailGetController,

                    decoration: InputDecoration(
                        labelText: 'email',

                        border: OutlineInputBorder()
                    ),
                  ),
                ),


                password ==''?
                    Text(''):
                    Text('your password is $password'),


                SwipeButton(
                  width: w*0.7,
                  thumb: Icon(
                    Icons.double_arrow_rounded,
                    color: Colors.white,
                  ),
                  child: Text(
                    "Swipe to get",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  activeThumbColor: Colors.green,
                  activeTrackColor: Colors.grey.shade100,

                  onSwipe: () async {

                    if(emailGetController.text !=''


                    ){

                      SharedPreferences prefs =await SharedPreferences.getInstance();

                   password =   prefs.getString(emailGetController.text)!;
                   setState(() {
                     
                   });


                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Got it"),
                          backgroundColor: Colors.green,
                        ),

                      );
                      emailGetController.clear();
                      passwordController.clear();
                    }



                  },
                ),


              ],
            )


          ],
        ),
      ),

    );
  }
}


showUploadMEssage(BuildContext context,String messaage){
  var snackBar = SnackBar(
    content: Text(messaage),
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}