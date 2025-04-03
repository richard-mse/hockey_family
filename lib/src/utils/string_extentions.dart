extension StringExtension on String {
  String sanitize() {
    return trim().toLowerCase() // Remove all spaces and convert to lowercase
        .replaceAll(RegExp('[àáâãäå]'), 'a')
        .replaceAll(RegExp('æ'), 'ae')
        .replaceAll(RegExp('ç'), 'c')
        .replaceAll(RegExp('[èéêë]'), 'e')
        .replaceAll(RegExp('[ìíîï]'), 'i')
        .replaceAll(RegExp('ñ'), 'n')
        .replaceAll(RegExp('[òóôõöø]'), 'o')
        .replaceAll(RegExp('œ'), 'oe')
        .replaceAll(RegExp('[ùúûü]'), 'u')
        .replaceAll(RegExp('[ýÿ]'), 'y')
        .replaceAll(RegExp('[^a-zA-Z0-9]'), ''); // Remove all other special characters
  }

  /// Remove undesired characters from a string to make it parseable as a number
  String numberify() {
    return trim().toLowerCase()
        .replaceAll(',', '.')
        .replaceAll("'", '')
        .replaceAll(' ', '');
  }

  /// Capitalize the first letter of a string
  String capitalizeFirstLetter() {
    if (trim().isEmpty) return '';
    return "${this.trim()[0].toUpperCase()}${trim().substring(1)}";
  }

  /// Capitalize the first letter of a string and cut it to one character
  String capitalizeAndCut() {
    return this.trim()[0].toUpperCase();
  }

  // ------------------ Recase -------------------
  static final RegExp _upperAlphaRegex = RegExp(r'[A-Z]');
  static final Set<String> _symbolSet = {' ', '.', '/', '_', '\\', '-'};

  /// Split the string into words
  List<String> get _words {
    final words = <String>[];
    final buffer = StringBuffer();
    final isAllCaps = this.toUpperCase() == this;

    for (var i = 0; i < this.length; i++) {
      final char = this[i];
      final nextChar = i + 1 < this.length ? this[i + 1] : null;

      if (_symbolSet.contains(char)) continue;

      buffer.write(char);

      final isEndOfWord = nextChar == null ||
          (_upperAlphaRegex.hasMatch(nextChar) && !isAllCaps) ||
          _symbolSet.contains(nextChar);

      if (isEndOfWord) {
        words.add(buffer.toString());
        buffer.clear();
      }
    }

    return words;
  }

  /// Transform the string into a different case
  String _transformCase({
    required String Function(String word) wordTransform,
    String separator = '',
  }) {
    final transformedWords = _words.map(wordTransform).toList();
    return transformedWords.join(separator);
  }

  /// camelCase
  String get camelCase => _transformCase(
    wordTransform: (word) => word == _words.first
        ? word.toLowerCase()
        : _upperCaseFirstLetter(word),
  );

  /// CONSTANT_CASE
  String get constantCase => _transformCase(
    wordTransform: (word) => word.toUpperCase(),
    separator: '_',
  );

  /// Sentence case
  String get sentenceCase => _transformCase(
    wordTransform: (word) =>
    word == _words.first ? _upperCaseFirstLetter(word) : word.toLowerCase(),
    separator: ' ',
  );

  /// snake_case
  String get snakeCase => _transformCase(
    wordTransform: (word) => word.toLowerCase(),
    separator: '_',
  );

  /// dot.case
  String get dotCase => _transformCase(
    wordTransform: (word) => word.toLowerCase(),
    separator: '.',
  );

  /// param-case
  String get paramCase => _transformCase(
    wordTransform: (word) => word.toLowerCase(),
    separator: '-',
  );

  /// path/case
  String get pathCase => _transformCase(
    wordTransform: (word) => word.toLowerCase(),
    separator: '/',
  );

  /// PascalCase
  String get pascalCase => _transformCase(
    wordTransform: _upperCaseFirstLetter,
  );

  /// Header-Case
  String get headerCase => _transformCase(
    wordTransform: _upperCaseFirstLetter,
    separator: '-',
  );

  /// Title Case
  String get titleCase => _transformCase(
    wordTransform: _upperCaseFirstLetter,
    separator: ' ',
  );


  String _upperCaseFirstLetter(String word) {
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }
}