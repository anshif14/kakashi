import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  Color primaryColor = Color(0xff2F2A42);

  Map basicInfo = {
    "Date of Admission": "26-04-2022",
    "Date  of Birth": "09-04-2006",
    "Nationality": "INDIA",
    "Address": "Address",
    "Father’s Name": "Father’s Name",
    "Mother’s Name": "mother’s name"
  };

  Map academicInfo = {
    "School"
        :  "school name",
    "Date  of Birth": "09-04-2006",
    "School House"
        :  "not assigned",

    "Hosteler":"Yes",
    "Using Canteen"
        :  "No",
    "Using School Bus": "No"
  };

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                "Student Profile",
                style: GoogleFonts.roboto(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Text(
                "Midhun k v | Roll no:310",
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: w * 0.04,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: primaryColor,
          elevation: 0,
          leading: Center(
            child: Container(
              width: w * 0.08,
              height: w * 0.08,
              decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 0.5)),
              child: Center(
                child: Icon(
                  CupertinoIcons.left_chevron,
                  color: Colors.white,
                  size: w * 0.04,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Icon(CupertinoIcons.bell_solid),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: w * 0.02,
                      width: w * 0.02,
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: height*0.1,
                  width: w * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(w * 0.04),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 20,
                            color: Colors.black.withOpacity(0.25))
                      ]),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          w * 0.03, w * 0.03, w * 0.03, w * 0.03),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: w * 0.12,
                                width: w * 0.12,
                                decoration: BoxDecoration(
                                    // color: Colors.red,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg'),
                                        fit: BoxFit.cover),
                                    borderRadius:
                                        BorderRadius.circular(w * 0.03)),
                              ),
                              SizedBox(
                                width: w * 0.03,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Midhun KV",
                                    style: GoogleFonts.roboto(
                                        color: primaryColor,
                                        fontSize: w * 0.042,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: w * 0.01,
                                  ),
                                  Text(
                                    "Roll no:310",
                                    style: GoogleFonts.roboto(
                                        color: primaryColor,
                                        fontSize: w * 0.032,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                size: w * 0.1,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Container(
                  height: h * 0.73,
                  width: w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(w * 0.1),
                        topLeft: Radius.circular(w * 0.1),
                      ),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: h * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            // height: height*0.1,
                            width: w * 0.85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(w * 0.04),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 15,
                                      color: Colors.black.withOpacity(0.25))
                                ]),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    w * 0.03, w * 0.04, w * 0.03, w * 0.04),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Academic year:",
                                          style: GoogleFonts.roboto(
                                              color: primaryColor,
                                              fontSize: w * 0.04,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: w * 0.01,
                                        ),
                                        Text(
                                          "Year",
                                          style: GoogleFonts.roboto(
                                              color: primaryColor,
                                              fontSize: w * 0.035,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Class:",
                                          style: GoogleFonts.roboto(
                                              color: primaryColor,
                                              fontSize: w * 0.04,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: w * 0.01,
                                        ),
                                        Text(
                                          "VII-A",
                                          style: GoogleFonts.roboto(
                                              color: primaryColor,
                                              fontSize: w * 0.035,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Gender:",
                                          style: GoogleFonts.roboto(
                                              color: primaryColor,
                                              fontSize: w * 0.04,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: w * 0.01,
                                        ),
                                        Text(
                                          "Male",
                                          style: GoogleFonts.roboto(
                                              color: primaryColor,
                                              fontSize: w * 0.035,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.05,
                        ),
                        Container(
                          // height: h * 0.3,
                          width: w * 0.85,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(w * 0.04),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 15,
                                    color: Colors.black.withOpacity(0.25))
                              ]),
                          child: Column(
                            children: [
                              Container(
                                // height: h*0.06,
                                width: w * 0.85,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(w * 0.04),
                                      topRight: Radius.circular(w * 0.04)),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 15,
                                        color: Colors.black.withOpacity(0.25))
                                  ],
                                ),

                                child: Padding(
                                  padding: EdgeInsets.all(w * 0.03),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Basic info',
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),

                                  itemCount: basicInfo.keys.toList().length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                              // color: Colors.red,
                                              width: w * 0.4,
                                              child: Text(basicInfo.keys
                                                  .toList()[index])),
                                          Container(
                                              // color: Colors.blue,

                                              child: Text(
                                                  ": ${basicInfo.values.toList()[index]}")),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),


                        SizedBox(
                          height: h * 0.05,
                        ),
                        Container(
                          // height: h * 0.3,
                          width: w * 0.85,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(w * 0.04),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 15,
                                    color: Colors.black.withOpacity(0.25))
                              ]),
                          child: Column(
                            children: [
                              Container(
                                // height: h*0.06,
                                width: w * 0.85,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(w * 0.04),
                                      topRight: Radius.circular(w * 0.04)),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 15,
                                        color: Colors.black.withOpacity(0.25))
                                  ],
                                ),

                                child: Padding(
                                  padding: EdgeInsets.all(w * 0.03),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Academic info',
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: academicInfo.keys.toList().length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            // color: Colors.red,
                                              width: w * 0.4,
                                              child: Text(academicInfo.keys
                                                  .toList()[index])),
                                          Container(
                                            // color: Colors.blue,

                                              child: Text(
                                                  ": ${academicInfo.values.toList()[index]}")),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        )

                      ],
                    ),
                  ))
            ]));
  }
}
