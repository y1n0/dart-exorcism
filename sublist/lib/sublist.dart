// Implement the Classification enum.
enum Classification {
  equal,
  unequal,
  sublist,
  superlist,
}

class Sublist {
  Classification sublist(List<int> A, List<int> B) {
    if (A.isEmpty && B.isEmpty)
      return Classification.equal;
  }
}
