import 'package:flutter/material.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/presentation/profileScreen/ManageCoupons/view/createDiscountCoupons/createDiscountCoupons.dart';
import 'package:taptohello/presentation/profileScreen/ManageCoupons/view/createDiscountCoupons/createdCouponScreen.dart';

class ManageDiscountCouponMainScreen extends StatefulWidget {
  const ManageDiscountCouponMainScreen({super.key});

  @override
  State<ManageDiscountCouponMainScreen> createState() =>
      _ManageDiscountCouponMainScreenState();
}

class _ManageDiscountCouponMainScreenState
    extends State<ManageDiscountCouponMainScreen> {

  bool isCreatedCoupons = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        /*iconTheme: IconThemeData(
          color: Colors.grey,
        ),*/
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
          'Manage Discount Coupons',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: isCreatedCoupons ? CreatedCouponsScreen() :  Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),

              /// Heading
              Text(
                'You haven’t created any discount coupons yet',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),

              /// Create discount coupon button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    // TODO: Create Discount Coupon page Navigation
                    final res = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateDiscountCoupons(),
                        ));
                    isCreatedCoupons = res;
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    backgroundColor: AppCol.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  child: Text(
                    'Create a Discount Coupon',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              /// Tip for help text
              Text(
                'Tip: Your customers would love a good deal!\nUse discounts to boost your business growth',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[500],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
