import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';

// ignore: must_be_immutable
class ListnameItemWidget extends StatelessWidget {
  const ListnameItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: double.maxFinite,
        child: Container(
          padding: getPadding(
            left: 23,
            top: 26,
            right: 23,
            bottom: 26,
          ),
          decoration: AppDecoration.outlineBlack9003f9.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: getPadding(
                  top: 37,
                ),
                child: Text(
                  "Janak Das",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsMedium8Gray900,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 19,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgLinkedin,
                      height: getSize(
                        9,
                      ),
                      width: getSize(
                        9,
                      ),
                      margin: getMargin(
                        bottom: 1,
                      ),
                    ),
                    Container(
                      height: getSize(
                        3,
                      ),
                      width: getSize(
                        3,
                      ),
                      margin: getMargin(
                        bottom: 9,
                      ),
                      decoration: BoxDecoration(
                        color: AppCol.indigo500,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            1,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: getSize(
                        12,
                      ),
                      width: getSize(
                        12,
                      ),
                      margin: getMargin(
                        left: 6,
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgSignalBlueGray90001,
                            height: getSize(
                              10,
                            ),
                            width: getSize(
                              10,
                            ),
                            alignment: Alignment.bottomLeft,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: getSize(
                                3,
                              ),
                              width: getSize(
                                3,
                              ),
                              decoration: BoxDecoration(
                                color: AppCol.indigo500,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
