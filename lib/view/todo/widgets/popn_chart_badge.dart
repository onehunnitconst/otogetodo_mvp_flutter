import 'package:flutter/material.dart';
import 'package:otogetodo_mvp/model/domain/charts/chart.dart';
import 'package:otogetodo_mvp/view/todo/widgets/chart_badge.dart';

class PopnChartBadge extends StatelessWidget {
  final Chart chart;

  const PopnChartBadge({
    super.key,
    required this.chart,
  });

  Color get _backgroundColor {
    if (chart.difficulty == 'EX') {
      return const Color(0xFFFF3737);
    }

    if (chart.difficulty == 'HYPER') {
      return const Color(0xFFFF9800);
    }

    if (chart.difficulty == 'NORMAL') {
      return const Color(0xFF009900);
    }

    if (chart.difficulty == 'EASY') {
      return const Color(0xFF00DDDD);
    }

    return const Color(0xFF555555);
  }

  Color get _labelColor {
    if (chart.difficulty == 'EASY') {
      return const Color(0xFF000000);
    }

    return const Color(0xFFFFFFFF);
  }

  @override
  Widget build(BuildContext context) {
    return ChartBadge(
      backgroundColor: _backgroundColor,
      labelColor: _labelColor,
      chart: chart,
    );
  }
}
