import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/data/productCategoryModel/getAllSellerDiscountCouponsResponceModel.dart';
import 'package:taptohello/data/productCategoryModel/getdiscountbyidResponceModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageDiscountCoupons/createCouponsController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ProductCategory/ProductCategoryController/productcategoryController.dart';
import 'package:taptohello/data/productCategoryModel/productCategoryApiResModel.dart'
    as productCategoryModel;

class CreateDiscountCoupons extends StatefulWidget {
  final bool isEdit;
  final String? id;

  const CreateDiscountCoupons({super.key, required this.isEdit,   this.id});

  @override
  State<CreateDiscountCoupons> createState() => _CreateDiscountCouponsState();
}

class _CreateDiscountCouponsState extends State<CreateDiscountCoupons> {
  final _formKey = GlobalKey<FormState>();
  bool isFlatAmount = true;
  bool isApplicationOn = true;
  String? selectedCategory;
  String? selectedSubCategory;
  DateTime? validityFrom;
  DateTime? validityTo;
  bool isSpecificCustomer = true;
  int usagePerCustomer = 1;
  bool additionalInfo = true;
  bool isFirstOrRepeat = true;
  List<String> skuList = [];
  List<String> customerMobileList = [];

  List<String> adminCategories = [];
  List adminSubCategories = [];
  List selectAdminSubCategories = [];
  bool isApiDataAvailable = false;

  final ProductCategoryController _productCategoryListController =
      ProductCategoryController();



  /// TextField Controller
  final TextEditingController _discountValue = TextEditingController();
  final TextEditingController _couponCodeValue = TextEditingController();
  final TextEditingController _descriptionValue = TextEditingController();
  final TextEditingController _skuIDValue = TextEditingController();
  final TextEditingController _fromDateValue = TextEditingController();
  final TextEditingController _toDateValue = TextEditingController();
  final TextEditingController _minimumOrderValue = TextEditingController();
  final TextEditingController _specificCustomerValue = TextEditingController();
  final TextEditingController _usagePerCustomerValue = TextEditingController();
  final TextEditingController _categoryTextField = TextEditingController();
    final GetDiscountCoponsController _getDiscountCoponsController = GetDiscountCoponsController();
  GetAllSellerDiscountCouponsResponceModel getDiscountApiResModel = GetAllSellerDiscountCouponsResponceModel();

  /// Radio List
  bool allProductRadioValue = true;
  bool skuIdRadioValue = false;
  bool categoryRadioValue = false;

  /// Offer validate
  bool firstTimeValue = false;
  bool repeatCustomer = false;
  bool specificCustomer = true;
  bool allCustomer = false;
  bool isOfferCheck = true;

  late Future _future;

  GetDiscountByIdResModel getDiscountByIdResModel = GetDiscountByIdResModel();

 
  productCategoryModel.ProductCategoryApiResModel productCategoryApiResModel =
      productCategoryModel.ProductCategoryApiResModel();
      String selectedCategoryId = '';


  Map<String, dynamic> buildDiscountPayload() {
  // Convert comma-separated SKU values to list
  List<String> skuList = _skuIDValue.text
      .split(',')
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();

  // Convert comma-separated customer mobiles to list
  List<String> customerMobileList = _specificCustomerValue.text
      .split(',')
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();

  return {
    "name": _discountValue.text.trim(),
    "code": _couponCodeValue.text.trim(),
    "type": isFlatAmount ? "FIXED_AMOUNT" : "PERCENTAGE",
    "description": _descriptionValue.text.trim(),
    "discountValue": int.tryParse(_discountValue.text.trim()) ?? 0,
    "minOrderValue": int.tryParse(_minimumOrderValue.text.trim()) ?? 0,
    "buyQuantity": 0,
    "getQuantity": 0,
    "startDate": validityFrom != null
        ? validityFrom!.toIso8601String().split("T").first
        : null,
    "endDate": validityTo != null
        ? validityTo!.toIso8601String().split("T").first
        : null,
    "isCouponRequired": true,
    "maxRedemptions":
        int.tryParse(_usagePerCustomerValue.text.trim()) ?? 0,
    "freeShipping": false,
    "collections": [],
    "applicableProducts": skuIdRadioValue ? skuList : [],
    "category": selectedCategoryId,
    "userEligibility": specificCustomer
        ? "SPECIFIC_USERS"
        : allCustomer
            ? "ALL"
            : firstTimeValue
                ? "NEW_USERS"
                : repeatCustomer
                    ? "LOYAL_CUSTOMERS"
                    : "ALL",
    "eligibleUsers": specificCustomer ? customerMobileList : [],
  };
}


void showError(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ),
  );
}

