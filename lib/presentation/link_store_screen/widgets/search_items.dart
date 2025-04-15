import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/core/utils/size_utils.dart';
import 'package:taptohello/data/auth/model/add_service.dart';

import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart' as ud;
import 'package:taptohello/presentation/premium/previum_view.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
import 'package:taptohello/theme/app_decoration.dart';
import 'package:taptohello/theme/app_style.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';

import '../../../data/auth/model/search_services.dart';

class Listtype1ItemWidgetSearch extends ConsumerStatefulWidget {
  final Service value;

  Listtype1ItemWidgetSearch(this.value);

  @override
  ConsumerState<Listtype1ItemWidgetSearch> createState() =>
      _Listtype1ItemWidgetSearchState();
}

class _Listtype1ItemWidgetSearchState
    extends ConsumerState<Listtype1ItemWidgetSearch> with BaseScreenView {
  TextEditingController addDataController = TextEditingController();
  var focusNode = FocusNode();
  late AuthViewModel _viewModel;
  bool isExpanded = false;
  final ud.UserDetailService _userDetailService = getIt<ud.UserDetailService>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.requestFocus();
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
                if (widget.value.isPro == false &&
                    widget.value.isProPlus == false) {
                  setState(() {
                    isExpanded = valu;
                  });
                } else if ((_userDetailService
                            .userDetailResponse?.user?.plan?.planType?.title
                            ?.toLowerCase() ==
                        "pro+") ||
                    (widget.value.isProPlus == true)) {
                  setState(() {
                    isExpanded = valu;
                  });
                } else if (_userDetailService
                            .userDetailResponse?.user?.plan?.planType?.title
                            ?.toLowerCase() ==
                        "pro" ||
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
              trailing: !isExpanded
                  ? (_viewModel.userServicesResponse!.services!.any(
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
                    child: getWidget())
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getWidget() {
    if (_userDetailService.userDetailResponse?.user?.services == null) {
      return Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              height: 45,
              child: CustomTextFormField(
                maxlength: 300,
                focusNode: focusNode,
                controller: addDataController,
                hintText: "@mina_howell",
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (addDataController.text.isNotEmpty) {
                _viewModel.addServiceRequest = AddServiceRequest(
                    content: addDataController.text,
                    serviceId: widget.value.id);
                focusNode.unfocus();
                _viewModel.addService(_viewModel.addServiceRequest, context);
                addDataController.clear();
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
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.cancel_outlined,
              size: 28,
              color: Color(0xFF858585),
            ),
          )
        ],
      );
    } else if (_viewModel.userServicesResponse!.services!
        .any((element) => element.title == widget.value.title)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text((_viewModel.userServicesResponse!.services!.firstWhere(
                        (element) => element.title == widget.value.title))
                    .content ??
                ""),
          ),
          InkWell(
            onTap: () {
              _viewModel.deleteService(_viewModel
                      .userServicesResponse!.services!
                      .firstWhere(
                          (element) => element.title == widget.value.title)
                      .id ??
                  "");
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
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              height: 45,
              child: CustomTextFormField(
                maxlength: 300,
                focusNode: focusNode,
                controller: addDataController,
                hintText: "@mina_howell",
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (addDataController.text.isNotEmpty) {
                _viewModel.addServiceRequest = AddServiceRequest(
                    content: addDataController.text,
                    serviceId: widget.value.id);
                focusNode.unfocus();
                _viewModel.addService(_viewModel.addServiceRequest, context);
                addDataController.clear();
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
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.cancel_outlined,
              size: 28,
              color: Color(0xFF858585),
            ),
          )
        ],
      );
    }
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
