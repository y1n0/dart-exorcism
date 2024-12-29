class Proverb {
  String recite(List<String> pieces) {
    String result = "";

    pieces.skip(1).indexed.forEach((x) {
      result += "For want of a ${pieces[x.$1]} the ${x.$2} was lost.\n";
    });

    if (pieces.isNotEmpty)
      result += "And all for the want of a ${pieces.first}.";

    return result;
  }
}
