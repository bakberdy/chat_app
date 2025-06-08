import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  double get mediaHeight => MediaQuery.of(this).size.height;
  double get mediaWidth => MediaQuery.of(this).size.width;
}
