import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimen {
  static final smallestSizeHorizontal = 4.w;
  static final smallestSizeVertical = 4.h;

  static final smallSizeHorizontal = 8.w;
  static final smallSizeVertical = 8.h;

  static final simpleSizeHorizontal = 12.w;
  static final simpleSizeVertical = 12.h;

  static final commonSizeHorizontal = 16.w;
  static final commonSizeVertical = 16.h;

  static final mediumSizeHorizontal = 24.w;
  static final mediumSizeVertical = 24.h;

  static final largeSizeHorizontal = 32.w;
  static final largeSizeVertical = 32.h;

  static final largestSizeHorizontal = 64.w;
  static final largestSizeVertical = 64.h;

  /// Common border specific values.
  static final double smallestRadius = 4.r;
  static final double smallRadius = 8.r;
  static final double simpleRadius = 12.r;
  static final double commonRadius = 16.r;
  static final double mediumRadius = 24.r;

  static final double commonBorderWidth = 1.w;
  static final double commonBorderHeight = 1.h;
  static final double mediumBorderWidth = 2.h;
  static final double mediumBorderHeight = 2.h;

  static final BorderRadius smallestBorderRadius = BorderRadius.all(Radius.circular(smallestRadius));
  static final BorderRadius smallBorderRadius = BorderRadius.all(Radius.circular(smallRadius));
  static final BorderRadius simpleBorderRadius = BorderRadius.all(Radius.circular(simpleRadius));
  static final BorderRadius commonBorderRadius = BorderRadius.all(Radius.circular(commonRadius));
  static final BorderRadius mediumBorderRadius = BorderRadius.all(Radius.circular(mediumRadius));

  static final bottomNavBarHeight = 58.h;
}
