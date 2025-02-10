import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chart/model/model.dart';

class Example2 extends StatelessWidget {
  const Example2({super.key,
   this.apiRes
  });
  final ApiResponse?apiRes;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 300,
          child: BarChart(
              BarChartData(
                barTouchData: BarTouchData(
                  enabled: false,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (group) => Colors.transparent,
                    tooltipPadding: EdgeInsets.zero,
                    tooltipMargin: 0,
                    getTooltipItem: (
                        BarChartGroupData group,
                        int groupIndex,
                        BarChartRodData rod,
                        int rodIndex,
                        ) {
                      return BarTooltipItem(
                        rod.toY.round().toString(),
                        children: [  TextSpan(
                          text: " PM",
                          style:TextStyle(fontWeight
                          : FontWeight.bold,
                        )),],
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),

                gridData: FlGridData(show: false),
                borderData: FlBorderData(
                  border: Border(
                    top: BorderSide.none,
                    left: BorderSide.none,
                    right: BorderSide.none,
                    bottom: BorderSide(color: Colors.grey,width: 4.0)
                  )
                ),
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,
                        getTitlesWidget: (value,metaData){
                      int index=value.toInt();
                    return Text(apiRes!.data![index].year.toString());
                    }
                    ))
                ),
                barGroups: [
                  ...List.generate(apiRes!.data!.length, (index)=>
                      BarChartGroupData(
                    groupVertically: true,
                    showingTooltipIndicators: [0],
                    x: index,
                    barRods: [
                      BarChartRodData(
                        width: 30.0,
                        backDrawRodData: BackgroundBarChartRodData(
                          toY: 15,
                          show: true,
                          color: Colors.grey.shade200
                        ),
                        toY: apiRes!.data![index].id?.toDouble()??2.0,
                        color: Colors.blueAccent,

                      ),
                    ]
                  )),
                ]
          )),
        ),
      ],
    );
  }
}
