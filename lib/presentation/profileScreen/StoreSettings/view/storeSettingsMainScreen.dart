import 'package:flutter/material.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/LogisticsIntegrationScreen/logisticsIntegrationScreen.dart';
import 'package:taptohello/presentation/profileScreen/StoreSettings/view/EnablePaymentGateway/enablePaymentGatewayScreen.dart';
import 'package:taptohello/presentation/profileScreen/StoreSettings/view/FeeConfiguration/logisticsFeeConfiguration.dart';
import 'package:taptohello/presentation/profileScreen/StoreSettings/view/FeeConfiguration/pgfreeConfiguration.dart';

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
    'Out of Stock Configuration',
    'Logout'
  ];

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
          return InkWell(
            onTap: () {
              if (storeSettingsFeatures[index] == 'Enable Payment Gateway') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnablePaymentGatewayScreen(),
                  ),
                );
              } 

              else if(storeSettingsFeatures[index] == 'Logistics Integration') {
                   Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => logisticsIntegrationScreen(),
                        ),
                      );
              }
              
              
              else if (storeSettingsFeatures[index] == 'Payment Gateway Fee Configuration') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PGFreeConfigurationScreen(),
                  ),
                );
              } else if (storeSettingsFeatures[index] == 'Logistics Fee Configuration') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogisticsFeeConfigurationsScreen(),
                  ),
                );
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
                    storeSettingsFeatures[index],
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
