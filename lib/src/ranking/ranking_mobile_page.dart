import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lappole/src/ranking/ranking_basic_page.dart';

class RankingMobilePage extends RankingBasicPage {
  RankingMobilePage(String title, {Key? key}) : super(title, key: key);

  @override
  Widget body(BuildContext context) {
    BarChartData barChartData = BarChartData(
      barGroups: [
        BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 5)]),
        BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 4)]),
        BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 3)])
      ],
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          // axisNameWidget: Text('0: El mejor'),
          sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const style = TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                );
                String text;
                switch (value.toInt()) {
                  case 0:
                    text = 'El Mejor';
                    break;
                  case 1:
                    text = 'La Mejor';
                    break;
                  case 2:
                    text = 'Les Mejores';
                    break;
                  default:
                    text = '';
                    break;
                }
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  space: 4,
                  child: Text(text, style: style),
                );
              }),
        ),
      ),
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(children: [
        const Text('Aquí se muestra el ranking del club e interclubes'),
        AspectRatio(aspectRatio: 1.6, child: BarChart(barChartData)),
      ]),
    );
  }
}
