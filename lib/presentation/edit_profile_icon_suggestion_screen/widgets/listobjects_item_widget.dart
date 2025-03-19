import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';

// ignore: must_be_immutable
class ListobjectsItemWidget extends StatelessWidget {
  const ListobjectsItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 17,
        top: 15,
        right: 17,
        bottom: 15,
      ),
      decoration: AppDecoration.outlineBlack9003f.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomImageView(
            svgPath: ImageConstant.imgObjectsGray900,
            height: getSize(
              20,
            ),
            width: getSize(
              20,
            ),
            margin: getMargin(
              left: 9,
              top: 1,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 31,
              top: 1,
              bottom: 1,
            ),
            child: Text(
              "Phone Number",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsSemiBold12,
            ),
          ),
          Spacer(),
          CustomImageView(
            svgPath: ImageConstant.imgCheckmark,
            height: getVerticalSize(
              16,
            ),
            width: getHorizontalSize(
              36,
            ),
            margin: getMargin(
              top: 3,
              bottom: 1,
            ),
          ),
        ],
      ),
    );
  }
}
