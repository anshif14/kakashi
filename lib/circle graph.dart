import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:k_chart/chart_style.dart';
import 'package:k_chart/chart_translations.dart';
import 'package:k_chart/entity/depth_entity.dart';
import 'package:k_chart/entity/k_line_entity.dart';
import 'package:k_chart/k_chart_widget.dart';
import 'package:k_chart/renderer/main_renderer.dart';

class circleGraph extends StatefulWidget {
  const circleGraph({super.key});

  @override
  State<circleGraph> createState() => _circleGraphState();
}

class _circleGraphState extends State<circleGraph> {
  List<KLineEntity>? datas;
  bool showLoading = true;
  MainState _mainState = MainState.MA;
  bool _volHidden = false;
  SecondaryState _secondaryState = SecondaryState.MACD;
  bool isLine = true;
  bool isChinese = true;
  bool _hideGrid = false;
  bool _showNowPrice = true;
  List<DepthEntity>? _bids, _asks;
  bool isChangeUI = false;
  bool _isTrendLine = false;
  bool _priceLeft = true;
  VerticalTextAlignment _verticalTextAlignment = VerticalTextAlignment.left;

  ChartStyle chartStyle = ChartStyle();
  ChartColors chartColors = ChartColors();

  List progress=[
    30.0,40.0,50.0,60.0,70.0,80.0,90.0
  ];


