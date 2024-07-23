import 'package:flutter/material.dart';
import 'package:otogetodo_mvp/pages/main_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  MainPage.routeName: (context) => const MainPage(),
};
