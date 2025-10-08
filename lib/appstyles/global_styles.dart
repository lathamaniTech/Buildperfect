import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GlobalStyles {
  static BorderSide selectedBorderStyle = BorderSide(
    color: Colors.teal,
    width: 2,
    style: BorderStyle.solid,
  );

  static BorderSide unselectedBorderStyle = BorderSide(
    color: Colors.transparent,
    width: 1,
  );

  static Icon selectedIcon = Icon(
    Icons.check_circle_outline_outlined,
    color: Colors.teal,
  );

  static SizedBox fillerSizedBox20 = SizedBox(width: 20);
}
