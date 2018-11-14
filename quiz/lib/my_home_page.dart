import 'package:flutter/material.dart';
import 'package:quiz/platform_scaffold.dart';
import 'package:quiz/platform_button.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _questions = [['Das Videospiel Donkey Kong sollte ursprünglich Popeye als Hauptfigur haben.',true],
                    ['Die Farbe Orange wurde nach der Frucht benannt.', true],
                    ['In der griechischen Mythologie ist Hera die Göttin der Ernte.', false],
                    ['Liechtenstein hat keinen eigenen Flughafen.', true],
                    ['Die meisten Subarus werden in China hergestellt.', false]];
  int _index = 0;
  String get _question => _questions[_index][0];
  var _response = 'TEXT';

  void _skip() {
    setState(() {
      _index = ++_index % _questions.length;
    });
  }

  void _evaluateAnswerFalse() => _evaluateAnswer(false);
  void _evaluateAnswerTrue() => _evaluateAnswer(true);

  void _evaluateAnswer(bool answer) {
    setState(() {
      if (answer==_questions[_index][1]) {
        _response = "Richtig!";
      } else {
        _response = "Falsch!";
      }
    });
    _skip();
  }

  @override
  Widget build(BuildContext context) {

    var questionSection = Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Text('$_question'),
      ),
    );

    var buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PlatformButton(
          child: Text('Falsch'),
          onPressed: _evaluateAnswerFalse,
        ),
        PlatformButton(
          child: Text('Richtig'),
          onPressed: _evaluateAnswerTrue,
        ),
      ],
    );

    return PlatformScaffold(
      title: widget.title,
      child: SafeArea(
        child: Column(
          children: [
            questionSection,
            Text('$_response'),
            buttonSection,
            PlatformButton(
              child: Text('Überspringen'),
              onPressed: _skip,
            ),
          ],
        ),
      ),
    );
  }
}
