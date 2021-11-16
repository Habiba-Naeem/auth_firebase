import 'package:dartz/dartz.dart';

class Password {
  final Either<String, String> value;

  Password({required String input})
      : value = isValid(input) ? right(input) : left(input);

  String getOrCrash() => value.fold((l) => throw Error(), (r) => r);

  static bool isValid(String pattern) {
    return pattern.length > 5;
  }
}
