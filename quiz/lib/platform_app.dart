import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PlatformApp extends PlatformWidgetBase<CupertinoApp, MaterialApp> {

  final String title;
  final Widget home;

  PlatformApp({this.title, this.home});

  @override
  MaterialApp createAndroidWidget(BuildContext context) {
    return MaterialApp(
      title: title,
      home: home,
    );
  }

  @override
  CupertinoApp createIosWidget(BuildContext context) {
    return CupertinoApp(
      title: title,
      home: home,
    );
  }
}