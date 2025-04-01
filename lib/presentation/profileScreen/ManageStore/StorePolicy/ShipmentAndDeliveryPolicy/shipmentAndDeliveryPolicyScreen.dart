import 'package:flutter/material.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/data/PolicyModel/ReturnAndReplacementPolicy/craeteReturnReplacementPolicyApiResModel.dart';
import 'package:taptohello/data/PolicyModel/ReturnAndReplacementPolicy/getReturnAndReplacementPolicy.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/StorePolicy/shipmentAndDeliveryPolicyController/shipmentAndDeliveryPolicyController.dart';

import '../../../../../data/PolicyModel/ReturnAndReplacementPolicy/updateReturnReplacementPolicy.dart';

class ShipmentAndDeliveryPolicyScreen extends StatefulWidget {
  const ShipmentAndDeliveryPolicyScreen({super.key});

  @override
  State<ShipmentAndDeliveryPolicyScreen> createState() => _ShipmentAndDeliveryPolicyScreen();
}

class _ShipmentAndDeliveryPolicyScreen extends State<ShipmentAndDeliveryPolicyScreen> {
  final UserDetailService _userDetailService = getIt<UserDetailService>();

  bool allowReplacement = false;

  bool isStoreEnable = false;

  TextEditingController daysController = TextEditingController(text: "7");

  final TextEditingController _controller = TextEditingController();
  final ShipmentAndDeliveryPolicyController _shipmentPolicyController = ShipmentAndDeliveryPolicyController();
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
          'Shipment and Delivery Policy',
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
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.multiline,
              // maxLines: null,
              expands: false,
               maxLines: 10, // Maximum height the TextField can expand to
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
      // "status": 0,
      // "estimatedDeliveryDays": "3",
      "description":_controller.text
    };

    debugPrint('My return policy body is: $body');

    createReturnAndReplacementPolicyApiResModel = await _shipmentPolicyController.createReturnAndReplacementPolicy(body);
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
    getReturnAndReplacementPolicyApiResModel = await _shipmentPolicyController.getReturnAndReplacementPolicy(body);
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
      "policyId": getReturnAndReplacementPolicyApiResModel.data?.sId,
      "userId": _userDetailService.userDetailResponse?.user?.id,
      // "status": 1,
      // "estimatedDeliveryDays": 5,
      "description": _controller.text
    };

    updateReturnAndReplacementPolicyApiResModel = await _shipmentPolicyController.updateReturnAndReplacementPolicy(body);
    if(updateReturnAndReplacementPolicyApiResModel.success == true) {
      Navigator.pop(context);
    }
  }
}
