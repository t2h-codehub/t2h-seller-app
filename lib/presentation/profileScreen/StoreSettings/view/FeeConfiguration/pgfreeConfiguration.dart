import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/FeeConfiguration/createPGFeeConfigurationAlreadyExistsApiResModel.dart';
import 'package:taptohello/data/FeeConfiguration/getFeeConfigurationApiResModel.dart';
import 'package:taptohello/data/FeeConfiguration/updatePGFeeConfigurationApiResModel.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/profileScreen/StoreSettings/view/FeeConfiguration/Controller/feeConfigurationController.dart';
import 'package:taptohello/services/shared_preference_service.dart';

class PGFreeConfigurationScreen extends StatefulWidget {
  const PGFreeConfigurationScreen({super.key});

  @override
  State<PGFreeConfigurationScreen> createState() =>
      _PGFreeConfigurationScreenState();
}

class _PGFreeConfigurationScreenState extends State<PGFreeConfigurationScreen> {
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  bool pgFreeConfig = false;

  bool pgFeeType = true;

  TextEditingController pgFeeConfiguration = TextEditingController();

  GetPGFeeConfigurationApiResModel getPGFeeConfigurationApiResModel =
      GetPGFeeConfigurationApiResModel();
  CreatePGFeeConfigurationApiResModel createPGFeeConfigurationApiResModel = CreatePGFeeConfigurationApiResModel();
  UpdatePGFeeConfigurationApiResModel updatePGFeeConfigurationApiResModel = UpdatePGFeeConfigurationApiResModel();

  final FeeConfigurationController _feeConfigurationController = FeeConfigurationController();

  String userId = '';
  String pgID = '';

  bool isApiDataAvailable = false;
  late Future _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userId = _userDetailService.userDetailResponse?.user?.id ?? '';
    _future = getPGFeeConfiguration();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
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
        centerTitle: false,
        title: Text(
          'PG Fee Configuration',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          /// Submit coupon Button
          InkWell(
            onTap: () {
              SharedPreferenceService.setString("pgFeeToggle", "$pgFreeConfig");
              SharedPreferenceService.setString("pgFeeType", "$pgFeeType");
              SharedPreferenceService.setString(
                  "pgFeeTextField", pgFeeConfiguration.text);
              debugPrint(
                  'Pg fee toggle: ${SharedPreferenceService.getString('pgFeeToggle')}');
              debugPrint(
                  'Pg fee toggle: ${SharedPreferenceService.getString('pgFeeType')}');
              debugPrint(
                  'Pg fee toggle: ${SharedPreferenceService.getString('pgFeeTextField')}');
              createCheckPGFeeConfiguration();
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
                        "Pass payment gateway Fee to Buyer",
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
                                  debugPrint('My value is: $pgFeeType');
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
                                  debugPrint('My value is: $pgFeeType');
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
                    controller: pgFeeConfiguration,
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
        }
      ),
    );
  }

  /// get pg fee configuration function
  Future<bool> getPGFeeConfiguration() async {
    Map<String, dynamic> body = {
      "userId": userId
    };
    getPGFeeConfigurationApiResModel = await _feeConfigurationController.getPGFee(body);
    if(getPGFeeConfigurationApiResModel.success == true) {
      isApiDataAvailable = true;
      pgID = "${getPGFeeConfigurationApiResModel.data?.sId}";
      pgFreeConfig = getPGFeeConfigurationApiResModel.data?.status == 1 ? true : false;
      pgFeeType = getPGFeeConfigurationApiResModel.data?.type == 1 ? true : false;
      pgFeeConfiguration.text = "${getPGFeeConfigurationApiResModel.data?.feeValue}";
    } else {
      isApiDataAvailable = true;
    }
    setState(() {});
    return isApiDataAvailable;
  }

  /// create pg fee configuration function
  createCheckPGFeeConfiguration() async {
    Map<String, dynamic> body = {
      "userId":userId,
      "status": pgFreeConfig ? "1" : "0",
      "type": pgFeeType ? "1" : "2",
      "feeValue":pgFeeConfiguration.text
    };
    createPGFeeConfigurationApiResModel = await _feeConfigurationController.createPgFee(body);
    if(createPGFeeConfigurationApiResModel.success == true) {
      Navigator.pop(context);
    } else {
      updatePGFeeConfiguration();
    }
  }

  /// update pg fee configuration function
  updatePGFeeConfiguration() async {
    Map<String, dynamic> body = {
      "PgId":pgID,
      "userId":userId,
      "status":pgFreeConfig ? "1" : "0",
      "type":pgFeeType ? "1" : "2",
      "feeValue":pgFeeConfiguration.text
    };

    updatePGFeeConfigurationApiResModel = await _feeConfigurationController.updatePGFee(body);
    if(updatePGFeeConfigurationApiResModel.success == true) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${updatePGFeeConfigurationApiResModel.message}')));
    }
  }
}
