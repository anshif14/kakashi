import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakashi/providers/poviders.dart';

class riverPondApiPostal extends StatelessWidget {
   riverPondApiPostal({super.key});
  TextEditingController pinController =TextEditingController();

  @override

  Widget build(BuildContext context) {
    // pinController.text = '679322';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [

            TextFormField(
              controller: pinController,
              maxLength: 6,
              onChanged: (
                  val
                  ){

              },
            ),
            Consumer(
              builder: (context,ref,child) {
                ref.refresh(pinProvider(pinController.text));
                // ref.watch(pinProvider(val));

                final data = ref.watch(pinProvider(pinController.text));

                return data.when(data: (data){

                  // print(data[0].keys.toList());
               return

pinController.text.length != 6?Container():
               ListView.separated(
                 separatorBuilder: (context, index) => Divider(
                   thickness: 3,
                 ),
                 physics: NeverScrollableScrollPhysics(),

                 shrinkWrap: true,

                 itemCount: data.length,
                 itemBuilder: (context, index) {

                   // return Text(data[index].keys.toList().length.toString());

                 return ListView.builder(
                   physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount: data[index].keys.toList().length,
                   itemBuilder: (context, index1) {

                  return   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text(data[index].keys.toList()[index1].toString(),style: TextStyle(color: Colors.black),),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text(data[index].values.toList()[index1].toString(),style: TextStyle(color: Colors.black)),
                           ),
                         ],
                       ),
                  );

                 },);


                 // );
               },);



                }, error: (e,x){
               return   Text(e.toString());
                }, loading: (){
                  return Center(child: CircularProgressIndicator());
                });
              }
            )

          ],
        ),
      ),
    );
  }
}
