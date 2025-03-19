import 'package:flutter/material.dart';
import 'package:taptohello/data/PaymentGatewayModel/merchantStatusApiResModel.dart';
import 'package:taptohello/data/PaymentGatewayModel/onboardingApiResModel.dart';
import 'package:taptohello/data/PaymentGatewayModel/onboardingResponseModels.dart';
import 'package:taptohello/presentation/profileScreen/StoreSettings/controller/paymentGatewayController.dart';
import 'package:taptohello/presentation/profileScreen/StoreSettings/view/EnablePaymentGateway/payentOnboardingWEbViewScreen.dart';

class PaymentGatewayScreen extends StatefulWidget {
  const PaymentGatewayScreen(
      {super.key, required this.paymentAccountId, required this.accountStatus});

  final String paymentAccountId;
  final String accountStatus;

  @override
  State<PaymentGatewayScreen> createState() => _PaymentGatewayScreenState();
}

class _PaymentGatewayScreenState extends State<PaymentGatewayScreen> {
  PaymentOnboardingApiResModel paymentOnboardingApiResModel =
      PaymentOnboardingApiResModel();

  PaymentGatewayController paymentGatewayController =
      PaymentGatewayController();

  OnboardingResponseModel onboardingResponseModel = OnboardingResponseModel();
  MerchantStatusApiResModel merchantStatusApiResModel =
      MerchantStatusApiResModel();

  bool kycResult = false;
  String merchantKycStatus = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('My thos: $paymentOnboardingApiResModel');
    merchantStatus(widget.paymentAccountId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/images/Cashfree_Logo.png',
              height: 50,
              width: MediaQuery.of(context).size.width / 1.5,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Payment Account ID',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.paymentAccountId,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Account Status',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            merchantKycStatus != "" ? merchantKycStatus : widget.accountStatus,
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Note: An account has been successfully created for you on Cashfree Payment Gateway. '
            'An email confirmation has also been sent to you. You can complete the remaining KYC by clicking '
            'on that link or clicking the button below:',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          if(merchantKycStatus == "MIN_KYC_PENDING")...[
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: ElevatedButton(
                onPressed: paymentOnboardingScreenValue,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Complete KYC with Cashfree for Online Payment',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void paymentOnboardingScreenValue() async {
    onboardingResponseModel = await paymentGatewayController
        .paymentOnboarding(widget.paymentAccountId);
    if (onboardingResponseModel.statusCode == 200) {
      paymentOnboardingApiResModel =
          onboardingResponseModel.model ?? PaymentOnboardingApiResModel();

      // launchUrl(Uri.parse("${paymentOnboardingApiResModel.onboardingLink}"), mode: LaunchMode.externalNonBrowserApplication,);
      kycResult = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PaymentOnboardingWebView(
                    redirectUrl:
                        paymentOnboardingApiResModel.onboardingLink ?? '',
                  )));
      debugPrint('My Kyu result is: $kycResult');
      if (kycResult) {
        merchantStatus(widget.paymentAccountId);
      }
    }
  }

  void merchantStatus(merchantId) async {
    merchantStatusApiResModel =
        await paymentGatewayController.merchantStatus(merchantId);
    if (merchantStatusApiResModel.onboardingStatus == "Email Verified") {
      merchantKycStatus =
          merchantStatusApiResModel.productStatus?[0].productMinKycStatus ?? '';
      debugPrint('My kyc status is: $merchantKycStatus');
      setState(() {});
    }
  }
}
