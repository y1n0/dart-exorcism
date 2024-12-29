class InvalidNucleotideException implements Exception {}

class NucleotideCount {
  Map<String, int> count(String sequence) {
    final Map<String, int> map = {'A': 0, 'C': 0, 'G': 0, 'T': 0};
    sequence.split("").forEach((nucleotide) => map.update(
        nucleotide, (x) => ++x,
        ifAbsent: () => throw InvalidNucleotideException()));
    return map;
  }
}
