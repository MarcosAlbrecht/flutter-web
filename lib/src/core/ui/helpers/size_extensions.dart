import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenShortestSide => MediaQuery.of(this).size.shortestSide;

  double get screenLongestSide => MediaQuery.of(this).size.longestSide;

  double percentWidth(double percent) {
    return screenWidth * percent;
  }

  double percentHeight(double percent) {
    return screenHeight * percent;
  }
}