void submitCoupon() {
  final payload = buildDiscountPayload(); // Build payload

  debugPrint("Payload: $payload"); // You can print it here for debugging

  DialogBuilder(context).showLoadingIndicator("Loading...");

  _getDiscountCoponsController.createDiscountCoupons(payload).then((value) {
    DialogBuilder(context).hideOpenDialog();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(value.message.toString())),
    );
    Navigator.of(context).pop();

    if (value.discounts != null && value.discounts!.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(value.message.toString())),
    );
      for (var discount in value.discounts!) {
        debugPrint('Discount name: ${discount.name}');
      }
    } else {
      debugPrint('No discounts returned');
    }

    setState(() {
      // Refresh UI if needed
    });
  }).catchError((error) {
    DialogBuilder(context).hideOpenDialog();
    debugPrint('Error: $error');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to create coupon')),
    );
  });
}

void updateCoupon() {
  final payload = buildDiscountPayload(); // Build payload

  debugPrint("Payload: $payload"); // You can print it here for debugging

  DialogBuilder(context).showLoadingIndicator("Loading...");

  _getDiscountCoponsController.updateDiscountCoupons(payload, getDiscountByIdResModel.discount!.sId.toString()).then((value) {
    DialogBuilder(context).hideOpenDialog();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(value.message.toString())),
    );
    Navigator.of(context).pop();

    if (value.discounts != null && value.discounts!.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(value.message.toString())),
    );
      for (var discount in value.discounts!) {
        debugPrint('Discount name: ${discount.name}');
      }
    } else {
      debugPrint('No discounts returned');
    }

    setState(() {
      // Refresh UI if needed
    });
  }).catchError((error) {
    DialogBuilder(context).hideOpenDialog();
    debugPrint('Error: $error');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to create coupon')),
    );
  });
}


