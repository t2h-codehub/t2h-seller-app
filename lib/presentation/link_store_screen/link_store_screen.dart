// ignore_for_file: duplicate_ignore

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/data/auth/model/add_contact_card.dart';
import 'package:taptohello/data/auth/model/add_service.dart';
import 'package:taptohello/data/auth/model/search_services.dart';
import 'package:taptohello/data/auth/model/services.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/helper/file_picker.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/link_store_screen/LinkGroups/linkGroupsScreen.dart';
import 'package:taptohello/presentation/link_store_screen/widgets/custom_services.dart';
import 'package:taptohello/presentation/link_store_screen/widgets/search_items.dart';
import 'package:taptohello/presentation/premium/previum_view.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';

import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';

import '../../helper/validation.dart';

class LinkStoreScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<LinkStoreScreen> createState() => _LinkStoreScreenState();
}

class _LinkStoreScreenState extends ConsumerState<LinkStoreScreen>
    with BaseScreenView {
  TextEditingController entermobilenumbController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isAdding = false;
  bool conisExpanded = false;
  late AuthViewModel _viewModel;

  @override
  void initState() {     
    super.initState();

    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
    Future.delayed(Duration(milliseconds: 200)).then((value) async {
      await _viewModel.services();
      await _viewModel.getUserServices();
      await _viewModel.getContactCard();
      await _viewModel.getUserDetail();

      await _viewModel.searchServices(GetSearchServicesRequest(title: ""));

      // for (var items in _viewModel.getServiceResponse?.services ?? []) {
      //   for (Value element in items) {
      //     filterData.add(element);
      //   }
      // }
    });
  }

  final UserDetailService _userDetailService = getIt<UserDetailService>();

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(authViewModel);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppCol.bgColor,
        resizeToAvoidBottomInset: false,
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
          title: Column(
            children: [
              Text(
                "Link Store",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              Text(
                "${_viewModel.userServicesResponse?.services?.length ?? "00"} links added to ${_userDetailService.userDetailResponse?.user?.name ?? "N/A"}",
                style: TextStyle(color: Color(0xFF606D93), fontSize: 13),
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.check_circle_outline,
                  color: AppCol.primary,
                ),
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: getPadding(
                top: 15, bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                    padding: getPadding(left: 16, top: 15, right: 16),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: CustomTextFormField(
                          prefix: Icon(Icons.search),
                          variant: TextFormFieldVariant.None,
                          shape: TextFormFieldShape.circular,
                          focusNode: FocusNode(),
                          controller: entermobilenumbController,
                          onChange: (value) => _viewModel.searchServices(
                              GetSearchServicesRequest(title: value)),
                          hintText: "Explore the Hello Link Store",
                          // padding: TextFormFieldPadding
                          //     .PaddingT16,
                          textInputAction: TextInputAction.done),
                    )),

               

                /// Custom text link widget
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: CustomLinkWidget(),
                ),

               
               

                /// Create & Manage Link Groups
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LinkGroupsScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: getMargin(left: 16, top: 15, right: 16),
                    width: double.infinity,
                    // margin: getMargin(left: 16, top: 15, right: 16),
                    padding: getPadding(top: 18, bottom: 18, left: 14),
                    decoration: AppDecoration.outlineBlack9003f.copyWith(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        /// plus icon
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: AppCol.primary,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 38,
                          ),
                        ),
                        SizedBox(width: 18),

                        /// Add button
                        Column(
                          children: [
                            Text(
                              'Create & Manage Link Groups',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Create groups for your custom text links',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                /// Social Links
                entermobilenumbController.text.isNotEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(left: 16, top: 15, right: 16),
                              child: ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                        height: getVerticalSize(15));
                                  },
                                  itemCount: _viewModel
                                          .getSearchServicesResponse
                                          ?.services
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    return Listtype1ItemWidgetSearch(_viewModel
                                        .getSearchServicesResponse!
                                        .services![index]);
                                  })),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index2) => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, top: 16),
                                  child: Text(
                                      "${_viewModel.getServiceResponse?.services?[index2].name}",
                                      style: TextStyle(
                                          color: AppCol.black900,
                                          fontSize: 18,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                    padding: getPadding(
                                        left: 16, top: 15, right: 16),
                                    child: ListView.separated(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                              height: getVerticalSize(15));
                                        },
                                        itemCount: _viewModel
                                                .getServiceResponse
                                                ?.services?[index2]
                                                .value
                                                ?.length ??
                                            0,
                                        itemBuilder: (context, index) {
                                          return Listtype1ItemWidget(
                                              _viewModel
                                                  .getServiceResponse!
                                                  .services![index2]
                                                  .value![index],
                                              index,
                                              index2);
                                        })),
                              ],
                            ),
                            itemCount: _viewModel
                                    .getServiceResponse?.services?.length ??
                                0,
                          )
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> addContactCard(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                padding: EdgeInsets.all(16),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/newIcons/contact_card_image.png",
                                    height: 32,
                                    width: 32,
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    'Contact Card',
                                    style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 16,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: AppCol.primary),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Add',
                                      style: TextStyle(
                                        color: AppCol.primary,
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                        SizedBox(
                          height: 16,
                        ),
                        CustomTextFormField(
                          controller: nameController,
                          hintText: "Enter Name",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomTextFormField(
                          controller: companyController,
                          hintText: "Company Name",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomTextFormField(
                          controller: designationController,
                          hintText: "Enter Designation",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomTextFormField(
                          validator: (value) => emailController.text.isEmpty
                              ? "Please enter a Email"
                              : null,
                          controller: emailController,
                          hintText: "Enter Email",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomTextFormField(
                          textInputType: TextInputType.phone,
                          controller: mobileController,
                          hintText: "Enter Mobile",
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _viewModel
                                      .addContactCard(ContactCardRequest(
                                          cmpName: companyController.text,
                                          designation:
                                              designationController.text,
                                          email: emailController.text,
                                          mobile: mobileController.text,
                                          name: nameController.text))
                                      .then((value) {
                                    Navigator.pop(context);
                                    companyController.clear();
                                    designationController.clear();
                                    mobileController.clear();
                                    emailController.clear();
                                    nameController.clear();
                                  });
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1.3,
                                height: 42,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 6),
                                decoration: ShapeDecoration(
                                  color: AppCol.primary,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: AppCol.primary),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Submit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.cancel_outlined,
                                size: 40,
                                color: Color(0xFF858585),
                              ),
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            ));
  }

  onTapArrowleft13(BuildContext context) {
    Navigator.pop(context);
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

// ignore: must_be_immutable
class Listtype1ItemWidget extends ConsumerStatefulWidget {
  final Value value;
  final int index;
  final int index2;

  Listtype1ItemWidget(this.value, this.index, this.index2);

  @override
  ConsumerState<Listtype1ItemWidget> createState() =>
      _Listtype1ItemWidgetState();
}

class _Listtype1ItemWidgetState extends ConsumerState<Listtype1ItemWidget>
    with BaseScreenView {
  TextEditingController addDataController = TextEditingController();
  late AuthViewModel _viewModel;
  bool isExpanded = false;
  final UserDetailService _userDetailService = getIt<UserDetailService>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // focusNode.requestFocus();
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
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
              onExpansionChanged: (valu) {
                if (widget.value.isPro == false ||
                    widget.value.isProPlus == false) {
                  setState(() {
                    isExpanded = valu;
                  });
                } else if ((_userDetailService
                            .userDetailResponse?.user?.plan?.planType?.title
                            ?.toLowerCase() ==
                        "pro+") &&
                    (widget.value.isProPlus == true)) {
                  setState(() {
                    isExpanded = valu;
                  });
                } else if (_userDetailService
                            .userDetailResponse?.user?.plan?.planType?.title
                            ?.toLowerCase() ==
                        "pro" &&
                    (widget.value.isPro == true)) {
                  // Handle the case where the plan type is "pro"
                  setState(() {
                    isExpanded = valu;
                  });
                } else {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => PremiumView(),
                  // ));
                  // Handle any other case
                }
              },
              collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              leading: SizedBox(
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.value.logo ?? "",
                    height: 40,
                    width: 40,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // trailing: !isExpanded
              //     ? (_viewModel.userServicesResponse!.services!.any(
              //             (element) => element.title == widget.value.title))
                          trailing: !isExpanded
    ? (_viewModel.userServicesResponse?.services?.any(
            (element) => element.title == widget.value.title) ?? false)
   

                      ? SizedBox(
                          height: 24,
                          width: 45,
                          child: AnimatedToggleSwitch<bool>.dual(
                            current: _viewModel.userServicesResponse!.services!
                                    .firstWhere((element) =>
                                        element.title == widget.value.title)
                                    .active ??
                                false,
                            first: false,
                            second: true,
                            innerColor: _viewModel
                                        .userServicesResponse!.services!
                                        .firstWhere((element) =>
                                            element.title == widget.value.title)
                                        .active ??
                                    false
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
                                _viewModel.toggleService(_viewModel
                                        .userServicesResponse!.services!
                                        .firstWhere((element) =>
                                            element.title == widget.value.title)
                                        .id ??
                                    "");
                              });
                            },
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppCol.primary)),
                          margin: getMargin(top: 8, bottom: 8),
                          padding:
                              getMargin(top: 6, bottom: 6, left: 16, right: 16),
                          child: Text("Add",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium10Gray900
                                  .copyWith(
                                      fontSize: 14, color: AppCol.primary)))
                  : (_viewModel.userServicesResponse!.services!.any(
                          (element) => element.title == widget.value.title))
                      ? SizedBox(
                          height: 24,
                          width: 45,
                          child: AnimatedToggleSwitch<bool>.dual(
                            current: _viewModel.userServicesResponse!.services!
                                    .firstWhere((element) =>
                                        element.title == widget.value.title)
                                    .active ??
                                false,
                            first: false,
                            second: true,
                            innerColor: _viewModel
                                        .userServicesResponse!.services!
                                        .firstWhere((element) =>
                                            element.title == widget.value.title)
                                        .active ??
                                    false
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
                                // _viewModel.userServicesResponse!.services!.firstWhere(
                                //     (element) => element.title == widget.value.title)
                                // .active  = b;
                                _viewModel.toggleService(_viewModel
                                        .userServicesResponse!.services!
                                        .firstWhere((element) =>
                                            element.title == widget.value.title)
                                        .id ??
                                    "");
                              });
                            },
                          ),
                        )
                      : SizedBox.shrink(),
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Text(
                    widget.value.title ?? "",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsSemiBold12
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Visibility(
                    visible: (widget.value.isPro == true ||
                        widget.value.isProPlus == true),
                    child: Image.asset(
                      "assets/newIcons/premium.png",
                      height: 17,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 14.0),
                  child: getWidget(isExpanded, widget.value.title ?? '',
                      widget.index, widget.index2),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  
  

  Widget getWidget(bool isExpanded, String title, int index, int index2) {
  debugPrint('My card name: $title');

  bool isCustomLink = widget.value.type == "Custom Links - Pro";
  bool isWhatsappOrPhone = ["Whatsapp", "Mobile", "Landline"]
      .contains(_viewModel.getServiceResponse!.services![index2].value?[index].title);

  bool isPaymentService = ["Paytm", "GPay", "PhonePe", "BharatPe"]
      .contains(_viewModel.getServiceResponse!.services![index2].value?[index].title);

  bool isMailService =
      _viewModel.getServiceResponse!.services![index2].value?[index].title == "Mail";

  bool isTelegram =
      _viewModel.getServiceResponse!.services![index2].value?[index].title == "Telegram";



  if (_userDetailService.userDetailResponse?.user?.services == null) {
  return buildServiceInputField(
    isCustomLink, isWhatsappOrPhone, isMailService, isPaymentService, isTelegram
  );
} else if (_viewModel.userServicesResponse?.services?.any(
      (element) => element.title == widget.value.title) ?? false) {
  return buildExistingServiceRow();


  } else {
    return buildServiceInputField(isCustomLink, isWhatsappOrPhone, isMailService, isPaymentService, isTelegram);
  }
}

/// **Builds input field for adding a service**
Widget buildServiceInputField(bool isCustomLink, bool isWhatsappOrPhone, bool isMailService, bool isPaymentService, bool isTelegram) {
  return Row(
    children: [
      Expanded(
        child: isCustomLink ? buildFileUploadField() : buildTextInputField(isWhatsappOrPhone, isMailService, isPaymentService, isTelegram),
      ),
      buildSubmitButton(isCustomLink),
      buildCancelButton(),
    ],
  );
}

/// **Builds file upload field (for "Custom Links - Pro")**
Widget buildFileUploadField() {
  return InkWell(
    onTap: () {
      openPickImageModalSheet(context, cropper: false, isPdfPicker: true).then((value) {
        if (value != null) {
          _viewModel.uploadSingleFile(value).then((fileURL) {
            setState(() {
              addDataController.text = fileURL ?? "";
            });
          });
        }
      });
    },
    child: Container(
      margin: EdgeInsets.only(left: 16),
      height: 45,
      child: CustomTextFormField(
        isenabled: false,
        controller: addDataController,
        suffix: Icon(Icons.folder_outlined),
        hintText: "Upload PDF or JPEG (Max: 5 MB)",
      ),
    ),
  );
}

/// **Builds text input field (for other services)**
Widget buildTextInputField(bool isWhatsappOrPhone, bool isMailService, bool isPaymentService, bool isTelegram) {
  return Container(
    margin: EdgeInsets.only(left: 16),
    height: 45,
    child: CustomTextFormField(
      isenabled: true,
      controller: addDataController,
      maxlength: isWhatsappOrPhone ? 10 : 300,
      textInputType: isWhatsappOrPhone ? TextInputType.number : TextInputType.text,
      inputFormatter: isWhatsappOrPhone
          ? [FilteringTextInputFormatter.digitsOnly]
          : [],
      validator: (value) {
        if (isMailService) return validateEmail(value!);
        if (isPaymentService) return hasValidUPI(value!);
        if (isTelegram) return validateName(value!);
        return null;
      },
      hintText: widget.value.placeholder ?? "@mina_howell",
    ),
  );
}

/// **Builds submit button (Upload/Submit)**
Widget buildSubmitButton(bool isCustomLink) {
  return InkWell(
    onTap: () {
      if (addDataController.text.isNotEmpty) {
        _viewModel.addServiceRequest =
            AddServiceRequest(content: addDataController.text, serviceId: widget.value.id);
        _viewModel.addService(_viewModel.addServiceRequest, context);
        addDataController.clear();
      }
    },
    child: Container(
      decoration: BoxDecoration(
        color: AppCol.primary,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppCol.primary),
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Text(
        isCustomLink ? "Upload" : "Submit",
        overflow: TextOverflow.ellipsis,
        style: AppStyle.txtPoppinsMedium10Gray900.copyWith(fontSize: 14, color: Colors.white),
      ),
    ),
  );
}

/// **Builds cancel button**
Widget buildCancelButton() {
  return InkWell(
    onTap: () {
      setState(() {});
    },
    child: Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: Icon(Icons.cancel_outlined, size: 28, color: Color(0xFF858585)),
    ),
  );
}

/// **Builds UI for existing service (if already added)**
Widget buildExistingServiceRow() {
  var existingService = _viewModel.userServicesResponse!.services!
      .firstWhere((element) => element.title == widget.value.title);

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Container(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.5),
          child: Text(
            existingService.content ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      InkWell(
        onTap: () {
          _viewModel.deleteService(existingService.id ?? "");
        },
        child: Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(Icons.cancel_outlined, size: 28, color: Color(0xFF858585)),
        ),
      ),
    ],
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
}
