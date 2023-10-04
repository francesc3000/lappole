import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lappole/src/manager/manager_basic_page.dart';
import 'package:lappole/src/model/user_role.dart';
import 'package:lappole/src/role/widget_with_role.dart';

class ManagerMobilePage extends ManagerBasicPage {
  ManagerMobilePage(String title, {Key? key}) : super(title, key: key);

  @override
  Widget body(BuildContext context) {
    BarChartData barChartData = BarChartData(
      barGroups: [
        BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 3)]),
        BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 4)]),
        BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 5)])
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
                    text = 'Valentín';
                    break;
                  case 1:
                    text = 'José';
                    break;
                  case 2:
                    text = 'Maria';
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

    return WidgetWithRole(
      allowedRoleLevel: UserRole.manager,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(children: [
          const Text('Aquí se muestra los datos que solo puede ver el manager'),
          AspectRatio(aspectRatio: 1.6, child: BarChart(barChartData)),
        ]),
      ),
    );
  }
}
