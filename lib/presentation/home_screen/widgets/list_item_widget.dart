import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/app_export.dart';

// ignore: must_be_immutable
class ListItemWidget extends StatelessWidget {
  ListItemWidget();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgWhatsappimage20230320,
            height: getSize(
              40,
            ),
            width: getSize(
              40,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                20,
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgWhatsappimage2023032040x40,
            height: getSize(
              40,
            ),
            width: getSize(
              40,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                20,
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgWhatsappimage202303201,
            height: getSize(
              40,
            ),
            width: getSize(
              40,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
