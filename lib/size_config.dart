import 'package:flutter/material.dart';

class SizeConfig {
  final double baseHeight = 960.0;
  final double baseWidth = 454.7368421052632;

  static double screenHeight;
  static double screenWidth;
  static double heightScaleRatio;
  static double widthScaleRatio;
  static double scaleFactor;

  void calculateScaleRatios(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    screenHeight = screenSize.height;
    screenWidth = screenSize.width;
    scaleFactor = MediaQuery.of(context).textScaleFactor;
    heightScaleRatio = screenHeight / baseHeight;
    widthScaleRatio = screenWidth / baseWidth;
  }

  double scaleHeight(double actualHeight) {
    return actualHeight * heightScaleRatio * scaleFactor;
  }

  double scaleWidth(double actualWidth) {
    return actualWidth * widthScaleRatio * scaleFactor;
  }
}
