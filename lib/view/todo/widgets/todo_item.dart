import 'package:flutter/material.dart';
import 'package:otogetodo_mvp/model/domain/todos/todo.dart';
import 'package:otogetodo_mvp/view/todo/widgets/chart_badge.dart';
import 'package:otogetodo_mvp/view/todo/widgets/maimai_chart_badge.dart';
import 'package:otogetodo_mvp/view/todo/widgets/popn_chart_badge.dart';

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
        gradient: LinearGradient(
            colors: [Colors.black, Colors.black, colorScheme.secondary]),
        image: todo.song.cover != null
            ? DecorationImage(
                image: NetworkImage(todo.song.cover!),
                fit: BoxFit.cover,
                opacity: 0.15,
              )
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.song.title,
                  style: typography.dense.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                if (todo.game == 'maimai')
                  MaimaiChartBadge(chart: todo.chart)
                else if (todo.game == 'popn')
                  PopnChartBadge(chart: todo.chart),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  todo.goal,
                  style: typography.dense.bodyMedium!,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 24.0,
            height: 24.0,
            child: Checkbox(
              value: false,
              onChanged: onChanged,
              fillColor: const WidgetStatePropertyAll(Colors.white),
              checkColor: Colors.black,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(
                  4.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
