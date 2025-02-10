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
                    return Expanded(child: Text(apiRes!.data![index].name.toString().substring(0,5)));
                    }
                    ))
                ),
                barGroups: [
                  ...List.generate(apiRes!.data!.length, (index)=>BarChartGroupData(
                    groupVertically: true,
                    x: index,
                    barRods: [
                      BarChartRodData(toY: apiRes!.data![index].id?.toDouble()??2.0)
                    ]
                  ))
                ]
          )),
        ),
      ],
    );
  }
}
