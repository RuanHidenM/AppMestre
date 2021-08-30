import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../globals.dart';

class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    //const Color(0xff23b6e6),
    //const Color(0xff02d39a),
    Colors.orange,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 40),

            //TODO Button: DIA, MES e ANO.
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          border: Border(
                            bottom: BorderSide(
                                width: 0.6,
                                color: dataShowDia ? Colors.orange : Colors.white),
                          ),
                        ),
                        child: Text('DIA',
                          style: TextStyle(
                              color: dataShowDia ? Colors.orange : Colors.white,
                              fontWeight: FontWeight.w800
                          ),
                        ),
                      ),
                      onTap: (){
                        setState(() {
                          dataShowDia = true;

                          dataShowMes = false;
                          dataShowAno = false;
                        });
                      },
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          border: Border(
                            bottom: BorderSide(
                                width: 0.6,
                                color: dataShowMes ? Colors.orange : Colors.white),
                          ),
                        ),
                        child: Text('MES',
                          style: TextStyle(
                              color: dataShowMes ? Colors.orange : Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      onTap: (){
                        setState(() {
                          dataShowMes = true;

                          dataShowDia = false;
                          dataShowAno = false;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          border: Border(
                            bottom: BorderSide(
                                width: 0.6,
                                color: dataShowAno ? Colors.orange : Colors.white),
                          ),
                        ),
                        child: Text('ANO',
                          style: TextStyle(
                            color: dataShowAno ? Colors.orange : Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      onTap: (){
                        setState(() {
                          dataShowAno = true;

                          dataShowMes = false;
                          dataShowDia = false;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),

          Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.70,
                child: Container(
                  decoration: const BoxDecoration(
                    //color: Colors.black12,
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                    //color: Color(0xff232d37)
                  ),
                  child: Padding(
                   // padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
                    padding: const EdgeInsets.only(right: 0.0, left: 0.0, top: 0, bottom: 0),
                    child: LineChart(
                      //dataShowDia ? DiaViewChart() : MesViewChart(),
                      dataShowDia ? DiaViewChart()
                        : dataShowMes ? MesViewChart()
                          : dataShowAno ? AnoViewChart()
                            : MesViewChart(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
   }

  //TODO: DIA
  LineChartData DiaViewChart() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            //color: const Color(0xff37434d),
            color: Colors.white,
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            // color: const Color(0xff37434d),
            color: Colors.white,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (context, value) =>
          const TextStyle(
            //color: Color(0xff68737d),
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Mat';
              case 2:
                return 'Vers';
              case 3:
                return 'Notu';
            }
            return '';
          },
          margin: 8,
          interval: 1,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            //color: Color(0xff67727d),
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 1:
                return '1';
              case 2:
                return '2';
              case 3:
                return '3';
              case 4:
                return '4';
              case 5:
                return '5';
              case 6:
                return '6';
            }
            return '';
          },
          reservedSize: 32,
          interval: 1,
          margin: 12,
        ),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      ),
      borderData:
      FlBorderData(
        show: true,
        border: Border.all(
          //color: const Color(0xff37434d),
          color: Colors.white,
          width: 1,
        ),
      ),

      //TODO Largura
      minX: 0,
      maxX: 3,

      //TODO Altura
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 0),
            FlSpot(1, 1),
            FlSpot(2, 2),
            FlSpot(3, 6),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!,
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!,
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }

  //TODO MES
  LineChartData MesViewChart() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.white54,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.white54,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) =>
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            //color: Color(0xff67727d),
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 2:
                return '20k';
              case 3:
                return '30k';
              case 4:
                return '40k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(
        show: true,
        border: Border.all(
          // color: const Color(0xff37434d),
            color: Colors.white,//TODO: Cor da borda do grafico
            width: 1
        ),
      ),
      //TODO Largura
      minX: 0,
      maxX: 11,

      //TODO Altura
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            //TODO: Valores do grafico
            FlSpot(0, 0),
            FlSpot(1, 1),
            FlSpot(3, 2),
            FlSpot(6, 3),
            FlSpot(8, 2),
            FlSpot(10, 5),
            FlSpot(11, 6),

          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  //TODO Ano
  LineChartData AnoViewChart() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.white54,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.white54,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) =>
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return '2019';
              case 5:
                return '2020';
              case 8:
                return '2021';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            //color: Color(0xff67727d),
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '20';
              case 1:
                return '40';
              case 2:
                return '50';
              case 3:
                return '80';
              case 4:
                return '110';
              case 5:
                return '150';
            }
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(
        show: true,
        border: Border.all(
          // color: const Color(0xff37434d),
            color: Colors.white,//TODO: Cor da borda do grafico
            width: 1
        ),
      ),
      //TODO Largura
      minX: 0,
      maxX: 11,

      //TODO Altura
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            //TODO: Valores do grafico
            FlSpot(0, 3),
            FlSpot(1, 3.5),
            FlSpot(3, 3),
            FlSpot(6, 4),
            FlSpot(8, 4.2),
            FlSpot(10, 4.5),
            FlSpot(11, 5),

          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

}