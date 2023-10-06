import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../../../../theme/app_theme.dart';
// import '../../../faculties/presentation/pages/facultiespage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color primaryColor = Color(0xff2F2A42);

  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
                    height: height * 0.3,
                    color: primaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: width * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'Sree Gokulam Public School',
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Text(
                                      'SGPS Calicut',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SvgPicture.asset(
                                  'assets/images/notificationIconEd.svg'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child:   Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: width * 0.06),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(width * 0.05)),
                                  boxShadow: [
                                    BoxShadow(blurRadius: width * 0.01)
                                  ],
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.all(width * 0.03),
                                child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                              'assets/images/profile_picture.png'),
                                          SizedBox(width: width * 0.03),
                                           Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Midhun k v',
                                                style: TextStyle(
                                                  color: Color(0xFF2F2A42),
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                'Roll no : 310',
                                                style: TextStyle(
                                                  color: Color(0xFF2F2A42),
                                                  fontSize: 10,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            isExpanded ? 'Show less' : 'Show more',
                                            style: const TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(
                                            isExpanded
                                                ? Icons.keyboard_arrow_up
                                                : Icons.keyboard_arrow_down,
                                            color: Colors.blue,
                                          ),
                                        ],
                                      ),
                                      // SvgPicture.asset(
                                      //     'assets/images/arrowdown.svg')
                                    ],
                                  ),
                                  if (isExpanded)
                                    Column(
                                      children: [
                                        CustomListItem(
                                          imageAsset: 'assets/images/profile_picture.png',
                                          text: 'Additional Item 1',
                                        ),
                                        CustomListItem(
                                          imageAsset: 'assets/images/profile_picture.png',
                                          text: 'Additional Item 2',
                                        ),
                                        // Add more custom list items as needed
                                      ],
                                    ),
                                ],
                                ),

                              ),
                            ),
                          ), ),

                        SizedBox(
                          height: height * 0.025,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height,
                    margin: EdgeInsets.only(top: height * 0.25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(width * 0.08),
                          topLeft: Radius.circular(width * 0.08),
                        ),
                        boxShadow: [
                          BoxShadow(blurRadius: width * 0.01),
                        ],
                        color: Colors.white),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(width * 0.06),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (BuildContext context) =>
                                  //     const FacultiesScreen()));
                                },
                                child: Container(
                                  width: width * 0.25,
                                  height: height * 0.11,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0x26000000),
                                          blurRadius: width * 0.03,
                                        )
                                      ],
                                      borderRadius:
                                      BorderRadius.circular(width * 0.055),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: EdgeInsets.all(width * 0.01),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/faculties.svg'),
                                        const Text(
                                          'Faculties',
                                          style: TextStyle(
                                            color: Color(0xFF2F2A42),
                                            fontSize: 10,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: width * 0.25,
                                height: height * 0.11,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x26000000),
                                        blurRadius: width * 0.03,
                                      )
                                    ],
                                    borderRadius:
                                    BorderRadius.circular(width * 0.055),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.all(width * 0.01),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/fees.svg'),
                                      const Text(
                                        'Fees',
                                        style: TextStyle(
                                          color: Color(0xFF2F2A42),
                                          fontSize: 10,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: width * 0.25,
                                height: height * 0.11,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x26000000),
                                        blurRadius: width * 0.03,
                                      )
                                    ],
                                    borderRadius:
                                    BorderRadius.circular(width * 0.055),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.all(width * 0.01),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/subjects.svg'),
                                      const Text(
                                        'Subjects',
                                        style: TextStyle(
                                          color: Color(0xFF2F2A42),
                                          fontSize: 10,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: width * 0.06),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: width * 0.25,
                                height: height * 0.11,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x26000000),
                                        blurRadius: width * 0.03,
                                      ),
                                    ],
                                    borderRadius:
                                    BorderRadius.circular(width * 0.055),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.all(width * 0.01),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/examresult.svg'),
                                      const Text(
                                        'Exam Result',
                                        style: TextStyle(
                                          color: Color(0xFF2F2A42),
                                          fontSize: 10,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: width * 0.25,
                                height: height * 0.11,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x26000000),
                                        blurRadius: width * 0.03,
                                      ),
                                    ],
                                    borderRadius:
                                    BorderRadius.circular(width * 0.055),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.all(width * 0.01),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/attendance.svg'),
                                      const Text(
                                        'Attendance',
                                        style: TextStyle(
                                          color: Color(0xFF2F2A42),
                                          fontSize: 10,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: width * 0.25,
                                height: height * 0.11,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x26000000),
                                        blurRadius: width * 0.03,
                                      ),
                                    ],
                                    borderRadius:
                                    BorderRadius.circular(width * 0.055),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.all(width * 0.01),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/achievements.svg'),
                                      const Text(
                                        'Achievements',
                                        style: TextStyle(
                                          color: Color(0xFF2F2A42),
                                          fontSize: 10,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(width * 0.06),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: width * 0.25,
                                height: height * 0.11,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x26000000),
                                        blurRadius: width * 0.03,
                                      )
                                    ],
                                    borderRadius:
                                    BorderRadius.circular(width * 0.055),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.all(width * 0.01),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/bustracking.svg'),
                                      const Text(
                                        'Bus Tracking',
                                        style: TextStyle(
                                          color: Color(0xFF2F2A42),
                                          fontSize: 10,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: width * 0.25,
                                height: height * 0.11,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x26000000),
                                        blurRadius: width * 0.03,
                                      )
                                    ],
                                    borderRadius:
                                    BorderRadius.circular(width * 0.055),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.all(width * 0.01),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/appointment.svg'),
                                      const Text(
                                        'Appointment',
                                        style: TextStyle(
                                          color: Color(0xFF2F2A42),
                                          fontSize: 10,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: width * 0.25,
                                height: height * 0.11,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x26000000),
                                        blurRadius: width * 0.03,
                                      ),
                                    ],
                                    borderRadius:
                                    BorderRadius.circular(width * 0.055),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.all(width * 0.01),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/mess.svg'),
                                      const Text(
                                        'Mess',
                                        style: TextStyle(
                                          color: Color(0xFF2F2A42),
                                          fontSize: 10,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   bottom: 0,
          //   child: Container(
          //     height: height * 0.09,
          //     decoration: BoxDecoration(
          //       boxShadow: [BoxShadow(blurRadius: width * 0.03)],
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(width * 0.04),
          //         topRight: Radius.circular(width * 0.04),
          //       ),
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         SvgPicture.asset('assets/images/menu_icon.svg'),
          //         SvgPicture.asset('assets/images/second_menu.svg'),
          //         SvgPicture.asset('assets/images/book.svg'),
          //         GestureDetector(
          //           child: SvgPicture.asset('assets/images/profile_icon.svg'),
          //           onTap: () {
          //             // Navigator.of(context).push(MaterialPageRoute(
          //             //     builder: (BuildContext context) => ProfileScreen()));
          //           },
          //         )
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
class CustomListItem extends StatelessWidget {
  final String imageAsset;
  final String text;

  CustomListItem({required this.imageAsset, required this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: width * 0.02),
      child: Row(
        children: [
          Image.asset(imageAsset),
          SizedBox(width: width * 0.03),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF2F2A42),
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
