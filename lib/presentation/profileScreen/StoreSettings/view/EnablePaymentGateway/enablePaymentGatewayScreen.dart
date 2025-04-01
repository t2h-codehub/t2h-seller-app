import 'package:flutter/material.dart';
import 'package:taptohello/data/PaymentGatewayModel/getBillingApiResModel.dart';
import 'package:taptohello/data/PaymentGatewayModel/insertBillingApiResModel.dart';
import 'package:taptohello/data/PaymentGatewayModel/merchantPaymentApiResModel.dart';
import 'package:taptohello/data/PaymentGatewayModel/paymentResponse.dart';
import 'package:taptohello/data/PaymentGatewayModel/updateBillingApiResModel.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/profileScreen/StoreSettings/controller/paymentGatewayController.dart';
import 'package:taptohello/presentation/profileScreen/StoreSettings/view/EnablePaymentGateway/businessInformationScreen.dart';
import 'package:taptohello/presentation/profileScreen/StoreSettings/view/EnablePaymentGateway/contactDetailsScreen.dart';
import 'package:taptohello/presentation/profileScreen/StoreSettings/view/EnablePaymentGateway/paymentGatewayScreen.dart';
import 'package:taptohello/services/shared_preference_service.dart';

class EnablePaymentGatewayScreen extends StatefulWidget {
  const EnablePaymentGatewayScreen({super.key});

  @override
  State<EnablePaymentGatewayScreen> createState() =>
      _EnablePaymentGatewayScreenState();
}

