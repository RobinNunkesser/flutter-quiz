import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:quiz/platform_button.dart';
import 'package:quiz/platform_scaffold.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;

  var _questions = [
    [
      'Das Videospiel Donkey Kong sollte ursprünglich Popeye als Hauptfigur haben.',
      true
    ],
    ['Die Farbe Orange wurde nach der Frucht benannt.', true],
    ['In der griechischen Mythologie ist Hera die Göttin der Ernte.', false],
    ['Liechtenstein hat keinen eigenen Flughafen.', true],
    ['Die meisten Subarus werden in China hergestellt.', false]
  ];
  int _index = 0;
  bool _areButtonsDisabled = false;

  String get _question => _questions[_index][0];
  var _response = '';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        setState(() {
          _areButtonsDisabled = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var questionSection = Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Text('$_question'),
      ),
    );

    var responseSection = FadeTransition(
               opacity: animation,
               child: Text('$_response'),
    );

    var buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PlatformButton(
          child: Text('Falsch'),
          onPressed: _areButtonsDisabled ? null : _evaluateAnswerFalse,
        ),
        PlatformButton(
          child: Text('Richtig'),
          onPressed: _areButtonsDisabled ? null : _evaluateAnswerTrue,
        ),
      ],
    );

    return PlatformScaffold(
      title: widget.title,
      child: SafeArea(
        child: Column(
          children: [
            questionSection,
            responseSection,
            buttonSection,
            PlatformButton(
              child: Text('Überspringen'),
              onPressed: _areButtonsDisabled ? null : _skip,
            ),
          ],
        ),
      ),
    );
  }

  @override
     dispose() {
       _controller.dispose();
       super.dispose();
     }

  void _skip() {
    setState(() {
      _index = ++_index % _questions.length;
    });
  }

  void _evaluateAnswerFalse() => _evaluateAnswer(false);

  void _evaluateAnswerTrue() => _evaluateAnswer(true);

  void _evaluateAnswer(bool answer) {
    setState(() {
      _areButtonsDisabled = true;
      if (answer == _questions[_index][1]) {
        _response = "Richtig!";
      } else {
        _response = "Falsch!";
      }
    });
    _controller.forward();
    _skip();
  }
}
