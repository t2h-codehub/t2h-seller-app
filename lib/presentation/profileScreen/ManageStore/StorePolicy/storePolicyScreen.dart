import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/StorePolicy/CancellationPolicy/cancellationPolicyScreen.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/StorePolicy/ReturnReplacementPolicy/returnReplacementPolicyScreen.dart';

class StorePolicyScreen extends StatefulWidget {
  const StorePolicyScreen({super.key});

  @override
  State<StorePolicyScreen> createState() => _StorePolicyScreenState();
}

class _StorePolicyScreenState extends State<StorePolicyScreen> {

  List storePolicyFeatures = [
    'Return/Replacement Policy',
    'Cancellation Policy',
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
          'Store Policy',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: storePolicyFeatures.length,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 16, left: 24, right: 24),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if(storePolicyFeatures[index] == 'Return/Replacement Policy') {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReturnReplacementPolicyScreen()));
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CancellationPolicyScreen()));
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
                    storePolicyFeatures[index],
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
