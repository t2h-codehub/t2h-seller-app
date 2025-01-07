import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/utils/color_constant.dart';
import 'package:swapnil_s_application4/data/PolicyModel/CancellationPolicyApiResModel/createCancellationPolicy.dart';
import 'package:swapnil_s_application4/data/PolicyModel/CancellationPolicyApiResModel/getCancellationPolicyApiResModel.dart';
import 'package:swapnil_s_application4/data/PolicyModel/CancellationPolicyApiResModel/updateCancellationPolicy.dart';
import 'package:swapnil_s_application4/helper/locator.dart';
import 'package:swapnil_s_application4/helper/user_detail_service.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/StorePolicy/cancellationPolicyController/cancellationPolicyController.dart';

class CancellationPolicyScreen extends StatefulWidget {
  const CancellationPolicyScreen({super.key});

  @override
  State<CancellationPolicyScreen> createState() => _CancellationPolicyScreenState();
}

class _CancellationPolicyScreenState extends State<CancellationPolicyScreen> {
  final UserDetailService _userDetailService = getIt<UserDetailService>();

  CancellationPolicyController _cancellationPolicyController = CancellationPolicyController();
  GetCancellationPolicyApiResModel getCancellationPolicyApiResModel = GetCancellationPolicyApiResModel();
  CreateCancellationPolicyApiResModel createCancellationPolicyApiResModel = CreateCancellationPolicyApiResModel();
  UpdateCancellationPolicyApiResModel updateCancellationPolicyApiResModel = UpdateCancellationPolicyApiResModel();
  bool allowCancellation = false;

  bool isStoreEnable = false;

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCancellationPolicy();
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
          'Cancellation Policy',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          /// Submit button
          InkWell(
            onTap: () {
              createCancellationPolicy();
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
                  'Allow Cancellation',
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
                    Container(
                      height: 24,
                      width: 45,
                      child: AnimatedToggleSwitch<bool>.dual(
                        current: allowCancellation,
                        first: false,
                        second: true,
                        innerColor:
                        allowCancellation ? AppCol.primary : Color(0xFFD0D5DD),
                        dif: 1.0,
                        borderColor: Colors.transparent,
                        // borderWidth: 2.0,
                        // height: 20,
                        indicatorSize: Size(17, 18),
                        indicatorColor: Colors.white,
                        onChanged: (b) {
                          allowCancellation = b;
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

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
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

  /// get cancellation policy
  getCancellationPolicy() async {
    Map<String, dynamic> body = {
      "userId": _userDetailService.userDetailResponse?.user?.id
    };
    getCancellationPolicyApiResModel = await _cancellationPolicyController.getCancellationPolicy(body);
    if(getCancellationPolicyApiResModel.success == true) {
      allowCancellation = getCancellationPolicyApiResModel.data?.status == 0 ? false : true;

      String description = getCancellationPolicyApiResModel.data?.description ?? '';

      // Format the description into new lines based on numbering
      _controller.text = description;
    }
    setState(() {});
  }

  /// create cancellation policy
  createCancellationPolicy() async {
    Map<String, dynamic> body = {
      "userId": _userDetailService.userDetailResponse?.user?.id,
      "status": allowCancellation ? 1 : 0,
      "noOfDay": "0",
      "description":_controller.text
    };

    debugPrint('My return policy body is: $body');

    createCancellationPolicyApiResModel = await _cancellationPolicyController.createCancellationPolicy(body);
    if(createCancellationPolicyApiResModel.success == false) {
      updateCancellationPolicy();
    } else {
      getCancellationPolicy();
    }
  }

  /// update cancellation policy
  updateCancellationPolicy() async {
    Map<String, dynamic> body = {
      "PolicyId": getCancellationPolicyApiResModel.data?.sId,
      "userId": _userDetailService.userDetailResponse?.user?.id,
      "status": allowCancellation ? 1 : 0,
      "noOfDay": "0",
      "description": _controller.text
    };

    updateCancellationPolicyApiResModel = await _cancellationPolicyController.updateCancellationPolicy(body);
    if (updateCancellationPolicyApiResModel.success == true) {
      Navigator.pop(context);
    }
  }
}
