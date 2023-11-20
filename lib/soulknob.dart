// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

List<DateTime> weekDates = [];

getDatesOfweek() {
  DateTime currentDate = DateTime.now();

  // Calculate the date of the previous Sunday
  DateTime sunday = currentDate.subtract(Duration(days: currentDate.weekday));

  // Create a list to store the dates of the current week

  // Generate dates from Sunday to Saturday
  for (int i = 0; i < 7; i++) {
    DateTime date = sunday.add(Duration(days: i));
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    weekDates.add(date);
  }
  print(weekDates);
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    Colors.blue,
    Colors.white,
  ];

  bool showAvg = false;
  @override
  void initState() {
    getDatesOfweek();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 0.9,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 18,
                  left: 12,
                  top: 24,
                  bottom: 10,
                ),
                child: LineChart(
                  mainData(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget text = Container();
  TextStyle style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );
    switch (value.toInt()) {
      case 1:
        text = Column(
          children: [
            Text(DateFormat("MMM").format(weekDates[0]), style: style),
            Text(DateFormat("dd").format(weekDates[0]), style: style),
          ],
        );
        break;
      case 2:
        text = Column(
          children: [
            Text(DateFormat("MMM").format(weekDates[1]), style: style),
            Text(DateFormat("dd").format(weekDates[1]), style: style),
          ],
        );
        break;
      case 3:
        text = Column(
          children: [
            Text(DateFormat("MMM").format(weekDates[2]), style: style),
            Text(DateFormat("dd").format(weekDates[2]), style: style),
          ],
        );
        break;
      case 4:
        text = Column(
          children: [
            Text(DateFormat("MMM").format(weekDates[3]), style: style),
            Text(DateFormat("dd").format(weekDates[3]), style: style),
          ],
        );
        break;
      case 5:
        text = Column(
          children: [
            Text(DateFormat("MMM").format(weekDates[4]), style: style),
            Text(DateFormat("dd").format(weekDates[4]), style: style),
          ],
        );
        break;
      case 6:
        text = Column(
          children: [
            Text(DateFormat("MMM").format(weekDates[5]), style: style),
            Text(DateFormat("dd").format(weekDates[5]), style: style),
          ],
        );
        break;
      case 7:
        text = Column(
          children: [
            Text(DateFormat("MMM").format(weekDates[6]), style: style),
            Text(DateFormat("dd").format(weekDates[6]), style: style),
          ],
        );
        break;
      case 8:
        text = Text('');
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String mood;
    switch (value.toInt()) {
      case 1:
        mood = 'assets/svg/face1.svg';
        break;
      case 2:
        mood = 'assets/svg/face2.svg';
        break;
      case 3:
        mood = 'assets/svg/face3.svg';

        break;
      case 4:
        mood = 'assets/svg/face4.svg';
        break;
      case 5:
        mood = 'assets/svg/face5.svg';

        break;
      default:
        return Container();
    }

    return SvgPicture.asset(mood);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        checkToShowVerticalLine: (value) => false,
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
              strokeWidth: 0.6, color: Color(0xffB4B4B4), dashArray: [10]);
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.blue,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 45,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          // gradient: LinearGradient(
          //   begin:  Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: gradientColors,
          // ),
          barWidth: 0,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
