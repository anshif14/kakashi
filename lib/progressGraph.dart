import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularArc extends StatefulWidget {
  const CircularArc({super.key});

  @override
  State<CircularArc> createState() => _CircularArcState();
}

class _CircularArcState extends State<CircularArc>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animController;
  @override
  void initState() {
    super.initState();
    animController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    final curvedAnimation =
        CurvedAnimation(parent: animController, curve: Curves.easeInOutCubic);
    animation =
        Tween<double>(begin: 0.0, end: (math.pi) / 9).animate(curvedAnimation)
          ..addListener(() {
            setState(() {});
          });
    // animController.repeat(reverse: false);
    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    print(w);
    print(math.pi);
    // double pendingSize=w-450;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.indigo.shade900,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          // color: Colors.yellowAccent,
          width: w,
          height: w,
          child: Stack(
            children: [

              /// YELLOW ARC
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomPaint(
                      size: Size(w, w),
                      // foregroundPainter: ,
                      painter: ProgressArc(
                          isBg: true,
                          arc: null,
                          progress: Color(0xffFFDC7E),
                          startAngle: (math.pi * w*0.00408)),

                  ),
                  CustomPaint(
                    size: Size(w, w),
                    painter: ProgressArc(
                        isBg: false,
                        arc: animation.value,
                        progress: Color(0xffFABC12),
                        startAngle: (math.pi * w*0.035)),
                  ),
                  Positioned(
                    top: w*0.28,
                    right: w*0.14,
                    // right: w*0.25,
                    child: Transform.rotate(
                      angle: w*0.0185,
                      child: Text(
                        '20%',
                        style: TextStyle(
                          fontSize: 13,
                          // lineHeight : 19.05.sp,
                          // fontFamily : FontFamily(Font(R.font.inter)),
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),

        // Center(
        //     child: ArcText(
        //         radius: 106,
        //         //text: maasadata[count].maasa.toString(),
        //         text: names[count],
        //         textStyle: const TextStyle(
        //             fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
        //         startAngle: start[count] - start[0]) * 0.0174533,
        //     startAngleAlignment: StartAngleAlignment.start,
        //     placement: Placement.outside,
        //     direction: Direction.clockwise),
      // );
                ],
              ),

              /// GREEN ARC
              Stack(
                children: [
                  CustomPaint(
                      size: Size(w, w),
                      painter: ProgressArc(
                          isBg: true,
                          arc: null,
                          progress: Color(0xff99FFB9),
                          startAngle: w*0.1111 )),
                  CustomPaint(
                    size: Size(w, w),
                    painter: ProgressArc(
                        isBg: false,
                        arc: animation.value,
                        progress: Color(0xff04AC38),
                        startAngle: w*0.1111 ),
                  ),
                  Positioned(
                    top: w*0.42,
                    right: w*0.07,
                    // right: w*0.01,
                    child: Transform.rotate(
                      angle: w*0.0035,
                      child: Text(
                        '37%',
                        style: TextStyle(
                          fontSize: 13,

                          // lineHeight : 19.05.sp,
                          // fontFamily : FontFamily(Font(R.font.inter)),
                          fontWeight: FontWeight.w700,

                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              /// VIOLET ARC
              Stack(
                children: [
                  CustomPaint(
                      size: Size(w, w),
                      painter: ProgressArc(
                          isBg: true,
                          arc: null,
                          progress: Color(0xffEBB1FF),
                          startAngle: (math.pi)/  w *0.01532)),
                  CustomPaint(
                    size: Size(w, w),
                    painter: ProgressArc(
                        isBg: false,
                        arc: animation.value,
                        progress: Color(0xffBD00FF),
                        startAngle: (math.pi)/6 ),
                  ),
                  Positioned(
                    bottom: 130,
                    right: 40,
                    // right: w*0.12,
                    child: Transform.rotate(
                      angle: 11.8,
                      child: Text(
                        '40%',
                        style: TextStyle(
                          fontSize: 13,
                          // lineHeight : 19.05.sp,
                          // fontFamily : FontFamily(Font(R.font.inter)),
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              /// SKY BLUE ARC
              Stack(
                children: [
                  CustomPaint(
                      size: Size(450, 450),
                      painter: ProgressArc(
                          isBg: true,
                          arc: null,
                          progress: Color(0xffC8F2FF),
                          startAngle: (math.pi)/2 -0.1 )),
                  CustomPaint(
                    size: Size(450, 450),
                    painter: ProgressArc(
                        isBg: false,
                        arc: animation.value,
                        progress: Color(0xff009CCD),
                        startAngle: (math.pi)/2 - 0.1 ),
                  ),
                  Positioned(
                    bottom: 75,
                    right: 160,
                    // right: w*0.5,
                    child: Transform.rotate(
                      angle: 0,
                      child: Text(
                        '10%',
                        style: TextStyle(
                          fontSize: 13,
                          // lineHeight : 19.05.sp,
                          // fontFamily : FontFamily(Font(R.font.inter)),
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                          // color: Colors.black
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              /// BLUE ARC
              Stack(
                children: [
                  CustomPaint(
                      size: Size(450, 450),
                      painter: ProgressArc(
                          isBg: true,
                          arc: null,
                          progress: Color(0xff97BFFF),
                          startAngle: -(math.pi)/0.8 )),
                  CustomPaint(
                    size: Size(450, 450),
                    painter: ProgressArc(
                        isBg: false,
                        arc: animation.value,
                        progress: Color(0xff0062FF),
                        startAngle: -(math.pi)/0.8 ),
                  ),
                  Positioned(
                    bottom: 135,
                    left: 40,
                    // left: w*0.12,
                    child: Transform.rotate(
                      angle: 0.9,
                      child: Text(
                        '28%',
                        style: TextStyle(
                          fontSize: 13,
                          // lineHeight : 19.05.sp,
                          // fontFamily : FontFamily(Font(R.font.inter)),
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                          // color: Colors.black
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              /// RED ARC
              Stack(
                children: [
                  CustomPaint(
                      size: Size(450, 450),
                      painter: ProgressArc(
                          isBg: true,
                          arc: null,
                          progress: Color(0xffFFB5AF),
                          startAngle: (math.pi)/0.97 )),
                  CustomPaint(
                    size: Size(450, 450),
                    painter: ProgressArc(
                        isBg: false,
                        arc: animation.value,
                        progress: Color(0xffFF1400),
                        startAngle: (math.pi)/0.97  ),
                  ),
                  Positioned(
                    top: 175,
                    left: 20,
                    // left: w*0.05,
                    child: Transform.rotate(
                      angle: 5,
                      child: Text(
                        '20%',
                        style: TextStyle(
                          fontSize: 13,
                          // lineHeight : 19.05.sp,
                          // fontFamily : FontFamily(Font(R.font.inter)),
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              /// ORANGE ARC
              Stack(
                children: [
                  CustomPaint(
                      size: Size(450, 450),
                      painter: ProgressArc(
                          isBg: true,
                          arc: null,
                          progress: Color(0xffFFC690),
                          startAngle: (math.pi)*1.315 )),
                  CustomPaint(
                    size: Size(450, 450),
                    painter: ProgressArc(
                        isBg: false,
                        arc: animation.value,
                        progress: Color(0xffF6881F),
                        startAngle: (math.pi)*1.315  ),
                  ),
                  Positioned(
                    top: 90,
                    left: 100,
                    // left: w*0.3,
                    child: Transform.rotate(
                      angle: -0.5,
                      child: Text(
                        '30%',
                        style: TextStyle(
                          fontSize: 13,
                          // lineHeight : 19.05.sp,
                          // fontFamily : FontFamily(Font(R.font.inter)),
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),



              Container(
                width: 450,
                height: 450,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFFB5AF),
                          Color(0xFFFFC690),
                          Color(0xFFFFDC7E),
                          // Color(0xFFFFDC7E),
                        ],
                        stops: [0, 0.4, 0.7],
                        begin: AlignmentDirectional(-1, -1),
                        end: AlignmentDirectional(1, 1),
                      ),
                      shape: BoxShape.circle,
                    ),
                    // alignment: AlignmentDirectional(0.00, 0.00),
                    child: Center(
                      child: Container(
                        width: 130,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const Gradient gradient = LinearGradient(
    colors: <Color>[Colors.greenAccent, Colors.yellowAccent, Colors.redAccent],
    stops: [0.0, 0.1, 5.0]);

class ProgressArc extends CustomPainter {
  bool isBg;
  double? arc;
  double startAngle;
  Color progress;

  ProgressArc(
      {required this.isBg,
      this.arc,
      required this.progress,
      required this.startAngle});
  @override
  void paint(Canvas canvas, Size size) {

    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: '12%',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.justify
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );


    final rect = Rect.fromCircle(
        center: Offset(
          size.width / 2,
          size.height / 2,
        ),
        radius: 140);
    // const rect = Rect.fromLTRB (0,0, 450, 450);
    final sweepAngle = arc ?? (math.pi * 2) / 7 - 0.1;
    const userCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.butt
      ..color = progress
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40;
    if (isBg) {


      // final offset = Offset(startAngle, ((math.pi * 2) / 7 - 0.1)/2); //text offset
      //
      // textPainter.paint(canvas,offset);

      // paint.shader=gradient.createShader(rect);
    }


    canvas.drawArc(rect, startAngle, sweepAngle, userCenter, paint);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
