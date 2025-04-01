// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key, this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonChildWidget(),
      ),
    );
  }

  _buildButtonChildWidget() {
    if (checkGradient()) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: _setBorderRadius()),
        elevation: 2,
        child: Container(
          width: width ?? double.maxFinite,
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: _buildButtonWithOrWithoutIcon(),
        ),
      );
    } else {
      return _buildButtonWithOrWithoutIcon();
    }
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildDecoration() {
    return BoxDecoration(
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
      boxShadow: _setBoxShadow(),
    );
  }

  _buildTextButtonStyle() {
    if (checkGradient()) {
      return TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ).copyWith(overlayColor: WidgetStateProperty.all(Colors.transparent));
    } else {
      return TextButton.styleFrom(
        fixedSize: Size(
          width ?? double.maxFinite,
          height ?? getVerticalSize(40),
        ),
        padding: _setPadding(),
        side: _setTextButtonBorder(),
        shadowColor: _setTextButtonShadowColor(),
        shape: RoundedRectangleBorder(
          borderRadius: _setBorderRadius(),
        ),
      ).copyWith(overlayColor: WidgetStateProperty.all(Colors.transparent));
    }
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingT14:
        return getPadding(
          top: 14,
          right: 14,
          bottom: 14,
        );
      case ButtonPadding.PaddingAll8:
        return getPadding(
          all: 8,
        );
      case ButtonPadding.PaddingAll16:
        return getPadding(
          all: 16,
        );
      case ButtonPadding.PaddingAll20:
        return getPadding(bottom: 20, top: 20);
      case ButtonPadding.PaddingAll12:
        return getPadding(
          all: 12,
        );
      case ButtonPadding.PaddingT16:
        return getPadding(
          left: 12,
          top: 16,
          right: 12,
          bottom: 16,
        );
      case ButtonPadding.PaddingT16_1:
        return getPadding(
          left: 16,
          top: 16,
          bottom: 16,
        );
      default:
        return getPadding(
          top: 1,
          right: 1,
          bottom: 1,
        );
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineGray500:
        return BorderSide(
          color: AppCol.gray500,
          width: getHorizontalSize(
            1.00,
          ),
        );
      default:
        return null;
    }
  }

  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariant.OutlineBlack9003f:
        return AppCol.black9003f;
      case ButtonVariant.OutlineBlack9003f_1:
        return AppCol.black9003f;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder5:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
      case ButtonShape.RoundedBorder19:
        return BorderRadius.circular(
          getHorizontalSize(
            19.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            9.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.PoppinsMedium15:
        return TextStyle(
          color: AppCol.gray900,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.53,
          ),
        );
      case ButtonFontStyle.PoppinsMedium12:
        return TextStyle(
          color: AppCol.indigo500,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.50,
          ),
        );

      case ButtonFontStyle.PoppinsMedium15Blue:
        return TextStyle(
          color: AppCol.indigo500,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
          height: getVerticalSize(
            1.50,
          ),
        );
      case ButtonFontStyle.PoppinsMedium12Gray700:
        return TextStyle(
          color: AppCol.gray700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.50,
          ),
        );
      case ButtonFontStyle.PoppinsSemiBold12:
        return TextStyle(
          color: AppCol.gray900,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.50,
          ),
        );
      default:
        return TextStyle(
          color: AppCol.black900,
          fontSize: getFontSize(
            10,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.50,
          ),
        );
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.OutlineGray500:
        return Border.all(
          color: AppCol.gray500,
          width: getHorizontalSize(
            1.00,
          ),
        );
      default:
        return null;
    }
  }

  checkGradient() {
    switch (variant) {
      case ButtonVariant.OutlineBlack9003f:
      case ButtonVariant.OutlineBlack9003f_1:
        return true;
      case ButtonVariant.OutlineGray500:
        return false;
      default:
        return true;
    }
  }

  _setGradient() {
    switch (variant) {
      case ButtonVariant.OutlineBlack9003f:
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
      case ButtonVariant.OutlineBlack9003f_1:
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
      case ButtonVariant.OutlineGray500:
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
      case ButtonVariant.OutlineBlack9003f:
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
      case ButtonVariant.OutlineBlack9003f_1:
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
        return null;
    }
  }
}

enum ButtonShape {
  Square,
  CircleBorder9,
  RoundedBorder5,
  RoundedBorder19,
}

enum ButtonPadding {
  PaddingT1,
  PaddingT14,
  PaddingAll8,
  PaddingAll16,
  PaddingAll20,

  PaddingAll12,
  PaddingT16,
  PaddingT16_1,
}

enum ButtonVariant {
  GradientGray600ccGray600cc,
  OutlineBlack9003f,
  OutlineGray500,
  OutlineBlack9003f_1,
}

enum ButtonFontStyle {
  PoppinsMedium10,
  PoppinsMedium15,
  PoppinsMedium15Blue,

  PoppinsMedium12,
  PoppinsMedium12Gray700,
  PoppinsSemiBold12,
}
