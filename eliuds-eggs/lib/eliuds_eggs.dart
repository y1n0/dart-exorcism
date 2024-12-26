class EggCounter {
  int count(int d) => d == 0 ? 0 : d % 2 + count(d ~/ 2);
}
