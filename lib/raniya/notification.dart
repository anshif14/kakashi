import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class notificationPage extends StatefulWidget {
  const notificationPage({super.key});

  @override
  State<notificationPage> createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage> {
  Color primaryColor = Color(0xff2F2A42);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text("Notifications",style: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.w600
        ),),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        leading: Center(
          child: Container(
            width: width*0.08,
            height: width*0.08,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white,width: 0.5)
            ),
            child: Center(
              child: Icon(CupertinoIcons.left_chevron,color: Colors.white,size: width*0.04,),
            ),

          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: height*0.87,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(width*0.1),
                topLeft: Radius.circular(width*0.1),
              ),
              color: Colors.white
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height*0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: height*0.1,
                    width: width*0.85,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(width*0.04),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 20,
                              color: Colors.black.withOpacity(0.25)
                          )
                        ]
                    ),
                    child: Center(
                      child: Padding(
                        padding:  EdgeInsets.fromLTRB(width*0.03,
                            width*0.03,
                            width*0.03,
                            width*0.03


                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width*0.7,
                              child: Column(
                                children: [
                                  RichText(text: TextSpan(
                                      children: [
                                        TextSpan(text: 'Principle: ',style: GoogleFonts.roboto(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w600
                                        ),),
                                        TextSpan(text: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',style: GoogleFonts.roboto(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w400
                                        ),),


                                      ]
                                  )),
                                  SizedBox(height: height*0.01,),
                                  Row(
                                    children: [
                                      Text(DateFormat('dd MM yyyy | hh:mm:a').format(DateTime.now()),
                                        style: GoogleFonts.roboto(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w600
                                        ),

                                      ),
                                    ],
                                  )

                                ],
                              ),
                            ),
                            Container(
                              height: width*0.02,
                              width: width*0.02,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle

                              ),
                              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Text('|',style: TextStyle(color: Colors.red,fontSize: width*0.1),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height*0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: height*0.1,
                    width: width*0.85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(width*0.04),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.25)
                        )
                      ]
                    ),
                    child: Center(
                      child: Padding(
                        padding:  EdgeInsets.fromLTRB(width*0.03,
                            width*0.03,
                            width*0.03,
                            width*0.03


                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width*0.7,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      RichText(text: TextSpan(
                                        children: [
                                          TextSpan(text: 'Teaching Staff: ',style: GoogleFonts.roboto(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w600
                                          ),),
                                          TextSpan(text: 'Posted a video',style: GoogleFonts.roboto(
                                              color: primaryColor,
                                              fontWeight: FontWeight.w400
                                          ),),


                                        ]
                                      )),
                                    ],
                                  ),
                                  SizedBox(height: height*0.01,),
                                  Row(
                                    children: [
                                      Text(DateFormat('dd MM yyyy | hh:mm:a').format(DateTime.now()),
                                      style: GoogleFonts.roboto(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w600
                                      ),

                                      ),
                                    ],
                                  )

                                ],
                              ),
                            ),
                            Container(
                              height: width*0.02,
                              width: width*0.02,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle

                              ),
                              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Text('|',style: TextStyle(color: Colors.red,fontSize: width*0.1),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: height*0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: height*0.1,
                    width: width*0.85,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(width*0.04),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 20,
                              color: Colors.black.withOpacity(0.25)
                          )
                        ]
                    ),
                    child: Center(
                      child: Padding(
                        padding:  EdgeInsets.fromLTRB(width*0.03,
                            width*0.03,
                            width*0.03,
                            width*0.03


                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width*0.7,
                              child: Column(
                                children: [
                                  RichText(text: TextSpan(
                                      children: [
                                        TextSpan(text: 'Principle: ',style: GoogleFonts.roboto(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w600
                                        ),),
                                        TextSpan(text: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',style: GoogleFonts.roboto(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w400
                                        ),),


                                      ]
                                  )),
                                  SizedBox(height: height*0.01,),
                                  Row(
                                    children: [
                                      Text(DateFormat('dd MM yyyy | hh:mm:a').format(DateTime.now()),
                                        style: GoogleFonts.roboto(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w600
                                        ),

                                      ),
                                    ],
                                  )

                                ],
                              ),
                            ),
                            Container(
                              height: width*0.02,
                              width: width*0.02,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle

                              ),
                              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Text('|',style: TextStyle(color: Colors.red,fontSize: width*0.1),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height*0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: height*0.1,
                    width: width*0.85,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(width*0.04),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 20,
                              color: Colors.black.withOpacity(0.25)
                          )
                        ]
                    ),
                    child: Center(
                      child: Padding(
                        padding:  EdgeInsets.fromLTRB(width*0.03,
                            width*0.03,
                            width*0.03,
                            width*0.03


                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width*0.7,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      RichText(text: TextSpan(
                                          children: [
                                            TextSpan(text: 'Teaching Staff: ',style: GoogleFonts.roboto(
                                                color: primaryColor,
                                                fontWeight: FontWeight.w600
                                            ),),
                                            
                                            TextSpan(text: 'Posted a video',style: GoogleFonts.roboto(
                                                color: primaryColor,
                                                fontWeight: FontWeight.w400
                                            ),),


                                          ]
                                      )),
                                    ],
                                  ),
                                  
                                  SizedBox(height: height*0.01,),
                                  Row(children: [
                                    
                                    Container(
                                      height: height*0.06,
                                      width: width*0.3,
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(width*0.08)
                                      ),
                                      child: Center(
                                        child: Text('View Video',style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                        ),),
                                      ),
                                    )
                                    
                                  ],),
                                  SizedBox(height: height*0.01,),

                                  Row(
                                    children: [
                                      Text(DateFormat('dd MM yyyy | hh:mm:a').format(DateTime.now()),
                                        style: GoogleFonts.roboto(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w600
                                        ),

                                      ),
                                    ],
                                  )

                                ],
                              ),
                            ),
                            Container(
                              height: width*0.02,
                              width: width*0.02,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle

                              ),
                              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Text('|',style: TextStyle(color: Colors.red,fontSize: width*0.1),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),

    );
  }
}
