import 'package:flutter/material.dart';
import 'package:otogetodo_mvp/model/domain/charts/chart.dart';
import 'package:otogetodo_mvp/model/domain/songs/song.dart';
import 'package:otogetodo_mvp/model/domain/todos/todo.dart';
import 'package:otogetodo_mvp/util/extensions/widget_list_extension.dart';
import 'package:otogetodo_mvp/view/todo/widgets/todo_item.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  void setIndex(int index) {
    _tabController.index = index;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final typography = theme.typography;
    final colorScheme = theme.colorScheme;

    final todos = [
      Todo(
        id: '8fb753a0-c497-4e51-9f83-52f492f99296',
        game: 'maimai',
        song: Song(
          title: 'Oshama Scramble!',
          artist: 't+pazolite',
        ),
        chart: Chart(
          mode: 'deluxe',
          difficulty: 'Re:MASTER',
          level: '13',
        ),
        completed: false,
      ),
      Todo(
        id: '2c3ff6c4-90f6-45ec-b0d0-7ff93a439ca9',
        game: 'iidx',
        song: Song(
          title: 'EMERALDAS',
          artist: 'BEMANI Sound Team "HuΣeR vs dj Hellix"',
        ),
        chart: Chart(
          mode: 'standard',
          difficulty: 'Re:MASTER',
          level: '13',
        ),
        completed: false,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('OTOGETODO', style: typography.black.headlineMedium!),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
        bottom: TabBar(
          controller: _tabController,
          onTap: setIndex,
          tabs: [
            Tab(
              child: Text('미완료'),
            ),
            Tab(
              child: Text('완료'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 22.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                  ),
                  const SizedBox(height: 10.0),
                  ...todos
                      .map((todo) => TodoItem(todo: todo))
                      .toList()
                      .spacing(6.0),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
