// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:taptohello/core/constants.dart';
// import 'package:taptohello/core/utils/color_constant.dart';
// import 'package:taptohello/core/utils/size_utils.dart';
// import 'package:taptohello/data/auth/model/edit_profile_link.dart';
// import 'package:taptohello/helper/base_screen_view.dart';
// import 'package:taptohello/helper/locator.dart';
// import 'package:taptohello/helper/user_detail_service.dart';
// import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
// import 'package:taptohello/theme/app_decoration.dart';
// import 'package:taptohello/theme/app_style.dart';
// import 'package:taptohello/widgets/custom_text_form_field.dart';

// class EditLink extends ConsumerStatefulWidget {
//   const EditLink({super.key});

//   @override
//   ConsumerState<EditLink> createState() => _ActivateDeviceScreenState();
// }

// class _ActivateDeviceScreenState extends ConsumerState<EditLink>
//     with BaseScreenView {
//   late AuthViewModel model;
//   TextEditingController linkController = TextEditingController();
//   final UserDetailService _userDetailService = getIt<UserDetailService>();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     linkController.text =
//         _userDetailService.userDetailResponse?.user?.username ?? "";

//     model = ref.read(authViewModel);
//     model.attachView(this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     model = ref.watch(authViewModel);
//     return Scaffold(
//       backgroundColor: AppCol.bgColor,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: InkWell(
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//           child: Padding(
//               padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//               child: Image.asset(
//                 "assets/images/back.png",
//                 height: 24,
//               )),
//         ),
//         title: Text(
//           "Edit your profile link",
//           style: TextStyle(color: Colors.black, fontSize: 17),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Stack(
//             children: [
//               Container(
//                 height: 110,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         fit: BoxFit.fill,
//                         image: AssetImage(
//                           "assets/newIcons/circle_path.png",
//                         ))),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 28, bottom: 24),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Center(
//                         child: SizedBox(
//                           width: 327,
//                           child: Text(
//                             'Choose a profile link for your Hello profile to be shared as a link in Bio on social patforms',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Color(0xFF666666),
//                               fontSize: 15,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                       )
//                     ]),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 0),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Column(
//                 children: [
//                   Container(
//                       padding:
//                           getPadding(left: 24, top: 24, right: 24, bottom: 24),
//                       decoration: AppDecoration.outlineBlack9003f.copyWith(
//                           borderRadius: BorderRadius.circular(12),
//                           color: Colors.white),
//                       child: Padding(
//                           padding: getPadding(bottom: 6),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             //RegExp(r"[!*'\(\);:@&=\+\$,\/\?\#\[\] A-Za-z0-9_.~%-]")
//                             //RegExp(r'^[0-9]+.?[0-9]*')
//                             children: [
//                               CustomTextFormField(
                               
//                                  inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r"[a-z0-9;,/?:@&=+$\-_.!~*'()#]"))],
//                                 onChange: (val) {
//                                   setState(() {});
//                                 },
                                 
//                                  validator: (value) {
//                                       return null;
//                                     },
                                
//                                 controller: linkController,
//                                 label: "Profile Link",
//                                 suffix: Padding(
//                                   padding: const EdgeInsets.fromLTRB(
//                                       16.0, 16, 14, 16),
//                                   child: Image.asset(
//                                       "assets/newIcons/pro_link.png"),
//                                 ),
//                               ),
//                               Center(
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                       top: 24.0, bottom: 24),
//                                   child: Text.rich(
//                                     TextSpan(
//                                       children: [
//                                         TextSpan(
//                                           text: '${AppConstants.storeUrl}',
//                                           style: TextStyle(
//                                             color: Color(0xFF666666),
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w400,
//                                             letterSpacing: 0.16,
//                                           ),
//                                         ),
//                                         TextSpan(
//                                           text: '/',
//                                           style: TextStyle(
//                                             color: Color(0xFF666666),
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500,
//                                             letterSpacing: 0.16,
//                                           ),
//                                         ),
//                                         TextSpan(
//                                           text: linkController.text.toLowerCase(),
//                                           style: TextStyle(
//                                             color: Color(0xFF1E1E1E),
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500,
//                                             letterSpacing: 0.16,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                               ),
//                               InkWell(
//                                 splashColor: Colors.transparent,
//                                 highlightColor: Colors.transparent,
//                                 onTap: () {
//                                   if (linkController.text.isNotEmpty) {
//                                     model.editProfileLinkRequest = EditProfileLinkRequest(username: linkController.text.toLowerCase());
//                                     model.editProfileLink(model.editProfileLinkRequest, context);
//                                   }
//                                 },
//                                 child: SizedBox(
//                                   height: getVerticalSize(
//                                     55,
//                                   ),
//                                   child: Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       Align(
//                                         alignment: Alignment.center,
//                                         child: Container(
//                                           padding: getPadding(
//                                             left: 16,
//                                             top: 16,
//                                             right: 16,
//                                             bottom: 16,
//                                           ),
//                                           // height: getVerticalSize(
//                                           //   60,
//                                           // ),
//                                           // width: getHorizontalSize(
//                                           //   281,
//                                           // ),
//                                           decoration: BoxDecoration(
//                                             color: AppCol.primary,
//                                             borderRadius: BorderRadius.circular(
//                                               getHorizontalSize(
//                                                 10,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Center(
//                                         // alignment: Alignment.bottomCenter,
//                                         child: Text(
//                                           "Update Profile Link",
//                                           overflow: TextOverflow.ellipsis,
//                                           textAlign: TextAlign.left,
//                                           style: AppStyle.txtPoppinsBold15
//                                               .copyWith(
//                                                   fontSize: 16,
//                                                   color: Colors.white),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ))),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void showSnackbar(String message, {Color? color}) {
//     final snackBar = SnackBar(
//       backgroundColor: color,
//       content: Text(message.toString()),
//       action: SnackBarAction(
//         label: 'Close',
//         onPressed: () {
//           ScaffoldMessenger.of(context).clearSnackBars();
//           // Some code to undo the change.
//         },
//       ),
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     // TODO: implement showSnackbar
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/core/utils/size_utils.dart';
import 'package:taptohello/data/auth/model/edit_profile_link.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
import 'package:taptohello/theme/app_decoration.dart';
import 'package:taptohello/theme/app_style.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';

