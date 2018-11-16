import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:quiz/statistics_singleton.dart';

class StatisticsPage extends StatelessWidget {
  StatisticsPage({Key key, this.title}) : super(key: key);

  final String title;

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

    var correctAnswers = StatisticsSingleton().correctAnswers;
    var falseAnswers = StatisticsSingleton().falseAnswers;
    var skippedQuestions = StatisticsSingleton().skippedQuestions;
    var answeredQuestions = StatisticsSingleton().answeredQuestions;

    var row1 = _buildRow('Bearbeitete Fragen', '$answeredQuestions');
    var row2 = _buildRow('Richtig beantwortet', '$correctAnswers');
    var row3 = _buildRow('Falsch beantwortet', '$falseAnswers');
    var row4 = _buildRow('Übersprungen', '$skippedQuestions');

    return PlatformScaffold(
      appBar: appBar,
      body: SafeArea(
        child: Column(
          children: [
            row1,
            row2,
            row3,
            row4,
          ],
        ),
      ),
    );
  }
}
