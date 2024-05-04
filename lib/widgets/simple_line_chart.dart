import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:get/get.dart';

class MyLineChart extends StatefulWidget {
  const MyLineChart({super.key});

  @override
  State<MyLineChart> createState() => _MyLineChartState();
}

class _MyLineChartState extends State<MyLineChart> {
  @override
  Widget build(BuildContext context) {
    final staticTicks = <charts.TickSpec<double>>[];
    return charts.LineChart(
      _createSampleData(),
      animate: true,
      domainAxis: charts.NumericAxisSpec(
        showAxisLine: false,
        tickProviderSpec: charts.StaticNumericTickProviderSpec(staticTicks),
      ),
      primaryMeasureAxis: const charts.NumericAxisSpec(
          showAxisLine: false,
          tickProviderSpec: charts.StaticNumericTickProviderSpec([])),
      behaviors: [
        charts.LinePointHighlighter(
            showHorizontalFollowLine:
                charts.LinePointHighlighterFollowLineType.none,
            showVerticalFollowLine:
                charts.LinePointHighlighterFollowLineType.nearest)
      ],
    );
  }
}

List<charts.Series<LinearSales, int>> _createSampleData() {
  final data = [
    LinearSales(0, 100),
    LinearSales(1, 100),
    LinearSales(2, 80),
    LinearSales(3, 80),
    LinearSales(4, 50),
    LinearSales(5, 50),
    LinearSales(6, 30),
    LinearSales(7, 30),
    LinearSales(8, 40),
    LinearSales(9, 25),
    LinearSales(10, 10),
    LinearSales(11, 30),
    LinearSales(12, 30),
    LinearSales(13, 50),
    LinearSales(14, 70),
    LinearSales(15, 70),
  ];

  final dataTwo = [
    LinearSales(4, 50),
    LinearSales(5, 50),
    LinearSales(6, 30),
    LinearSales(7, 30),
    LinearSales(8, 40),
    LinearSales(9, 25),
    LinearSales(10, 10),
    LinearSales(11, 30),
    LinearSales(12, 30),
    LinearSales(13, 50),
  ];

  return [
    charts.Series<LinearSales, int>(
      id: 'Sales',
      colorFn: (_, __) => charts.ColorUtil.fromDartColor(
          Get.theme.primaryColorDark.withOpacity(0.2)),
      domainFn: (LinearSales sales, _) => sales.year,
      measureFn: (LinearSales sales, _) => sales.sales,
      data: data,
    ),
    charts.Series<LinearSales, int>(
      id: 'Two',
      colorFn: (_, __) =>
          charts.ColorUtil.fromDartColor(Get.theme.primaryColorDark),
      domainFn: (LinearSales sales, _) => sales.year,
      measureFn: (LinearSales sales, _) => sales.sales,
      data: dataTwo,
    ),
  ];
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
