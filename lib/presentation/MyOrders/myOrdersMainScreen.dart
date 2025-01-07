import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/presentation/MyOrders/NewOrders/newOrdersScreen.dart';
import 'package:swapnil_s_application4/presentation/MyOrders/Reports/reportsMainScreen.dart';

class MyOrdersMainScreen extends StatefulWidget {
  const MyOrdersMainScreen({super.key});

  @override
  State<MyOrdersMainScreen> createState() => _MyOrdersMainScreenState();
}

class _MyOrdersMainScreenState extends State<MyOrdersMainScreen> {
  List myOrdersFeatures = [
    'New Orders',
    'Shipped Orders',
    'Delivered Orders',
    'Cancelled Orders',
    'Failed Orders',
    'Reports',
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
        centerTitle: true,
        title: Text(
          'My Orders',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: myOrdersFeatures.length,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 16, left: 24, right: 24),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (myOrdersFeatures[index] == 'New Orders') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NewOrderScreen(),
                  ),
                );
              } else if(myOrdersFeatures[index] == 'Reports') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReportsMainScreen(),
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
                    myOrdersFeatures[index],
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
