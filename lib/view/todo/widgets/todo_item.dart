import 'package:flutter/material.dart';
import 'package:otogetodo_mvp/model/domain/todos/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final void Function(bool?)? onChanged;

  const TodoItem({super.key, required this.todo, this.onChanged});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.song.title,
                  style: typography.dense.headlineSmall!,
                ),
                Text(
                  todo.song.artist,
                  style: typography.dense.bodyMedium!,
                ),
                Text(
                  "${todo.chart.difficulty} ${todo.chart.level}",
                  style: typography.dense.bodyMedium!,
                ),
              ],
            ),
          ),
          Checkbox(value: todo.completed, onChanged: onChanged),
        ],
      ),
    );
  }
}
