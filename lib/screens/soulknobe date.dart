import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class doctorSlotBooking extends StatefulWidget {
  const doctorSlotBooking({super.key});

  @override
  State<doctorSlotBooking> createState() => _doctorSlotBookingState();
}

class _doctorSlotBookingState extends State<doctorSlotBooking> {
  DateTime currentDate = DateTime.now();

  List<DateTime> monthList = [];
  List daysList = [];

  DateTime selectedMonth = DateTime.now();
  int selectedMonthIndex = 0;

  DateTime selectedDate = DateTime.now();

  getMonths() {
    for (int i = 0; i < 12; i++) {
      monthList.add(DateTime(DateTime.now().year, DateTime.now().month + i));
    }

    selectedMonth = monthList.first;
    getDaysInMonth(selectedMonth);
  }

  getDaysInMonth(DateTime date) {
    daysList.clear();

    DateTime dateTime = date;
    int year = dateTime.year;
    int month = dateTime.month;

    DateTime firstDayOfNextMonth = DateTime(year, month + 1, 1);

    DateTime lastDayOfCurrentMonth =
        firstDayOfNextMonth.subtract(Duration(days: 1));

    int numberOfDaysInMonth = lastDayOfCurrentMonth.day;

    for (int i = 0; i < numberOfDaysInMonth; i++) {
      if (DateTime(date.year, date.month, date.day + i).isAfter(DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day - 1))) {
        daysList.add(DateTime(date.year, date.month, date.day + i));
      }
    }

    selectedDate = daysList[0];
    print(daysList);

    print("Number of days in the month: $numberOfDaysInMonth");
  }

  var primarycolor = Color(0xffE01F24);

  @override
  void initState() {
    getMonths();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: w * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (selectedMonthIndex > 0) {
                          selectedMonthIndex--;
                          selectedMonth = monthList[selectedMonthIndex];
                          getDaysInMonth(selectedMonth);

                          setState(() {});
                        }
                      },
                      child: Container(
                        height: w * 0.06,
                        width: w * 0.12,
                        child: Center(
                          child: Icon(CupertinoIcons.left_chevron,
                              color: Colors.white, size: w * 0.05),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w * 000.03),
                            color: primarycolor),
                      ),
                    ),
                    Text(
                      DateFormat('MMMM yyyy').format(selectedMonth),
                      style: GoogleFonts.inter(fontWeight: FontWeight.w800),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (selectedMonthIndex < monthList.length) {
                          selectedMonthIndex++;
                          selectedMonth = monthList[selectedMonthIndex];
                          getDaysInMonth(selectedMonth);

                          setState(() {});
                        }
                      },
                      child: Container(
                        height: w * 0.06,
                        width: w * 0.12,
                        child: Center(
                          child: Icon(CupertinoIcons.right_chevron,
                              color: Colors.white, size: w * 0.05),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w * 000.03),
                            color: primarycolor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: h * 0.09,
            width: w,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: daysList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      selectedDate = daysList[index];
                      setState(() {});
                    },
                    child: Container(
                      height: w * 0.12,
                      width: w * 0.08,
                      decoration: BoxDecoration(
                          color: daysList[index] == selectedDate
                              ? primarycolor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(w * 0.3),
                          border: Border.all(color: primarycolor)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat("d").format(daysList[index]),
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                color: daysList[index] == selectedDate
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          Text(DateFormat("E").format(daysList[index]),
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  color: daysList[index] == selectedDate
                                      ? Colors.white
                                      : Colors.black)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
