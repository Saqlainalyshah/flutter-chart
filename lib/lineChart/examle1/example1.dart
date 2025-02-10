import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Example1 extends StatelessWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: LineChart(
            LineChartData(
                maxX: 10,
                minX:0,
                maxY: 5,
                minY: 0,
                betweenBarsData: [
                  BetweenBarsData(
                      fromIndex: 0, toIndex: 1,
                      color: Colors.red),
                  BetweenBarsData(
                      fromIndex: 1, toIndex: 2,
                      color: Colors.grey),
                ],
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,
                      getTitlesWidget: (value,metaData){
                        if(value==2){
                          return Text("Sep");
                        }
                        else if(value==4){
                          return Text("Oct");
                        }
                        else if(value==6){
                          return Text("Nov");
                        }
                        else if(value==8){
                          return Text("Dec");
                        }else
                          return Text("");

                      }
                  )),
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,
                      getTitlesWidget: (value,metaData){
                        if(value==1){
                          return Text("1m");
                        }
                        else if(value==2){
                          return Text("2m");
                        }
                        else if(value==3){
                          return Text("3m");
                        }
                        else if(value==4){
                          return Text("4m");
                        }else
                          return Text("");

                      }
                  )),

                ),
                borderData: FlBorderData(
                    show: true,
                    border: Border(
                        top:BorderSide(color: Colors.transparent),
                        bottom:BorderSide(color: Colors.black12,width: 4),
                        left:BorderSide(color: Colors.transparent),
                        right:BorderSide(color: Colors.transparent)
                    )
                ),
                lineBarsData: [

                  LineChartBarData(

                    color: Colors.red,
                    spots: [
                      FlSpot(3, 2.4),
                      FlSpot(5, 3.0),
                      FlSpot(6, 2.5),
                      FlSpot(7, 3.2),
                      FlSpot(8, 1.4),
                    ],

                  ),
                  LineChartBarData(
                    color: Colors.black,
                    spots: [
                      FlSpot(1, 1.4),
                      FlSpot(3, 3.0),
                      FlSpot(5, 4.5),
                      FlSpot(7, 4.2),
                      FlSpot(9, 1.4),
                    ],

                  ),
                  LineChartBarData(
                    color: Colors.green,
                    spots: [
                      FlSpot(1, 2.4),
                      FlSpot(2, 3.0),
                      FlSpot(3, 2.5),
                      FlSpot(5, 3.2),
                      FlSpot(6, 1.4),
                    ],

                  )
                ]
            ),

          ),
        ),

      ],
    );
  }
}
