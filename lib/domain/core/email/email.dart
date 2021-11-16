class Email {
  final String value;

  Email({required this.value}) : assert(isValid(value));

  static bool isValid(String pattern) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(pattern);
  }
}
