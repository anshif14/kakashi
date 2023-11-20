import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:jhijri/_src/_jHijri.dart';
// import 'package:jhijri/_src/_jHijri.dart';

import 'package:table_calendar/table_calendar.dart';

class arabicCalendar extends StatefulWidget {



  const arabicCalendar({super.key,});

  @override
  State<arabicCalendar> createState() => _arabicCalendarState();
}

class _arabicCalendarState extends State<arabicCalendar> {
  DateTime now = DateTime.now();
  DateTime dayStart = DateTime.now();

  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return
      Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.6,

                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: Colors.grey
                        // ),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: TableCalendar(
                          headerStyle: HeaderStyle(formatButtonVisible: false),

                          // selectedDayPredicate: (day) => ,
                          calendarStyle: CalendarStyle(

                              weekendTextStyle: TextStyle(color: Colors.red),
                              holidayTextStyle: TextStyle(color: Colors.red),
                              todayTextStyle: TextStyle(color: Colors.indigo),
                              todayDecoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black38)),
                              markersAlignment: Alignment.bottomRight,
                              weekNumberTextStyle: TextStyle(color: Colors.red)),
                          calendarBuilders: CalendarBuilders(
                            // dowBuilder: (context, day) {
                            //   return Center(child: Text(getWeekdayName(day.weekday)),);
                            // },

                            headerTitleBuilder: (context, day) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(DateFormat("MMMM - yyyy").format(day)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(HijriCalendar.fromDate(DateTime(
                                        day.year,
                                        day.month,
                                      )).longMonthName),
                                      Text(' - '),
                                      Text(HijriCalendar.fromDate(DateTime(
                                              day.year,
                                              day.month,
                                              DateTime(day.year, day.month + 1, 0).day))
                                          .shortMonthName,locale: Locale('ar'),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(HijriCalendar.fromDate(DateTime(
                                              day.year,
                                              day.month,
                                              DateTime(day.year, day.month + 1, 0).day))
                                          .hYear
                                          .toString()),
                                    ],
                                  )
                                ],
                              );
                            },
                            holidayBuilder: (context, day, focusedDay) {
                              return Text(
                                day.day.toString(),
                                style: TextStyle(color: Colors.red),
                              );
                            },
                            markerBuilder: (context, day, events) {
                              return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white, shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      HijriDate.dateToHijri(day).day.toString(),
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ));
                            },
                            defaultBuilder: (context, day, focusedDay) {},
                          ),



                          onDaySelected: (DateTime day, DateTime focusDay) {
                            dayStart = DateTime(day.year, day.month, day.day, 0, 0, 0);


                            setState(() {});
                          },
                          selectedDayPredicate: (DateTime date) {
                            return isSameDay(dayStart, date);
                          },

                          focusedDay: DateTime.now().add(Duration(days: 3)),
                          firstDay: DateTime(1000),
                          lastDay: DateTime(3000)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Wrap(
                          children: [
                            TextButton(onPressed: (){}, child: Text("Cancel",style: TextStyle(color: Colors.red),)),
                            SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                            TextButton(onPressed: (){
                              print(dayStart);
                              Navigator.pop(context);

                            }, child: Text("Confirm"))
                          ],
                        )
                      ],
                    )

                  ],
                ),
              ),
            ],
          ));
    // );
  }


  String getArabicMonthName(int month) {
    final arabicMonthNames = DateFormat().dateSymbols.MONTHS;
    return arabicMonthNames[month - 1];
  }
}


class checkCalendar extends StatefulWidget {
  const checkCalendar({super.key});

  @override
  State<checkCalendar> createState() => _checkCalendarState();
}

class _checkCalendarState extends State<checkCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          showDialog(

            context: context, builder: (context) => AlertDialog(


            insetPadding: EdgeInsets.symmetric(vertical: 125,horizontal: 20),
            elevation: 0,
            backgroundColor: Colors.white,

            buttonPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            content: Container(
                width: MediaQuery.of(context).size.width*0.95,
                height: MediaQuery.of(context).size.height*0.7,
                child: arabicCalendar()),
            // actions: [
            //   TextButton(onPressed: (){
            //     Navigator.pop(context);
            //   }, child: Text('Cancel')),
            //   TextButton(onPressed: (){}, child: Text('Confirm'))
            // ],
          ),);
        }, child: Text("")),
      ),
    );
  }
}
