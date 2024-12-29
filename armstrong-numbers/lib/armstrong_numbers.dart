class ArmstrongNumbers {
  isArmstrongNumber(String number) {
    final sum = number.split("").fold(BigInt.from(0),
        (acc, digit) => acc + BigInt.from(int.parse(digit)).pow(number.length));
    return sum.toString() == number;
  }
}
