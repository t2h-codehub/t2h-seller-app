import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/auth/model/add_custom_service.dart';

import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/helper/file_picker.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/helper/validation.dart';
import 'package:taptohello/presentation/premium/previum_view.dart';
import 'package:taptohello/presentation/profileWebview/image_viewer.dart';
import 'package:taptohello/presentation/profileWebview/pdf_viewer.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';

class CustomLinkWidget extends ConsumerStatefulWidget {
  // final services.CustomService? value;

  CustomLinkWidget();

  @override
  ConsumerState<CustomLinkWidget> createState() => _CustomLinkWidgetState();
}

class _CustomLinkWidgetState extends ConsumerState<CustomLinkWidget>
    with BaseScreenView {
  TextEditingController imageController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  bool isExtraFiledsVisible = false;
  late AuthViewModel _viewModel;
  bool isExpanded = false;
  final _formKey = GlobalKey<FormState>();
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  // Regular Expression for URL validation
  final RegExp urlRegExp = RegExp(
    r'^(https?:\/\/)?([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}(:\d+)?(\/\S*)?$',
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // focusNode.requestFocus();
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
  }

  String? _validateURL(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a URL'; // If the field is empty, show an error
  } else if (!urlRegExp.hasMatch(value)) {
    return 'Enter a valid URL (e.g., https://example.com)'; // If it doesn't match the regex, show an error
  }
  return null; // Return null if the input is valid (no error)
}



  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: AppDecoration.outlineBlack9003f.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder5,
                color: Colors.white),
            child: ExpansionTile(
              onExpansionChanged: (value) {
                setState(() {
                  isExpanded = value;
                });
              },
              collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              leading: SizedBox(
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/newIcons/customLink.png",
                    height: 40,
                    width: 40,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              trailing: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppCol.primary)),
                  margin: getMargin(top: 8, bottom: 8),
                  padding: getMargin(top: 6, bottom: 6, left: 18, right: 18),
                  child: Text("Add",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsMedium10Gray900
                          .copyWith(fontSize: 14, color: AppCol.primary))),
              backgroundColor: Colors.white,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Custom Text Link',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsSemiBold12
                            .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' Browse 20 MB',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsSemiBold12
                            .copyWith(fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Image.asset(
                    "assets/newIcons/premium.png",
                    height: 17,
                    color: Colors.red,
                  )
                ],
              ),
              children: [
                // Padding(
                //     padding: const EdgeInsets.only(bottom: 14.0),
                //     child: getFields(isExpanded))
                _userDetailService.userDetailResponse?.user?.customServices
                            ?.isEmpty ??
                        true
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 14.0, top: 16),
                        child: getFields(isExpanded))
                    : Column(
                        children: [
                          ...List.generate(
                              _userDetailService.userDetailResponse?.user
                                      ?.customServices?.length ??
                                  0,
                              (index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 16),
                                          child: Icon(
                                            Icons.menu,
                                            color: Color(0xff677b8a80),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _launchURL(_userDetailService
                                                    .userDetailResponse
                                                    ?.user
                                                    ?.customServices?[index]
                                                    .link ??
                                                "");
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            margin: EdgeInsets.only(left: 6),
                                            child: Text(
                                              _userDetailService
                                                      .userDetailResponse
                                                      ?.user
                                                      ?.customServices?[
                                                          index]
                                                      .title ??
                                                  "",
                                              style: TextStyle(
                                                  color: AppCol.primary),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        /*Icon(Icons.remove_red_eye_outlined,color: Colors.black.withOpacity(.4),size: 22),
                                        SizedBox(width: 2),
                                        Text(
                                          "34",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsSemiBold12
                                              .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),*/
                                        SizedBox(width: 10),
                                        InkWell(
                                          onTap: () {
                                            _viewModel.deleteCustomService(
                                                _userDetailService
                                                        .userDetailResponse
                                                        ?.user
                                                        ?.customServices?[index]
                                                        .id ??
                                                    "");
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16.0),
                                            child: Icon(
                                              Icons.cancel_outlined,
                                              size: 28,
                                              color: Color(0xFF858585),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                          InkWell(
                            onTap: () {
                              isExtraFiledsVisible = true;
                              setState(() {});
                            },
                            child: Visibility(
                              visible: !isExtraFiledsVisible,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Add new link',
                                      style: TextStyle(
                                        color: AppCol.primary,
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add_circle_outline,
                                      size: 18,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isExtraFiledsVisible,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 14.0, top: 16),
                                child: getFields(isExpanded)),
                          )
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getFields(bool isExpanded) {
    return Form(
       key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    openPickImageModalSheet(context, cropper: false)
                        .then((value) {
                      if (value != null) {
                        _viewModel.uploadSingleFile(value).then((fileURL) {
                          setState(() {
                            imageController.text = fileURL ?? "";
                          });
                        });
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 16),
                    height: 45,
                    child: CustomTextFormField(
                      maxlength: 300,
                      isenabled: false,
                      suffix: Icon(Icons.folder_outlined),
                      // focusNode: focusNode,
                      controller: imageController,
                      hintText: "upload icon/logo",
                    ),
                  ),
                ),
              ),
              SizedBox(width: 18),
              InkWell(
                onTap: () {
                  isExpanded = false;
                  imageController.clear();
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.cancel_outlined,
                    size: 28,
                    color: Color(0xFF858585),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 16),
                  // height: 45,
                  child: CustomTextFormField(
                    maxlength: 75,
                    // focusNode: focusNode,
                    controller: titleController,
                    hintText: "Type Text Here (75 characters)",
                  ),
                ),
              ),
              SizedBox(width: 18),
              InkWell(
                onTap: () {
                  isExpanded = false;
                  titleController.clear();
      
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.cancel_outlined,
                    size: 28,
                    color: Color(0xFF858585),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 16),
                  // height: 45,
                  child: 
                  // CustomTextFormField(
                  //   maxlength: 300,
                  //   // focusNode: focusNode,
                  //   controller: linkController,
      
                  //   hintText: "Paste Link",
                  //   validator: (value)  {
                  //     // if(value!.isNotEmpty) {
                  //     //  return hasValidUrl(value ?? '');
                  //     // }
                  //     if(value!.isNotEmpty){
      
                  //       return hasValidUrl(value);
                  //     }
                  //      return null;
                  //   },
                  // ),
               TextFormField(
        controller: linkController,
        decoration: InputDecoration(
      labelText: 'Paste Link',
      //  filled: true,
      //         fillColor: Colors.grey[200], // Background color
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10), // Circular border
                borderSide: BorderSide(color: Colors.grey, width: 1), // Removes default border
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey, width: 1), // Default border color
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppCol.primary, width: 1), // Turns black on focus
              ),
      //  border: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(10), // Circular border
      //           borderSide: BorderSide.none, // Removes default border
      //         ),
      //         focusedBorder: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(10),
      //           borderSide: BorderSide(color: Colors.blue, width: 2), // Focus border color
      //         ),
      //         enabledBorder: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(10),
      //           borderSide: BorderSide(color: Colors.grey, width: 1), // Default border color
      //         ),
      suffixIcon: Icon(Icons.link),
        ),
        keyboardType: TextInputType.url,
        validator: _validateURL, // This calls _validateURL when the form is submitted
      )
                ),
              ),
              SizedBox(width: 18),
              InkWell(
                onTap: () {
                  isExpanded = false;
                  linkController.clear();
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.cancel_outlined,
                    size: 28,
                    color: Color(0xFF858585),
                  ),
                ),
              )
            ],
          ),
          InkWell(
            onTap: () {
        //        if (_formKey.currentState!.validate()) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Valid URL: ${linkController.text}')),
        //   return;
        // );
        //        }
               // ✅ Prevent navigation if form is invalid
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Valid URL: ${linkController.text}')),
    );
              if ((_userDetailService
                          .userDetailResponse?.user?.plan?.planType?.title
                          ?.toLowerCase() ==
                      "pro+") ||
                  (_userDetailService
                          .userDetailResponse?.user?.plan?.planType?.title
                          ?.toLowerCase() ==
                      "pro")) {
                if (titleController.text.isNotEmpty &&
                    linkController.text.isNotEmpty) {
                  _viewModel.addCustomServiceRequest = AddCustomServiceRequest(
                      link: linkController.text,
                      logo: imageController.text,
                      title: titleController.text);
                  // focusNode.unfocus();
                  _viewModel.addCustomService(
                    _viewModel.addCustomServiceRequest,
                  );
                  isExtraFiledsVisible = false;
                  setState(() {});
                  // addDataController.clear();
                  linkController.clear();
                  titleController.clear();
                  imageController.clear();
                }
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PremiumView(),
                ));
                // Handle any other case
              }
            },
            child: Container(
                decoration: BoxDecoration(
                    color: AppCol.primary,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppCol.primary)),
                margin: getMargin(top: 8, bottom: 8, left: 12, right: 12),
                padding: getMargin(top: 10, bottom: 10, left: 16, right: 16),
                child: Text("Submit",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsMedium10Gray900
                        .copyWith(fontSize: 14, color: Colors.white))),
          ),
          SizedBox(height: 18),
        ],
      ),
    );
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

  _launchURL(String url) async {
    if (url.contains("http") || url.contains("https")) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else if (!url.contains("http") || !url.contains("https")) {
      await launchUrl(
        Uri.parse("https://$url"),
        mode: LaunchMode.externalApplication,
      );
    } else if (url.contains(".pdf")) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PdfViewer(pdfUrl: url),
      ));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ImageViewer(imageUrl: url),
      ));
    }
  }
}
