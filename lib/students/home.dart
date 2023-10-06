import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakashi/API%20INTEGRATION.dart';
import 'package:kakashi/students/shared%20pref.dart';

class studentsHome extends StatefulWidget {
  const studentsHome({super.key});

  @override
  State<studentsHome> createState() => _studentsHomeState();
}
var h;
var w;

class _studentsHomeState extends State<studentsHome> {
 List pages= [
   {
     'name':'shared Pref',
     'page':sharedPref()
   },  {
     'name':'Api Integration',
     'page':apiIntegration()
   }
 ];

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: pages.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
         itemBuilder: (context, index) {
           return  GestureDetector(
             onTap: (){
               Navigator.push(context, CupertinoPageRoute(builder: (context) => pages[index]['page']));
             },
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 height: w*0.3,
                 width: w*0.3,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(w*00.03)
                     ,color: Colors.indigo.shade100
                 ),
                 child: Center(
                   child: Text(pages[index]['name']),
                 ),
               ),
             ),
           );
         },
        ),
      ),
    );
  }
}
