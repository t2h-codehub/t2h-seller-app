import '../edit_profile_icon_suggestion_screen/widgets/listobjects_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
// import 'package:taptohello/widgets/app_bar/custom_app_bar.dart';
import 'package:taptohello/widgets/custom_button.dart';
import 'package:taptohello/widgets/custom_icon_button.dart';

class EditProfileIconSuggestionScreen extends StatelessWidget {
  const EditProfileIconSuggestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppCol.whiteA700,
           
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Divider(
                          height: getVerticalSize(1),
                          thickness: getVerticalSize(1),
                          color: AppCol.gray5003a),
                      Padding(
                          padding: getPadding(left: 55, top: 12, right: 54),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgGroup25,
                                    height: getVerticalSize(5),
                                    width: getHorizontalSize(21),
                                    margin: getMargin(top: 11, bottom: 6)),
                                SizedBox(
                                    height: getVerticalSize(23),
                                    width: getHorizontalSize(91),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  height: getVerticalSize(21),
                                                  width: getHorizontalSize(91),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  5)),
                                                      gradient: LinearGradient(
                                                          begin: Alignment(
                                                              0.5, -0.42),
                                                          end: Alignment(
                                                              0.5, 1.54),
                                                          colors: [
                                                            AppCol.gray6007f,
                                                            AppCol.whiteA7007f,
                                                            AppCol.gray6007f
                                                          ])))),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  width: getHorizontalSize(75),
                                                  margin: getMargin(
                                                      left: 8, right: 6),
                                                  decoration: AppDecoration
                                                      .outlineBlack9003f6,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 3,
                                                                bottom: 1),
                                                            child: Text(
                                                                "Add Card",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtPoppinsMedium12)),
                                                        Text("+",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsMedium15)
                                                      ])))
                                        ]))
                              ])),
                      Container(
                          margin: getMargin(left: 55, top: 14, right: 54),
                          decoration: AppDecoration.outlineBlack9003f6,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    padding: getPadding(
                                        left: 15, top: 5, right: 15, bottom: 5),
                                    decoration: AppDecoration
                                        .gradientGray6007fGray6007f
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder5),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: getSize(102),
                                              width: getSize(102),
                                              margin: getMargin(
                                                  top: 23, bottom: 23),
                                              decoration: BoxDecoration(
                                                  color: AppCol.gray700,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getHorizontalSize(
                                                              51)))),
                                          Padding(
                                              padding: getPadding(
                                                  left: 15,
                                                  top: 23,
                                                  bottom: 47),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text("Rohan Verma",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsSemiBold12),
                                                    Text("Designation",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsMedium12),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 15),
                                                        child: Text(
                                                            "+91 7248972507",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsMedium10Gray900)),
                                                    Text("rohan@email.com",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsMedium10Gray900)
                                                  ])),
                                          Padding(
                                              padding: getPadding(
                                                  left: 20, top: 119),
                                              child: Text(">",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsSemiBold20Gray700))
                                        ]))
                              ])),
                      Padding(
                          padding: getPadding(left: 55, top: 14, right: 54),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                    width: getHorizontalSize(133),
                                    text: "Edit Card",
                                    variant: ButtonVariant.OutlineBlack9003f,
                                    shape: ButtonShape.RoundedBorder5,
                                    padding: ButtonPadding.PaddingAll16,
                                    fontStyle: ButtonFontStyle.PoppinsMedium12),
                                CustomButton(
                                    width: getHorizontalSize(133),
                                    text: "Preview Card",
                                    margin: getMargin(left: 15),
                                    variant: ButtonVariant.OutlineBlack9003f,
                                    shape: ButtonShape.RoundedBorder5,
                                    padding: ButtonPadding.PaddingAll16,
                                    fontStyle: ButtonFontStyle.PoppinsMedium12)
                              ])),
                      Padding(
                          padding: getPadding(left: 55, top: 15, right: 54),
                          child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getVerticalSize(15));
                              },
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return ListobjectsItemWidget();
                              })),
                      Container(
                          margin: getMargin(left: 55, top: 15, right: 54),
                          padding: getPadding(
                              left: 69, top: 42, right: 69, bottom: 42),
                          decoration: AppDecoration.outlineBlack9003f.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: getHorizontalSize(141),
                                    margin: getMargin(top: 2),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "+\n",
                                              style: TextStyle(
                                                  color: AppCol.gray900,
                                                  fontSize: getFontSize(40),
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500)),
                                          TextSpan(
                                              text: "Add Info to Card\n",
                                              style: TextStyle(
                                                  color: AppCol.gray900,
                                                  fontSize: getFontSize(15),
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500)),
                                          TextSpan(
                                              text:
                                                  "contact info, links and more",
                                              style: TextStyle(
                                                  color: AppCol.gray900,
                                                  fontSize: getFontSize(10),
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500))
                                        ]),
                                        textAlign: TextAlign.center)),
                                SizedBox(height: 10),
                              ])),
                      Container(
                          margin: getMargin(left: 55, top: 15, right: 54),
                          padding: getPadding(
                              left: 19, top: 9, right: 19, bottom: 9),
                          decoration: AppDecoration.outlineBlack9003f.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomIconButton(
                                    height: 33,
                                    width: 33,
                                    margin: getMargin(left: 1),
                                    variant: IconButtonVariant.OutlineGray900,
                                    child: CustomImageView(
                                        svgPath:
                                            ImageConstant.imgVector1Gray900)),
                                Padding(
                                    padding:
                                        getPadding(left: 23, top: 7, bottom: 7),
                                    child: Text("Cover Video",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsMedium12)),
                                Spacer(),
                                Container(
                                    height: getVerticalSize(16),
                                    width: getHorizontalSize(36),
                                    margin: getMargin(top: 8, bottom: 8),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgMenuWhiteA700,
                                              height: getVerticalSize(16),
                                              width: getHorizontalSize(36),
                                              alignment: Alignment.center),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Text("Add",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsMedium10Gray900))
                                        ]))
                              ])),
                      Container(
                          height: getVerticalSize(94),
                          width: getHorizontalSize(391),
                          margin: getMargin(top: 38),
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    height: getVerticalSize(78),
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        color: AppCol.whiteA700))),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                    padding: getPadding(
                                        left: 45, right: 43, bottom: 14),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgUserIndigo500,
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
                                        width: getHorizontalSize(156),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: AppCol.gray5007f,
                                            endIndent: getHorizontalSize(1))))),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                    padding: getPadding(left: 35, bottom: 10),
                                    child: Text("PROFILE",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPoppinsRegular10Indigo500))),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: getPadding(right: 102, bottom: 11),
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
                                    padding: getPadding(right: 34, bottom: 11),
                                    child: Text("SETTINGS",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPoppinsRegular10Gray700))),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: getPadding(top: 16),
                                    child: SizedBox(
                                        width: getHorizontalSize(155),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: AppCol.gray5007f))))
                          ]))
                    ]))));
  }

  onTapArrowleft14(BuildContext context) {
    Navigator.pop(context);
  }
}
