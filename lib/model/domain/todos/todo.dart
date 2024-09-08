import 'package:otogetodo_mvp/model/domain/charts/chart.dart';
import 'package:otogetodo_mvp/model/domain/songs/song.dart';

class Todo {
  final String id;
  final String game;
  final Song song;
  final Chart chart;
  final String goal;
  final bool completed;

  Todo({
    required this.id,
    required this.game,
    required this.song,
    required this.chart,
    required this.goal,
    required this.completed,
  });
}
