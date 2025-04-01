import 'package:flutter/material.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/presentation/profileScreen/ManageCoupons/view/createDiscountCoupons/couponDetailsScreen.dart';

class CreatedCouponsScreen extends StatefulWidget {
  const CreatedCouponsScreen({super.key});

  @override
  State<CreatedCouponsScreen> createState() => _CreatedCouponsScreenState();
}

class _CreatedCouponsScreenState extends State<CreatedCouponsScreen> {
  bool couponStatus = true;
  bool activeStatus = true;
  bool scheduledStatus = false;
  bool expiredStatus = false;

  String statusName = 'Active';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Text(
            "Coupon Status",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),

        /// Status Tabs
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// Active Radio
              GestureDetector(
                onTap: () {
                  setState(() {
                    couponStatus = true;
                    activeStatus = true;
                    scheduledStatus = false;
                    expiredStatus = false;
                  });
                },
                child: Row(
                  children: [
                    Radio<bool>(
                      value: activeStatus,
                      groupValue: couponStatus,
                      activeColor: AppCol.primary,
                      visualDensity: VisualDensity.compact,
                      onChanged: (bool? value) {
                        setState(() {
                          couponStatus = true;
                          activeStatus = true;
                          scheduledStatus = false;
                          expiredStatus = false;
                        });
                      },
                    ),
                    Text('Active'),
                  ],
                ),
              ),

              /// Scheduled Radio
              GestureDetector(
                onTap: () {
                  setState(() {
                    couponStatus = true;
                    activeStatus = false;
                    scheduledStatus = true;
                    expiredStatus = false;
                  });
                },
                child: Row(
                  children: [
                    Radio<bool>(
                      value: scheduledStatus,
                      groupValue: couponStatus,
                      activeColor: AppCol.primary,
                      visualDensity: VisualDensity.compact,
                      onChanged: (bool? value) {
                        setState(() {
                          couponStatus = true;
                          activeStatus = false;
                          scheduledStatus = true;
                          expiredStatus = false;
                        });
                      },
                    ),
                    Text('Scheduled'),
                  ],
                ),
              ),

              /// Expired Radio
              GestureDetector(
                onTap: () {
                  setState(() {
                    couponStatus = true;
                    activeStatus = false;
                    scheduledStatus = false;
                    expiredStatus = true;
                  });
                },
                child: Row(
                  children: [
                    Radio<bool>(
                      value: expiredStatus,
                      groupValue: couponStatus,
                      activeColor: AppCol.primary,
                      visualDensity: VisualDensity.compact,
                      onChanged: (bool? value) {
                        setState(() {
                          couponStatus = true;
                          activeStatus = false;
                          scheduledStatus = false;
                          expiredStatus = true;
                        });
                      },
                    ),
                    Text('Expired'),
                  ],
                ),
              ),
            ],
          ),
        ),

        /// coupons
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildCouponCard(
                  context, 'DISC10', '10% Discount for all Customers');
            },
           
           
          ),
        ),
      ],
    );
  }

  Widget _buildCouponCard(
      BuildContext context, String code, String description) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(code,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // TODO: handle click on coupon details
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CouponDetailsScreen(statusName: statusName, couponName: code, couponDescription: description),
            ),
          );
        },
      ),
    );
  }
}
