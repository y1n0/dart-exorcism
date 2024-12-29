class Forth {
  List<String>? _tmp = null;
  bool defining = false;
  String? defName = null;
  Map<String, List<String>> userDefs = {};
  List<int> stack = [];
  List<Function> ops = [];

  parse(cmd) {}

  evaluate(String inputString, [int indexOffset = 0]) {
    List<String> input = inputString.toLowerCase().split(" ");

    input.indexed.forEach((e) {
      final (index, cmd) = e;

      if (cmd == ':') {
        defining = true;
      } else if (cmd == ';') {
        defining = false;
        defName = null;
        _tmp = null;
      } else if (defining) {
        recordDef(cmd);
      } else if (userDefs.keys.contains(cmd)) {
        evaluate(userDefs[cmd]!.join(" "), indexOffset = index);
      } else if (cmd == '+') {
        add();
      } else if (cmd == '-') {
        substract();
      } else if (cmd == '*') {
        multiply();
      } else if (cmd == '/') {
        divide();
      } else if (cmd == 'dup') {
        dup(indexOffset + index - 1);
      } else if (cmd == 'drop') {
        drop(indexOffset + index - 1);
      } else if (cmd == 'swap') {
        swap(indexOffset + index - 1);
      } else if (cmd == 'over') {
        over(indexOffset + index - 1);
      } else if (cmd.startsWith(RegExp(r'[0-9-]'))) {
        stack.add(int.parse(cmd));
      } else {
        throw Exception('Unknown command');
      }
    });
  }

  checkOrThrow(bool predicate, String message) {
    if (predicate) throw Exception(message);
  }

  add() {
    checkOrThrow(stack.length < 2, 'Stack empty');
    stack.insert(0, stack.removeAt(0) + stack.removeAt(0));
  }

  substract() {
    checkOrThrow(stack.length < 2, 'Stack empty');
    stack.insert(0, stack.removeAt(0) - stack.removeAt(0));
  }

  multiply() {
    checkOrThrow(stack.length < 2, 'Stack empty');
    stack.insert(0, stack.removeAt(0) * stack.removeAt(0));
  }

  divide() {
    checkOrThrow(stack.length < 2, 'Stack empty');
    checkOrThrow(stack[1] == 0, 'Division by zero');

    stack.insert(0, stack.removeAt(0) ~/ stack.removeAt(0));
  }

  dup(index) {
    checkOrThrow(stack.length < 1, 'Stack empty');
    stack.insert(index, stack[index]);
  }

  drop(index) {
    checkOrThrow(stack.length < 1, 'Stack empty');
    stack.removeAt(stack.length - 1);
  }

  swap(index) {
    checkOrThrow(stack.length < 2, 'Stack empty');
    stack.insert(stack.length - 2, stack.removeAt(stack.length - 1));
  }

  over(index) {
    checkOrThrow(stack.length < 2, 'Stack empty');
    stack.insert(index + 1, stack[index - 1]);
  }

  recordDef(String cmd) {
    if (defName == null) {
      if (cmd.startsWith(RegExp(r'[0-9-]')))
        throw Exception('Invalid definition');
      defName = cmd;
      // if already defined
      if (userDefs.containsKey(cmd)) {
        _tmp = [...userDefs[cmd]!];
      }
      userDefs[cmd] = [];
    } else {
      if (defName == cmd)
        userDefs[defName!]!.addAll(_tmp!);
      else if (userDefs.containsKey(cmd))
        userDefs[defName!]!.addAll(userDefs[cmd]!);
      else
        userDefs[defName!]!.add(cmd);
    }
  }
}
