class StatisticsSingleton {
  static final StatisticsSingleton _singleton = StatisticsSingleton._internal();

  factory StatisticsSingleton() {
    return _singleton;
  }

  StatisticsSingleton._internal();

  int correctAnswers = 0;
  int falseAnswers  = 0;
  int skippedQuestions  = 0;
  int get answeredQuestions => correctAnswers + falseAnswers + skippedQuestions;
}