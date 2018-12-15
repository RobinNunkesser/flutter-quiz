import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class StatisticsPage extends StatelessWidget {
  StatisticsPage(
      {Key key,
      this.title,
      this.correctAnswers,
      this.falseAnswers,
      this.skippedQuestions})
      : super(key: key);

  final String title;
  final int correctAnswers;
  final int falseAnswers;
  final int skippedQuestions;
  int get answeredQuestions => correctAnswers + falseAnswers + skippedQuestions;

  Widget _buildRow(String label, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(label),
        ),
        Text(value)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var appBar = PlatformAppBar(
      title: Text(title),
    );

    return PlatformScaffold(
      appBar: appBar,
      body: SafeArea(
        child: Column(
          children: [
            _buildRow('Bearbeitete Fragen', '$answeredQuestions'),
            _buildRow('Richtig beantwortet', '$correctAnswers'),
            _buildRow('Falsch beantwortet', '$falseAnswers'),
            _buildRow('Übersprungen', '$skippedQuestions'),
          ],
        ),
      ),
    );
  }
}
