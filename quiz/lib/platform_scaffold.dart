import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz/platform_widget.dart';

class PlatformScaffold extends PlatformWidget<CupertinoPageScaffold, Scaffold> {
  final String title;
  final Widget child;

  PlatformScaffold({this.title, this.child});

  @override
  Scaffold createAndroidWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: child,
    );
  }

  @override
  CupertinoPageScaffold createIosWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: child,
    );
  }
}
