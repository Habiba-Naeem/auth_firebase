class Password {
  final String value;

  Password({required this.value}) : assert(isValid(value));

  static bool isValid(String pattern) {
    return pattern.length > 5;
  }
}