  ValueNotifier<double> _valueNotifier = ValueNotifier(30);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return  Scaffold(
      backgroundColor: Colors.white,
      body:
      Column(
        children: [
          Container(
            height: 450,
            width: double.infinity,
            child: KChartWidget(
                chartStyle as List<KLineEntity>?, // Required for styling purposes
                chartColors as ChartStyle,// Required for styling purposes
                datas as ChartColors,// Required，Data must be an ordered list，(history=>now)
                isLine: isLine,// Decide whether it is k-line or time-sharing
                mainState: _mainState,// Decide what the main view shows
                secondaryState: _secondaryState,// Decide what the sub view shows
                fixedLength: 2,// Displayed decimal precision
                timeFormat: TimeFormat.YEAR_MONTH_DAY,
                onLoadMore: (bool a) {},// Called when the data scrolls to the end. When a is true, it means the user is pulled to the end of the right side of the data. When a
                // is false, it means the user is pulled to the end of the left side of the data.
                maDayList: [5,10,20],// Display of MA,This parameter must be equal to DataUtil.calculate‘s maDayList
                translations: kChartTranslations,// Graphic language
                volHidden: false,// hide volume
                showNowPrice: true,// show now price
                isOnDrag: (isDrag){},// true is on Drag.Don't load data while Draging.
                onSecondaryTap:(){},// on secondary rect taped.
                isTrendLine: false, // You can use Trendline by long-pressing and moving your finger after setting true to isTrendLine property.
                xFrontPadding: 100 // padding in front
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(

                      children: [
                        DashedCircularProgressBar.aspectRatio(

                          aspectRatio: 1, // width ÷ height
                          valueNotifier: _valueNotifier,
                          progress: progress[0],
                          startAngle: 355,

                          sweepAngle: 50,
                          foregroundColor: Color(0xffFABC12),
                          backgroundColor: const Color(0xffFFDC7E),
                          foregroundStrokeWidth: 40,
                          backgroundStrokeWidth: 40,
                          animation: true,
                          seekSize: 6,
                          corners: StrokeCap.butt,

                          // seekColor: const Color(0xffFABC12),
                          seekColor: Colors.transparent,

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Container(
decoration: BoxDecoration(
  shape: BoxShape.circle,
gradient: LinearGradient(colors: [
  Color(0xffFFDC7E),
  Color(0xffFFC690),
  Color(0xffFFB5AF),
])


),
child: Center(
  child:   Container(
    decoration: BoxDecoration(
            // image: DecorationImage(image: AssetImage('assets/img.png'),fit: BoxFit.cover),
            color: Colors.white,

            shape: BoxShape.circle
    ),
    height: w*0.4,
    width: w*0.4,
  ),
),
height: w*0.6,
width: w*0.6,
                              ),
                            ),
                          ),

                        ),
                        Positioned(
                          top: w*0.022,
                          right: w*0.37,
                          child: RotationTransition(
                            turns:AlwaysStoppedAnimation(4 / 360),
                            child: Text('${progress[0]}'+'%',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: w*0.04
                        ),),
                          ),)

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        DashedCircularProgressBar.aspectRatio(

                          aspectRatio: 1, // width ÷ height
                          valueNotifier: _valueNotifier,
                          progress: progress[1],
                          startAngle: 50,
                          sweepAngle: 45,
                          foregroundColor: Color(0xff04AC38),
                          backgroundColor: const Color(0xff99FFB9),
                          foregroundStrokeWidth: 40,
                          backgroundStrokeWidth: 40,
                          animation: true,

                          seekSize: 6,
                          corners: StrokeCap.butt,

                          // seekColor: const Color(0xffFABC12),
                          seekColor: Colors.transparent,

                        ),
                        Positioned(
                          top: w*0.22,
                          right: w*0.07,
                          child: RotationTransition(
                            turns:AlwaysStoppedAnimation(55 / 360),
                            child: Text('${progress[1]}'+'%',style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: w*0.04
                            ),),
                          ),)

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        DashedCircularProgressBar.aspectRatio(

                          aspectRatio: 1, // width ÷ height
                          valueNotifier: _valueNotifier,
                          progress: progress[2],
                          startAngle: 100,
                          sweepAngle: 45,
                          foregroundColor: Color(0xffBD00FF),
                          backgroundColor: const Color(0xffEBB1FF),
                          foregroundStrokeWidth: 40,
                          backgroundStrokeWidth: 40,
                          animation: true,

                          seekSize: 6,
                          corners: StrokeCap.butt,

                          // seekColor: const Color(0xffFABC12),
                          seekColor: Colors.transparent,

                        ),
                        Positioned(
                          top: w*0.58,
                          right: w*0.019,
                          child: RotationTransition(
                            turns:AlwaysStoppedAnimation(12 / 360),
                            child: Text('${progress[2]}'+'%',style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: w*0.04
                            ),),
                          ),)

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        DashedCircularProgressBar.aspectRatio(

                          aspectRatio: 1, // width ÷ height
                          valueNotifier: _valueNotifier,
                          progress: progress[3],
                          startAngle: 150,
                          sweepAngle: 45,
                          foregroundColor: Color(0xff009CCD),
                          backgroundColor: const Color(0xffC8F2FF),
                          foregroundStrokeWidth: 40,
                          backgroundStrokeWidth: 40,
                          animation: true,

                          seekSize: 6,
                          corners: StrokeCap.butt,

                          // seekColor: const Color(0xffFABC12),
                          seekColor: Colors.transparent,

                        ),
                        Positioned(
                          bottom: w*0.04,
                          right: w*0.28,
                          child: RotationTransition(
                            turns:AlwaysStoppedAnimation(339 / 360),
                            child: Text('${progress[3]}'+'%',style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: w*0.04
                            ),),
                          ),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        DashedCircularProgressBar.aspectRatio(

                          aspectRatio: 1, // width ÷ height
                          valueNotifier: _valueNotifier,
                          progress: progress[4],
                          startAngle: 200,
                          sweepAngle: 45,
                          foregroundColor: Color(0xff0062FF),
                          backgroundColor: const Color(0xff97BFFF),
                          foregroundStrokeWidth: 40,
                          backgroundStrokeWidth: 40,
                          animation: true,

                          seekSize: 6,

                          corners: StrokeCap.butt,

                          // seekColor: const Color(0xffFABC12),
                          seekColor: Colors.transparent,

                        ),
                        Positioned(
                          bottom: w*0.07,
                          left: w*0.22,
                          child: RotationTransition(
                            turns:AlwaysStoppedAnimation(28 / 360),
                            child: Text('${progress[4]}'+'%',style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: w*0.04
                            ),),
                          ),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        DashedCircularProgressBar.aspectRatio(

                          aspectRatio: 1, // width ÷ height
                          valueNotifier: _valueNotifier,
                          progress: progress[5],
                          startAngle: 250,
                          sweepAngle: 45,
                          foregroundColor: Color(0xffFF1400),
                          backgroundColor: const Color(0xffFFB5AF),
                          foregroundStrokeWidth: 40,
                          backgroundStrokeWidth: 40,
                          animation: true,

                          seekSize: 6,

                          corners: StrokeCap.butt,

                          // seekColor: const Color(0xffFABC12),
                          seekColor: Colors.transparent,

                        ),
                        Positioned(
                          bottom: w*0.38,
                          left: w*0.01,
                          child: RotationTransition(
                            turns:AlwaysStoppedAnimation(0 / 360),
                            child: Text('${progress[5]}'+'%',style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: w*0.04
                            ),),
                          ),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        DashedCircularProgressBar.aspectRatio(


                          aspectRatio: 1, // width ÷ height
                          valueNotifier: _valueNotifier,
                          progress: progress[6],
                          startAngle: 300,
                          sweepAngle: 50,
                          foregroundColor: Color(0xffF6881F),
                          backgroundColor: const Color(0xffFFC690),
                          foregroundStrokeWidth: 40,
                          backgroundStrokeWidth: 40,
                          animation: true,

                          seekSize: 6,

                          corners: StrokeCap.butt,

                          // seekColor: const Color(0xffFABC12),
                          seekColor: Colors.transparent,

                        ),
                        Positioned(
                          top: w*0.16,
                          left: w*0.12,
                          child: RotationTransition(
                            turns:AlwaysStoppedAnimation(310 / 360),
                            child: Text('${progress[6]}'+'%',style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: w*0.04
                            ),),
                          ),)

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
