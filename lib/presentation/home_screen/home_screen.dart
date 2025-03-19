import '../home_screen/widgets/list_item_widget.dart';
import '../home_screen/widgets/listname_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppCol.whiteA700,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 55, top: 19, right: 54),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgLayer1,
                                        height: getVerticalSize(24),
                                        width: getHorizontalSize(54)),
                                    CustomButton(
                                        width: getHorizontalSize(62),
                                        text: "Invite",
                                        margin: getMargin(top: 3, bottom: 3),
                                        prefixWidget: Container(
                                            margin: getMargin(right: 3),
                                            child: CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgLayer17x7,
                                                height: getSize(7),
                                                width: getSize(7))))
                                  ]))),
                      Padding(
                          padding: getPadding(top: 15),
                          child: Divider(
                              height: getVerticalSize(1),
                              thickness: getVerticalSize(1),
                              color: AppCol.gray5003a)),
                      Padding(
                          padding: getPadding(left: 55, top: 13),
                          child: Text("Home",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsSemiBold20Bluegray900)),
                      Padding(
                          padding: getPadding(left: 55),
                          child: Text(
                              "Tap on a contact’s card to view updates from them",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium10Gray700)),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getVerticalSize(547),
                              width: getHorizontalSize(283),
                              margin: getMargin(top: 19),
                              child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                            margin: getMargin(
                                                left: 3,
                                                top: 138,
                                                right: 190,
                                                bottom: 276),
                                            padding: getPadding(
                                                left: 14,
                                                top: 26,
                                                right: 14,
                                                bottom: 26),
                                            decoration: AppDecoration
                                                .outlineBlack9003f7
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                      height: getSize(11),
                                                      width: getSize(11),
                                                      margin: getMargin(
                                                          top: 69, bottom: 1),
                                                      child: Stack(
                                                          alignment: Alignment
                                                              .topRight,
                                                          children: [
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgLayer1Gray900,
                                                                height:
                                                                    getSize(9),
                                                                width:
                                                                    getSize(9),
                                                                alignment: Alignment
                                                                    .bottomLeft),
                                                            Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child: Container(
                                                                    height:
                                                                        getSize(
                                                                            3),
                                                                    width:
                                                                        getSize(
                                                                            3),
                                                                    decoration: BoxDecoration(
                                                                        color: AppCol
                                                                            .indigo500,
                                                                        borderRadius:
                                                                            BorderRadius.circular(getHorizontalSize(1)))))
                                                          ])),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 36),
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("Leah Dias",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtPoppinsMedium8Gray900),
                                                            Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: Padding(
                                                                    padding: getPadding(
                                                                        top: 20,
                                                                        right:
                                                                            5),
                                                                    child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Container(
                                                                              height: getSize(3),
                                                                              width: getSize(3),
                                                                              decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1)))),
                                                                          Container(
                                                                              height: getSize(3),
                                                                              width: getSize(3),
                                                                              margin: getMargin(left: 14),
                                                                              decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1))))
                                                                        ]))),
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgTwitterGray900,
                                                                      height:
                                                                          getVerticalSize(
                                                                              7),
                                                                      width:
                                                                          getHorizontalSize(
                                                                              9),
                                                                      margin: getMargin(
                                                                          bottom:
                                                                              2),
                                                                      onTap:
                                                                          () {
                                                                        onTapImgTwitter(
                                                                            context);
                                                                      }),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgGlobe,
                                                                      height:
                                                                          getSize(
                                                                              9),
                                                                      width:
                                                                          getSize(
                                                                              9),
                                                                      margin: getMargin(
                                                                          left:
                                                                              9))
                                                                ])
                                                          ])),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgLayer1Gray9009x5,
                                                      height:
                                                          getVerticalSize(9),
                                                      width:
                                                          getHorizontalSize(5),
                                                      margin: getMargin(
                                                          left: 3,
                                                          top: 71,
                                                          bottom: 1)),
                                                  Container(
                                                      height: getSize(3),
                                                      width: getSize(3),
                                                      margin: getMargin(
                                                          top: 69, bottom: 9),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              AppCol.indigo500,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      1))))
                                                ]))),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                            margin: getMargin(
                                                right: 193, bottom: 414),
                                            padding: getPadding(
                                                left: 11,
                                                top: 26,
                                                right: 11,
                                                bottom: 26),
                                            decoration: AppDecoration
                                                .outlineBlack9003f8
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                      height: getSize(11),
                                                      width: getSize(11),
                                                      margin: getMargin(
                                                          top: 69, bottom: 1),
                                                      child: Stack(
                                                          alignment: Alignment
                                                              .topRight,
                                                          children: [
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgLayer1Gray900,
                                                                height:
                                                                    getSize(9),
                                                                width:
                                                                    getSize(9),
                                                                alignment: Alignment
                                                                    .bottomLeft),
                                                            Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child: Container(
                                                                    height:
                                                                        getSize(
                                                                            3),
                                                                    width:
                                                                        getSize(
                                                                            3),
                                                                    decoration: BoxDecoration(
                                                                        color: AppCol
                                                                            .indigo500,
                                                                        borderRadius:
                                                                            BorderRadius.circular(getHorizontalSize(1)))))
                                                          ])),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 4, top: 37),
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("Pia Roy",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtPoppinsMedium8Gray900),
                                                            Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: Padding(
                                                                    padding:
                                                                        getPadding(
                                                                            top:
                                                                                19),
                                                                    child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Container(
                                                                              height: getSize(3),
                                                                              width: getSize(3),
                                                                              decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1)))),
                                                                          Container(
                                                                              height: getSize(3),
                                                                              width: getSize(3),
                                                                              margin: getMargin(left: 14),
                                                                              decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1))))
                                                                        ]))),
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgTwitterGray900,
                                                                      height:
                                                                          getVerticalSize(
                                                                              7),
                                                                      width:
                                                                          getHorizontalSize(
                                                                              9),
                                                                      margin: getMargin(
                                                                          bottom:
                                                                              2),
                                                                      onTap:
                                                                          () {
                                                                        onTapImgTwitterone(
                                                                            context);
                                                                      }),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgGlobe,
                                                                      height:
                                                                          getSize(
                                                                              9),
                                                                      width:
                                                                          getSize(
                                                                              9),
                                                                      margin: getMargin(
                                                                          left:
                                                                              9))
                                                                ])
                                                          ])),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgLayer1Gray9009x5,
                                                      height:
                                                          getVerticalSize(9),
                                                      width:
                                                          getHorizontalSize(5),
                                                      margin: getMargin(
                                                          left: 8,
                                                          top: 71,
                                                          bottom: 1)),
                                                  Container(
                                                      height: getSize(3),
                                                      width: getSize(3),
                                                      margin: getMargin(
                                                          top: 69, bottom: 9),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              AppCol.indigo500,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      1))))
                                                ]))),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                            margin: getMargin(top: 138),
                                            padding: getPadding(
                                                left: 19,
                                                top: 26,
                                                right: 19,
                                                bottom: 26),
                                            decoration: AppDecoration
                                                .outlineBlack9003f8
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 36),
                                                      child: Text(
                                                          "K. Shrivastav",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPoppinsMedium8Gray900)),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 20),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                                height:
                                                                    getSize(11),
                                                                width:
                                                                    getSize(11),
                                                                margin:
                                                                    getMargin(
                                                                        bottom:
                                                                            1),
                                                                child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgLayer1Gray900,
                                                                          height: getSize(
                                                                              9),
                                                                          width: getSize(
                                                                              9),
                                                                          alignment:
                                                                              Alignment.bottomLeft),
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .topRight,
                                                                          child: Container(
                                                                              height: getSize(3),
                                                                              width: getSize(3),
                                                                              decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1)))))
                                                                    ])),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            6),
                                                                child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .centerRight,
                                                                          child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Container(height: getSize(3), width: getSize(3), decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1)))),
                                                                                Container(height: getSize(3), width: getSize(3), margin: getMargin(left: 14), decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1))))
                                                                              ])),
                                                                      Row(
                                                                          children: [
                                                                            CustomImageView(
                                                                                svgPath: ImageConstant.imgTwitterGray900,
                                                                                height: getVerticalSize(7),
                                                                                width: getHorizontalSize(9),
                                                                                margin: getMargin(bottom: 2),
                                                                                onTap: () {
                                                                                  onTapImgTwittertwo(context);
                                                                                }),
                                                                            CustomImageView(
                                                                                svgPath: ImageConstant.imgGlobe,
                                                                                height: getSize(9),
                                                                                width: getSize(9),
                                                                                margin: getMargin(left: 9))
                                                                          ])
                                                                    ]))
                                                          ]))
                                                ]))),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Padding(
                                            padding: getPadding(
                                                left: 98,
                                                right: 95,
                                                bottom: 138),
                                            child: ListView.separated(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                separatorBuilder:
                                                    (context, index) {
                                                  return SizedBox(
                                                      height:
                                                          getVerticalSize(5));
                                                },
                                                itemCount: 3,
                                                itemBuilder: (context, index) {
                                                  return ListnameItemWidget();
                                                }))),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                            margin: getMargin(
                                                left: 3, top: 414, right: 190),
                                            padding: getPadding(
                                                left: 14,
                                                top: 26,
                                                right: 14,
                                                bottom: 26),
                                            decoration: AppDecoration
                                                .outlineBlack9003f11
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                      height: getSize(11),
                                                      width: getSize(11),
                                                      margin: getMargin(
                                                          top: 69, bottom: 1),
                                                      child: Stack(
                                                          alignment: Alignment
                                                              .topRight,
                                                          children: [
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgLayer1Gray900,
                                                                height:
                                                                    getSize(9),
                                                                width:
                                                                    getSize(9),
                                                                alignment: Alignment
                                                                    .bottomLeft),
                                                            Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child: Container(
                                                                    height:
                                                                        getSize(
                                                                            3),
                                                                    width:
                                                                        getSize(
                                                                            3),
                                                                    decoration: BoxDecoration(
                                                                        color: AppCol
                                                                            .indigo500,
                                                                        borderRadius:
                                                                            BorderRadius.circular(getHorizontalSize(1)))))
                                                          ])),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 37),
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("Aditya M.",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtPoppinsMedium8Gray900),
                                                            Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: Padding(
                                                                    padding: getPadding(
                                                                        top: 19,
                                                                        right:
                                                                            3),
                                                                    child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Container(
                                                                              height: getSize(3),
                                                                              width: getSize(3),
                                                                              decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1)))),
                                                                          Container(
                                                                              height: getSize(3),
                                                                              width: getSize(3),
                                                                              margin: getMargin(left: 14),
                                                                              decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1))))
                                                                        ]))),
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgTwitterGray900,
                                                                      height:
                                                                          getVerticalSize(
                                                                              7),
                                                                      width:
                                                                          getHorizontalSize(
                                                                              9),
                                                                      margin: getMargin(
                                                                          bottom:
                                                                              2),
                                                                      onTap:
                                                                          () {
                                                                        onTapImgTwitterthree(
                                                                            context);
                                                                      }),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgGlobe,
                                                                      height:
                                                                          getSize(
                                                                              9),
                                                                      width:
                                                                          getSize(
                                                                              9),
                                                                      margin: getMargin(
                                                                          left:
                                                                              9))
                                                                ])
                                                          ])),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgLayer1Gray9009x5,
                                                      height:
                                                          getVerticalSize(9),
                                                      width:
                                                          getHorizontalSize(5),
                                                      margin: getMargin(
                                                          left: 4,
                                                          top: 71,
                                                          bottom: 1)),
                                                  Container(
                                                      height: getSize(3),
                                                      width: getSize(3),
                                                      margin: getMargin(
                                                          top: 69, bottom: 9),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              AppCol.indigo500,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      1))))
                                                ]))),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                            padding: getPadding(
                                                left: 22, bottom: 194),
                                            child: Text("Mahek Singh",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsMedium8Gray900))),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                            padding: getPadding(
                                                left: 11,
                                                top: 26,
                                                right: 11,
                                                bottom: 26),
                                            decoration: AppDecoration
                                                .outlineBlack9003f7
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 37),
                                                      child: Text(
                                                          "Janushree Dutta",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPoppinsMedium8Gray900)),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 19),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                                height:
                                                                    getSize(11),
                                                                width:
                                                                    getSize(11),
                                                                margin:
                                                                    getMargin(
                                                                        bottom:
                                                                            1),
                                                                child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgLayer1Gray900,
                                                                          height: getSize(
                                                                              9),
                                                                          width: getSize(
                                                                              9),
                                                                          alignment:
                                                                              Alignment.bottomLeft),
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .topRight,
                                                                          child: Container(
                                                                              height: getSize(3),
                                                                              width: getSize(3),
                                                                              decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1)))))
                                                                    ])),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            6),
                                                                child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .centerRight,
                                                                          child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Container(height: getSize(3), width: getSize(3), decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1)))),
                                                                                Container(height: getSize(3), width: getSize(3), margin: getMargin(left: 14), decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1))))
                                                                              ])),
                                                                      Row(
                                                                          children: [
                                                                            CustomImageView(
                                                                                svgPath: ImageConstant.imgTwitterGray900,
                                                                                height: getVerticalSize(7),
                                                                                width: getHorizontalSize(9),
                                                                                margin: getMargin(bottom: 2),
                                                                                onTap: () {
                                                                                  onTapImgTwitterfour(context);
                                                                                }),
                                                                            CustomImageView(
                                                                                svgPath: ImageConstant.imgGlobe,
                                                                                height: getSize(9),
                                                                                width: getSize(9),
                                                                                margin: getMargin(left: 9))
                                                                          ])
                                                                    ]))
                                                          ]))
                                                ]))),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                            margin: getMargin(
                                                left: 3,
                                                top: 276,
                                                right: 190,
                                                bottom: 138),
                                            padding: getPadding(
                                                left: 14,
                                                top: 26,
                                                right: 14,
                                                bottom: 26),
                                            decoration: AppDecoration
                                                .outlineBlack9003f7
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                      height: getSize(11),
                                                      width: getSize(11),
                                                      margin: getMargin(
                                                          top: 69, bottom: 1),
                                                      child: Stack(
                                                          alignment: Alignment
                                                              .topRight,
                                                          children: [
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgLayer1Gray900,
                                                                height:
                                                                    getSize(9),
                                                                width:
                                                                    getSize(9),
                                                                alignment: Alignment
                                                                    .bottomLeft),
                                                            Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child: Container(
                                                                    height:
                                                                        getSize(
                                                                            3),
                                                                    width:
                                                                        getSize(
                                                                            3),
                                                                    decoration: BoxDecoration(
                                                                        color: AppCol
                                                                            .indigo500,
                                                                        borderRadius:
                                                                            BorderRadius.circular(getHorizontalSize(1)))))
                                                          ])),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 6, top: 69),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Container(
                                                                          height: getSize(
                                                                              3),
                                                                          width: getSize(
                                                                              3),
                                                                          decoration: BoxDecoration(
                                                                              color: AppCol.indigo500,
                                                                              borderRadius: BorderRadius.circular(getHorizontalSize(1)))),
                                                                      Container(
                                                                          height: getSize(
                                                                              3),
                                                                          width: getSize(
                                                                              3),
                                                                          margin: getMargin(
                                                                              left:
                                                                                  14),
                                                                          decoration: BoxDecoration(
                                                                              color: AppCol.indigo500,
                                                                              borderRadius: BorderRadius.circular(getHorizontalSize(1))))
                                                                    ])),
                                                            Row(children: [
                                                              CustomImageView(
                                                                  svgPath:
                                                                      ImageConstant
                                                                          .imgTwitterGray900,
                                                                  height:
                                                                      getVerticalSize(
                                                                          7),
                                                                  width:
                                                                      getHorizontalSize(
                                                                          9),
                                                                  margin:
                                                                      getMargin(
                                                                          bottom:
                                                                              2),
                                                                  onTap: () {
                                                                    onTapImgTwitterfive(
                                                                        context);
                                                                  }),
                                                              CustomImageView(
                                                                  svgPath:
                                                                      ImageConstant
                                                                          .imgGlobe,
                                                                  height:
                                                                      getSize(
                                                                          9),
                                                                  width:
                                                                      getSize(
                                                                          9),
                                                                  margin:
                                                                      getMargin(
                                                                          left:
                                                                              9))
                                                            ])
                                                          ])),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgLayer1Gray9009x5,
                                                      height:
                                                          getVerticalSize(9),
                                                      width:
                                                          getHorizontalSize(5),
                                                      margin: getMargin(
                                                          left: 8, top: 71)),
                                                  Container(
                                                      height: getSize(3),
                                                      width: getSize(3),
                                                      margin: getMargin(
                                                          top: 69, bottom: 9),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              AppCol.indigo500,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      1))))
                                                ]))),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                            padding: getPadding(
                                                left: 22,
                                                top: 26,
                                                right: 22,
                                                bottom: 26),
                                            decoration: AppDecoration
                                                .outlineBlack9003f7
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 37),
                                                      child: Text("Rhea Khan",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPoppinsMedium8Gray900)),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 19),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                                height:
                                                                    getSize(11),
                                                                width:
                                                                    getSize(11),
                                                                margin:
                                                                    getMargin(
                                                                        bottom:
                                                                            1),
                                                                child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgLayer1Gray900,
                                                                          height: getSize(
                                                                              9),
                                                                          width: getSize(
                                                                              9),
                                                                          alignment:
                                                                              Alignment.bottomLeft),
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .topRight,
                                                                          child: Container(
                                                                              height: getSize(3),
                                                                              width: getSize(3),
                                                                              decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1)))))
                                                                    ])),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            6),
                                                                child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .centerRight,
                                                                          child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Container(height: getSize(3), width: getSize(3), decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1)))),
                                                                                Container(height: getSize(3), width: getSize(3), margin: getMargin(left: 14), decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1))))
                                                                              ])),
                                                                      Row(
                                                                          children: [
                                                                            CustomImageView(
                                                                                svgPath: ImageConstant.imgTwitterGray900,
                                                                                height: getVerticalSize(7),
                                                                                width: getHorizontalSize(9),
                                                                                margin: getMargin(bottom: 2),
                                                                                onTap: () {
                                                                                  onTapImgTwittersix(context);
                                                                                }),
                                                                            CustomImageView(
                                                                                svgPath: ImageConstant.imgGlobe,
                                                                                height: getSize(9),
                                                                                width: getSize(9),
                                                                                margin: getMargin(left: 9))
                                                                          ])
                                                                    ]))
                                                          ]))
                                                ]))),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                            margin: getMargin(bottom: 138),
                                            padding: getPadding(
                                                left: 16,
                                                top: 26,
                                                right: 16,
                                                bottom: 26),
                                            decoration: AppDecoration
                                                .outlineBlack9003f9
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 37),
                                                      child: Text(
                                                          "D. Kulshreshth",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPoppinsMedium8Gray900)),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 19),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                                height:
                                                                    getSize(11),
                                                                width:
                                                                    getSize(11),
                                                                margin:
                                                                    getMargin(
                                                                        bottom:
                                                                            1),
                                                                child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgLayer1Gray900,
                                                                          height: getSize(
                                                                              9),
                                                                          width: getSize(
                                                                              9),
                                                                          alignment:
                                                                              Alignment.bottomLeft),
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .topRight,
                                                                          child: Container(
                                                                              height: getSize(3),
                                                                              width: getSize(3),
                                                                              decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1)))))
                                                                    ])),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            6),
                                                                child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .centerRight,
                                                                          child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Container(height: getSize(3), width: getSize(3), decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1)))),
                                                                                Container(height: getSize(3), width: getSize(3), margin: getMargin(left: 14), decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1))))
                                                                              ])),
                                                                      Row(
                                                                          children: [
                                                                            CustomImageView(
                                                                                svgPath: ImageConstant.imgTwitterGray900,
                                                                                height: getVerticalSize(7),
                                                                                width: getHorizontalSize(9),
                                                                                margin: getMargin(bottom: 2),
                                                                                onTap: () {
                                                                                  onTapImgTwitterseven(context);
                                                                                }),
                                                                            CustomImageView(
                                                                                svgPath: ImageConstant.imgGlobe,
                                                                                height: getSize(9),
                                                                                width: getSize(9),
                                                                                margin: getMargin(left: 9))
                                                                          ])
                                                                    ]))
                                                          ]))
                                                ]))),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                            margin:
                                                getMargin(left: 98, right: 95),
                                            padding: getPadding(
                                                left: 17,
                                                top: 26,
                                                right: 17,
                                                bottom: 26),
                                            decoration: AppDecoration
                                                .outlineBlack9003f9
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 38),
                                                      child: Text(
                                                          "Geeta Kapoor",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPoppinsMedium8Gray900)),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 18),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgLinkedin,
                                                                height:
                                                                    getSize(9),
                                                                width:
                                                                    getSize(9),
                                                                margin:
                                                                    getMargin(
                                                                        bottom:
                                                                            1)),
                                                            Container(
                                                                height:
                                                                    getSize(3),
                                                                width:
                                                                    getSize(3),
                                                                margin:
                                                                    getMargin(
                                                                        bottom:
                                                                            9),
                                                                decoration: BoxDecoration(
                                                                    color: AppCol
                                                                        .indigo500,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            getHorizontalSize(1)))),
                                                            Container(
                                                                height:
                                                                    getSize(12),
                                                                width:
                                                                    getSize(12),
                                                                margin:
                                                                    getMargin(
                                                                        left:
                                                                            6),
                                                                child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgSignalBlueGray90001,
                                                                          height: getSize(
                                                                              10),
                                                                          width: getSize(
                                                                              10),
                                                                          alignment:
                                                                              Alignment.bottomLeft),
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .topRight,
                                                                          child: Container(
                                                                              height: getSize(3),
                                                                              width: getSize(3),
                                                                              decoration: BoxDecoration(color: AppCol.indigo500, borderRadius: BorderRadius.circular(getHorizontalSize(1)))))
                                                                    ]))
                                                          ]))
                                                ]))),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Padding(
                                            padding: getPadding(
                                                left: 28,
                                                top: 17,
                                                right: 25,
                                                bottom: 76),
                                            child: ListView.separated(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                separatorBuilder:
                                                    (context, index) {
                                                  return SizedBox(
                                                      height:
                                                          getVerticalSize(97));
                                                },
                                                itemCount: 4,
                                                itemBuilder: (context, index) {
                                                  return ListItemWidget();
                                                })))
                                  ]))),
                      Container(
                          height: getVerticalSize(94),
                          width: double.maxFinite,
                          margin: getMargin(top: 62),
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgRectangle154,
                                height: getVerticalSize(78),
                                width: getHorizontalSize(389),
                                alignment: Alignment.bottomCenter),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                    padding: getPadding(
                                        left: 45, right: 42, bottom: 14),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgUserGray700,
                                              height: getVerticalSize(20),
                                              width: getHorizontalSize(18),
                                              margin: getMargin(
                                                  top: 37, bottom: 22)),
                                          CustomImageView(
                                              svgPath: ImageConstant.imgQrcode,
                                              height: getVerticalSize(80),
                                              width: getHorizontalSize(81)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgSettingsGray700,
                                              height: getSize(26),
                                              width: getSize(26),
                                              margin: getMargin(
                                                  top: 34, bottom: 19))
                                        ]))),
                            Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                    padding: getPadding(top: 16),
                                    child: SizedBox(
                                        width: getHorizontalSize(155),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: AppCol.gray5007f)))),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: getPadding(top: 16),
                                    child: SizedBox(
                                        width: getHorizontalSize(155),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: AppCol.gray5007f)))),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                    padding: getPadding(left: 35, bottom: 10),
                                    child: Text("PROFILE",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPoppinsRegular10Gray700))),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: getPadding(right: 101, bottom: 11),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgUserGray70024x25,
                                              height: getVerticalSize(24),
                                              width: getHorizontalSize(25),
                                              margin: getMargin(left: 12)),
                                          Padding(
                                              padding: getPadding(top: 9),
                                              child: Text("CONTACTS",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsRegular10Gray700))
                                        ]))),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                    padding: getPadding(bottom: 10),
                                    child: Text("SHARE",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPoppinsRegular10Gray700))),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                    padding: getPadding(left: 111, bottom: 10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgCalendar,
                                              height: getSize(25),
                                              width: getSize(25)),
                                          Padding(
                                              padding: getPadding(top: 8),
                                              child: Text("SCAN",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsRegular10Gray700))
                                        ]))),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: getPadding(right: 33, bottom: 11),
                                    child: Text("SETTINGS",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPoppinsRegular10Gray700)))
                          ]))
                    ]))));
  }

  onTapImgTwitter(BuildContext context) async {
    var url = 'https://twitter.com/login/';
    if (!await launch(url)) {
      throw 'Could not launch https://twitter.com/login/';
    }
  }

  onTapImgTwitterone(BuildContext context) async {
    var url = 'https://twitter.com/login/';
    if (!await launch(url)) {
      throw 'Could not launch https://twitter.com/login/';
    }
  }

  onTapImgTwittertwo(BuildContext context) async {
    var url = 'https://twitter.com/login/';
    if (!await launch(url)) {
      throw 'Could not launch https://twitter.com/login/';
    }
  }

  onTapImgTwitterthree(BuildContext context) async {
    var url = 'https://twitter.com/login/';
    if (!await launch(url)) {
      throw 'Could not launch https://twitter.com/login/';
    }
  }

  onTapImgTwitterfour(BuildContext context) async {
    var url = 'https://twitter.com/login/';
    if (!await launch(url)) {
      throw 'Could not launch https://twitter.com/login/';
    }
  }

  onTapImgTwitterfive(BuildContext context) async {
    var url = 'https://twitter.com/login/';
    if (!await launch(url)) {
      throw 'Could not launch https://twitter.com/login/';
    }
  }

  onTapImgTwittersix(BuildContext context) async {
    var url = 'https://twitter.com/login/';
    if (!await launch(url)) {
      throw 'Could not launch https://twitter.com/login/';
    }
  }

  onTapImgTwitterseven(BuildContext context) async {
    var url = 'https://twitter.com/login/';
    if (!await launch(url)) {
      throw 'Could not launch https://twitter.com/login/';
    }
  }
}
