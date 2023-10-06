import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popover/popover.dart';

class multipleSelectWindow extends StatefulWidget {
  const multipleSelectWindow({super.key});

  @override
  State<multipleSelectWindow> createState() => _multipleSelectWindowState();
}

class _multipleSelectWindowState extends State<multipleSelectWindow> {
  var _checkedValue ;

  List values =[
    'Dine in',
    'Delivery',
    'Take away'
  ];



  String selectedOption='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // PopupMenuButton(itemBuilder: (context) {
          //   return
          //       List.generate(values.length, (index) =>  PopupMenuItem(child: GestureDetector(
          //
          //         onTap: (){
          //           _checkedValue=!_checkedValue;
          //           setState(() {
          //
          //           });
          //         },
          //         child: Row(
          //           children: [
          //             Checkbox(value: _checkedValue, onChanged: (
          //                 val
          //                 ){
          //               _checkedValue = val!;
          //               setState(() {
          //
          //               });
          //             }),
          //             Text(values[index])
          //           ],
          //         ),
          //       )));
          //
          //
          // },),
          //
          // IconButton(onPressed: (){
          //   showPopover(context: context, bodyBuilder: (context) {
          //     return Container(
          //       height: 100,
          //       width: 100,
          //       color: Colors.white,
          //       child: Column(
          //         children: List.generate(values.length, (index) => Text(values[index])),
          //       ),
          //     );
          //
          //   },);
          // }, icon: Icon(Icons.more_vert))

          // popupItems()

CustomPopupMenu(
  verticalMargin: 0,
    horizontalMargin: 0,

    child: Icon(
        Icons.more_vert
      ),

    menuBuilder: () {
      return popupItems();

    },
    pressType: PressType.singleClick
)

          // PopupMenuButton(
          //   icon: Icon(Icons.sort),
          //   onSelected: (value) {
          //     setState(() {
          //       // Update the selected option
          //       _checkedValue = value;
          //     });
          //   },
          //   itemBuilder: (BuildContext context) {
          //     return List.generate(values.length, (index) =>
          //       PopupMenuItem(
          //       value: values[index],
          //       child: Row(
          //         children: [
          //           Checkbox(
          //             value:values[index] == selectedOption,
          //             onChanged: (_) {
          //               setState(() {
          //                 // Update the selected option when the checkbox is toggled
          //                 selectedOption = values[index];
          //               });
          //             },
          //           ),
          //           Text(values[index]),
          //         ],
          //       ),
          //     )
          //
          //
          //     );
          //   },
          // ),
        ],
      ),
     body: Center(
       child:CustomPopupMenu(
         arrowColor: Colors.transparent,


           child: Icon(
               Icons.more_vert
           ),

           menuBuilder: () {
             return popupItems();

           },
           pressType: PressType.singleClick
       ) ,
     ),
    );
  }
}



class popupItems extends StatefulWidget {
  const popupItems({super.key});

  @override
  State<popupItems> createState() => _popupItemsState();
}

class _popupItemsState extends State<popupItems> {
  List values =[
    'Dine in',
    'Delivery',
    'Take away'
  ];

  var _checked;

  List checkedList =[];

  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {





    return
      Container(
        // height: 100,
        width: 200,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          separatorBuilder: (context, index) => Divider(),
          shrinkWrap: true,
          itemCount: values.length,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: GestureDetector(

                onTap: (){

                  if(checkedList.contains(values[index])){
                    checkedList.remove(values[index]);
                  }
                  else{
                    checkedList.add(values[index]);
                  }
                  setState(() {

                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(values[index],style: GoogleFonts.montserrat(),),
                    Checkbox(value:checkedList.contains(values[index]), onChanged: (
                        val
                        ){

                      if(checkedList.contains(values[index])){
                        checkedList.remove(values[index]);
                      }
                      else{
                        checkedList.add(values[index]);
                      }
                      setState(() {

                      });


                    })

                  ],
                ),
              ),
            ),
          );
        },),
        decoration: BoxDecoration(

          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
      );

  }
}

// class popup extends StatefulWidget {
//   const popup({super.key});
//
//   @override
//   State<popup> createState() => _popupState();
// }
//
// class _popupState extends State<popup> {
//   @override
//   Widget build(BuildContext context) {
//     return  CustomPopupMenu(
//
//         child: Icon(
//             Icons.more_vert
//         ),
//
//         menuBuilder: () {
//           return popupItems();
//
//         },
//         pressType: PressType.singleClick
//     );
//   }
// }
