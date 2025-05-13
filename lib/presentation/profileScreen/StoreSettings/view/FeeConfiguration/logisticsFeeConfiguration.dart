import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/FeeConfiguration/createLogisticFeeConfigurationApiResModel.dart';
import 'package:taptohello/data/FeeConfiguration/getLogisticFeeConfigurationApiResModel.dart';
import 'package:taptohello/data/FeeConfiguration/updateLogisticFeeConfigurationApiResModel.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/profileScreen/StoreSettings/view/FeeConfiguration/Controller/feeConfigurationController.dart';

class LogisticsFeeConfigurationsScreen extends StatefulWidget {
  const LogisticsFeeConfigurationsScreen({super.key});

  @override
  State<LogisticsFeeConfigurationsScreen> createState() => _LogisticsFeeConfigurationsScreenState();
}

class _LogisticsFeeConfigurationsScreenState extends State<LogisticsFeeConfigurationsScreen> {
  final UserDetailService _userDetailService = getIt<UserDetailService>();

  bool pgFreeConfig = false;

  bool pgFeeType = true;

  TextEditingController logisticsFeeConfiguration = TextEditingController();

  GetLogisticFeeConfiguration getLogisticFeeConfiguration = GetLogisticFeeConfiguration();
  CreateLogisticFeeConfiguration createLogisticFeeConfiguration = CreateLogisticFeeConfiguration();
  UpdateLogisticFeeConfiguration updateLogisticFeeConfiguration = UpdateLogisticFeeConfiguration();
  final FeeConfigurationController _feeConfigurationController = FeeConfigurationController();

  String userId = '';
  String logisticId = '';

  bool isApiDataAvailable = false;
  late Future _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userId = _userDetailService.userDetailResponse?.user?.id ?? '';
    _future = getLogisticFeeConfigurationFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        /*iconTheme: IconThemeData(
          color: Colors.grey,
        ),*/
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Image.asset(
                "assets/images/back.png",
                height: 24,
              )),
        ),
        centerTitle: false,

        title: Text(
          'Logistics  Fee Configuration',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          /// Submit coupon Button
          InkWell(
            onTap: () {
              createCheckLogisticFeeConfiguration();
            },
            child: Padding(
              padding: EdgeInsets.only(top: 24, right: 14),
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
        ],
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if(isApiDataAvailable) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),

                /// Pass payment gateway Fee to Buyer text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pass Logistics Fee to Buyer",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                        width: 45,
                        child: AnimatedToggleSwitch<bool>.dual(
                          current: pgFreeConfig,
                          first: false,
                          second: true,
                          innerColor:
                          pgFreeConfig ? AppCol.primary : Color(0xFFD0D5DD),
                          dif: 1.0,
                          borderColor: Colors.transparent,
                          // borderWidth: 2.0,
                          // height: 20,
                          indicatorSize: Size(17, 18),
                          indicatorColor: Colors.white,
                          onChanged: (b) {
                            pgFreeConfig = b;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                /// Fee Type
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Fee type",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                /// fee type radio button
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: [
                      /// Fixed Radio
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Radio<bool>(
                              value: true,
                              groupValue: pgFeeType,
                              activeColor: AppCol.primary,
                              visualDensity: VisualDensity.compact,
                              onChanged: (bool? value) {
                                setState(() {
                                  pgFeeType = value!;
                                });
                              },
                            ),
                            Text(
                              'Fixed',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.08),

                      /// % of total product value Radio
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Radio<bool>(
                              value: false,
                              groupValue: pgFeeType,
                              activeColor: AppCol.primary,
                              visualDensity: VisualDensity.compact,
                              onChanged: (bool? value) {
                                setState(() {
                                  pgFeeType = value!;
                                });
                              },
                            ),
                            Text(
                              '% of total product value',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                /// Fee Value Text field
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: TextFormField(
                    controller: logisticsFeeConfiguration,
                    decoration: InputDecoration(
                      labelText: 'Fee value',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Enter value',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {},
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  /// get logistic fee configuration function
  Future<bool> getLogisticFeeConfigurationFunction() async {
    Map<String, dynamic> body = {
      "userId": userId
    };
    getLogisticFeeConfiguration = await _feeConfigurationController.getLogisticFee(body);
    if(getLogisticFeeConfiguration.success == true) {
      isApiDataAvailable = true;
      logisticId = "${getLogisticFeeConfiguration.data?.sId}";
      pgFreeConfig = getLogisticFeeConfiguration.data?.status == 1 ? true : false;
      pgFeeType = getLogisticFeeConfiguration.data?.type == 1 ? true : false;
      logisticsFeeConfiguration.text = "${getLogisticFeeConfiguration.data?.feeValue}";
    } else {
      isApiDataAvailable = true;
    }
    setState(() {});
    return isApiDataAvailable;
  }

  /// create logistic fee configuration function
  createCheckLogisticFeeConfiguration() async {
    Map<String, dynamic> body = {
      "userId":userId,
      "status": pgFreeConfig ? "1" : "0",
      "type": pgFeeType ? "1" : "2",
      "feeValue":logisticsFeeConfiguration.text
    };
    createLogisticFeeConfiguration = await _feeConfigurationController.createLogisticFee(body);
   // debugPrint('My response is: $createLogisticFeeConfiguration');
    if(createLogisticFeeConfiguration.success == true) {
      Navigator.pop(context);
    } else {
      updatePGFeeConfiguration();
    }
  }

  /// update pg fee configuration function
  updatePGFeeConfiguration() async {
    Map<String, dynamic> body = {
      "LogisticsId":logisticId,
      "userId":userId,
      "status":pgFreeConfig ? "1" : "0",
      "type":pgFeeType ? "1" : "2",
      "feeValue":logisticsFeeConfiguration.text
    };

    updateLogisticFeeConfiguration = await _feeConfigurationController.updateLogisticFee(body);
    debugPrint('My update response is: ${updateLogisticFeeConfiguration.success}');
    if(updateLogisticFeeConfiguration.success == true) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${updateLogisticFeeConfiguration.message}')));
    }
  }
}
