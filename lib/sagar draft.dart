// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:sagar_indian_restaurant_admin/Home/home.dart';
// import 'package:sagar_indian_restaurant_admin/model/employee_model.dart';
//
// import '../../Theame/color_theams.dart';
//
// class Leaves extends StatefulWidget {
//   final Employee empdetails;
//
//   const Leaves({Key key, this.empdetails}) : super(key: key);
//
//   @override
//   State<Leaves> createState() => _LeavesState();
// }
//
// class _LeavesState extends State<Leaves> {
//   TextEditingController reasonController = TextEditingController();
//   bool loading = false;
//   DateTime startDate;
//   DateTime endDate;
//   List<String> selectedLeaves = [];
//   DateTimeRange picked;
//   final today = DateUtils.dateOnly(DateTime.now());
//   List leaves = [];
//   bool isExpanded = false;
//   DateTime selectedMonth = DateTime.now();
//   int selectedMonthIndex =0;
//   List leaveDates=[];
//
//
//   String formattedMonth ;
//   DateTime now = DateTime.now();
//
//
//   List<String> monthsList = [];
//   months(){
//     DateTime now = DateTime.now();
//
//     // Create a list of all months.
//
//     for (int i = 1; i <= 12; i++) {
//       String month = DateFormat('MMMM').format(DateTime(now.year, i));
//       monthsList.add(month);
//
//
//
//     }
//     // selectedMonth= monthsList[0];
//
//
//     // Print the list of months.
//     print(months);
//   }
//   List  leavesonmonth =[];
//
//
//   getLeaves() {
//     FirebaseFirestore.instance
//         .collectionGroup('leave')
//         .where('employeeId', isEqualTo: widget.empdetails.id)
//         .snapshots()
//         .listen((event) {
//       leaves = [];
//       for (var element in event.docs) {
//         leaves.add(element);
//         leaveDates.add(
//             DateTime.tryParse(element['date'])
//         );
//         print(leaveDates);
//       }
//       print(leaves[0]['date']);
//       setState(() {});
//     });
//   }
//
//   @override
//   void initState() {
//     formattedMonth = DateFormat.yMMM().format(now);
//     months();
//     getLeaves();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsetsDirectional.fromSTEB(170, 20, 30, 0),
//       child: SizedBox(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Text(
//                     isExpanded ? 'Add Leaves' : 'Leaves',
//                     style: TextStyle(
//                       fontFamily: 'Lexend Deca',
//                       color: primaryColor,
//                       fontSize: 25,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   SizedBox(
//                     width: w * 0.02,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         isExpanded = !isExpanded;
//                       });
//                     },
//                     child: Container(
//                       height: h * .042,
//                       width: w * 0.15,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: logoTheme),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             isExpanded ? 'clear' : 'Add',
//                             style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             width: w * 0.01,
//                           ),
//                           Icon(
//                             isExpanded ? Icons.expand_less : Icons.expand_more,
//                             color: Colors.white,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: isExpanded
//                   ? Row(
//                 children: [
//                   InkWell(
//                     onTap: () async {
//                       picked = await showDateRangePicker(
//                           context: context,
//                           firstDate: DateTime(DateTime.now().year - 5),
//                           lastDate: DateTime(DateTime.now().year + 5),
//                           initialDateRange: DateTimeRange(
//                             end: DateTime(
//                                 DateTime.now().year,
//                                 DateTime.now().month,
//                                 DateTime.now().day + 13),
//                             start: DateTime.now(),
//                           ),
//                           builder: (context, child) {
//                             return Column(
//                               children: [
//                                 ConstrainedBox(
//                                   constraints: BoxConstraints(
//                                     maxWidth: w * 0.6,
//                                   ),
//                                   child: child,
//                                 )
//                               ],
//                             );
//                           });
//                       setState(() {});
//                     },
//                     child: Container(
//                       height: h * 0.06,
//                       width: picked == null ? w * 0.3 : w * 0.35,
//                       decoration: BoxDecoration(
//                         border: picked == null
//                             ? Border.all(color: logoTheme)
//                             : Border.all(),
//                         color: picked == null ? logoTheme : Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           picked == null
//                               ? const Icon(
//                             Icons.calendar_month,
//                             color: Colors.white,
//                             size: 26,
//                           )
//                               : const SizedBox(),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(
//                             picked == null
//                                 ? 'Select Dates'
//                                 : '${picked.start.day}/${picked.start.month}/${picked.start.year} to ${picked.end.day}/${picked.end.month}/${picked.end.year}',
//                             style: TextStyle(
//                                 color: picked == null
//                                     ? Colors.white
//                                     : Colors.black),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: w * 0.05,
//                   ),
//                   Expanded(
//                     child: TextFormField(
//                       controller: reasonController,
//                       obscureText: false,
//                       decoration: InputDecoration(
//                         labelText: 'Reason',
//                         labelStyle: const TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Colors.black,
//                         ),
//                         hintText: 'Please Enter The Reason',
//                         hintStyle: const TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Colors.black,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             color: Color(0xFF252525),
//                             width: 1,
//                           ),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             color: Color(0xFF252525),
//                             width: 1,
//                           ),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       style: const TextStyle(
//                         fontFamily: 'Poppins',
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 25,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (ctx) => AlertDialog(
//                           title: const Text("Leaves"),
//                           content: loading
//                               ? const CircularProgressIndicator()
//                               : const Text(
//                               "Do you want to Add this Leave?"),
//                           actions: <Widget>[
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(ctx).pop();
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.all(14),
//                                 child: const Text(
//                                   "Cancel",
//                                   style: TextStyle(color: Colors.red),
//                                 ),
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 if (picked != null) {
//                                   // Clear the list before adding new dates
//                                   selectedLeaves.clear();
//
//                                   // Loop through the date range and add each date to the list
//                                   for (DateTime date = picked.start;
//                                   date.isBefore(picked.end) ||
//                                       date.isAtSameMomentAs(
//                                           picked.end);
//                                   date = date
//                                       .add(const Duration(days: 1))) {
//                                     selectedLeaves.add(
//                                         DateFormat('dd-MM-yyy')
//                                             .format(date));
//                                   }
//                                   print(selectedLeaves);
//
//                                   setState(() {});
//                                 }
//                                 loading = true;
//
//                                 for (var docs in selectedLeaves) {
//                                   FirebaseFirestore.instance
//                                       .collection('employees')
//                                       .doc(widget.empdetails.id)
//                                       .collection('leave')
//                                       .doc(docs)
//                                       .set({
//                                     'reason': reasonController.text,
//                                     'date': docs,
//                                     'employeeName':
//                                     widget.empdetails.name,
//                                     'employeeId': widget.empdetails.id,
//                                   });
//                                 }
//                                 picked = null;
//                                 reasonController.clear();
//                                 selectedLeaves.clear();
//                                 docs.clear();
//                                 setState(() {});
//                                 Navigator.of(ctx).pop();
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.all(14),
//                                 child: const Text("Yes"),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                     child: Container(
//                       height: 50,
//                       width: 150,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: logoTheme,
//                       ),
//                       child: const Center(
//                         child: Text(
//                           'Submit',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               )
//                   : const SizedBox(),
//             ),
//             SizedBox(
//               height: h * 0.02,
//             ),
//             // leaves.isEmpty
//             //     ? const SizedBox(
//             //         child: Center(
//             //             child: Text(
//             //           'No Data Found.',
//             //           style: TextStyle(color: Colors.red),
//             //         )),
//             //       )
//             //     : SizedBox(
//             //         width: w * 8,
//             //         child: Column(
//             //           children: [
//             //
//             //             Expanded(
//             //               flex: 0,
//             //               child: GridView.builder(
//             //                 itemCount:monthsList.length ,
//             //                 shrinkWrap: true,
//             //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             //                     childAspectRatio: 2.2,
//             //
//             //                     crossAxisCount: 12), itemBuilder: (context, index) {
//             //                 return Padding(
//             //                   padding: const EdgeInsets.all(8.0),
//             //                   child: GestureDetector(
//             //                     onTap: (){
//             //
//             //                       selectedMonthIndex = index;
//             //                       setState(() {
//             //
//             //                       });
//             //
//             //                     },
//             //                     child: Container(
//             //
//             //
//             //                       height: 50,
//             //                       width: 100,
//             //                       decoration: BoxDecoration(
//             //                           color: selectedMonthIndex == index?primaryColor:Colors.white,
//             //
//             //                           border: Border.all(color: primaryColor),
//             //                           borderRadius: BorderRadius.circular(10)
//             //                       ),
//             //                       child: Center(child: Text(monthsList[index],
//             //                         style: TextStyle(
//             //                             color:selectedMonthIndex == index?Colors.white: primaryColor
//             //                         ),
//             //
//             //                       )),
//             //                     ),
//             //                   ),
//             //                 ) ;
//             //               },),
//             //             ),
//             //
//
//             //           ],
//             //         ),
//             //       ),
//
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: (){
//                     print(DateTime(2023 , selectedMonth.month-1));
//                     selectedMonth = DateTime(selectedMonth.year , selectedMonth.month-1,);
//                     startDate = DateTime(selectedMonth.year,
//                         selectedMonth.month
//                     );
//                     endDate = DateTime(selectedMonth.year,
//                         selectedMonth.month,
//                         DateUtils.getDaysInMonth(selectedMonth.year,
//                             selectedMonth.month)
//
//                     );
//                     setState(() {
//
//                     });
//                   },
//                   child: Container(
//                     height: 50,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: primaryColor,
//                       borderRadius: BorderRadius.circular(15),
//
//                     ),
//                     child: Center(
//                       child: Icon(
//                         CupertinoIcons.left_chevron,
//                         color: Colors.white,
//
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 GestureDetector(
//                   onTap: ()async{
//                     var select = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));
//                     selectedMonth = DateTime(select.year , select.month,);
//                     startDate = DateTime(selectedMonth.year,
//                         selectedMonth.month
//                     );
//                     endDate = DateTime(selectedMonth.year,
//                         selectedMonth.month,
//                         DateUtils.getDaysInMonth(selectedMonth.year,
//                             selectedMonth.month)
//
//                     );
//                     setState(() {
//
//                     });
//                   },
//                   child: Container(height: 50,
//                     width: 250,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         border: Border.all(color: primaryColor,width: 2)
//                     ),
//                     child: Center(child: Text(DateFormat.yMMM().format(selectedMonth))),
//
//                   ),
//                 ),
//
//                 GestureDetector(
//                   onTap: (){
//                     print(DateTime(2023 , selectedMonth.month+1));
//                     selectedMonth = DateTime(selectedMonth.year , selectedMonth.month+1);
//                     startDate = DateTime(selectedMonth.year,
//                         selectedMonth.month
//                     );
//                     endDate = DateTime(selectedMonth.year,
//                         selectedMonth.month,
//                         DateUtils.getDaysInMonth(selectedMonth.year,
//                             selectedMonth.month)
//
//                     );
//                     setState(() {
//
//                     });
//                   },
//                   child: Container(
//                     height: 50,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: primaryColor,
//                       borderRadius: BorderRadius.circular(15),
//
//                     ),
//                     child: Center(
//                       child: Icon(
//                         CupertinoIcons.right_chevron,
//                         color: Colors.white,
//
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//
//
//             SizedBox(
//               height: 30,
//             ),
//
//             StreamBuilder(
//               stream: FirebaseFirestore.instance.collection('employees').doc(widget.empdetails.id).collection('leave')
//                   .where('date',isGreaterThanOrEqualTo: startDate)
//                   .where('date',isLessThanOrEqualTo: endDate)
//
//
//                   .snapshots(),
//
//
//               builder: (context, snapshot) {
//                 if(!snapshot.hasData){
//                   return const SizedBox(
//                     child: Center(
//                         child: Text(
//                           'No Data Found.',
//                           style: TextStyle(color: Colors.red),
//                         )),
//                   );
//
//                 }
//
//                 return snapshot.data?.docs.length == 0?
//
//                 const SizedBox(
//                   child: Center(
//                       child: Text(
//                         'No Leave Taken.',
//                         style: TextStyle(color: Colors.red),
//                       )),
//                 ):
//
//                 Container(
//                   width: w*2,
//                   child:DataTable(
//                       columns: const <DataColumn>[
//                         DataColumn(
//                           label: Text(
//                             'No',
//                             style: TextStyle(
//                                 fontStyle: FontStyle.italic,
//                                 color: Color(0xff153E6C),
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'Date',
//                             style: TextStyle(
//                                 fontStyle: FontStyle.italic,
//                                 color: Color(0xff153E6C),
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Expanded(
//                             child: Text(
//                               'Reason',
//                               style: TextStyle(
//                                   fontStyle: FontStyle.italic,
//                                   color: Color(0xff153E6C),
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ],
//                       rows: List.generate(
//                         snapshot.data.docs.length,
//                             (index) {
//                           var data = snapshot.data.docs[index];
//                           return DataRow(
//                             color: index.isOdd
//                                 ? MaterialStateProperty.all(
//                                 Colors.blueGrey.shade50.withOpacity(0.7))
//                                 : MaterialStateProperty.all(
//                                 Colors.blueGrey.shade50),
//                             cells: [
//                               DataCell(Text("${index + 1}")),
//                               DataCell(
//                                 Text(data['date'].toDate().toString().substring(0,10)),
//                               ),
//                               DataCell(
//                                   Text(data['reason'].toString())),
//                             ],
//                           );
//                         },
//                       )),
//                 );
//               },)
//
//           ],
//         ),
//       ),
//     );
//   }
// }
