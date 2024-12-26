class Etl {
  Map<String, int> transform(Map<String, List<String>> data) {
    return Map.fromEntries(data.entries
        .map((entry) => entry.value.map(
            (letter) => MapEntry(letter.toLowerCase(), int.parse(entry.key))))
        .expand((x) => x));
  }
}