@override
  void initState() {
    // TODO: implement initState
    super.initState();
        
    if (widget.isEdit == true) {
  // call update API
   WidgetsBinding.instance.addPostFrameCallback((_) {
    getDiscountById(widget.id.toString());
  });
 
 
} else {
  // call create API
}
    _future = loadData();
  
    }


 
 void getDiscountById(String id) {
  DialogBuilder(context).showLoadingIndicator("Loading...");

  _getDiscountCoponsController.getSellerDiscountById(id).then((response) {
    if (!mounted || response == null) return;

    setState(() {


setState(() {
  getDiscountByIdResModel = response;

  _discountValue.text = response.discount?.discountValue?.toString() ?? '';
  _couponCodeValue.text = response.discount?.code ?? '';
  _minimumOrderValue.text = response.discount?.minOrderValue?.toString() ?? '';
  _usagePerCustomerValue.text = response.discount?.maxRedemptions?.toString() ?? '';
  _skuIDValue.text = response.discount?.applicableProducts?.join(',') ?? '';

  // Dates
  final startDate = DateTime.tryParse(response.discount?.startDate ?? '');
  final endDate = DateTime.tryParse(response.discount?.endDate ?? '');
  if (startDate != null) {
    _fromDateValue.text = DateFormat('dd/MM/yyyy').format(startDate);
    validityFrom = startDate;
  }
  if (endDate != null) {
    _toDateValue.text = DateFormat('dd/MM/yyyy').format(endDate);
    validityTo = endDate;
  }

  // Category
  selectedCategory = response.discount?.category ?? '';
  
  // Toggle
  additionalInfo = response.discount?.minOrderValue != null;
  _descriptionValue.text = response.discount?.description?.toString() ?? '';

   // Set Radio Selections Based on userEligibility
  final eligibility = response.discount?.userEligibility;
  firstTimeValue = eligibility == "NEW_USERS";
  repeatCustomer = eligibility == "LOYAL_CUSTOMERS";
  specificCustomer = eligibility == "SPECIFIC_USERS";
  allCustomer = eligibility == "ALL";
  isOfferCheck = eligibility != null;
});

    });
  }).catchError((e) {
    debugPrint("Error fetching discount: $e");
    // You can also show an error dialog/snackbar here
  }).whenComplete(() {
    if (mounted) {
      DialogBuilder(context).hideOpenDialog();
    }
  });
}





      /// Load Api data
  Future<bool> loadData() async {
    debugPrint('Step 1');
    productCategoryApiResModel =
        await _productCategoryListController.getCategoryList();
    if (productCategoryApiResModel.success == true) {
      debugPrint('Step 2');
      await loadAdminCategoriesData();
     
      // isApiDataAvailable = true;
    } else {
      debugPrint('Step 3');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${productCategoryApiResModel.message}')));
    }
    debugPrint('Step 4');
    setState(() {});
    return isApiDataAvailable;
  }

  /// Load Admin categories data
  loadAdminCategoriesData() {
    debugPrint('My Admin category function');
    productCategoryApiResModel.categories?.forEach((element) {
      adminCategories.add(element.title ?? '');
    //  debugPrint('My Admin caetgpry is: $adminCategories');
    });
    isApiDataAvailable = true;
    setState(() {});
  }
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
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
          'Create Discount Coupon',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          /// Submit coupon Button
          // InkWell(
          //   onTap: () {
          //     // Navigator.pop(context, true);
          //   },
          //   child: Padding(
          //     padding: EdgeInsets.only(top: 24, right: 14),
          //     child: Text(
          //       'Submit',
          //       style: TextStyle(
          //         color: AppCol.primary,
          //         fontSize: 14,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
         ElevatedButton(
  onPressed: () {
    if (_discountValue.text.trim().isEmpty) {
      showError('Discount value is required');
      return;
    }

    if (_couponCodeValue.text.trim().isEmpty) {
      showError('Coupon code is required');
      return;
    }

    if (skuIdRadioValue && _skuIDValue.text.trim().isEmpty) {
      showError('SKU ID is required');
      return;
    }

    if (categoryRadioValue && (selectedCategory == null || selectedCategory!.isEmpty)) {
      showError('Please select a category');
      return;
    }

    if (validityFrom == null) {
      showError('From date is required');
      return;
    }

    if (validityTo == null) {
      showError('To date is required');
      return;
    }

    /// All validations passed - proceed to submit logic
    if (widget.isEdit == true) {
     updateCoupon();
    }
    else{
      submitCoupon();
    }
    
  },
  child: widget.isEdit == true ? Text("Update") : Text("Submit"),
),

        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(height: 25),

            /// Discount Type
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Discount Type*",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            /// Flat & Discount Radio Buttons
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFlatAmount = true;
                        });
                      },
                      child: Row(
                        children: [
                          Radio<bool>(
                            value: true,
                            groupValue: isFlatAmount,
                            activeColor: AppCol.primary,
                            visualDensity: VisualDensity.compact,
                            onChanged: (bool? value) {
                              setState(() {
                                isFlatAmount = value!;
                              });
                            },
                          ),
                          Text('Flat Amount'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFlatAmount = false;
                        });
                      },
                      child: Row(
                        children: [
                          Radio<bool>(
                            value: false,
                            groupValue: isFlatAmount,
                            activeColor: AppCol.primary,
                            onChanged: (bool? value) {
                              setState(() {
                                isFlatAmount = value!;
                              });
                            },
                          ),
                          Text('% Discount'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            /// Discount Value & Coupon code TextField
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  /// Discount Value
                  /// Discount Value

Expanded(
  child: TextFormField(
    controller: _discountValue,
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
    ],
    onChanged: (value) {
      setState(() {});
    },
    decoration: InputDecoration(
      labelText: 'Discount Value*',
      prefixText: isFlatAmount ? '₹ ' : '% ',
      hintStyle: TextStyle(
        color: Colors.black,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
),


                  SizedBox(width: 16),

                  /// Coupon Code Value
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        controller: _couponCodeValue,
                        onChanged: (value) {
                          _couponCodeValue.text = value;
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          labelText: 'Coupon Code*',
                          hintText: 'Enter code',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            /// Coupon Description Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                child: TextFormField(
                  controller: _descriptionValue,
                  onChanged: (value) {
                    _descriptionValue.text = value;
                    setState(() {});
                  },
                  maxLines: 5,
                  scribbleEnabled: true,
                  decoration: InputDecoration(
                    labelText: 'Coupon Description',
                    hintText: 'Input text',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            /// Application On Heading
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Applicable on*",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            /// All Products Radio tile
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isApplicationOn = true;
                    allProductRadioValue = true;
                    skuIdRadioValue = false;
                    categoryRadioValue = false;
                  });
                },
                child: Row(
                  children: [
                    Radio<bool>(
                      value: allProductRadioValue,
                      groupValue: isApplicationOn,
                      activeColor: AppCol.primary,
                      visualDensity: VisualDensity.compact,
                      onChanged: (bool? value) {
                        setState(() {
                          isApplicationOn = true;
                          allProductRadioValue = true;
                          skuIdRadioValue = false;
                          categoryRadioValue = false;
                        });
                      },
                    ),
                    Text('All Product'),
                  ],
                ),
              ),
            ),

            /// SKU ID Radio tile
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isApplicationOn = true;
                        allProductRadioValue = false;
                        skuIdRadioValue = true;
                        categoryRadioValue = false;
                      });
                    },
                    child: Row(
                      children: [
                        Radio<bool>(
                          value: skuIdRadioValue,
                          groupValue: isApplicationOn,
                          activeColor: AppCol.primary,
                          visualDensity: VisualDensity.compact,
                          onChanged: (bool? value) {
                            setState(() {
                              isApplicationOn = true;
                              allProductRadioValue = false;
                              skuIdRadioValue = true;
                              categoryRadioValue = false;
                            });
                          },
                        ),
                        Text('SKU ID'),
                      ],
                    ),
                  ),
                  SizedBox(width: 34),
                 Expanded(
  child: TextFormField(
    controller: _skuIDValue,
    readOnly: !skuIdRadioValue,
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9_,\-]')),
    ],
    onChanged: (value) {
      // skuList = value
      //     .split(',')
      //     .map((e) => e.trim())
      //     .where((e) => e.isNotEmpty)
      //     .toList();
      setState(() {});
      
    },
    validator: (value) {
      if (skuIdRadioValue) {
        if (value == null || value.trim().isEmpty) {
          return 'SKU ID is required';
        }
        if (!RegExp(r'^[A-Za-z0-9_,\-]+$').hasMatch(value)) {
          return 'Only letters, numbers, _, - and , allowed';
        }
      }
      return null;
    },
    decoration: InputDecoration(
      hintText: 'SKU ID',
      hintStyle: TextStyle(
        color: skuIdRadioValue ? Colors.black : Colors.grey,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: skuIdRadioValue ? AppCol.primary : Colors.grey,
        ),
      ),
    ),
  ),
)

                ],
              ),
            ),

            /// Category Radio tile
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isApplicationOn = true;
                    allProductRadioValue = false;
                    skuIdRadioValue = false;
                    categoryRadioValue = true;
                  });
                },
                child: Row(
                  children: [
                    Radio<bool>(
                      value: categoryRadioValue,
                      groupValue: isApplicationOn,
                      activeColor: AppCol.primary,
                      visualDensity: VisualDensity.compact,
                      onChanged: (bool? value) {
                        setState(() {
                          isApplicationOn = true;
                          allProductRadioValue = false;
                          skuIdRadioValue = false;
                          categoryRadioValue = true;
                        });
                      },
                    ),
                    Text('Category'),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            if (categoryRadioValue) ...[
               Padding(
                 padding: const EdgeInsets.only(left: 15.0,right: 15),
                 child: Container(
                      child:
                         
                      DropdownSearch<String>(
                        
                           items: (filter, infiniteScrollProps) =>
                        adminCategories,
                              decoratorProps: DropDownDecoratorProps(
                               
                              
                    decoration: InputDecoration(
                                labelText: 'Category*',
                      hintText: 'Select Category',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                          ),
                        ),
                           ),
                           popupProps: PopupProps.menu(
                             showSearchBox: true,
                           ),
                          // selectedItem: (),
                           onChanged: (value) {
                             print("Selected: $value");
                              print("responce model data   :");
                              
                     
                  
                            adminSubCategories.clear();
                            _categoryTextField.text = value.toString();
                           selectedCategory = value;
                            selectedCategoryId = productCategoryApiResModel
                                .categories!.firstWhere((element) => element.title == value)
                                .sId!;
                                debugPrint('res data 1$_categoryTextField.text');
                                 debugPrint('res data 2$selectedCategoryId');
                            
                            setState(() {});
                 
                 
                           //  selectedSubCategoryId =
                               //
                               // adminSubCategories[index]['_id'];
                           
                          
                           },
                         )
                   
                    ),
               ),
              
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ],

            /// Validity heading
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Validity*",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            /// From & to validity
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  /// From Value
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        controller: _fromDateValue,
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          setState(() {
                            validityFrom = pickedDate;
                            _fromDateValue.text = DateFormat('dd/MM/yyyy')
                                .format(validityFrom!);
                          });
                                                },
                        decoration: InputDecoration(
                          labelText: 'From*',
                          hintText: 'dd/mm/yy',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),

                  /// To Value
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        controller: _toDateValue,
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          setState(() {
                            validityTo = pickedDate;
                            _toDateValue.text =
                                DateFormat('dd/MM/yyyy').format(validityTo!);
                          });
                                                },
                        decoration: InputDecoration(
                          labelText: 'To',
                          hintText: 'dd/mm/yy',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            /// Additional info heading
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Additional Info (optional)"),
                  SizedBox(
                    height: 24,
                    width: 45,
                    child: AnimatedToggleSwitch<bool>.dual(
                      current: additionalInfo,
                      first: false,
                      second: true,
                      innerColor:
                          additionalInfo ? AppCol.primary : Color(0xFFD0D5DD),
                      dif: 1.0,
                      borderColor: Colors.transparent,
                      // borderWidth: 2.0,
                      // height: 20,
                      indicatorSize: Size(17, 18),
                      indicatorColor: Colors.white,
                      onChanged: (b) {
                        additionalInfo = b;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

           if(additionalInfo)...[
             /// Minimum order value
           
            Container(
  padding: EdgeInsets.symmetric(horizontal: 16),
  child: TextFormField(
    controller: _minimumOrderValue,
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
    ],
    onChanged: (value) {
      // No need to assign value back to controller
      setState(() {});
    },
    decoration: InputDecoration(
      labelText: 'Minimum Order Value',
      hintText: '₹',
      hintStyle: TextStyle(
        color: Colors.black,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
),
             SizedBox(height: MediaQuery.of(context).size.height * 0.02),

             /// Offer Valid to
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16),
               child: Text(
                 "Offer Valid to",
                 style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.w600,
                 ),
               ),
             ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.02),

             /// First Time Customer & Repeat customer
             Padding(
               padding: const EdgeInsets.only(left: 6, right: 16),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   GestureDetector(
                     onTap: () {
                       setState(() {
                         isOfferCheck = true;
                         firstTimeValue = true;
                         repeatCustomer = false;
                         specificCustomer = false;
                         allCustomer = false;
                       });
                     },
                     child: Row(
                       children: [
                         Radio<bool>(
                           value: firstTimeValue,
                           groupValue: isOfferCheck,
                           activeColor: AppCol.primary,
                           visualDensity: VisualDensity.compact,
                           onChanged: (bool? value) {
                             setState(() {
                               isOfferCheck = true;
                               firstTimeValue = true;
                               repeatCustomer = false;
                               specificCustomer = false;
                               allCustomer = false;
                             });
                           },
                         ),
                         Text('First Time Customer'),
                       ],
                     ),
                   ),
                   GestureDetector(
                     onTap: () {
                       isOfferCheck = true;
                       firstTimeValue = false;
                       repeatCustomer = true;
                       specificCustomer = false;
                       allCustomer = false;
                     },
                     child: Row(
                       children: [
                         Radio<bool>(
                           value: repeatCustomer,
                           groupValue: isOfferCheck,
                           activeColor: AppCol.primary,
                           visualDensity: VisualDensity.compact,
                           onChanged: (bool? value) {
                             setState(() {
                               isOfferCheck = true;
                               firstTimeValue = false;
                               repeatCustomer = true;
                               specificCustomer = false;
                               allCustomer = false;
                             });
                           },
                         ),
                         Text('Repeat Customer'),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.02),



            Padding(
  padding: const EdgeInsets.only(left: 6, right: 16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isOfferCheck = true;
                firstTimeValue = false;
                repeatCustomer = false;
                specificCustomer = true;
                allCustomer = false;
              });
            },
            child: Row(
              children: [
                Radio<bool>(
                  value: specificCustomer,
                  groupValue: isOfferCheck,
                  activeColor: AppCol.primary,
                  visualDensity: VisualDensity.compact,
                  onChanged: (bool? value) {
                    setState(() {
                      isOfferCheck = true;
                      firstTimeValue = false;
                      repeatCustomer = false;
                      specificCustomer = true;
                      allCustomer = false;
                    });
                  },
                ),
                Text('CUSTOMER ID'),
              ],
            ),
          ),
          SizedBox(width: 34),
         
         
          Expanded(
  child: TextFormField(
    controller: _specificCustomerValue,
    keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
    ],
    onChanged: (value) {
    

      setState(() {});
    },
    readOnly: !specificCustomer,
    decoration: InputDecoration(
      hintText: 'Enter customer mobile',
      hintStyle: TextStyle(
        color: specificCustomer ? Colors.black : Colors.grey,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: specificCustomer ? AppCol.primary : Colors.grey,
        ),
      ),
    ),
  ),
)

        ],
      ),


    ],
  ),
)
,
             SizedBox(height: MediaQuery.of(context).size.height * 0.02),

             /// All Product Radio
             Padding(
               padding: const EdgeInsets.only(left: 6),
               child: GestureDetector(
                 onTap: () {
                   setState(() {
                     isOfferCheck = true;
                     firstTimeValue = false;
                     repeatCustomer = false;
                     specificCustomer = false;
                     allCustomer = true;
                   });
                 },
                 child: Row(
                   children: [
                     Radio<bool>(
                       value: allCustomer,
                       groupValue: isOfferCheck,
                       activeColor: AppCol.primary,
                       visualDensity: VisualDensity.compact,
                       onChanged: (bool? value) {
                         setState(() {
                           isOfferCheck = true;
                           firstTimeValue = false;
                           repeatCustomer = false;
                           specificCustomer = false;
                           allCustomer =true;
                         });
                       },
                     ),
                     Text('All Customer'),
                   ],
                 ),
               ),
             ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.02),

             /// Usage per customer
            Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: TextFormField(
    controller: _usagePerCustomerValue,
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    onChanged: (value) {
      setState(() {});
    },
    decoration: InputDecoration(
      labelText: 'Usage Per Customer',
      hintText: '0',
      hintStyle: TextStyle(
        color: Colors.black,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
),
             SizedBox(height: MediaQuery.of(context).size.height * 0.04),
           ]
          ],
        ),
      ),
    );
  }
}
