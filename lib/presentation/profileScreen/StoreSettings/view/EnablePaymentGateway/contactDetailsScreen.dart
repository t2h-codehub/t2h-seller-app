import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/PaymentGatewayModel/getBillingApiResModel.dart';
import 'package:taptohello/services/shared_preference_service.dart';

class ContactDetailsScreen extends StatefulWidget {
  const ContactDetailsScreen(
      {super.key,
      required this.merchant_email,
      required this.merchant_name,
      required this.poc_phone,
        required this.business_legal_name,
        required this.business_type,
        required this.business_category,
        required this.business_subcategory, required this.getApiDetails,
      });

  final Function(String) merchant_name;
  final Function(String) merchant_email;
  final Function(String) poc_phone;
  final Function(String) business_legal_name;
  final Function(String) business_type;
  final Function(String) business_category;
  final Function(String) business_subcategory;
  final GetBillingApiResModel getApiDetails;

  @override
  State<ContactDetailsScreen> createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  String _relationship = 'Owner';
  List<String> entityTypes = ['Sole Proprietorship', 'Partnership', 'Company'];
  List<String> categories = ['Ecommerce', 'Jewellery', 'Retail and Shopping'];
  List<String> subCategories = [];

  String? selectedEntityType;
  String? _selectedCategory;
  String? _selectedSubCategory;

  List<String> ecommerceName = [
    'Apparels',
    'Fashion and Lifestyle',
    'Footwear',
    'Home Decor Items',
    'Food, Health and Beauty Supplements',
    'Kitchen Ware and Household Appliances',
    'General Merchandise',
    'Sports Good and Fitness Equipment'
  ];

  List<String> jewelleryName = [
    'Jewellery',
    'Watches',
    'Clock',
    'Silverware Stores'
  ];
  List<String> retailAndShoppingName = ['Fashion and Lifestyle'];

  TextEditingController personName = TextEditingController();
  TextEditingController personEmail = TextEditingController();
  TextEditingController pocPhone = TextEditingController();
  TextEditingController legalBusinessName = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  getDetails() {
    debugPrint('My business type is: ${widget.getApiDetails.data?.businessEntityType}');
    personName.text =  SharedPreferenceService.getString("merchantName") ?? '';
    personEmail.text = SharedPreferenceService.getString("merchantEmail") ?? '';
    pocPhone.text = SharedPreferenceService.getString("pocPhone") ?? '';
    legalBusinessName.text = SharedPreferenceService.getString("businessLegalName") ?? '';
    // Set selected entity type
    selectedEntityType = widget.getApiDetails.data?.businessEntityType != "" ? widget.getApiDetails.data?.businessEntityType : null; // Default to first item
    _selectedCategory = widget.getApiDetails.data?.businessCategory != "" ? widget.getApiDetails.data?.businessCategory : null; // Default to first item
  _selectedSubCategory = widget.getApiDetails.data?.businessSubCategory != "" ? widget.getApiDetails.data?.businessSubCategory : null; // Default to first item if available
    debugPrint('My sub category is: ${selectedEntityType==""}');
   
   
  }

  @override
  Widget build(BuildContext context) {
   
   
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading of contact details
            const Text(
              'Contact Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            /// Person name
            TextFormField(
              controller: personName,
              decoration: InputDecoration(
                labelText: 'Contact Person Name',
                hintText: 'Enter Full Name',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: widget.merchant_name,
            ),
            const SizedBox(height: 20),

            /// Relationship
            Row(
              children: [
                const Text(
                  'Relationship',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ListTile(
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Owner'),
                    leading: Radio<String>(
                      value: 'Owner',
                      groupValue: _relationship,
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      activeColor: AppCol.primary,
                      onChanged: (String? value) {
                        setState(() {
                          _relationship = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Employee'),
                    leading: Radio<String>(
                      value: 'Employee',
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      groupValue: _relationship,
                      activeColor: AppCol.primary,
                      onChanged: (String? value) {
                        setState(() {
                          _relationship = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Email field
            TextFormField(
              controller: personEmail,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email address',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: widget.merchant_email,
            ),
            const SizedBox(height: 20),

            /// Mobile field
            TextFormField(
              controller: pocPhone,
              decoration: InputDecoration(
                labelText: 'Mobile',
                hintText: 'Enter mobile number',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: widget.poc_phone,
            ),
            const SizedBox(height: 20),

            /// Legal Business Name text field
            TextFormField(
              controller: legalBusinessName,
              decoration: InputDecoration(
                labelText: 'Legal Business Name',
                hintText: 'Enter Legal Business Name',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: widget.business_legal_name,
            ),
            SizedBox(height: 16),

            /// Business Entity Type drop down
            DropdownButtonFormField<String>(
              icon: const Icon(Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey),
              decoration: InputDecoration(
                labelText: 'Business Entity Type',
                hintText: 'Select Entity Type',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: selectedEntityType,
              items: entityTypes.map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedEntityType = newValue!;
                  widget.business_type(selectedEntityType ?? '');
                });
              },
            ),
            SizedBox(height: 16),

            /// Business Category drop down
            DropdownButtonFormField<String>(
              icon: const Icon(Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey),
              decoration: InputDecoration(
                labelText: 'Business Category',
                hintText: 'Select Category',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: _selectedCategory,
              items: categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue;
                  _selectedSubCategory = null;
                  subCategories = _getSubCategories(_selectedCategory);
                  widget.business_category(_selectedCategory ?? '');
                  // _selectedSubCategory ;
                });
              },
            ),
            SizedBox(height: 16),

            /// Business Sub Category text field
            DropdownButtonFormField<String>(
              icon: const Icon(Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey),
              decoration: InputDecoration(
                labelText: 'Business Sub Category',
                hintText: 'Select Sub Category',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: _selectedSubCategory,
              items: subCategories.map((String subCategory) {
                return DropdownMenuItem<String>(
                  value: subCategory,
                  child: Text(subCategory),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedSubCategory = newValue;
                  widget.business_subcategory(_selectedSubCategory ?? '');
                });
              },
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  /// Method to return the correct list of subcategories based on the selected category
  List<String> _getSubCategories(businessCategory) {
    switch (businessCategory) {
      case 'Ecommerce':
        return ecommerceName;
      case 'Jewellery':
        return jewelleryName;
      case 'Retail and Shopping':
        return retailAndShoppingName;
      default:
        return [];
    }
  }

}
