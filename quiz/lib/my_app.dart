import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_theming/platform_theming.dart';
import 'package:quiz/my_home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: PlatformTheme(),
      home: MyHomePage(title: 'Quiz'),
    );
  }
}
