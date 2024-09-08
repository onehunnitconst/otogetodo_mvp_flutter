import 'package:flutter/material.dart';
import 'package:otogetodo_mvp/model/domain/charts/chart.dart';

class ChartBadge extends StatelessWidget {
  final Color backgroundColor;
  final Color labelColor;
  final Chart chart;

  const ChartBadge({
    super.key,
    required this.backgroundColor,
    required this.labelColor,
    required this.chart,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (chart.mode != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 2.0,
              ),
              decoration: BoxDecoration(
                color: backgroundColor,
              ),
              child: Text(
                chart.mode!,
                style: TextStyle(
                  color: labelColor,
                ),
              ),
            ),
            const SizedBox(
              width: 2.0,
            ),
          ],
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 2.0,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
            child: Text(
              chart.difficulty,
              style: TextStyle(
                color: labelColor,
              ),
            ),
          ),
          const SizedBox(
            width: 2.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 2.0,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
            child: Text(
              chart.level,
              style: TextStyle(
                color: labelColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
