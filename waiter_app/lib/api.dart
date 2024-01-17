import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Api_detail extends StatefulWidget {
  final String name;
  final int count;
  final String profil_img_url;

  const Api_detail({
    Key? key,
    required this.name,
    required this.count,
    required this.profil_img_url,
  }) : super(key: key);

  @override
  State<Api_detail> createState() => _Api_detailState();
}

class _Api_detailState extends State<Api_detail> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: widget.name,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              child: SizedBox(
                height: screenHeight / 2.2,
                width: screenWidth,
                child: Image.network(
                  widget.profil_img_url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth / 20,
              vertical: 20,
            ),
            child: Text(
              widget.name,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.black87,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth / 20,
            ),
            child: Text(
              "Count: ${widget.count}",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: widget.count.toDouble() + 10,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.blueGrey,
                    ),
                    touchCallback: (BarTouchResponse, details) {},
                    handleBuiltInTouches: true,
                  ),
                  /*titlesData: FlTitlesData(
                      show: true,
                      leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: leftTitleWidgets,
                      ))),*/
                  /*titlesData: FlTitlesData(
                    leftTitles: SideTitles(showTitles: true, reservedSize: 40),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitles: (value) {
                        return value.toString();
                      },
                    ),
                  ),*/
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color(0xff37434d),
                      width: 1,
                    ),
                  ),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                            toY: widget.count.toDouble(), color: Colors.blue),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle();
  String text = value.toString();
  text = text + 'µs';
  return FittedBox(
    child: Text(text, style: style, textAlign: TextAlign.center),
    fit: BoxFit.fitWidth,
  );
}
