import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_chart.dart';

class ChartPage extends StatelessWidget {
  final List spots;

  const ChartPage(this.spots, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: CustomChart(spots),
        ),
      ),
    );
  }
}
