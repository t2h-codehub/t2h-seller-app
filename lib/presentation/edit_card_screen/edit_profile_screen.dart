// ignore_for_file: deprecated_member_use


import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/core.dart';
import 'package:taptohello/data/auth/model/update_user.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/helper/file_picker.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/choose_profile/choose_profile_view.dart';
import 'package:taptohello/presentation/edit_card_screen/hello_direct_bottomSheet.dart';
import 'package:taptohello/presentation/premium/previum_view.dart';
import 'package:taptohello/presentation/settings_screen/settings_screen.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';
import 'package:video_player/video_player.dart';

import '../../services/shared_preference_service.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  final bool gotoMulti;

  EditProfileScreen({super.key, this.gotoMulti = false});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends ConsumerState<EditProfileScreen>
    with BaseScreenView {
  String thumbnail = "";
  TextEditingController uploadImageController = TextEditingController();
  TextEditingController uploadCoverController = TextEditingController();
  TextEditingController companyController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController designationController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  late final AuthViewModel _viewModel;
  late VideoPlayerController _controller;
  int selectedIndex = 0;
  bool isDirect = false;
  bool isIconColor = false;
  bool isGainLeads = false;
  bool isQuickIntro = false;
  bool isCustomBranding = false;
  bool isImage = false;
  String coverVideo = "";
  int langIndexSelect = 0;
  Color? qrCustomColor;

  bool customBrandTheme = false;

  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = AppConstants.selectedIndex;
    debugPrint(
        'My custom branding: ${_userDetailService.userDetailResponse?.user?.isCustomBranding}');
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      setState(() {
        langIndexSelect = SharedPreferenceService.getInt("language") ?? 0;
      });
    });
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);

    // print('Yrrfjfv----: ${_userDetailService.userDetailResponse?.user?.color}');
    // qrCustomColor = (_userDetailService.userDetailResponse?.user?.color ?? '') as Color?;
    selectedIndex = _userDetailService.userDetailResponse?.user?.color == null
        ? 0
        : _userDetailService.userDetailResponse?.user?.color?.index ?? 0;
    isDirect =
        _userDetailService.userDetailResponse?.user?.helloDirect ?? false;
    isIconColor = _userDetailService.userDetailResponse?.user?.theme ?? false;
    isGainLeads =
        _userDetailService.userDetailResponse?.user?.gainLeads ?? false;
    isQuickIntro =
        _userDetailService.userDetailResponse?.user?.quickIntro ?? false;
    isCustomBranding =
        _userDetailService.userDetailResponse?.user?.isCustomBranding ?? false;
    companyController.text =
        _userDetailService.userDetailResponse?.user?.companyName ?? "";
    uploadCoverController.text =
        _userDetailService.userDetailResponse?.user?.coverVideo ?? "";
    coverVideo = _userDetailService.userDetailResponse?.user?.coverVideo ?? "";
    if (_userDetailService.userDetailResponse?.user?.coverVideo != null) {
      if ((_userDetailService.userDetailResponse?.user?.coverVideo != null &&
              coverVideo.contains(".png")) ||
          (coverVideo.contains(".jpg") || coverVideo.contains(".jpeg"))) {
        setState(() {
          isImage = true;
        });
      }
    }
    if (!isImage) {
      _controller = VideoPlayerController.network(
          _userDetailService.userDetailResponse?.user?.coverVideo ?? "");

      _controller.addListener(() {
        setState(() {});
      });
      _controller.setLooping(true);
      _controller.initialize().then((_) => setState(() {}));
      _controller.play();
    }

    nameController.text =
        _userDetailService.userDetailResponse?.user?.name ?? "";
    designationController.text =
        _userDetailService.userDetailResponse?.user?.designation ?? "";
    bioController.text = _userDetailService.userDetailResponse?.user?.bio ?? "";
    uploadImageController.text =
        _userDetailService.userDetailResponse?.user?.profileImg ?? "";
  }

  // getColorAndImage() {
  //   _colorColtroller.text = SharedPreferenceService.getString('qrColor') ?? '';
  //
  //   debugPrint('My selected color is: ${_colorColtroller.text} ${_imageController.text}');
  //   setState(() {});
  //   // hexStringToHexInt(qrColor);
  // }

  bool _isImageFile(String url) {
  return url.toLowerCase().endsWith('.png') ||
         url.toLowerCase().endsWith('.jpg') ||
         url.toLowerCase().endsWith('.jpeg') ||
         url.toLowerCase().endsWith('.webp');
}


  @override
  Widget build(BuildContext context) {
    debugPrint(
        'My account is isPro: ${_userDetailService.userDetailResponse?.user?.isPro}');
    debugPrint(
        'My account is isProPlus: ${_userDetailService.userDetailResponse?.user?.isProPlus}');
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
            if (nameController.text.isEmpty) {
              showSnackbar("Please enter a name");
            } else {
              onSave(_formKey, context);
            }
          },
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
                    "Update Profile",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsBold15
                        .copyWith(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppCol.bgColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            if (widget.gotoMulti) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChooseProfileView(),
                  ));
            }
            Navigator.of(context).pop();
          },
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Image.asset(
                "assets/images/back.png",
                height: 24,
              )),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SettingsScreen(),
              ));
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("assets/newIcons/setting.png"),
            ),
          ),
        ],
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: getPadding(top: 0, bottom: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// Cover Image and Profile Photo Section
SizedBox(
  height: getVerticalSize(270),
  width: double.infinity,
  child: Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Align(
        alignment: Alignment.topCenter,
        child: InkWell(
          onTap: () {
            openPickImageVideoModalSheet(context).then((value) {
              if (value != null) {
                _viewModel.uploadSingleFile(value).then((fileURL) {
                  if (fileURL != null) {
                    setState(() {
                      uploadCoverController.text = fileURL;

                      if (_isImageFile(fileURL)) {
                        isImage = true;
                      } else {
                        isImage = false;
                        _controller = VideoPlayerController.network(fileURL)
                          ..addListener(() => setState(() {}))
                          ..setLooping(true)
                          ..initialize().then((_) {
                            setState(() {});
                            _controller.play();
                          });
                      }
                    });
                  }
                });
              }
            });
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: uploadCoverController.text.isNotEmpty
                ? isImage
                    ? Image.network(
                        uploadCoverController.text,
                        height: 210,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : _controller.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                        : const Center(child: CircularProgressIndicator())
                : Image.asset(
                    "assets/images/Cover image HS.png",
                    height: 210,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),

      /// Profile Image Section
      InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => openPickImageModalSheet(context).then((value) {
          if (value != null) {
            _viewModel.uploadSingleFile(value).then((fileURL) {
              if (fileURL != null) {
                setState(() {
                  uploadImageController.text = fileURL;
                });
              }
            });
          }
        }),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 19),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Container(
                height: getSize(120),
                width: getSize(120),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: uploadImageController.text.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(uploadImageController.text),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: uploadImageController.text.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgUserGray700,
                            height: getVerticalSize(52),
                            width: getHorizontalSize(60),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Add Profile Photo",
                            style: AppStyle.txtPoppinsMedium10Gray900,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : null,
              ),
            ),
            Image.asset(
              "assets/newIcons/camera.png",
              height: 37,
            ),
          ],
        ),
      ),
    ],
  ),
),

                /// Cover Image and Video
                // SizedBox(
                //     height: getVerticalSize(270),
                //     width: double.infinity,
                //     child: Stack(alignment: Alignment.bottomCenter, children: [
                //       (uploadCoverController.text.isNotEmpty ||
                //               uploadCoverController.text != "")
                //           ? Align(
                //               alignment: Alignment.topCenter,
                //               child: InkWell(
                //                   onTap: () {
                //                     openPickImageVideoModalSheet(context)
                //                         .then((value) {
                //                       if (value != null) {
                //                         _viewModel
                //                             .uploadSingleFile(value)
                //                             .then((fileURL) {
                //                           setState(() {
                //                             uploadCoverController.text =
                //                                 fileURL ?? "";
                //                             if ((uploadCoverController.text !=
                //                                         "" &&
                //                                     uploadCoverController.text
                //                                         .contains(".png")) ||
                //                                 (uploadCoverController.text
                //                                         .contains(".jpg") ||
                //                                     uploadCoverController.text
                //                                         .contains(".jpeg"))) {
                //                               setState(() {
                //                                 isImage = true;
                //                               });
                //                             } else {
                //                               _controller =
                //                                   VideoPlayerController.network(
                //                                       uploadCoverController
                //                                           .text);
                //                               _controller.addListener(() {
                //                                 setState(() {});
                //                               });
                //                               _controller.setLooping(true);
                //                               _controller
                //                                   .initialize()
                //                                   .then((_) => setState(() {}));
                //                               _controller.play();
                //                             }
                //                           });
                //                         });
                //                       }
                //                     });
                //                   },
                //                   child: isImage == true
                //                       ? Image.network(
                //                           height: 210,
                //                           uploadCoverController.text,
                //                           width: double.infinity,
                //                           fit: BoxFit.cover,
                //                         )
                //                       : _controller.value.isInitialized
                //                           ? Padding(
                //                               padding: const EdgeInsets.only(
                //                                   bottom: 20),
                //                               child: SizedBox(
                //                                 height: 210,
                //                                 width: double.infinity,
                //                                 child: AspectRatio(
                //                                     aspectRatio: _controller
                //                                         .value.aspectRatio,
                //                                     child: VideoPlayer(
                //                                         _controller)),
                //                               ),
                //                             )
                //                           : Center(
                //                               child:
                //                                   CircularProgressIndicator(),
                //                             )),
                //             )
                //           : InkWell(
                //               onTap: () {
                //                 openPickImageVideoModalSheet(context)
                //                     .then((value) {
                //                   if (value != null) {
                //                     _viewModel
                //                         .uploadSingleFile(value)
                //                         .then((fileURL) {
                //                       setState(() {
                //                         uploadCoverController.text =
                //                             fileURL ?? "";
                //                         _controller =
                //                             VideoPlayerController.network(
                //                                 uploadCoverController.text);
                //                       });
                //                       if ((uploadCoverController.text != "" &&
                //                               uploadCoverController.text
                //                                   .contains(".png")) ||
                //                           (uploadCoverController.text
                //                                   .contains(".jpg") ||
                //                               uploadCoverController.text
                //                                   .contains(".jpeg"))) {
                //                         setState(() {
                //                           isImage = true;
                //                         });
                //                       } else {
                //                         _controller.addListener(() {
                //                           setState(() {});
                //                           _controller.setLooping(true);

                //                           _controller
                //                               .initialize()
                //                               .then((_) => setState(() {}));
                //                           _controller.play();
                //                         });
                //                       }
                //                     });
                //                   }
                //                 });
                //               },
                //               child: Align(
                //                   alignment: Alignment.topCenter,
                //                   child: Container(
                //                     decoration: BoxDecoration(
                //                         image: DecorationImage(
                //                             fit: BoxFit.fitWidth,
                //                             image: AssetImage(
                //                                 "assets/images/Cover image HS.png"))),
                //                     height: 210,
                //                     // width:
                //                     //     getHorizontalSize(280),
                //                   )),
                //             ),
                //       InkWell(
                //           splashColor: Colors.transparent,
                //           highlightColor: Colors.transparent,
                //           onTap: () =>
                //               openPickImageModalSheet(context).then((value) {
                //                 if (value != null) {
                //                   _viewModel
                //                       .uploadSingleFile(value)
                //                       .then((fileURL) {
                //                     setState(() {
                //                       uploadImageController.text =
                //                           fileURL ?? "";
                //                     });
                //                   });
                //                 }
                //               }),
                //           child: (uploadImageController.text.isEmpty ||
                //                   uploadImageController.text == "")
                //               ? Stack(
                //                   alignment: Alignment.bottomRight,
                //                   children: [
                //                     Container(
                //                       margin: EdgeInsets.only(top: 19),
                //                       decoration: BoxDecoration(
                //                           color: Colors.white,
                //                           shape: BoxShape.circle),
                //                       child: Container(
                //                           padding: getPadding(
                //                               left: 16,
                //                               top: 20,
                //                               right: 16,
                //                               bottom: 22),
                //                           margin: getPadding(
                //                               left: 4,
                //                               top: 4,
                //                               right: 4,
                //                               bottom: 4),
                //                           decoration: AppDecoration
                //                               .outlineBlack9003f12
                //                               .copyWith(shape: BoxShape.circle),
                //                           child: Column(
                //                               mainAxisSize: MainAxisSize.min,
                //                               mainAxisAlignment:
                //                                   MainAxisAlignment.center,
                //                               children: [
                //                                 CustomImageView(
                //                                     svgPath: ImageConstant
                //                                         .imgUserGray700,
                //                                     height: getVerticalSize(52),
                //                                     width:
                //                                         getHorizontalSize(60),
                //                                     margin: getMargin(top: 4)),
                //                                 Padding(
                //                                     padding: getPadding(top: 6),
                //                                     child: Text(
                //                                         "Add Profile Photo",
                //                                         overflow: TextOverflow
                //                                             .ellipsis,
                //                                         textAlign:
                //                                             TextAlign.left,
                //                                         style: AppStyle
                //                                             .txtPoppinsMedium10Gray900))
                //                               ])),
                //                     ),
                //                     Image.asset(
                //                       "assets/newIcons/camera.png",
                //                       height: 37,
                //                     )
                //                   ],
                //                 )
                //               : Stack(
                //                   alignment: Alignment.bottomRight,
                //                   children: [
                //                     Container(
                //                       margin: EdgeInsets.only(top: 19),
                //                       decoration: BoxDecoration(
                //                           color: Colors.white,
                //                           shape: BoxShape.circle),
                //                       child: Container(
                //                         // height: getSize(120),
                //                         // width: getSize(200),
                //                         height: getSize(120),
                //                         width: getSize(134),
                //                         padding: getPadding(
                //                             left: 16,
                //                             top: 20,
                //                             right: 16,
                //                             bottom: 22),
                //                         margin: getPadding(
                //                             left: 4,
                //                             top: 4,
                //                             right: 4,
                //                             bottom: 4),
                //                         decoration: BoxDecoration(
                //                             shape: BoxShape.circle,
                //                             image: DecorationImage(
                //                                 fit: BoxFit.cover,
                //                                 image: NetworkImage(
                //                                     uploadImageController
                //                                         .text))),
                //                       ),
                //                     ),
                //                     Image.asset(
                //                       "assets/newIcons/camera.png",
                //                       height: 37,
                //                     )
                //                   ],
                //                 )),
                //     ])),

                /// Textfield
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      CustomTextFormField(
                          controller: nameController,
                          label: AppConstants.nameList[index],
                          hintText: AppConstants.nameList[index],
                          suffix: Icon(
                            Icons.person_outline,
                            size: 26,
                          ),
                          margin: getMargin(left: 16, top: 24, right: 16)),
                      CustomTextFormField(
                          controller: designationController,
                          label: AppConstants.designation[index],
                          hintText: AppConstants.designation[index],
                          suffix: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 16, 14, 16),
                            child: Image.asset("assets/newIcons/company.png"),
                          ),
                          margin: getMargin(left: 16, top: 15, right: 16),
                          textInputAction: TextInputAction.done),
                      // CustomTextFormField(
                      //     controller: companyController,
                      //     suffix: Padding(
                      //       padding:
                      //           const EdgeInsets.fromLTRB(16.0, 16, 14, 16),
                      //       child: Image.asset("assets/newIcons/company.png"),
                      //     ),

                      //     // controller: designationController,
                      //     label: AppConstants.company[index],
                      //     hintText: AppConstants.company[index],
                      //     margin: getMargin(left: 16, top: 15, right: 16),
                      //     textInputAction: TextInputAction.done)
                      Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
  child: TextFormField(
    controller: companyController,
    maxLength: 70,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.done,
    scrollPadding: const EdgeInsets.all(20),
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    decoration: InputDecoration(
        
        
         label: Text(AppConstants.company[index]),
hintText: AppConstants.company[index],// Optional hint
      floatingLabelBehavior: FloatingLabelBehavior.always, // Always show label
      suffixIcon: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.badge_outlined, // You can use your custom image here
          size: 20,
          color: Colors.grey.shade800,
        ),
      ),
      counterText: '',
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.blue, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    ),
  ),
)
,
                      SizedBox(
                        height: 120,
                        child: CustomTextFormField(
                            label: AppConstants.bio[index],
                            hintText: AppConstants.customHello[index],
                            maxLines: 3,
                            maxlength: 120,
                            controller: bioController,
                            // hintText: "Bio",
                            margin: getMargin(left: 16, top: 24, right: 16)),
                      ),
                    ],
                  ),
                ),

                /// Custom brand theme
                InkWell(
                  onTap: () {
                    setState(() {
                      isCustomBranding =
                      !isCustomBranding;
                      _viewModel.toggleStatus(
                          "isCustomBranding");
                    });
                  },
                  child: Container(
                    margin: getMargin(left: 16, top: 15, right: 16),
                    width: double.infinity,
                    // margin: getMargin(left: 16, top: 15, right: 16),
                    padding: getPadding(top: 14, bottom: 14,left: 16, right: 16),
                    decoration: AppDecoration.outlineBlack9003f.copyWith(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        /// Custom brand theme column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Custom Brand Theme",
                                style: TextStyle(
                                  color: AppCol.gray900,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Put custom brand color theme on your profile.",
                                style: TextStyle(
                                  color:Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// Toggle Button
                        SizedBox(
                          height: 24,
                          width: 45,
                          child: AnimatedToggleSwitch<bool>.dual(
                            current: isCustomBranding,
                            first: false,
                            second: true,
                            innerColor: isCustomBranding
                                ? AppCol.primary
                                : Color(0xFFD0D5DD),
                            dif: 1.0,
                            borderColor: Colors.transparent,
                            // borderWidth: 2.0,
                            // height: 20,
                            indicatorSize: Size(17, 18),
                            indicatorColor: Colors.white,
                            onChanged: (b) {
                              setState(() {
                                setState(() {
                                  isCustomBranding =
                                  !isCustomBranding;
                                  _viewModel.toggleStatus(
                                      "isCustomBranding");
                                });
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              

                /// Hello Direct container
                Visibility(
                  visible: AppConstants.eligibility == true,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        /// Hello Direct
                        Container(
                          padding: getPadding(
                              left: 18, top: 20, right: 18, bottom: 20),
                          decoration: AppDecoration.outlineBlack9003f.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: ()
                            /*=> showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                      24)),
                              context: context,
                              builder: (context) =>
                                  HelloDirectBottomSheet(
                                      _viewModel),
                            ),*/
                              {
                              if (_userDetailService
                                      .userDetailResponse?.user?.isPro ==
                                  true) {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //   builder: (context) => PremiumView(),
                                // ));
                              } else if (_userDetailService
                                      .userDetailResponse?.user?.isProPlus ==
                                  true) {
                                setState(() {
                                  isDirect = !isDirect;
                                  _viewModel
                                      .toggleStatus("helloDirect")
                                      .then((value) => {
                                            if (isDirect)
                                              {
                                                showModalBottomSheet(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24)),
                                                  context: context,
                                                  builder: (context) =>
                                                      HelloDirectBottomSheet(
                                                          _viewModel),
                                                )
                                              }
                                          });
                                });
                              } else {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //   builder: (context) => PremiumView(),
                                // ));
                              }
                            },
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Container(
                                  //     width: getHorizontalSize(250),
                                  //     margin: getMargin(top: 4),
                                  //     child: Column(
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.start,
                                  //       children: [
                                  //         Row(
                                  //           children: [
                                  //             Text("SocioDirect™️",
                                  //                 style: TextStyle(
                                  //                     color: AppCol.gray900,
                                  //                     fontSize: 16,
                                  //                     fontFamily: 'Roboto',
                                  //                     fontWeight:
                                  //                         FontWeight.w600)),
                                  //             SizedBox(width: 5),
                                  //           ],
                                  //         ),
                                  //         SizedBox(height: 9.5),
                                  //         Text(
                                  //             "Share directly any single link of your choice  instead of sharing whole profile on every Tap.",
                                  //             style: TextStyle(
                                  //                 color: AppCol.gray900,
                                  //                 fontSize: 12,
                                  //                 fontFamily: 'Roboto',
                                  //                 fontWeight: FontWeight.w400)),
                                  //       ],
                                  //     )),
                                  // Visibility(
                                  //   visible: AppConstants.eligibility == true,
                                  //   child: SizedBox(
                                  //     height: 24,
                                  //     width: 45,
                                  //     child: AnimatedToggleSwitch<bool>.dual(
                                  //       current: isDirect,
                                  //       first: false,
                                  //       second: true,
                                  //       innerColor: isDirect
                                  //           ? AppCol.primary
                                  //           : Color(0xFFD0D5DD),
                                  //       dif: 1.0,
                                  //       borderColor: Colors.transparent,
                                  //       // borderWidth: 2.0,
                                  //       // height: 20,
                                  //       indicatorSize: Size(17, 18),
                                  //       indicatorColor: Colors.white,
                                  //       onChanged: (b) {
                                  //         if (_userDetailService
                                  //                 .userDetailResponse
                                  //                 ?.user
                                  //                 ?.plan
                                  //                 ?.planType
                                  //                 ?.features ==
                                  //             null) {
                                  //           Navigator.of(context)
                                  //               .push(MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 PremiumView(),
                                  //           ));
                                  //         } else if (_userDetailService
                                  //             .userDetailResponse!
                                  //             .user!
                                  //             .plan!
                                  //             .planType!
                                  //             .features!
                                  //             .contains("Hello Direct")) {
                                  //           setState(() {
                                  //             isDirect = b;
                                  //             _viewModel
                                  //                 .toggleStatus("helloDirect")
                                  //                 .then((value) => {
                                  //                       if (isDirect)
                                  //                         {
                                  //                           showModalBottomSheet(
                                  //                             shape: RoundedRectangleBorder(
                                  //                                 borderRadius:
                                  //                                     BorderRadius
                                  //                                         .circular(
                                  //                                             24)),
                                  //                             context: context,
                                  //                             builder: (context) =>
                                  //                                 HelloDirectBottomSheet(
                                  //                                     _viewModel),
                                  //                           )
                                  //                         }
                                  //                     });
                                  //           });
                                  //         } else {
                                  //           Navigator.of(context)
                                  //               .push(MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 PremiumView(),
                                  //           ));
                                  //         }
                                  //       },
                                  //     ),
                                  //   ),
                                  // ),
                                ]),
                          ),
                        ),

                        ///
                        // Padding(
                        //     padding: getPadding(top: 9),
                        //     child: Divider(
                        //         height: getVerticalSize(1),
                        //         thickness: getVerticalSize(1),
                        //         color: Color(0xffDBDBDB))),

                        // /// Hello Lead
                        // Visibility(
                        //   visible: AppConstants.eligibility == true,
                        //   child: InkWell(
                        //     splashColor: Colors.transparent,
                        //     highlightColor: Colors.transparent,
                        //     onTap: () {
                        //       if (_userDetailService
                        //               .userDetailResponse?.user?.isPro ==
                        //           true) {
                        //         setState(() {
                        //           isGainLeads = !isGainLeads;
                        //           _viewModel.toggleStatus("gainLeads");
                        //         });
                        //       } else if (_userDetailService
                        //               .userDetailResponse?.user?.isProPlus ==
                        //           true) {
                        //         setState(() {
                        //           isGainLeads = !isGainLeads;
                        //           _viewModel.toggleStatus("gainLeads");
                        //         });
                        //       } else {
                        //         Navigator.of(context).push(MaterialPageRoute(
                        //           builder: (context) => PremiumView(),
                        //         ));
                        //       }
                        //     },
                        //     child: Container(
                        //         padding: getPadding(all: 20),
                        //         decoration: AppDecoration.outlineBlack9003f
                        //             .copyWith(
                        //                 borderRadius:
                        //                     BorderRadiusStyle.roundedBorder5),
                        //         child: Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceBetween,
                        //             children: [
                        //               Container(
                        //                   width: getHorizontalSize(250),
                        //                   margin: getMargin(top: 4),
                        //                   child: Column(
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.start,
                        //                     children: [
                        //                       Row(
                        //                         children: [
                        //                           Text("SocioLead",
                        //                               style: TextStyle(
                        //                                   color: AppCol.gray900,
                        //                                   fontSize: 16,
                        //                                   fontFamily: 'Roboto',
                        //                                   fontWeight:
                        //                                       FontWeight.w600)),
                        //                           SizedBox(width: 5),
                        //                           Image.asset(
                        //                             "assets/newIcons/premium.png",
                        //                             height: 14,
                        //                           )
                        //                         ],
                        //                       ),
                        //                       SizedBox(height: 9.5),
                        //                       RichText(
                        //                           text: TextSpan(children: [
                        //                             TextSpan(
                        //                                 text:
                        //                                     "Capture the details of another person before they can access your profile.",
                        //                                 style: TextStyle(
                        //                                     color:
                        //                                         AppCol.gray900,
                        //                                     fontSize: 12,
                        //                                     fontFamily:
                        //                                         'Roboto',
                        //                                     fontWeight:
                        //                                         FontWeight
                        //                                             .w400))
                        //                           ]),
                        //                           textAlign: TextAlign.left),
                        //                     ],
                        //                   )),
                        //               Visibility(
                        //                 visible:
                        //                     AppConstants.eligibility == true,
                        //                 child: SizedBox(
                        //                   height: 24,
                        //                   width: 45,
                        //                   child:
                        //                       AnimatedToggleSwitch<bool>.dual(
                        //                     current: isGainLeads,
                        //                     first: false,
                        //                     second: true,
                        //                     innerColor: isGainLeads
                        //                         ? AppCol.primary
                        //                         : Color(0xFFD0D5DD),
                        //                     dif: 1.0,
                        //                     borderColor: Colors.transparent,
                        //                     // borderWidth: 2.0,
                        //                     // height: 20,
                        //                     indicatorSize: Size(17, 18),
                        //                     indicatorColor: Colors.white,
                        //                     onChanged: (b) {
                        //                       if (_userDetailService
                        //                               .userDetailResponse
                        //                               ?.user
                        //                               ?.plan
                        //                               ?.planType
                        //                               ?.features ==
                        //                           null) {
                        //                         Navigator.of(context)
                        //                             .push(MaterialPageRoute(
                        //                           builder: (context) =>
                        //                               PremiumView(),
                        //                         ));
                        //                       } else if (_userDetailService
                        //                           .userDetailResponse!
                        //                           .user!
                        //                           .plan!
                        //                           .planType!
                        //                           .features!
                        //                           .contains("Gain Leads")) {
                        //                         setState(() {
                        //                           isGainLeads = b;
                        //                           _viewModel.toggleStatus(
                        //                               "gainLeads");
                        //                         });
                        //                       } else {
                        //                         Navigator.of(context)
                        //                             .push(MaterialPageRoute(
                        //                           builder: (context) =>
                        //                               PremiumView(),
                        //                         ));
                        //                       }
                        //                     },
                        //                   ),
                        //                 ),
                        //               ),
                        //             ])),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),

                /// Quick hello container
                /*Visibility(
                  visible: AppConstants.eligibility == true,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        /// Quick Hello
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            if (_userDetailService
                                    .userDetailResponse?.user?.isPro ==
                                true) {
                              setState(() {
                                isQuickIntro = !isQuickIntro;
                                _viewModel.toggleStatus("quickIntro");
                              });
                            } else if (_userDetailService
                                    .userDetailResponse?.user?.isProPlus ==
                                true) {
                              setState(() {
                                isQuickIntro = !isQuickIntro;
                                _viewModel.toggleStatus("quickIntro");
                              });
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PremiumView(),
                              ));
                            }
                          },
                          child: Container(
                              padding: getPadding(
                                  left: 18, top: 20, right: 18, bottom: 20),
                              decoration: AppDecoration.outlineBlack9003f
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                        child: Container(
                                            width: getHorizontalSize(250),
                                            margin: getMargin(left: 1, top: 3),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("QuickHello™️",
                                                        style: TextStyle(
                                                            color:
                                                                AppCol.gray900,
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                    SizedBox(width: 5),
                                                    Image.asset(
                                                      "assets/newIcons/premium.png",
                                                      height: 14,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 9.5),
                                                RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              "Send an auto email intro to every new connection upon connecting",
                                                          style: TextStyle(
                                                              color: AppCol
                                                                  .gray900,
                                                              fontSize:
                                                                  getFontSize(
                                                                      12),
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400))
                                                    ]),
                                                    textAlign: TextAlign.left),
                                              ],
                                            ))),
                                    Visibility(
                                      visible: AppConstants.eligibility == true,
                                      child: Container(
                                        height: 24,
                                        width: 45,
                                        child: AnimatedToggleSwitch<bool>.dual(
                                          current: isQuickIntro,
                                          first: false,
                                          second: true,
                                          innerColor: isQuickIntro
                                              ? AppCol.primary
                                              : Color(0xFFD0D5DD),
                                          dif: 1.0,
                                          borderColor: Colors.transparent,
                                          // borderWidth: 2.0,
                                          // height: 20,
                                          indicatorSize: Size(17, 18),
                                          indicatorColor: Colors.white,
                                          onChanged: (b) {
                                            if (_userDetailService
                                                    .userDetailResponse
                                                    ?.user
                                                    ?.plan
                                                    ?.planType
                                                    ?.features ==
                                                null) {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    PremiumView(),
                                              ));
                                            } else if (_userDetailService
                                                .userDetailResponse!
                                                .user!
                                                .plan!
                                                .planType!
                                                .features!
                                                .contains("Quick Intro")) {
                                              setState(() {
                                                isQuickIntro = b;
                                                _viewModel
                                                    .toggleStatus("quickIntro");
                                              });
                                            } else {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    PremiumView(),
                                              ));
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ])),
                        ),

                        Padding(
                            padding: getPadding(top: 9),
                            child: Divider(
                                height: getVerticalSize(1),
                                thickness: getVerticalSize(1),
                                color: Color(0xffDBDBDB))),

                        /// Custom Branding
                        Visibility(
                          visible: AppConstants.eligibility == true,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              debugPrint(
                                  'My pro plus is active or not: ${_userDetailService.userDetailResponse?.user?.isPro}');
                              if (_userDetailService
                                      .userDetailResponse?.user?.isPro ==
                                  true) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditThemeView(),
                                ));
                                setState(() {
                                  isCustomBranding = !isCustomBranding;
                                  _viewModel.toggleStatus("isCustomBranding");
                                });
                              } else if (_userDetailService
                                      .userDetailResponse?.user?.isProPlus ==
                                  true) {
                                if (isCustomBranding) {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) => EditThemeView(),
                                  ))
                                      .then((value) {
                                    isIconColor = false;
                                    setState(() {});
                                  });
                                } else {
                                  setState(() {
                                    isCustomBranding = !isCustomBranding;
                                    _viewModel.toggleStatus("isCustomBranding");
                                  });
                                }
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PremiumView(),
                                ));
                              }
                            },
                            child: Container(
                                padding: getPadding(all: 20),
                                decoration: AppDecoration.outlineBlack9003f
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder5),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          width: getHorizontalSize(250),
                                          margin: getMargin(top: 4),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text("Custom Branding",
                                                      style: TextStyle(
                                                          color: AppCol.gray900,
                                                          fontSize: 16,
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  SizedBox(width: 5),
                                                  Image.asset(
                                                    "assets/newIcons/premium.png",
                                                    height: 14,
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 9.5),
                                              RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text:
                                                            "Put custom branding and theme on your profile.",
                                                        style: TextStyle(
                                                            color:
                                                                AppCol.gray900,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400))
                                                  ]),
                                                  textAlign: TextAlign.left),
                                            ],
                                          )),
                                      Visibility(
                                        visible:
                                            AppConstants.eligibility == true,
                                        child: Container(
                                          height: 24,
                                          width: 45,
                                          child:
                                              AnimatedToggleSwitch<bool>.dual(
                                            current: isCustomBranding,
                                            first: false,
                                            second: true,
                                            innerColor: isCustomBranding
                                                ? AppCol.primary
                                                : Color(0xFFD0D5DD),
                                            dif: 1.0,
                                            borderColor: Colors.transparent,
                                            // borderWidth: 2.0,
                                            // height: 20,
                                            indicatorSize: Size(17, 18),
                                            indicatorColor: Colors.white,
                                            onChanged: (b) {
                                              debugPrint(
                                                  'My pro is or not-------: ${_userDetailService.userDetailResponse?.user?.isPro}');
                                              if (_userDetailService
                                                      .userDetailResponse
                                                      ?.user
                                                      ?.isPro ==
                                                  true) {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditThemeView(),
                                                ));
                                                setState(() {
                                                  isCustomBranding =
                                                      !isCustomBranding;
                                                });
                                              } else if (_userDetailService
                                                      .userDetailResponse
                                                      ?.user
                                                      ?.isProPlus ==
                                                  true) {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditThemeView(),
                                                ));
                                                setState(() {
                                                  isCustomBranding =
                                                      !isCustomBranding;
                                                });
                                              } else {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      PremiumView(),
                                                ));
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ])),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),*/
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapArrowleft6(BuildContext context) {
    Navigator.pop(context);
  }

  void onSave(GlobalKey<FormState> formKey, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      _viewModel.updateUserRequest = UpdateUserRequest(
          designation: designationController.text,
          bio: bioController.text,
          companyName: companyController.text,
          name: nameController.text,
          phone: _userDetailService.userDetailResponse?.user?.phone ?? "",
          coverVideo: uploadCoverController.text,
          profileImg: uploadImageController.text);
      _viewModel.changeTheme(selectedIndex);
      // _viewModel.addCustomBranding(File(''), qrCustomColor as String?);
      _viewModel.updateUser(
        _viewModel.updateUserRequest,
        context,
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message.toString()),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // TODO: implement showSnackbar
  }
}
