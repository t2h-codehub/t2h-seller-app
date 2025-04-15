// import 'package:flutter/material.dart';
// import 'package:taptohello/helper/shared_pref_service.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/LogisticsIntegrationScreen/logisticsIntegrationScreen.dart';
// import 'package:taptohello/presentation/profileScreen/StoreSettings/view/EnablePaymentGateway/enablePaymentGatewayScreen.dart';
// import 'package:taptohello/presentation/profileScreen/StoreSettings/view/FeeConfiguration/logisticsFeeConfiguration.dart';
// import 'package:taptohello/presentation/profileScreen/StoreSettings/view/FeeConfiguration/pgfreeConfiguration.dart';
// import 'package:taptohello/presentation/sign_in_screen/sign_in_screen.dart';

// class StoreSettingsScreen extends StatefulWidget {
//   const StoreSettingsScreen({super.key});

//   @override
//   State<StoreSettingsScreen> createState() => _StoreSettingsScreenState();
// }

// class _StoreSettingsScreenState extends State<StoreSettingsScreen> {
//   List storeSettingsFeatures = [
//     'Enable Payment Gateway',
//     'Logistics Integration',
//     'Payment Gateway Fee Configuration',
//     'Logistics Fee Configuration',
//     'Cash On Delivery',
//     // 'Out of Stock Configuration',
//     'Sign Out'
//   ];
//   bool _isCashOnDeliveryEnabled = false;

//   // Function to show the sign-out confirmation dialog
// void _showSignOutDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text("Confirm Sign Out"),
//         content: Text("Are you sure you want to sign out?"),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Close the dialog
//             },
//             child: Text("Cancel"),
//           ),
//           TextButton(
//             onPressed: () {
//               // Clear stored data
//               SharedPreferenceService.clearAll();

//               // Navigate to Sign In screen
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) => SignInScreen()),
//               );
//             },
//             child: Text(
//               "Sign Out",
//               style: TextStyle(color: Colors.red),
//             ),
//           ),
//         ],
//       );
//     },
//   );
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF0F1F6),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//         title: Text(
//           'Shop Settings',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//           ),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: storeSettingsFeatures.length,
//         physics: NeverScrollableScrollPhysics(),
//         padding: EdgeInsets.only(top: 16, left: 24, right: 24),
//         shrinkWrap: true,
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               if (storeSettingsFeatures[index] == 'Enable Payment Gateway') {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => EnablePaymentGatewayScreen(),
//                   ),
//                 );
//               } 

//               else if(storeSettingsFeatures[index] == 'Logistics Integration') {
//                    Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => logisticsIntegrationScreen(),
//                         ),
//                       );
//               }
              
              
//               else if (storeSettingsFeatures[index] == 'Payment Gateway Fee Configuration') {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PGFreeConfigurationScreen(),
//                   ),
//                 );
//               } else if (storeSettingsFeatures[index] == 'Logistics Fee Configuration') {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => LogisticsFeeConfigurationsScreen(),
//                   ),
//                 );
//               }
//               else if (storeSettingsFeatures[index] == 'Sign Out') {
//                _showSignOutDialog(context);
               
//               }
//             },
//             child: Container(
//               padding: EdgeInsets.all(20),
//               margin: EdgeInsets.only(bottom: 16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(14),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(.1),
//                     spreadRadius: 1,
//                     blurRadius: 4,
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     storeSettingsFeatures[index],
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Icon(
//                     Icons.arrow_forward_ios_rounded,
//                     color: Colors.black,
//                     size: 14,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:taptohello/data/FeeConfiguration/getLogisticFeeConfigurationApiResModel.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/shared_pref_service.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/LogisticsIntegrationScreen/logisticsIntegrationScreen.dart';
import 'package:taptohello/presentation/profileScreen/StoreSettings/controller/paymentGatewayController.dart';
import 'package:taptohello/presentation/profileScreen/StoreSettings/view/EnablePaymentGateway/enablePaymentGatewayScreen.dart';
import 'package:taptohello/presentation/profileScreen/StoreSettings/view/FeeConfiguration/logisticsFeeConfiguration.dart';
import 'package:taptohello/presentation/profileScreen/StoreSettings/view/FeeConfiguration/pgfreeConfiguration.dart';
import 'package:taptohello/presentation/sign_in_screen/sign_in_screen.dart';

import 'FeeConfiguration/Controller/feeConfigurationController.dart';

class StoreSettingsScreen extends StatefulWidget {
  const StoreSettingsScreen({super.key});

  @override
  State<StoreSettingsScreen> createState() => _StoreSettingsScreenState();
}

class _StoreSettingsScreenState extends State<StoreSettingsScreen> {
  List storeSettingsFeatures = [
    'Enable Payment Gateway',
    'Logistics Integration',
    'Payment Gateway Fee Configuration',
    'Logistics Fee Configuration',
    'Cash On Delivery',
    'Sign Out'
  ];
    final UserDetailService _userDetailService = getIt<UserDetailService>();

  bool _isCashOnDeliveryEnabled = false;
 bool isApiDataAvailable = false;


  final PaymentGatewayController _feeConfigurationController = PaymentGatewayController();
 GetLogisticFeeConfiguration getLogisticFeeConfiguration = GetLogisticFeeConfiguration();
  @override
  void initState() {
    super.initState();
  
  // _userDetailService.userDetailResponse?.user?.designation;
    //_loadCODStatus();
  }

  // Load COD status from shared preferences
  // void _loadCODStatus() async {
  //   bool value = await SharedPreferenceService.getBool('cod_enabled') ?? false;
  //   setState(() {
  //     _isCashOnDeliveryEnabled = value;
  //   });
  // }

  // Toggle COD and save to shared preferences
  void _toggleCOD(bool value) async {
   // await SharedPreferenceService.setBool('cod_enabled', value);
    setState(() {
      _isCashOnDeliveryEnabled = value;
      getLogisticFeeConfigurationFunction();
      //cashOnDeliveryApi
    });
  }

   Future<bool> getLogisticFeeConfigurationFunction() async {
    
    
    getLogisticFeeConfiguration = await _feeConfigurationController.cashOnDeliveryApi();
    if(getLogisticFeeConfiguration.success == true) {
      isApiDataAvailable = true;
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(getLogisticFeeConfiguration.message.toString())),
      );
     
    } else {
      isApiDataAvailable = true;
    }
    setState(() {});
    return isApiDataAvailable;
  }

  // Sign out confirmation dialog
  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Sign Out"),
          content: Text("Are you sure you want to sign out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                SharedPreferenceService.clearAll();

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: Text(
                "Sign Out",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

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
          'Shop Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: storeSettingsFeatures.length,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 16, left: 24, right: 24),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final feature = storeSettingsFeatures[index];

          if (feature == 'Cash On Delivery') {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cash On Delivery',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Switch(
                    value: _isCashOnDeliveryEnabled,
                    onChanged: (value) {
                      _toggleCOD(value);
                    },
                  ),
                ],
              ),
            );
          }

          return InkWell(
            onTap: () {
              if (feature == 'Enable Payment Gateway') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnablePaymentGatewayScreen(),
                  ),
                );
              } else if (feature == 'Logistics Integration') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => logisticsIntegrationScreen(),
                  ),
                );
              } else if (feature == 'Payment Gateway Fee Configuration') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PGFreeConfigurationScreen(),
                  ),
                );
              } else if (feature == 'Logistics Fee Configuration') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogisticsFeeConfigurationsScreen(),
                  ),
                );
              } else if (feature == 'Sign Out') {
                _showSignOutDialog(context);
              }
            },
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    feature,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                    size: 14,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

