import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakashi/providers/contoller/controller.dart';
import 'package:kakashi/providers/poviders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class riverpod1 extends StatelessWidget {
   riverpod1({super.key});

  List names = [
    'anshif',
    'adul',
    'hilal',
    'ameer',
    'anandu'

  ];
   final provider2 = Provider((ref) {
     // use ref to obtain other providers
     final repository = ref.watch(nameProvider.notifier);

     return repository;

   });

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer(
              builder: (context,ref,child)  {

                final name = ref.watch(nameProvider.notifier);

                final userData=ref.watch(userDataStreamProvider);


                return   userData.when(data:(data) {
                  // print(data.docs[0]['name'].runtimeType);
                 // Map<String,dynamic> data =data1 as Map <String,dynamic>;

                  return Center(


                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.docs.length,
                        itemBuilder: (context, index)  {
                          return  Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(data.docs[index]['name'].toString(),
                                    style: TextStyle(
                                        color: Colors.green
                                    )
                                ),
                              ),
                              // Text(name.state.toString(),
                              //   style: TextStyle(color: Colors.white),)
                              // ,
                            ],
                          );
                        }
                    ) ,);
                },  error: (error, stackTrace) => Center(child: Text(error.toString()),), loading: () => Center(child: CircularProgressIndicator(),),);


              }
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  for(var docs in names){
                    FirebaseFirestore.instance.collection('users').add({
                      'name':docs
                    });
                  }
                },


                    child: Text('Add')),


                ElevatedButton(onPressed: ()async{
                var dataa = await FirebaseFirestore.instance.collection('users').get();
                  for(var docs in dataa.docs){
                    FirebaseFirestore.instance.collection('users').doc(docs.id).delete();
                  }
                },


                    child: Text('Delete')),
              ],
            )

          ],
        ),
      ),
    );
  }
}
