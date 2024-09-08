import 'package:flutter/material.dart';
import 'package:otogetodo_mvp/model/domain/charts/chart.dart';
import 'package:otogetodo_mvp/model/domain/songs/song.dart';
import 'package:otogetodo_mvp/model/domain/todos/todo.dart';
import 'package:otogetodo_mvp/util/extensions/widget_list_extension.dart';
import 'package:otogetodo_mvp/view/todo/widgets/todo_group.dart';
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
        id: 'todo-1',
        game: 'maimai',
        song: Song(
          cover: 'https://i.ytimg.com/vi/_Pa0FFARajk/maxresdefault.jpg',
          title: 'Technicians High',
          artist: 'HiTECH NINJA',
        ),
        chart: Chart(
          mode: 'DX',
          difficulty: 'MASTER',
          level: '13',
        ),
        goal: '랭크 SSS+ 달성',
        completed: false,
      ),
      Todo(
        id: 'todo-2',
        game: 'maimai',
        song: Song(
          cover:
              'https://silentblue.remywiki.com/images/thumb/d/d8/Rooftop_Run_Act1.png/300px-Rooftop_Run_Act1.png',
          title: 'Rooftop Run: Act1',
          artist: 'Tomoya Ohtani',
        ),
        chart: Chart(
          mode: 'STD',
          difficulty: 'Re:MASTER',
          level: '13',
        ),
        goal: '풀콤보 달성',
        completed: false,
      ),
      Todo(
        id: 'todo-3',
        game: 'popn',
        song: Song(
          cover:
              'https://remywiki.com/images/0/03/Snow_prism.png?20180826223840',
          title: 'Snow Prism',
          artist: 'Qrispy Joybox',
        ),
        chart: Chart(
          difficulty: 'EX',
          level: '45',
        ),
        goal: '98000점 이상 달성',
        completed: false,
      ),
      Todo(
        id: 'todo-4',
        game: 'popn',
        song: Song(
          cover:
              'https://remywiki.com/images/a/a5/LT_L-an%21ma.png?20160605222031',
          title: 'L-an!ma',
          artist: 'Master of Lapis',
        ),
        chart: Chart(
          difficulty: 'EX',
          level: '50',
        ),
        goal: '클리어 달성',
        completed: false,
      ),
      Todo(
        id: 'todo-5',
        game: 'maimai',
        song: Song(
          cover:
              'https://silentblue.remywiki.com/images/thumb/c/c8/SOS.png/300px-SOS.png',
          title: 'エスオーエス',
          artist: 'Nanahoshi kangengakudan',
        ),
        chart: Chart(
          mode: 'DX',
          difficulty: 'MASTER',
          level: '13+',
        ),
        goal: '랭크 SSS+ 달성',
        completed: false,
      ),
    ];

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
          child: TabBarView(
            controller: _tabController,
            children: [
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 22.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...todos
                              .map((todo) => TodoItem(todo: todo))
                              .toList()
                              .spacing(6.0),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 22.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.black12,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                      ],
                    ),
                  ),
                ],
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