class _EnablePaymentGatewayScreenState
    extends State<EnablePaymentGatewayScreen> {
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  List<String> appBarTitle = ['Business', 'Contact', 'Seller KYC'];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  MerchantPaymentAPIResModel merchantPaymentAPIResModel =
  MerchantPaymentAPIResModel();
  PaymentGatewayController paymentGatewayController =
  PaymentGatewayController();
  PaymentResponse paymentResponse = PaymentResponse();

  int _currentStep = 0;

  GetBillingApiResModel getBillingApiResModel = GetBillingApiResModel();

  bool isApiDataAvailable = false;
  late Future _future;


  @override
  void initState() {
    super.initState();
    _future = getBillingDetails();
    merchant_id =
    'test_${_userDetailService.userDetailResponse?.user?.id}';
    debugPrint('My seller id is: ${_userDetailService.userDetailResponse?.user?.id}');
  }

  /// get billing details from api
  Future<bool> getBillingDetails() async {
    Map<String, dynamic> body = {
      "sellerId": "${_userDetailService.userDetailResponse?.user?.id}",
    };
    getBillingApiResModel = await paymentGatewayController.getBilling(body);
    if(getBillingApiResModel.success == true) {
      isApiDataAvailable = true;
      business_pan = (getBillingApiResModel.data?.businessPan != "" ? getBillingApiResModel.data?.businessPan : SharedPreferenceService.getString("paymentBusinessPan") ?? '')!;
      debugPrint('My api pan id is: $business_pan');
      business_gstin = (getBillingApiResModel.data?.gst != "" ? getBillingApiResModel.data?.gst : SharedPreferenceService.getString("paymentBusinessGST") ?? '')!;
      business_address = (getBillingApiResModel.data?.operationalAddress != "" ? getBillingApiResModel.data?.operationalAddress : SharedPreferenceService.getString("paymentBusinessAddress") ?? '')!;
      business_postalcode = (getBillingApiResModel.data?.shipmentAddress != "" ? getBillingApiResModel.data?.shipmentAddress : SharedPreferenceService.getString("paymentBusinessPostalCode") ?? '')!;
      business_city = (getBillingApiResModel.data?.city != "" ? getBillingApiResModel.data?.city : SharedPreferenceService.getString("paymentBusinessCity") ?? '')!;
      business_state = (getBillingApiResModel.data?.state != "" ? getBillingApiResModel.data?.state : SharedPreferenceService.getString("paymentBusinessState") ?? '')!;
      paymentAccountId = SharedPreferenceService.getString("paymentId") ?? '';
      // paymentAccountId = '';
      accountStatus = SharedPreferenceService.getString("accountStatus") ?? '';
      billingID = getBillingApiResModel.data?.sId ?? '';
      business_type = getBillingApiResModel.data?.businessEntityType ?? '';
      business_category = getBillingApiResModel.data?.businessCategory ?? '';
      business_subcategory = getBillingApiResModel.data?.businessSubCategory ?? '';
      merchant_name = SharedPreferenceService.getString("merchantName") ?? '';
      merchant_email = SharedPreferenceService.getString("merchantEmail") ?? '';
      poc_phone = SharedPreferenceService.getString("pocPhone") ?? '';
      business_legal_name = SharedPreferenceService.getString("businessLegalName") ?? '';

      if (paymentAccountId.isNotEmpty) {
        _currentStep = 2;
        setState(() {

        });
      }
    }
    else {
      business_pan = '';
      business_gstin = '';
      business_address = '';
      business_postalcode = '';
      business_city = '';
      business_state = '';
      paymentAccountId = '';
      accountStatus = '';
      billingID =  '';
      business_type = '';
      business_category = '';
      business_subcategory = '';
      merchant_name = '';
      merchant_email = '';
      poc_phone =  '';
      business_legal_name = '';
      isApiDataAvailable = true;
    }
    return isApiDataAvailable;
  }

  /// Details Variables
  String merchant_id = '';
  String merchant_email = '';
  String merchant_name = '';
  String poc_phone = '9999999999';
  String merchant_site_url = 'cashfree.com';
  String business_legal_name = '';
  String business_type = '';
  String business_model = 'Both';
  String business_category = '';
  String business_subcategory = '';
  String business_pan = 'ABCCD8000T';
  String business_address = '';
  String business_city = '';
  String business_state = '';
  String business_postalcode = '';
  String business_country = 'India';
  String business_gstin = '29AAICP2912R1ZR';
  String business_cin = 'L65190MH2003PLC143249';
  String register_address = '';
  String register_shipment = '';
  String register_city = '';
  String register_state = '';
  String billingID = '';

  bool isCreatingMerchant = false;

  String paymentAccountId = '';
  String accountStatus = '';

  /// get billing details from local database
  void getDetails() {
    business_pan =
        SharedPreferenceService.getString("paymentBusinessPan") ?? '';
    business_gstin =
        SharedPreferenceService.getString("paymentBusinessGST") ?? '';
    business_address =
        SharedPreferenceService.getString("paymentBusinessAddress") ?? '';
    business_postalcode =
        SharedPreferenceService.getString("paymentBusinessPostalCode") ?? '';
    business_city =
        SharedPreferenceService.getString("paymentBusinessCity") ?? '';
    business_state =
        SharedPreferenceService.getString("paymentBusinessState") ?? '';

    paymentAccountId = SharedPreferenceService.getString("paymentId") ?? '';
    accountStatus = SharedPreferenceService.getString("accountStatus") ?? '';

    if (paymentAccountId.isNotEmpty) {
      _currentStep = 2;
    }
  }

  bool isGSTNotApplicable = false;

  InsertBillingApiResModel insertBillingApiResModel = InsertBillingApiResModel();
  UpdateBillingApiResModel updateBillingApiResModel = UpdateBillingApiResModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Enable Payment - ${appBarTitle[_currentStep]}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if(isApiDataAvailable) {
            return Column(
              children: [
                // Custom Stepper Row
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStepCircle(0, 'Step1'),
                      _buildStepDivider(),
                      _buildStepCircle(1, 'Step2'),
                      _buildStepDivider(),
                      _buildStepCircle(2, 'Step3'),
                    ],
                  ),
                ),
                Expanded(
                  child: _currentStep == 0
                      ? BusinessInformationScreen(
                    formKey: _formKey,
                    getApiDetails: getBillingApiResModel,
                    business_pan: (value) {
                      business_pan = value;
                      SharedPreferenceService.setString(
                          "paymentBusinessPan", business_pan);
                    },
                    business_gstin: (value) {
                      business_gstin = value;
                      SharedPreferenceService.setString(
                          "paymentBusinessGST", business_gstin);
                    },
                    isGSTNotApplicable: (value) {
                      isGSTNotApplicable = value;
                      debugPrint('My gst is applicable: $value');
                    },
                    business_operational_address: (value) {
                      business_address = value;
                      debugPrint('My operational address is: $business_address');
                      SharedPreferenceService.setString(
                          "paymentBusinessAddress", business_address);
                    },
                    business_shipment_address: (value) {
                      business_postalcode = value;
                      debugPrint('My operational address is: $business_postalcode');
                      SharedPreferenceService.setString(
                          "paymentBusinessPostalCode", business_postalcode);
                    },
                    business_city: (value) {
                      business_city = value;
                      SharedPreferenceService.setString(
                          "paymentBusinessCity", business_city);
                    },
                    business_state: (value) {
                      business_state = value;
                      SharedPreferenceService.setString(
                          "paymentBusinessState", business_state);
                    },
                    register_address: (value) {
                      register_address = value;
                    },
                    register_shipment: (value) {
                      register_shipment = value;
                    },
                    register_city: (value) {
                      register_city = value;
                    },
                    register_state: (value) {
                      register_state = value;
                    },
                  )
                      : _currentStep == 1
                      ? ContactDetailsScreen(
                    merchant_name: (value) {
                      merchant_name = value;
                      SharedPreferenceService.setString(
                          "merchantName", merchant_name);
                    },
                    merchant_email: (value) {
                      merchant_email = value;
                      SharedPreferenceService.setString(
                          "merchantEmail", merchant_email);
                    },
                    poc_phone: (value) {
                      poc_phone = value;
                      SharedPreferenceService.setString(
                          "pocPhone", poc_phone);
                    },
                    business_legal_name: (value) {
                      business_legal_name = value;
                      SharedPreferenceService.setString(
                          "businessLegalName", business_legal_name);
                    },
                    business_type: (value) {
                      business_type = value;
                      debugPrint('My business type is: $business_type');
                      SharedPreferenceService.setString(
                          "businessType", business_type);
                    },
                    business_category: (value) {
                      business_category = value;
                      SharedPreferenceService.setString(
                          "businessCategory", business_category);
                    },
                    business_subcategory: (value) {
                      business_subcategory = value;
                      SharedPreferenceService.setString(
                          "businessSubCategory", business_subcategory);
                    },
                    getApiDetails: getBillingApiResModel,
                  )
                      : PaymentGatewayScreen(
                    paymentAccountId: paymentAccountId,
                    accountStatus: accountStatus,
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
      bottomNavigationBar: _currentStep == 2
          ?  SizedBox() : Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: ElevatedButton(
          onPressed: _currentStep == 0
              ? () {
            if (_formKey.currentState?.validate() ?? false) {
              if (business_postalcode.isNotEmpty &&
                  business_city.isNotEmpty &&
                  business_state.isNotEmpty) {
                savingOrderDetails();
                setState(() {
                  _currentStep++;
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text('Please fill all the fields'),
                  ),
                );
              }
            }
          }
              : _currentStep == 1
              ? () {
            if (merchant_name.isNotEmpty &&
                merchant_email.isNotEmpty &&
                poc_phone.isNotEmpty &&
                business_legal_name.isNotEmpty &&
            business_type.isNotEmpty &&
            business_category.isNotEmpty &&
            business_subcategory.isNotEmpty) {
              merchantBody();
              // savingOrderDetails();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text('Please fill all the fields'),
                ),
              );
            }
          }
              : () {},
          child: isCreatingMerchant
              ? Center(
            child: CircularProgressIndicator(color: Colors.white),
          )
              : Text('Save and Next'),
        ),
      ),
    );
  }

  // Function to build a circle with the step number
  Widget _buildStepCircle(int stepIndex, String stepLabel) {
    bool isActive = stepIndex == _currentStep;
    return InkWell(
      onTap: () {
        if (stepIndex <= _currentStep) { // Only allow going to current or previous steps
          setState(() {
            _currentStep = stepIndex;
            isApiDataAvailable = false;
            _future = getBillingDetails();
          });
        }
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: isActive ? Colors.deepOrange : Colors.grey,
            child: isActive
                ? Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 14,
                ))
                : Center(
                child: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.white,
                  size: 14,
                )),
          ),
          SizedBox(height: 8),
          Text(
            stepLabel,
            style: TextStyle(
              color: isActive ? Colors.black : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // Function to build a divider between steps
  Widget _buildStepDivider() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Divider(
          thickness: 2,
          color: Colors.grey,
        ),
      ),
    );
  }

  /// merchants create id raw body
  void merchantBody() async {
    setState(() {
      isCreatingMerchant = true;
    });
    Map<String, dynamic> merchantsBody = {
      "merchant_id": merchant_id,
      "merchant_email": merchant_email,
      "merchant_name": merchant_name,
      "poc_phone": poc_phone,
      "merchant_site_url": merchant_site_url,
      "business_details": {
        "business_legal_name": business_legal_name,
        "business_type": business_type,
        "business_model": business_model,
        "business_category": business_category,
        "business_subcategory": business_subcategory,
        "business_pan": business_pan,
        "business_address": business_address,
        "business_city": business_city,
        "business_state": business_state,
        "business_postalcode": business_postalcode,
        "business_country": business_country,
        "business_gstin": isGSTNotApplicable ? "" : business_gstin,
        "business_cin": business_cin
      }
    };
    debugPrint('My merchant body is: $merchantsBody');

    savingOrderDetails();
    paymentResponse = await paymentGatewayController.merchantPaymentGateway(context, merchantsBody);
    debugPrint('My merchant id is: ${merchantPaymentAPIResModel.merchantId}');
    debugPrint('My merchant status is: ${merchantPaymentAPIResModel.onboardingStatus}');
    if (paymentResponse.statusCode == 200) {
      debugPrint('My payment response: ${paymentResponse.model}');
      paymentAccountId = paymentResponse.model?.merchantId ?? '';
      SharedPreferenceService.setString("paymentId", paymentAccountId);
      debugPrint(
          'My payment id: ${SharedPreferenceService.getString("paymentId")}');
      accountStatus = paymentResponse.model?.productStatus?[0].productFullKycStatus ?? '';
      SharedPreferenceService.setString("accountStatus", accountStatus);
      setState(() {
        isCreatingMerchant = false;
        _currentStep++;
      });
    } else if (paymentResponse.statusCode == 409) {
      setState(() {
        isCreatingMerchant = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Merchant with same id already exists'),
        ),
      );
    }
  }

  /// saving order details
  void savingOrderDetails() async {
    debugPrint('My business address is: $business_address');
    debugPrint('My business shipment address is: $business_postalcode');
    debugPrint('My business shipment address is: $register_address');
    debugPrint('My business shipment address is: $register_shipment');
    Map<String, dynamic> body = {
      "sellerId":"${_userDetailService.userDetailResponse?.user?.id}",
      "businessPan":business_pan,
      "gst": isGSTNotApplicable ? "" : business_gstin,
      "operationalAddress":business_address,
      "shipmentAddress":business_postalcode,
      "city":business_city,
      "state":business_state,
      "registerOperationalAddress":register_address,
      "registerShipmentAddress":register_shipment,
      "registerCity":register_city,
      "registerState":register_state
    };
    insertBillingApiResModel = await paymentGatewayController.insertBilling(body);
    if(insertBillingApiResModel.success == false) {
      updateBilling();
    }
  }

  /// update if already exits
  void updateBilling() async {
    debugPrint('My billing id is: $billingID');
    Map<String, dynamic> body = {
      "billingId": billingID,
      "businessPan":business_pan,
      "gst": isGSTNotApplicable ? "" : business_gstin,
      "operationalAddress":business_address,
      "shipmentAddress":business_postalcode,
      "city":business_city,
      "state":business_state,
      "registerOperationalAddress":register_address,
      "registerShipmentAddress":register_shipment,
      "registerCity":register_city,
      "registerState":register_state,
      "businessEntityType":business_type,
      "businessCategory":business_category,
      "businessSubCategory":business_subcategory
    };
    updateBillingApiResModel = await paymentGatewayController.updateBilling(body);
    if(updateBillingApiResModel.success == true) {
    } else {
      debugPrint('My this api hit');
    }
  }
}