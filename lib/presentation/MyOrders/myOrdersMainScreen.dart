
import 'package:flutter/material.dart';
import 'package:taptohello/presentation/MyOrders/NewOrders/newOrdersScreen.dart';
import 'package:taptohello/presentation/MyOrders/Reports/reportsMainScreen.dart';

class MyOrdersMainScreen extends StatefulWidget {
  const MyOrdersMainScreen({super.key});

  @override
  State<MyOrdersMainScreen> createState() => _MyOrdersMainScreenState();
}

class _MyOrdersMainScreenState extends State<MyOrdersMainScreen> {
  final List<String> myOrdersFeatures = [
    'New Orders',
    'Shipped Orders',
    'Delivered Orders',
    'Return Initiated',
    'Returned',
    'Cancelled Orders',
    'Failed Orders',
    'Reports',
  ];



  

  void navigateToScreen(BuildContext context, String feature) {
    if (feature == 'Reports') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ReportsMainScreen()),
      );
    } else {
      // Pass only the clicked value to NewOrderScreen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => NewOrderScreen(orderFeatures: feature),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'My Orders',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: ListView.builder(
        itemCount: myOrdersFeatures.length,
        padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
        itemBuilder: (context, index) {
          return OrderFeatureTile(
            title: myOrdersFeatures[index],
            onTap: () => navigateToScreen(context, myOrdersFeatures[index]),
          );
        },
      ),
    );
  }
}

// Reusable Order Feature Tile Widget
class OrderFeatureTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const OrderFeatureTile({required this.title, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}


