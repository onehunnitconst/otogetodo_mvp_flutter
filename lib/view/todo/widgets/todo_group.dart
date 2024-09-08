import 'package:flutter/material.dart';

class TodoGroupCollapseHeader extends StatelessWidget {
  const TodoGroupCollapseHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final typography = theme.typography;
    final colorScheme = theme.colorScheme;

    return Container(
      width: mediaQuery.size.width,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: colorScheme.secondary,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '기본 그룹',
              style: typography.dense.bodyLarge!,
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: colorScheme.background,
          ),
        ],
      ),
    );
  }
}
