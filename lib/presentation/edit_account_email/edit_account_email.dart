import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/core/utils/size_utils.dart';
import 'package:taptohello/theme/app_decoration.dart';
import 'package:taptohello/theme/app_style.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';

class EditAccountEmail extends ConsumerStatefulWidget {
  const EditAccountEmail({super.key});

  @override
  ConsumerState<EditAccountEmail> createState() => _ActivateDeviceScreenState();
}

class _ActivateDeviceScreenState extends ConsumerState<EditAccountEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCol.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Image.asset(
                "assets/images/back.png",
                height: 24,
              )),
        ),
        title: Text(
          "Edit your profile link",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          "assets/newIcons/circle_path.png",
                        ))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 28, bottom: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          width: 327,
                          child: Text(
                            //'Choose a profile link for your Hello profile to be shared as a link in Bio on social patforms',
                            'Customize shop link for your SocioShop',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                children: [
                  Container(
                      padding:
                          getPadding(left: 24, top: 24, right: 24, bottom: 24),
                      decoration: AppDecoration.outlineBlack9003f.copyWith(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: Padding(
                          padding: getPadding(bottom: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                label: "Profile Link",
                                suffix: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16.0, 16, 14, 16),
                                  child: Image.asset(
                                      "assets/newIcons/pro_link.png"),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 24.0, bottom: 24),
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'taptohello.com',
                                          style: TextStyle(
                                            color: Color(0xFF666666),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.16,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '/',
                                          style: TextStyle(
                                            color: Color(0xFF666666),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.16,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'abcd1234',
                                          style: TextStyle(
                                            color: Color(0xFF1E1E1E),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {},
                                child: SizedBox(
                                  height: getVerticalSize(
                                    55,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          padding: getPadding(
                                            left: 16,
                                            top: 16,
                                            right: 16,
                                            bottom: 16,
                                          ),
                                          // height: getVerticalSize(
                                          //   60,
                                          // ),
                                          // width: getHorizontalSize(
                                          //   281,
                                          // ),
                                          decoration: BoxDecoration(
                                            color: AppCol.primary,
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        // alignment: Alignment.bottomCenter,
                                        child: Text(
                                          "Update Profile Link",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsBold15
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ))),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
