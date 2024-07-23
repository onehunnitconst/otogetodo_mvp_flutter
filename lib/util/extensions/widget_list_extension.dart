import 'package:flutter/material.dart';

extension WidgetListExtension on List<Widget> {
  List<Widget> spacing(double spacing, {Axis direction = Axis.vertical}) {
    if (length < 2) {
      return this;
    }

    return asMap()
        .entries
        .map(
          (entry) => [
            if (entry.key > 0)
              SizedBox(
                height: direction == Axis.vertical ? spacing : 0,
                width: direction == Axis.horizontal ? spacing : 0,
              ),
            entry.value,
          ],
        )
        .reduce((prev, curr) => [...prev, ...curr]);
  }

  List<Widget> divider(Widget divider) {
    if (length < 2) {
      return this;
    }

    return asMap()
        .entries
        .map((entry) => [
              if (entry.key > 0) divider,
              entry.value,
            ])
        .reduce((a, b) => [...a, ...b])
        .toList();
  }
}
