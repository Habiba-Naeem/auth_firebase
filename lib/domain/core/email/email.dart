import 'package:dartz/dartz.dart';

class Email {
  // final String value;
  final Either<String, String> value;

  Email({required String input})
      : value = isValid(input) ? right(input) : left(input);

  String getOrCrash() => value.fold((l) => throw Error(), (r) => r);

  static bool isValid(String pattern) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(pattern);
  }
}
