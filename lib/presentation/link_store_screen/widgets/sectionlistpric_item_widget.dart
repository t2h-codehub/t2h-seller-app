import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class SectionlistpricItemWidget extends StatelessWidget {
  const SectionlistpricItemWidget({super.key});

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
          CustomIconButton(
            height: 33,
            width: 33,
            variant: IconButtonVariant.OutlineBlack9003f_3,
            child: CustomImageView(
              svgPath: ImageConstant.imgObjects,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 24,
              top: 7,
              bottom: 7,
            ),
            child: Text(
              "Phone Number",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsSemiBold12,
            ),
          ),
          Container(
            height: getVerticalSize(
              16,
            ),
            width: getHorizontalSize(
              36,
            ),
            margin: getMargin(
              left: 54,
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
