import 'package:flutter/material.dart';
import 'package:otogetodo_mvp/model/domain/charts/chart.dart';
import 'package:otogetodo_mvp/view/todo/widgets/chart_badge.dart';

class MaimaiChartBadge extends StatelessWidget {
  final Chart chart;

  const MaimaiChartBadge({
    super.key,
    required this.chart,
  });

  Color get _backgroundColor {
    if (chart.difficulty == 'Re:MASTER') {
      return const Color(0xFFE4CEF4);
    }

    if (chart.difficulty == 'MASTER') {
      return const Color(0xFF994AFF);
    }

    if (chart.difficulty == 'EXPERT') {
      return const Color(0xFFFF3737);
    }

    if (chart.difficulty == 'ADVANCED') {
      return const Color(0xFFFF9800);
    }
    if (chart.difficulty == 'BASIC') {
      return const Color(0xFF009900);
    }

    return const Color(0xFF555555);
  }

  Color get _labelColor {
    if (chart.difficulty == 'Re:MASTER' || chart.difficulty == 'ADVANCED') {
      return const Color(0xFF000000);
    }

    return const Color(0xFFFFFFFF);
  }

  @override
  Widget build(BuildContext context) {
    return ChartBadge(
        backgroundColor: _backgroundColor,
        labelColor: _labelColor,
        chart: chart);
  }
}
