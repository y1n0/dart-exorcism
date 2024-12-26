class AtbashCipher {
  int count = 0;

  String space() => ++count % 5 == 0 ? ' ' : '';

  String encode(String text) {
    count = 0;
    return text
        .toLowerCase()
        .runes
        .map((code) => switch (code) {
              >= 48 && <= 57 => String.fromCharCode(code) + space(),
              >= 97 && <= 122 => String.fromCharCode(97 + 122 - code) + space(),
              _ => '',
            })
        .join('')
        .trim();
  }

  String decode(String cipher) => encode(cipher).replaceAll(' ', '');
}
