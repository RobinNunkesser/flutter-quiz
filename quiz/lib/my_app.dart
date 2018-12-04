import 'package:flutter/material.dart';
import 'package:quiz/platform_app.dart';
import 'package:quiz/my_home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Quiz',
      home: MyHomePage(title: 'Quiz'),
    );
  }
}
