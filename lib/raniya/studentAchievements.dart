import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class studentAcheivements extends StatefulWidget {
  const studentAcheivements({super.key});

  @override
  State<studentAcheivements> createState() => _studentAcheivementsState();
}

class _studentAcheivementsState extends State<studentAcheivements> {
  List<int> years=[];
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  getYear(){
    int startYear = 2000;
    int endYear = 2023;

     years = List.generate(endYear - startYear + 1, (index) => startYear + index);

    print(years);
  }
String? selectedMonth ;

  @override

  void initState() {
    print(DateTime.now().month);

    getYear();
    selectedYear = DateTime.now().year;
    selectedMonth = months[DateTime.now().month-1];
    // TODO: implement initState
    super.initState();
  }
  Color primaryColor = Color(0xff2F2A42);

  int? selectedYear ;

  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;



    return  Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Achievements",
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
            width: w*0.08,
            height: w*0.08,
            decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white,width: 0.5)
            ),
            child: Center(
              child: Icon(CupertinoIcons.left_chevron,color: Colors.white,size: w*0.04,),
            ),

          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Row(
            // mainAxisAlignment: MainAxisAlignment.s,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 8.0),
                child: Container(
                    width: w*0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w*0.02),
                        color: primaryColor,
                        border: Border.all(
                            width: 2,
                            color: Colors.white)
                    ),

                    child: Padding(
                      padding:  EdgeInsets.only(left: 8.0,right: 8),
                      child: DropdownButton(
                          dropdownColor: primaryColor,
                          borderRadius: BorderRadius.circular(w*0.03),

                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.w500

                          ),


                          value: selectedYear,

                          isExpanded: true,
                          underline: Container(),
                          icon: Icon(Icons.arrow_drop_down_sharp,color: Colors.white,),
                          items:
                          List.generate(years.length, (index) {
                            return DropdownMenuItem(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                years[index].toString(),

                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500

                                ),

                              ),

                            ),
                              value: years[index],

                            );
                          })
                          , onChanged: (val){
                        print(val);
                        selectedYear = val;
                        setState(() {

                        });
                      }),
                    )),
              ),

              SizedBox(width: w*0.03,),

              Padding(
                padding:  EdgeInsets.only(left: 8.0),
                child: Container(
                    width: w*0.35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w*0.02),
                        color: primaryColor,
                        border: Border.all(
                            width: 2,
                            color: Colors.white)
                    ),

                    child: Padding(
                      padding:  EdgeInsets.only(left: 8.0,right: 8),
                      child: DropdownButton(
                          dropdownColor: primaryColor,
                          borderRadius: BorderRadius.circular(w*0.03),

                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.w500

                          ),


                          value: selectedMonth,

                          isExpanded: true,
                          underline: Container(),
                          icon: Icon(Icons.arrow_drop_down_sharp,color: Colors.white,),
                          items:
                          List.generate(months.length, (index) {
                            return DropdownMenuItem(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                months[index].toString(),

                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500

                                ),

                              ),

                            ),
                              value: months[index],

                            );
                          })
                          , onChanged: (val){
                        print(val);
                        selectedMonth=  val;
                        setState(() {

                        });
                      }),
                    )),
              ),


          ],),

          SizedBox(height: h*0.05,),

          Container(
            height: h*0.75,
            width: w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(w*0.1),
                  topLeft: Radius.circular(w*0.1),
                ),
                color: Color(0xffF6F6F6)
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  // color: Colors.red,
                  height: h*0.7,
                  width: w,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        GridView.builder(
                          physics: BouncingScrollPhysics(),

                          shrinkWrap: true,

                          itemCount: 12,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                              crossAxisCount: 2), itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(w*0.03),
                                boxShadow: [
                                  BoxShadow(

                                    blurRadius: 15,
                                    color: Colors.black.withOpacity(0.15)
                                  )
                                ]
                              ),

                              height: w*0.3,
                              width: w*0.3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    SvgPicture.asset(
                                        index%2==0?
                                            Constants.medal:
                                        Constants.trophy),
                                    Text('Achievement',style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: w*0.045,
                                      color: primaryColor
                                    ),),
                                    Text('Amet minim mollit non deserunt ullamco',textAlign: TextAlign.center,),
                                    Text(DateFormat('dd MMMM yyyy').format(DateTime.now()),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: w*0.035,
                                            color: primaryColor
                                        )
                                    )


                                  ],
                                ),
                              ),
                            ),
                          );
                        },),
                      ],
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


class Constants{
  static const trophy = 'assets/svg/trophy.svg';
  static const medal = 'assets/svg/medal.svg';

}