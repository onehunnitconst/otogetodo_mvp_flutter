import 'package:flutter/material.dart';
import 'package:otogetodo_mvp/view/challenge/challenge_view.dart';
import 'package:otogetodo_mvp/view/mypage/my_page_view.dart';
import 'package:otogetodo_mvp/view/todo/todo_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = 0;
  }

  void setIndex(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typo = theme.typography.black;

    return Scaffold(

      body: const [
        TodoView(),
        ChallengeView(),
        MyPageView(),
      ][_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: setIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined),
            label: '과제',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rate_rounded),
            label: '챌린지',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}
