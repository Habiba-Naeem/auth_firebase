import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10)),
);
