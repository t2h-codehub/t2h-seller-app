import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/core/utils/size_utils.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key, this.shape,
      
      this.padding,
      this.maxlength,
      this.variant,
      this.fontStyle,
      this.onChange,
      this.alignment,
      this.width,
      this.autoFocus = false,
      this.margin,
      this.controller,
      this.isenabled = true,
      this.focusNode,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType,
      this.maxLines,
      this.hintText,
      this.label,
      this.prefix,
      this.onFieldSubmitted,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator, 
      this.inputFormatter});

  TextFormFieldShape? shape;
  bool? autoFocus;
  TextFormFieldPadding? padding;
  Function(String value)? onChange;
  Function(String value)? onFieldSubmitted;
  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;
  

  Alignment? alignment;

  double? width;
  String? label;
  bool isenabled;
  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;
  int? maxlength;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        enabled: isenabled,
        onChanged: onChange,
        autofocus: autoFocus ?? false,
        maxLength: maxlength ?? 30,
        controller: controller,
        focusNode: focusNode,
        style: _setFontStyle(),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        inputFormatters: inputFormatter,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      counterText: "",
      hintText: hintText ?? "",
      labelText: label ?? "",
      labelStyle: _setFontStyle(),
      hintStyle: TextStyle(
        color: AppCol.gray500
      ),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyleActive(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          // color: ColorConstant.gray700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.50,
          ),
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.circular:
        return BorderRadius.circular(getHorizontalSize(
          40.00,
        ));
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: AppCol.gray500,
            width: 1,
          ),
        );
    }
  }

  _setBorderStyleActive() {
    switch (variant) {
      case TextFormFieldVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: AppCol.primary,
            width: 1,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      default:
        return AppCol.whiteA700;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.None:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      default:
        return getPadding(
          left: 14,
          top: 18,
          right: 14,
          bottom: 18,
        );
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder5,
  circular,
}

enum TextFormFieldPadding {
  PaddingT15,
}

enum TextFormFieldVariant {
  None,
  OutlineGray500,
}

enum TextFormFieldFontStyle {
  PoppinsMedium12,
}
