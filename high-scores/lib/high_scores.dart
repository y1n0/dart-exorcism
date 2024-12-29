class HighScores {
  final List<int> scores;
  HighScores(this.scores);
  List<int> sorted() => scores.toList()..sort();
  int latest() => scores.last;
  int personalBest() => sorted().last;
  List<int> personalTopThree() => sorted().reversed.take(3).toList();
}
