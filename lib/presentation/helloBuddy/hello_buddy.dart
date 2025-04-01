import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/core/utils/size_utils.dart';
import 'package:taptohello/theme/app_decoration.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';

class HelloBuddy extends ConsumerStatefulWidget {
  const HelloBuddy({super.key});

  @override
  ConsumerState<HelloBuddy> createState() => _ActivateDeviceScreenState();
}

class _ActivateDeviceScreenState extends ConsumerState<HelloBuddy> {
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
          "Hello Buddy",
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
                height: 204,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          "assets/newIcons/circle_path.png",
                        ))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24, bottom: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
                        child: Center(
                          child: Text(
                              "Apply now to become a Hello  Buddy and monetize your network. Get bonus on each Hello device purchased by your network using your referral code.",
                              style: TextStyle(
                                // color: ColorConstant.indigo500,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Container(
                          width: 136,
                          height: 45,
                          decoration: BoxDecoration(
                              color: AppCol.primary,
                              borderRadius: BorderRadius.circular(23)),
                          child: Center(
                            child: Text("Apply now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                          )),
                    ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
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
                              Text("Hello Buddy code connected with profile",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  )),
                              SizedBox(height: 16),
                              CustomTextFormField(
                                label: "Hello Buddy Code",
                                suffix: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16.0, 16, 14, 16),
                                  child:
                                      Image.asset("assets/newIcons/ticket.png"),
                                ),
                              )
                            ],
                          ))),
                ],
              ),
              SizedBox(height: 10),
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
                              Text("Your Hello Buddy Bonus for this month",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  )),
                              SizedBox(height: 16),
                              CustomTextFormField(
                                label: "Hello Buddy Code",
                                suffix: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16.0, 16, 14, 16),
                                  child:
                                      Image.asset("assets/newIcons/bonus.png"),
                                ),
                              )
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
