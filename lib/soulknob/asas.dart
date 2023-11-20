import 'package:flutter/material.dart';
import 'package:k_chart/flutter_k_chart.dart';

class sk3 extends StatefulWidget {
  const sk3({super.key});

  @override
  State<sk3> createState() => _sk3State();
}

class _sk3State extends State<sk3> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: KChartWidget(

          [
            KLineEntity.fromJson(
    {
      "Month":41,
      "Month2":41,
      "Month3":41,
      "Month4":41
    }
            )
          ], ChartStyle(),chartColors ,

          isLine: true,
          isTrendLine: true
      ),
    );
  }
  ChartColors chartColors = ChartColors();

}