class EditLink extends ConsumerStatefulWidget {
  const EditLink({super.key});

  @override
  ConsumerState<EditLink> createState() => _EditLinkState();
}

class _EditLinkState extends ConsumerState<EditLink> with BaseScreenView {
  late AuthViewModel model;
  TextEditingController linkController = TextEditingController();
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  bool isWarningVisible = false; // Flag to show warning

  @override
  void initState() {
    super.initState();
    String initialUsername = _userDetailService.userDetailResponse?.user?.username ?? "";
    linkController.text = initialUsername;

    model = ref.read(authViewModel);
    model.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    model = ref.watch(authViewModel);

    return Scaffold(
      backgroundColor: AppCol.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset("assets/images/back.png", height: 24),
          ),
        ),
        title: const Text(
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
                    image: AssetImage("assets/newIcons/circle_path.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28, bottom: 24),
                child: Center(
                  child: SizedBox(
                    width: 327,
                    child: Text(
                      'Choose a profile link for your Hello profile to be shared as a link in Bio on social platforms',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF666666), fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: getPadding(left: 24, top: 24, right: 24, bottom: 24),
                  decoration: AppDecoration.outlineBlack9003f.copyWith(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        inputFormatter: [
                          FilteringTextInputFormatter.allow(RegExp(r"^[a-z0-9;/?:@&=+$\-_.!~*'()#]+$")),
                          
                        ],
                        onChange: (val) {
                          setState(() {
                            // Convert to lowercase
                            linkController.text = val.toLowerCase();
                            linkController.selection = TextSelection.collapsed(offset: linkController.text.length);
                            
                            // Show warning if updating HelloLink
                            isWarningVisible = val.isNotEmpty && val != _userDetailService.userDetailResponse?.user?.username;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "HelloLink cannot be empty!";
                          }
                          return null;
                        },
                        controller: linkController,
                        label: "Profile Link",
                        suffix: Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 16, 14, 16),
                          child: Image.asset("assets/newIcons/pro_link.png"),
                        ),
                      ),
                      if (isWarningVisible) // Show warning message
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.warning, color: Colors.orange),
                              SizedBox(width: 5),
                              Text(
                                "Warning: You are updating the HelloLink!",
                                style: TextStyle(color: Colors.orange),
                              ),
                            ],
                          ),
                        ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24.0, bottom: 24),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '${AppConstants.storeUrl}',
                                  style: TextStyle(color: Color(0xFF666666), fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.16),
                                ),
                                // TextSpan(
                                //   text: '/',
                                //   style: TextStyle(color: Color(0xFF666666), fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.16),
                                // ),
                                TextSpan(
                                  text: linkController.text.toLowerCase(),
                                  style: TextStyle(color: Color(0xFF1E1E1E), fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.16),
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
                        onTap: () {
                          if (linkController.text.isNotEmpty) {
                            model.editProfileLinkRequest = EditProfileLinkRequest(username: linkController.text.toLowerCase());
                            model.editProfileLink(model.editProfileLinkRequest, context);
                          }
                        },
                        child: SizedBox(
                          height: getVerticalSize(55),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: getPadding(left: 16, top: 16, right: 16, bottom: 16),
                                  decoration: BoxDecoration(
                                    color: AppCol.primary,
                                    borderRadius: BorderRadius.circular(getHorizontalSize(10)),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Update Profile Link",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsBold15.copyWith(fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

