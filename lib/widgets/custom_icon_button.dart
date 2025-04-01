// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {super.key, this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.width,
      this.height,
      this.child,
      this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? width;

  double? height;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        visualDensity: VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        iconSize: getSize(height ?? 0),
        padding: EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: getSize(width ?? 0),
          height: getSize(height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll3:
        return getPadding(
          all: 3,
        );
      default:
        return getPadding(
          all: 6,
        );
    }
  }

  _setBorder() {
    switch (variant) {
      case IconButtonVariant.OutlineGray900:
        return Border.all(
          color: AppCol.gray900,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case IconButtonVariant.OutlineBlack9003f:
      case IconButtonVariant.OutlineBlack9003f_1:
      case IconButtonVariant.OutlineBlack9003f_2:
      case IconButtonVariant.OutlineBlack9003f_3:
      case IconButtonVariant.OutlineBlack9003f_4:
      case IconButtonVariant.OutlineBlack9003f_5:
      case IconButtonVariant.OutlineBlack9003f_6:
      case IconButtonVariant.OutlineBlack9003f_7:
      case IconButtonVariant.OutlineBlack9003f_8:
      case IconButtonVariant.OutlineBlack9003f_9:
      case IconButtonVariant.OutlineBlack9003f_10:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.CircleBorder18:
        return BorderRadius.circular(
          getHorizontalSize(
            18.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        );
    }
  }

  _setGradient() {
    switch (variant) {
      case IconButtonVariant.OutlineBlack9003f_1:
        return LinearGradient(
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
        );
      case IconButtonVariant.OutlineBlack9003f_2:
        return LinearGradient(
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
        );
      case IconButtonVariant.OutlineBlack9003f_3:
        return LinearGradient(
          begin: Alignment(
            0.5,
            -0.86,
          ),
          end: Alignment(
            0.52,
            2.2,
          ),
          colors: [
            AppCol.lightGreenA70033,
            AppCol.lightGreenA700,
            AppCol.lightGreen90000,
          ],
        );
      case IconButtonVariant.OutlineBlack9003f_4:
        return LinearGradient(
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
            AppCol.blueGray90000,
          ],
        );
      case IconButtonVariant.OutlineBlack9003f_5:
        return LinearGradient(
          begin: Alignment(
            0.5,
            -0.86,
          ),
          end: Alignment(
            0.52,
            2.2,
          ),
          colors: [
            AppCol.yellowA2003a,
            AppCol.yellowA200,
            AppCol.yellowA2001c,
          ],
        );
      case IconButtonVariant.OutlineBlack9003f_6:
        return LinearGradient(
          begin: Alignment(
            0.5,
            -0.86,
          ),
          end: Alignment(
            0.52,
            2.2,
          ),
          colors: [
            AppCol.blue6007f,
            AppCol.blue600,
            AppCol.blue60044,
          ],
        );
      case IconButtonVariant.OutlineBlack9003f_7:
        return LinearGradient(
          begin: Alignment(
            0.5,
            -0.86,
          ),
          end: Alignment(
            0.52,
            2.2,
          ),
          colors: [
            AppCol.lightBlue50066,
            AppCol.lightBlue50001,
            AppCol.lightBlue50051,
          ],
        );
      case IconButtonVariant.OutlineBlack9003f_8:
        return LinearGradient(
          begin: Alignment(
            0.5,
            -0.86,
          ),
          end: Alignment(
            0.52,
            2.2,
          ),
          colors: [
            AppCol.deepOrangeA40059,
            AppCol.deepOrangeA400,
            AppCol.red6000001,
          ],
        );
      case IconButtonVariant.OutlineBlack9003f_9:
        return LinearGradient(
          begin: Alignment(
            0.5,
            -0.86,
          ),
          end: Alignment(
            0.52,
            2.2,
          ),
          colors: [
            AppCol.whiteA7009e,
            AppCol.lightGreen200,
          ],
        );
      case IconButtonVariant.OutlineBlack9003f_10:
        return LinearGradient(
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
        );
      case IconButtonVariant.OutlineGray900:
        return null;
      default:
        return LinearGradient(
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
        );
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case IconButtonVariant.OutlineBlack9003f_1:
        return [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          )
        ];
      case IconButtonVariant.OutlineBlack9003f_2:
        return [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          )
        ];
      case IconButtonVariant.OutlineBlack9003f_3:
        return [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          )
        ];
      case IconButtonVariant.OutlineBlack9003f_4:
        return [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          )
        ];
      case IconButtonVariant.OutlineBlack9003f_5:
        return [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          )
        ];
      case IconButtonVariant.OutlineBlack9003f_6:
        return [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          )
        ];
      case IconButtonVariant.OutlineBlack9003f_7:
        return [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          )
        ];
      case IconButtonVariant.OutlineBlack9003f_8:
        return [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          )
        ];
      case IconButtonVariant.OutlineBlack9003f_9:
        return [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          )
        ];
      case IconButtonVariant.OutlineBlack9003f_10:
        return [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          )
        ];
      case IconButtonVariant.OutlineGray900:
        return [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          )
        ];
      default:
        return [
          BoxShadow(
            color: AppCol.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          )
        ];
    }
  }
}

enum IconButtonShape {
  RoundedBorder5,
  CircleBorder18,
}

enum IconButtonPadding {
  PaddingAll6,
  PaddingAll3,
}

enum IconButtonVariant {
  OutlineBlack9003f,
  OutlineBlack9003f_1,
  OutlineBlack9003f_2,
  OutlineBlack9003f_3,
  OutlineBlack9003f_4,
  OutlineBlack9003f_5,
  OutlineBlack9003f_6,
  OutlineBlack9003f_7,
  OutlineBlack9003f_8,
  OutlineBlack9003f_9,
  OutlineBlack9003f_10,
  OutlineGray900,
}
