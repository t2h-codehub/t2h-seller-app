import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get txtOutlineGray700 => BoxDecoration(
        color: AppCol.gray700,
        border: Border.all(
          color: AppCol.gray700,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get txtOutlineGray7001 => BoxDecoration(
        color: AppCol.whiteA7007f,
        border: Border.all(
          color: AppCol.gray700,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: AppCol.whiteA700,
        border: Border.all(
          color: AppCol.black900,
          width: getHorizontalSize(
            1,
          ),
          strokeAlign: strokeAlignCenter,
        ),
      );
  static BoxDecoration get gradientGray6007fGray6007f => BoxDecoration();
  static BoxDecoration get outlineGray50001 => BoxDecoration(
        border: Border.all(
          color: AppCol.gray50001,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get gradientWhiteA700WhiteA700 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0,
            0.5,
          ),
          end: Alignment(
            1,
            0.5,
          ),
          colors: [
            AppCol.whiteA700,
            AppCol.blue200,
            AppCol.whiteA700,
          ],
        ),
      );
  static BoxDecoration get outlineBlack9001 => BoxDecoration(
        border: Border.all(
          color: AppCol.black900,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineBlack90019 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.68,
            0.32,
          ),
          end: Alignment(
            -0.47,
            1.21,
          ),
          colors: [
            AppCol.red600,
            AppCol.red60000,
          ],
        ),
      );
  static BoxDecoration get outlineBlack900191 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.84,
            0.16,
          ),
          end: Alignment(
            -0.74,
            1,
          ),
          colors: [
            AppCol.lightBlue800,
            AppCol.lightBlue80000,
          ],
        ),
      );
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: AppCol.gray50,
      );
  static BoxDecoration get gradientGray7007fBluegray9007f => BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment(
          0.5,
          -1.7,
        ),
        end: Alignment(
          0.5,
          1.7,
        ),
        colors: [
          AppCol.gray6007f.withOpacity(0.1),
          AppCol.whiteA7007f,
          AppCol.gray6007f.withOpacity(0.1),
        ],
      ));
  static BoxDecoration get outlineBlack9003f10 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            -0.42,
          ),
          end: Alignment(
            0.5,
            1.54,
          ),
          colors: [
            AppCol.yellowA7007f,
            AppCol.whiteA7007f,
            AppCol.yellowA7007f01,
          ],
        ),
      );
  static BoxDecoration get outlineGray500 => BoxDecoration(
        border: Border.all(
          color: AppCol.gray500,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: AppCol.whiteA700,
      );
  static BoxDecoration get outlineBlack9003f9 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            -0.42,
          ),
          end: Alignment(
            0.5,
            1.54,
          ),
          colors: [
            AppCol.lightGreenA4007f,
            AppCol.whiteA7007f,
            AppCol.lightGreenA4007f01,
          ],
        ),
      );
  static BoxDecoration get outlineBlack9003f8 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            -0.42,
          ),
          end: Alignment(
            0.5,
            1.54,
          ),
          colors: [
            AppCol.deepOrangeA7007f,
            AppCol.whiteA7007f,
            AppCol.deepOrangeA7007f01,
          ],
        ),
      );
  static BoxDecoration get outlineBlack9003f17 => BoxDecoration(
        color: AppCol.red500,
        boxShadow: [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9003f16 => BoxDecoration(
        color: AppCol.blueGray900,
        boxShadow: [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9003f15 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            -0.86,
          ),
          end: Alignment(
            0.52,
            2.2,
          ),
          colors: [
            AppCol.whiteA700,
            AppCol.whiteA700,
            AppCol.gray60000,
          ],
        ),
      );
  static BoxDecoration get outlineBlack9003f14 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            -0.03,
            -0.42,
          ),
          end: Alignment(
            -0.03,
            1.54,
          ),
          colors: [
            AppCol.gray6007f,
            AppCol.whiteA7007f,
            AppCol.gray6007f,
          ],
        ),
      );
  static BoxDecoration get outlineBlack9003f13 => BoxDecoration(
        color: AppCol.black900,
        boxShadow: [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9003f => BoxDecoration();
  static BoxDecoration get redColor => BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment(
          0.5,
          -1.7,
        ),
        end: Alignment(
          0.5,
          1.7,
        ),
        colors: [
          Color(0xffF05323).withOpacity(0.01),
          AppCol.whiteA7007f,
          Color(0xffF05323).withOpacity(0.01),
        ],
      ));
  static BoxDecoration get outlineBlack9003f12 => BoxDecoration(
        color: AppCol.blueGray50,
        boxShadow: [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              1,
            ),
            blurRadius: getHorizontalSize(
              1,
            ),
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9003f11 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            -0.42,
          ),
          end: Alignment(
            0.5,
            1.54,
          ),
          colors: [
            AppCol.blueA7007f,
            AppCol.whiteA7007f,
            AppCol.blueA7007f01,
          ],
        ),
      );
  static BoxDecoration get outlineBlack9003f1 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            -0.86,
          ),
          end: Alignment(
            0.52,
            2.2,
          ),
          colors: [
            AppCol.lightBlue50000,
            AppCol.lightBlue500,
            AppCol.black90000,
          ],
        ),
      );
  static BoxDecoration get outlineBlack9003f3 => BoxDecoration(
        color: AppCol.lime500,
        boxShadow: [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9003f2 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            -0.42,
          ),
          end: Alignment(
            0.5,
            1.54,
          ),
          colors: [
            AppCol.lightBlue5007f,
            AppCol.whiteA7007f,
            AppCol.lightBlue5007f,
          ],
        ),
      );
  static BoxDecoration get outlineBlack9003f5 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            0.05,
          ),
          end: Alignment(
            0.5,
            1.16,
          ),
          colors: [
            AppCol.gray200,
            AppCol.gray600,
          ],
        ),
      );
  static BoxDecoration get outlineBlack9003f4 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            0.05,
          ),
          end: Alignment(
            0.5,
            1.16,
          ),
          colors: [
            AppCol.gray90001,
            AppCol.black900,
          ],
        ),
      );
  static BoxDecoration get gradientLightblue500Black900 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            0.5,
          ),
          end: Alignment(
            0.5,
            1.67,
          ),
          colors: [
            AppCol.lightBlue500,
            AppCol.black900,
          ],
        ),
      );
  static BoxDecoration get outlineBlack9003f7 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            -0.42,
          ),
          end: Alignment(
            0.5,
            1.54,
          ),
          colors: [
            AppCol.purpleA4007f,
            AppCol.whiteA7007f,
            AppCol.purpleA4007f01,
          ],
        ),
      );
  static BoxDecoration get outlineBlack9003f6 => BoxDecoration();
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16,
    ),
  );

  static BorderRadius customBorderLR20 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        19,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        20,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        19,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        19,
      ),
    ),
  );

  static BorderRadius roundedBorder69 = BorderRadius.circular(
    getHorizontalSize(
      69,
    ),
  );

  static BorderRadius roundedBorder5 = BorderRadius.circular(
    getHorizontalSize(
      12,
    ),
  );

  static BorderRadius circleBorder62 = BorderRadius.circular(
    getHorizontalSize(
      62,
    ),
  );

  static BorderRadius circleBorder51 = BorderRadius.circular(
    getHorizontalSize(
      51,
    ),
  );

  static BorderRadius roundedBorder13 = BorderRadius.circular(
    getHorizontalSize(
      13,
    ),
  );

  static BorderRadius roundedBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10,
    ),
  );

  static BorderRadius txtCircleBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
