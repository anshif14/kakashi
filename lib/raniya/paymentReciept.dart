import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class paymentRecieptScreen extends StatefulWidget {
  const paymentRecieptScreen({super.key});

  @override
  State<paymentRecieptScreen> createState() => _paymentRecieptScreenState();
}

class _paymentRecieptScreenState extends State<paymentRecieptScreen> {
  Color primaryColor = Color(0xff2F2A42);

  @override
  Widget build(BuildContext context) {
    Map data = {
      "Bill No": "ACA/2023/101/003000",
      "Date": "20 June 2023",
      "Time": "09:30am",
      "Tuition Fee": "₹3,000",
      "Hostel Fee": "₹3,000",
      "Transportation Fee": "₹3,000"
    };

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
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
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: h,
            width: w,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: h * 0.75,
              width: w,
              decoration: BoxDecoration(
                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(w * 0.05),
                      topLeft: Radius.circular(w * 0.05))),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: h * 0.08),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Midhun k v',
                        style: GoogleFonts.roboto(
                          color: Color(0xFF2F2A42),
                          fontSize: w * 0.06,
                          // fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Roll no : 310',
                        style: GoogleFonts.roboto(
                          color: Color(0xFF2F2A42),
                          fontSize: w * 0.04,
                          // fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    height: h * 0.47,
                    width: w * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 15),
                              blurRadius: 15,
                              color: Colors.black.withOpacity(0.15)),
                        ],
                        borderRadius: BorderRadius.circular(w * 0.06)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: h * 0,
                        ),

                        Text(
                          'Payment Completed',
                          style: GoogleFonts.roboto(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        // SizedBox(height: h*0.015,),

                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Fee for the Term of ',
                              style: GoogleFonts.roboto(
                                  color: primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: 'Term one',
                              style: GoogleFonts.roboto(
                                  color: primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                        ])),
                        // SizedBox(height: h*0.015,),

                        Text('₹9,000',
                            style: GoogleFonts.roboto(
                                color: primaryColor,
                                fontSize: 40,
                                fontWeight: FontWeight.w700))
                        // , SizedBox(height: h*0.015,),
                        ,
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: data.keys.toList().length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              height: h * 0.04,
                              color: index % 2 == 0
                                  ? Colors.white
                                  : Color(0xffF6F6F6),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                        // color: Colors.red,
                                        width: w * 0.35,
                                        child: Text(data.keys.toList()[index],
                                            style: GoogleFonts.roboto(
                                                color: primaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400))),
                                    Container(
                                        // color: Colors.blue,

                                        child: Text(
                                            ": ${data.values.toList()[index]}",
                                            style: GoogleFonts.roboto(
                                                color: primaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600))),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                        Container(
                          child: Center(
                            child: Text(
                              "Download",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                          height: h * 0.06,
                          width: w * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(w * 0.06),
                              bottomLeft: Radius.circular(w * 0.06),
                            ),
                            color: primaryColor,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: w * 0.12,
            left: h * 0.17,
            child: Container(
              height: w * 0.3,
              width: w * 0.3,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
    );
  }
}
