class Leap {
  bool leapYear(int y) => switch ((y % 4, y % 100, y % 400)) {
    (_, _,0) => true,
    (_,0,_) => false,
    (0,_,_) => true,
    _ => false,
  };
}
