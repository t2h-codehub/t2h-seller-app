import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';

// ignore: must_be_immutable
class Listname1ItemWidget extends StatelessWidget {
  const Listname1ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 20,
        top: 9,
        right: 20,
        bottom: 9,
      ),
      decoration: AppDecoration.outlineBlack9003f.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage39,
            height: getSize(
              33,
            ),
            width: getSize(
              33,
            ),
            margin: getMargin(
              left: 1,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 23,
              top: 9,
              bottom: 5,
            ),
            child: Text(
              "PayTM",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsSemiBold12,
            ),
          ),
          Spacer(),
          Container(
            height: getVerticalSize(
              16,
            ),
            width: getHorizontalSize(
              36,
            ),
            margin: getMargin(
              top: 8,
              bottom: 8,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgMenuWhiteA700,
                  height: getVerticalSize(
                    16,
                  ),
                  width: getHorizontalSize(
                    36,
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Add",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsMedium10Gray900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
