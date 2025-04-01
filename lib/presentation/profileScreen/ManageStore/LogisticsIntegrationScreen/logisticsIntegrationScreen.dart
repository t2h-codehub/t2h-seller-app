


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/delivery_OnboardModel/delivery_Onboard_RequestModel.dart';
import 'package:taptohello/data/productCategoryModel/logisticResModel.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
import 'package:taptohello/services/shared_preference_service.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';
import 'logisticsIntegrationControler.dart';

class logisticsIntegrationScreen extends ConsumerStatefulWidget {
  const logisticsIntegrationScreen({super.key});

  @override
  ConsumerState<logisticsIntegrationScreen> createState() => _LogisticsIntegrationScreenState();
}

class _LogisticsIntegrationScreenState extends ConsumerState<logisticsIntegrationScreen>
    with BaseScreenView {
  final LogisticsIntegrationControler _logisticsIntegrationController = LogisticsIntegrationControler();
  bool obscurePassword = true;
  late DeliveryOnboard onboardRequest;
  String userId = '';
  late AuthViewModel _viewModel;
  ChangeLogisticApiResModel changeLogisticApiResModel = ChangeLogisticApiResModel();

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
    loadSavedCredentials();
  }

  void loadSavedCredentials() async {
    userId = SharedPreferenceService.getString('userId') ?? '';
    String? savedCourier = SharedPreferenceService.getString('selectedCourier');
    String? savedEmail = SharedPreferenceService.getString('email');
    String? savedPassword = SharedPreferenceService.getString('password');

    setState(() {
      _logisticsIntegrationController.selectedCourier = savedCourier;
      _logisticsIntegrationController.emailController.text = savedEmail ?? '';
      _logisticsIntegrationController.passwordController.text = savedPassword ?? '';
    });
  }

  Future<void> onSubmit() async {
    userId = SharedPreferenceService.getString('userId') ?? '';
    Map<String, dynamic> body = {
      "email": _logisticsIntegrationController.emailController.text,
      "password": _logisticsIntegrationController.passwordController.text,
      "deliveryService": _logisticsIntegrationController.selectedCourier,
    };

    await _logisticsIntegrationController.createLogistic(body).then((value) {
      changeLogisticApiResModel = value;

      if (changeLogisticApiResModel.success == true) {
        SharedPreferenceService.setString('selectedCourier', _logisticsIntegrationController.selectedCourier ?? '');
        SharedPreferenceService.setString('email', _logisticsIntegrationController.emailController.text);
        SharedPreferenceService.setString('password', _logisticsIntegrationController.passwordController.text);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(changeLogisticApiResModel.message.toString())),
      );
      Navigator.pop(context);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'Logistics Integration',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Logistic Partner', border: OutlineInputBorder()),
              value: _logisticsIntegrationController.selectedCourier,
              hint: const Text('Please Select Logistic Partner'),
              onChanged: (String? newValue) {
                setState(() => _logisticsIntegrationController.selectedCourier = newValue);
              },
              items: _logisticsIntegrationController.courierServices.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Visibility(
              visible: _logisticsIntegrationController.selectedCourier == "shipRocket",
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: _logisticsIntegrationController.emailController,
                    label: "Email",
                    hintText: "Enter email address",
                    validator: (value) => _logisticsIntegrationController.validateEmail(value, "Email"),
                    textInputType: TextInputType.emailAddress,
                    suffix: Icon(Icons.person_outline, size: 26),
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    controller: _logisticsIntegrationController.passwordController,
                    label: "Password",
                    hintText: "Enter password",
                    validator: (value) => _logisticsIntegrationController.validatePassword(value, "Password"),
                    textInputType: TextInputType.visiblePassword,
                    isObscureText: obscurePassword,
                    suffix: InkWell(
                      onTap: () => setState(() => obscurePassword = !obscurePassword),
                      child: Icon(
                        obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        size: 26,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: onSubmit,
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: AppCol.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Submit",
                        style: AppStyle.txtPoppinsBold15.copyWith(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void showSnackbar(String message, {Color? color}) {}
}

