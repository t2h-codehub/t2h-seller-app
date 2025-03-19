// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:taptohello/core/app_export.dart';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:taptohello/data/delivery_OnboardModel/delivery_Onboard_RequestModel.dart';
// import 'package:taptohello/data/productCategoryModel/logisticResModel.dart';
// import 'package:taptohello/helper/base_screen_view.dart';
// import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
// import 'package:taptohello/services/shared_preference_service.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// import 'package:taptohello/widgets/custom_text_form_field.dart';

// import 'logisticsIntegrationControler.dart';
// import 'package:taptohello/data/auth/auth_repo.dart';

// // class logisticsIntegrationScreen extends StatefulWidget {
// //   const logisticsIntegrationScreen({super.key});

// //   @override
// //   State<logisticsIntegrationScreen> createState() =>
// //       _logisticsIntegrationScreenScreenState();
// // }

// // class _logisticsIntegrationScreenScreenState
// //     extends State<logisticsIntegrationScreen> {

// class logisticsIntegrationScreen extends ConsumerStatefulWidget {
//   // final String userId;
//   const logisticsIntegrationScreen({
   
//     super.key,
//   });

//   @override
//   ConsumerState<logisticsIntegrationScreen> createState() => _VerifyPhoneViewState();
// }

// class _VerifyPhoneViewState extends ConsumerState<logisticsIntegrationScreen>
//     with BaseScreenView {



//   final LogisticsIntegrationControler _logisticsIntegrationController =
//       LogisticsIntegrationControler();
//       bool obscurePassword = true;

//       late DeliveryOnboard onboardRequest;
//       String userId = '';
//       late AuthViewModel _viewModel;
//       ChangeLogisticApiResModel changeLogisticApiResModel = ChangeLogisticApiResModel();
      
      
      
  
     
// // Map<String, dynamic>? selectedCourier;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//      _viewModel = ref.read(authViewModel);
//     _viewModel.attachView(this);
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF0F1F6),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(
//           color: Colors.grey,
//         ),
//         title: Text(
//           'Logistics Integration',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 24, right: 24),
//         child: Column(
//           children: [
//             SizedBox(height: 16),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 labelText: 'Logistic partner',
//                 border: OutlineInputBorder(),
//               ),
//               value: _logisticsIntegrationController.selectedCourier,
//               hint: const Text('Please Select logistic partner'),
//               onChanged: (String? newValue) {
//                 _logisticsIntegrationController.selectedCourier = newValue;

//                 // _selectedCategory != "" ? _selectedCategory = "" : null;
//                 setState(() {});
//               },
//               items: _logisticsIntegrationController.courierServices
//                   .map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Visibility(
//                 visible: _logisticsIntegrationController.selectedCourier ==
//                     "Shiprocket",
//                 child: SingleChildScrollView(
//                   key: _logisticsIntegrationController.formKey,
//                   child: Column(
//                     children: [
//                       // Text("Shiprocket API", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                       SizedBox(height: 20),
//                       // Login Section

//                       Container(
//                         height: 100,
//                         child: CustomTextFormField(
//                           controller:
//                               _logisticsIntegrationController.emailController,
//                           label: "Email",
//                           hintText: "Enter email address",
//                           validator: (value) => _logisticsIntegrationController.validateEmail(value, "Email"),
//                           //_logisticsIntegrationController.validateEmail("Email"),
//                           margin: getMargin(
//                             top: 24,
//                           ),
//                           textInputType: TextInputType.emailAddress,
//                           suffix: Icon(
//                             Icons.person_outline,
//                             size: 26,
//                           ),
//                           maxlength: 50,
//                           onChange: (val) {},
//                         ),
//                       ),

//                     //  SizedBox(height: 16),
//                       Container(
//                         height: 100,
//                         child: CustomTextFormField(
//                           controller:
//                               _logisticsIntegrationController.passwordController,
//                           label: "Password",
//                           hintText: "Enter password",
//                            validator: (value) => _logisticsIntegrationController.validatePassword(value, "Password"),
//                           // _logisticsIntegrationController.validatePassword ,
//                           margin: getMargin(
//                             top: 9,
//                           ),
                          
//                            textInputAction: TextInputAction.done,
//                         textInputType: TextInputType.visiblePassword,
//                         isObscureText: obscurePassword,
//                         suffix: InkWell(
//                           onTap: () {
//                             obscurePassword = !obscurePassword;
//                             setState(() {});
//                           },
//                           child: Icon(
//                             obscurePassword
//                                 ? Icons.visibility_off_outlined
//                                 : Icons.visibility_outlined,
//                             size: 26,
//                           ),
//                         ),
//                         onChange: (pass) {
//                         }
//                         ),
//                       ),
//                       SizedBox(height: 25),

//                       InkWell(
//                         splashColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         onTap: () async {
//                           print("hello");
        
//                           userId = SharedPreferenceService.getString('userId') ?? '';
//                           Map<String, dynamic> body = {"email": _logisticsIntegrationController.emailController.text,
//     "password": _logisticsIntegrationController.passwordController.text,
//     "deliveryService": "shipRocket",
//   };
                         
//                               await _logisticsIntegrationController.createLogistic(
//           body 
//         ).then((value) {
//                       changeLogisticApiResModel = value;
//                        ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(changeLogisticApiResModel.message.toString())));
//            Navigator.pop(context);
//                       setState(() {});
//                     });
      
            
//                         },
//                         child: SizedBox(
//                           height: getVerticalSize(
//                             55,
//                           ),
//                           child: Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               Align(
//                                 alignment: Alignment.center,
//                                 child: Container(
//                                   padding: getPadding(
//                                     left: 16,
//                                     top: 16,
//                                     right: 16,
//                                     bottom: 16,
//                                   ),
//                                   // height: getVerticalSize(
//                                   //   60,
//                                   // ),
//                                   // width: getHorizontalSize(
//                                   //   281,
//                                   // ),
//                                   decoration: BoxDecoration(
//                                     color: AppCol.primary,
//                                     borderRadius: BorderRadius.circular(
//                                       getHorizontalSize(
//                                         10,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Center(
//                                 // alignment: Alignment.bottomCenter,
//                                 child: Text(
//                                   "Submit",
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: AppStyle.txtPoppinsBold15.copyWith(
//                                       fontSize: 16, color: Colors.white),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       // ElevatedButton(
//                       //   onPressed: loginToShiprocket,
//                       //   child: Text("Login to Shiprocket"),
//                       // ),
//                       // Divider(),
//                       // // Order Creation Section
//                       // Text("Create Order", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                       // TextField(
//                       //   controller: orderIdController,
//                       //   decoration: InputDecoration(labelText: "Order ID"),
//                       // ),
//                       // SizedBox(height: 10),
//                       // ElevatedButton(
//                       //   onPressed: createOrder,
//                       //   child: Text("Create Order"),
//                       // ),
//                       // Divider(),
//                       // // Order Tracking Section
//                       // Text("Track Order", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                       // TextField(
//                       //   controller: awbController,
//                       //   decoration: InputDecoration(labelText: "Enter AWB Number"),
//                       // ),
//                       // SizedBox(height: 10),
//                       // ElevatedButton(
//                       //   onPressed: trackOrder,
//                       //   child: Text("Track Order"),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
  
//   @override
//   void showSnackbar(String message, {Color? color}) {
//     // TODO: implement showSnackbar
//   }
// }



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

