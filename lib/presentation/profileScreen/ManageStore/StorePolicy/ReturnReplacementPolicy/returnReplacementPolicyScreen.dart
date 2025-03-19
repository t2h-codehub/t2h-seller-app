import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/data/PolicyModel/ReturnAndReplacementPolicy/craeteReturnReplacementPolicyApiResModel.dart';
import 'package:taptohello/data/PolicyModel/ReturnAndReplacementPolicy/getReturnAndReplacementPolicy.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/StorePolicy/returnandCancellationPolicyController/returnReplacementPolicyController.dart';

import '../../../../../data/PolicyModel/ReturnAndReplacementPolicy/updateReturnReplacementPolicy.dart';

class ReturnReplacementPolicyScreen extends StatefulWidget {
  const ReturnReplacementPolicyScreen({super.key});

  @override
  State<ReturnReplacementPolicyScreen> createState() => _ReturnReplacementPolicyScreenState();
}

class _ReturnReplacementPolicyScreenState extends State<ReturnReplacementPolicyScreen> {
  final UserDetailService _userDetailService = getIt<UserDetailService>();

  bool allowReplacement = false;

  bool isStoreEnable = false;

  TextEditingController daysController = TextEditingController(text: "7");

  final TextEditingController _controller = TextEditingController();
  final ReturnReplacementPolicyController _replacementPolicyController = ReturnReplacementPolicyController();
  CreateReturnAndReplacementPolicyApiResModel createReturnAndReplacementPolicyApiResModel = CreateReturnAndReplacementPolicyApiResModel();
  GetReturnAndReplacementPolicyApiResModel getReturnAndReplacementPolicyApiResModel = GetReturnAndReplacementPolicyApiResModel();
  UpdateReturnAndReplacementPolicyApiResModel updateReturnAndReplacementPolicyApiResModel = UpdateReturnAndReplacementPolicyApiResModel();

  @override
  void initState() {
    super.initState();
    getCreateReturnAndReplacementPolicy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Return/Replacement Policy',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          /// Submit button
          InkWell(
            onTap: () {
              createReturnAndReplacementPolicy();
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: AppCol.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Allow Replacement',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                /// Toggle Button
                Row(
                  children: [
                    Text(
                      'No',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8),
                    SizedBox(
                      height: 24,
                      width: 45,
                      child: AnimatedToggleSwitch<bool>.dual(
                        current: allowReplacement,
                        first: false,
                        second: true,
                        innerColor:
                        allowReplacement ? AppCol.primary : Color(0xFFD0D5DD),
                        dif: 1.0,
                        borderColor: Colors.transparent,
                        // borderWidth: 2.0,
                        // height: 20,
                        indicatorSize: Size(17, 18),
                        indicatorColor: Colors.white,
                        onChanged: (b) {
                          allowReplacement = b;
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),

          if(allowReplacement)...[
            /// Number of days
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 60,
                child: TextFormField(
                  controller: daysController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Number of days',
                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    daysController.text = value;
                  },
                ),
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "Enter the number of days from delivery date when replacement is allowed",
                style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ],

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.multiline,
              // maxLines: null,
              expands: false,
               maxLines: 7, // Maximum height the TextField can expand to
          minLines: 1,
              decoration: InputDecoration(
                labelText: 'Additional Terms (Modify as per your need)',
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.all(16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: TextStyle(height: 1.5),
            ),
          )

        ],
      ),
    );
  }

  /// create return and replacement policy
  createReturnAndReplacementPolicy() async {
    Map<String, dynamic> body = {
      "userId": _userDetailService.userDetailResponse?.user?.id,
      "status": allowReplacement ? 1 : 0,
      "noOfDay":allowReplacement ? daysController.text : "0",
      "description":_controller.text
    };

    debugPrint('My return policy body is: $body');

    createReturnAndReplacementPolicyApiResModel = await _replacementPolicyController.createReturnAndReplacementPolicy(body);
    if(createReturnAndReplacementPolicyApiResModel.success == false) {
      updateReturnAndReplacementPolicy();
    } else {
      getCreateReturnAndReplacementPolicy();
    }
  }

  /// get create return and replacement policy
  getCreateReturnAndReplacementPolicy() async {
    Map<String, dynamic> body = {
      "userId": _userDetailService.userDetailResponse?.user?.id
    };
    getReturnAndReplacementPolicyApiResModel = await _replacementPolicyController.getReturnAndReplacementPolicy(body);
    if(getReturnAndReplacementPolicyApiResModel.success == true) {
      allowReplacement = getReturnAndReplacementPolicyApiResModel.data?.status == 0 ? false : true;
      daysController.text = "${getReturnAndReplacementPolicyApiResModel.data?.noOfDay}";

      String description = getReturnAndReplacementPolicyApiResModel.data?.description ?? '';
      _controller.text = description;
    }
    setState(() {});
  }

  /// update return and replacement policy
  updateReturnAndReplacementPolicy() async {
    Map<String, dynamic> body = {
      "PolicyId": getReturnAndReplacementPolicyApiResModel.data?.sId,
      "userId": _userDetailService.userDetailResponse?.user?.id,
      "status": allowReplacement ? 1 : 0,
      "noOfDay": allowReplacement ? daysController.text : "0",
      "description": _controller.text
    };

    updateReturnAndReplacementPolicyApiResModel = await _replacementPolicyController.updateReturnAndReplacementPolicy(body);
    if(updateReturnAndReplacementPolicyApiResModel.success == true) {
      Navigator.pop(context);
    }
  }
}
