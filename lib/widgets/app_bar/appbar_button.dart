import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/widgets/custom_button.dart';

// ignore: must_be_immutable
class AppbarButton extends StatelessWidget {
  AppbarButton({super.key, this.margin, this.onTap});

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomButton(
          height: 100,
          width: getHorizontalSize(
            80,
          ),
          text: "Invite",
          fontStyle: ButtonFontStyle.PoppinsMedium15,
          prefixWidget: Container(
            margin: getMargin(
              right: 3,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgLayer17x7,
              height: getSize(
                10,
              ),
              width: getSize(
                10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
