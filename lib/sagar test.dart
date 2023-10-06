import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class sagaraTest extends StatefulWidget {
  const sagaraTest({super.key});

  @override
  State<sagaraTest> createState() => _sagaraTestState();
}

class _sagaraTestState extends State<sagaraTest> {
  @override
  var primaryColor = Colors.indigo;

 var  selectedMonth = DateTime.now();

 var formattedMonth ;

 var startDate;
 var endDate;


  void initState() {

    formattedMonth = DateFormat.yMMM().format(selectedMonth);
    startDate = DateTime(selectedMonth.year,
   selectedMonth.month
    );
    endDate = DateTime(selectedMonth.year,
        selectedMonth.month,
        DateUtils.getDaysInMonth(selectedMonth.year,
            selectedMonth.month)

    );

    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {

    return  Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    print(DateTime(2023 , selectedMonth.month-1));
                    selectedMonth = DateTime(selectedMonth.year , selectedMonth.month-1,);
                    startDate = DateTime(selectedMonth.year,
                        selectedMonth.month
                    );
                    endDate = DateTime(selectedMonth.year,
                        selectedMonth.month,
                        DateUtils.getDaysInMonth(selectedMonth.year,
                            selectedMonth.month)

                    );
                    setState(() {

                    });
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.left_chevron,
                        color: Colors.white,

                      ),
                    ),
                  ),
                ),

                Container(height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: primaryColor,width: 2)
                  ),
                  child: Center(child: Text(DateFormat.yMMM().format(selectedMonth))),

                ),

                GestureDetector(
                  onTap: (){
                    print(DateTime(2023 , selectedMonth.month+1));
                    selectedMonth = DateTime(selectedMonth.year , selectedMonth.month+1);
                    startDate = DateTime(selectedMonth.year,
                        selectedMonth.month
                    );
                    endDate = DateTime(selectedMonth.year,
                        selectedMonth.month,
                        DateUtils.getDaysInMonth(selectedMonth.year,
                            selectedMonth.month)

                    );
                    setState(() {

                    });
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.right_chevron,
                        color: Colors.white,

                      ),
                    ),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('start Date'),
                  Text(startDate.toString()),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('start Date'),
                  Text(endDate.toString()),
                ],
              ),
            ),

          ],
        ),
      ) ,

    );
  }
}
