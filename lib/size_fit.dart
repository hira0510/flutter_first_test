import 'package:flutter/material.dart';
import 'package:flutter_first_test/member_page.dart';

class HYSizeFit {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double Width = 0;
  static double Height = 0;

  static void init(BuildContext context, {double standardWidth = 750}) {
    final MediaQueryData _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    Width = screenWidth / 375;
    Height = screenHeight / 667;
  }

  // 按照畫素來設定
  static double W(double size) {
    return size * Width;
  }

  // 按照rxp來設定
  static double H(double size) {
    return size * Height;
  }
}
