
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taptohello/core/app_export.dart';

class CreateCouponScreen extends StatefulWidget {
  @override
  _CreateCouponScreenState createState() => _CreateCouponScreenState();
}

class _CreateCouponScreenState extends State<CreateCouponScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController discountValueController = TextEditingController();
  final TextEditingController minOrderValueController = TextEditingController();
  final TextEditingController buyQuantityController = TextEditingController();
  final TextEditingController getQuantityController = TextEditingController();
  final TextEditingController maxRedemptionsController = TextEditingController();

  String selectedDiscountType = "PERCENTAGE";
  bool isCouponRequired = true;
  bool freeShipping = false;
  DateTime? startDate;
  DateTime? endDate;

  final List<String> discountTypes = [
    "PERCENTAGE",
    "FIXED_AMOUNT",
    "BOGO",
    "FREE_SHIPPING",
  ];

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     final Map<String, dynamic> couponData = {
  //       "name": nameController.text,
  //       "code": codeController.text,
  //       "type": selectedDiscountType,
  //       "discountValue": int.parse(discountValueController.text),
  //       "minOrderValue": int.parse(minOrderValueController.text),
  //       "buyQuantity": int.parse(buyQuantityController.text),
  //       "getQuantity": int.parse(getQuantityController.text),
  //       "startDate": startDate != null ? DateFormat('yyyy-MM-dd').format(startDate!) : null,
  //       "endDate": endDate != null ? DateFormat('yyyy-MM-dd').format(endDate!) : null,
  //       "isCouponRequired": isCouponRequired,
  //       "maxRedemptions": int.parse(maxRedemptionsController.text),
  //       "freeShipping": freeShipping,
  //     };

  //     print("Coupon Data: $couponData");
  //     // TODO: Send data to API or process further.
  //   }
  // }

  void _submitForm() {
  if (_formKey.currentState!.validate()) {
    final Map<String, dynamic> couponData = {
      "name": nameController.text,
      "code": codeController.text,
      "type": selectedDiscountType,
      "discountValue": int.tryParse(discountValueController.text) ?? 0,
      "minOrderValue": int.tryParse(minOrderValueController.text) ?? 0,
      "buyQuantity": buyQuantityController.text.isNotEmpty ? int.tryParse(buyQuantityController.text) : null,
      "getQuantity": getQuantityController.text.isNotEmpty ? int.tryParse(getQuantityController.text) : null,
      "startDate": startDate != null ? DateFormat('yyyy-MM-dd').format(startDate!) : null,
      "endDate": endDate != null ? DateFormat('yyyy-MM-dd').format(endDate!) : null,
      "isCouponRequired": isCouponRequired,
      "maxRedemptions": int.tryParse(maxRedemptionsController.text) ?? 0,
      "freeShipping": freeShipping,
    };

    print("Coupon Data: $couponData");
    // TODO: Send data to API or process further.
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Discount Coupon')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(height: 5),
                  _buildTextField(nameController, 'Coupon Name'),
                  _buildTextField(codeController, 'Coupon Code'),
                  
                  DropdownButtonFormField<String>(
                    value: selectedDiscountType,
                    decoration: _inputDecoration('Discount Type'),
                    items: discountTypes.map((type) {
                      return DropdownMenuItem(value: type, child: Text(type));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedDiscountType = value!;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  
                  _buildTextField(discountValueController, 'Discount Value', isNumber: true),
                  _buildTextField(minOrderValueController, 'Minimum Order Value', isNumber: true),
                  _buildTextField(buyQuantityController, 'Buy Quantity', isNumber: true),
                  _buildTextField(getQuantityController, 'Get Quantity', isNumber: true),
                  
                  _buildDatePicker(context, 'Start Date', startDate, true),
                  _buildDatePicker(context, 'End Date', endDate, false),

                  _buildSwitch('Is Coupon Required?', isCouponRequired, (val) {
                    setState(() {
                      isCouponRequired = val;
                    });
                  }),

                  _buildTextField(maxRedemptionsController, 'Max Redemptions', isNumber: true),

                  _buildSwitch('Free Shipping', freeShipping, (val) {
                    setState(() {
                      freeShipping = val;
                    });
                  }),

                  SizedBox(height: 20),
                  // ElevatedButton(
                  //   onPressed: _submitForm,
                  //   style: ElevatedButton.styleFrom(
                  //     padding: EdgeInsets.symmetric(vertical: 14),
                  //     textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  //   ),
                  //   child: Text('Create Coupon'),
                  // ),
                  Center(
  child: SizedBox(
    width: double.infinity, // Makes the button full width
    child: ElevatedButton.icon(
      onPressed: _submitForm,
      icon: Icon(Icons.discount, size: 20, color: Colors.white), // Add an icon
      label: Text(
        'Create Coupon',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: AppCol.primary, // Change button color
        foregroundColor: Colors.white, // Change text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        elevation: 3, // Add elevation for shadow effect
      ),
    ),
  ),
),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildTextField(TextEditingController controller, String label, {bool isNumber = false}) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 12.0),
  //     child: TextFormField(
  //       controller: controller,
  //       keyboardType: isNumber ? TextInputType.number : TextInputType.text,
  //       decoration: _inputDecoration(label),
  //       validator: (value) => value!.isEmpty ? 'Enter $label' : null,
  //     ),
  //   );
  // }

  Widget _buildTextField(TextEditingController controller, String label, {bool isNumber = false}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: _inputDecoration(label),
      validator: (value) {
        if ((controller == buyQuantityController || controller == getQuantityController) && value!.isEmpty) {
          return null; // Make optional
        }
        return value!.isEmpty ? 'Enter $label' : null;
      },
    ),
  );
}


  Widget _buildDatePicker(BuildContext context, String label, DateTime? date, bool isStartDate) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () => _selectDate(context, isStartDate),
        child: InputDecorator(
          decoration: _inputDecoration(label),
          child: Text(
            date == null ? 'Select $label' : DateFormat('yyyy-MM-dd').format(date),
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitch(String label, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: SwitchListTile(
        title: Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }
}

