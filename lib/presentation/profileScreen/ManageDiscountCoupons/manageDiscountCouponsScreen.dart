

import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'package:taptohello/data/productCategoryModel/getAllSellerDiscountCouponsResponceModel.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/profileScreen/ManageCoupons/view/createDiscountCoupons/createDiscountCoupons.dart';
import 'package:taptohello/presentation/profileScreen/ManageDiscountCoupons/createCouponsController.dart';

import 'createCouponsScreen.dart';

class CouponsScreen extends StatefulWidget {
  @override
  _CouponsScreenState createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
  final GetDiscountCoponsController _getDiscountCoponsController = GetDiscountCoponsController();
  final UserDetailService _userDetailService = getIt<UserDetailService>();
      GetAllSellerDiscountCouponsResponceModel getDiscountApiResModel = GetAllSellerDiscountCouponsResponceModel();





void _showCouponDetailsDialog(BuildContext context, Map<String, dynamic> coupon, int index) {
  TextEditingController maxRedemptionsController = TextEditingController(text: coupon['maxRedemptions'].toString());
  TextEditingController endDateController = TextEditingController(text: coupon['endDate'].toString());
  bool isCouponRequired = coupon['isCouponRequired'];
  bool freeShipping = coupon['freeShipping'];
  String selectedDiscountType = coupon['type'];

  showDialog(
    context: context,
    builder: (context) {
      return Dialog( // Use Dialog instead of AlertDialog for better width control
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8, // Adjust width (60% of screen)
          padding: EdgeInsets.all(16),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text('${coupon['name']} Details',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),

                  Divider(),

                  // Discount Type Dropdown
                  DropdownButtonFormField<String>(
                    value: selectedDiscountType,
                    decoration: _inputDecoration("Discount Type"),
                    items: ["PERCENTAGE", "FIXED_AMOUNT", "BOGO", "FREE_SHIPPING"]
                        .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                        .toList(),
                    onChanged: (value) {
                      setState(() => selectedDiscountType = value!);
                    },
                  ),
                  SizedBox(height: 12),

                  // End Date Selection
                  TextField(
                    controller: endDateController,
                    decoration: _inputDecoration("End Date"),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          endDateController.text = pickedDate.toString().split(' ')[0];
                        });
                      }
                    },
                  ),
                  SizedBox(height: 12),

                  // Is Coupon Required? Switch
                  SwitchListTile(
                    title: Text("Is Coupon Required?", style: TextStyle(fontSize: 16)),
                    value: isCouponRequired,
                    onChanged: (value) {
                      setState(() => isCouponRequired = value);
                    },
                    contentPadding: EdgeInsets.zero,
                  ),

                  // Max Redemptions
                  TextField(
                    controller: maxRedemptionsController,
                    keyboardType: TextInputType.number,
                    decoration: _inputDecoration("Max Redemptions"),
                  ),
                  SizedBox(height: 12),

                  // Free Shipping Switch
                  SwitchListTile(
                    title: Text("Free Shipping", style: TextStyle(fontSize: 16)),
                    value: freeShipping,
                    onChanged: (value) {
                      setState(() => freeShipping = value);
                    },
                    contentPadding: EdgeInsets.zero,
                  ),

                  SizedBox(height: 16),

                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Close', style: TextStyle(color: Colors.red)),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                         // _updateCoupon(index, isCouponRequired, maxRedemptionsController.text, freeShipping);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: AppCol.primary),
                        child: Text('Update', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}


InputDecoration _inputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
  );
}







Widget _buildTextField(TextEditingController controller, String label, {bool isNumber = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    ),
  );
}

Widget _buildSwitch(String label, bool value, Function(bool) onChanged) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: SwitchListTile(
      title: Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      value: value,
      onChanged: onChanged,
    ),
  );
}


Widget _buildDetailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
        Text(value, style: TextStyle(color: Colors.black87)),
      ],
    ),
  );
}


  
  

//   void toggleCouponStatus(sid) {
//   // setState(() {
//   //  _getDiscountCoponsController.ToggleActiveStatus(sid) .then((value) => {
//   //                     print(value)                     
                                           
//   //                                         });
//   // });
// }


 Future<void> toggleCouponStatus(sid) async {
  try {
    DialogBuilder(context).showLoadingIndicator("Loading...");
    

    final response = await _getDiscountCoponsController
        .ToggleActiveStatus(sid)
        .timeout(Duration(seconds: 10)); // optional

    if (!mounted || response == null) return;

    setState(() {
     getCoponsList();
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.message.toString())),
      );
    });

  } catch (e, stackTrace) {
    debugPrint("Error fetching banner: $e\n$stackTrace");
  } finally {
    if (mounted) {
      DialogBuilder(context).hideOpenDialog();
    }
  }
}





  @override
  void initState() {
    super.initState();
    Future.microtask(() => getCoponsList());
  }



 Future<void> getCoponsList() async {
  try {
    DialogBuilder(context).showLoadingIndicator("Loading...");

    final response = await _getDiscountCoponsController
        .getCouponsList()
        .timeout(Duration(seconds: 10)); // optional

    if (!mounted || response == null) return;

    setState(() {
      getDiscountApiResModel = response;
    });

  } catch (e, stackTrace) {
    debugPrint("Error fetching banner: $e\n$stackTrace");
  } finally {
    if (mounted) {
      DialogBuilder(context).hideOpenDialog();
    }
  }
}


  @override
  Widget build(BuildContext context) {
  
  

    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Discount Coupons'),
      ),
      body: Column(
        children: [
        
        
             Padding(
               padding: const EdgeInsets.only(left: 10, right: 10),
               child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align text left & button right
                       children: [
                         const Text(
                           "Create Your Coupons",
                           style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                         ),
                         ElevatedButton.icon(
                           onPressed:() {
                        //     Navigator.push(
                        // context,
                        // MaterialPageRoute(
                        //   builder: (context) => CreateDiscountCoupons(),
                        // ));
                        Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => CreateDiscountCoupons(isEdit: false,id: "",),
  ),
).then((_) {
  // Call the API again to refresh the list
  getCoponsList();
});

                     
                           },
                           icon: Icon(Icons.discount, size: 20, color: AppCol.primary),
                           label: const Text("Create Coupons"),
                           style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: const TextStyle(fontSize: 14),
                           ),
                         ),
                       ],
                     ),
             ),
         
         
          Expanded(
  child: ListView.builder(
  itemCount: getDiscountApiResModel.discounts?.length ?? 0,

  itemBuilder: (context, index) {
    final discount = getDiscountApiResModel.discounts![index];
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(discount.name ?? 'No Name'),
        subtitle: Text('Code: ${discount.code ?? '-'} - ${discount.discountValue ?? 0}%'),
        trailing: Switch(
          value: discount.isActive ?? false,
          onChanged: (value) => toggleCouponStatus(discount.sId),
          activeColor: Colors.white,
          activeTrackColor: AppCol.primary,
        ),
        onTap:() {
                  Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => CreateDiscountCoupons(isEdit: true, id: discount.sId.toString(),),
  ),
).then((_) {
  // Call the API again to refresh the list
  getCoponsList();
});
        },
        // _showCouponDetailsDialog(context, discount, index),
      ),
    );
  },
)

),

        ],
      ),
    );
  }
}
