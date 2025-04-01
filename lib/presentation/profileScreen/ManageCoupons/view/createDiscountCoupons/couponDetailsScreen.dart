import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taptohello/core/utils/color_constant.dart';

class CouponDetailsScreen extends StatefulWidget {
  const CouponDetailsScreen(
      {super.key,
      required this.statusName,
      required this.couponName,
      required this.couponDescription});

  final String statusName;
  final String couponName;
  final String couponDescription;

  @override
  State<CouponDetailsScreen> createState() => _CouponDetailsScreenState();
}

class _CouponDetailsScreenState extends State<CouponDetailsScreen> {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _couponCodeValue.text = widget.couponName;
    _descriptionValue.text = widget.couponDescription;
  }

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
          onTap: () => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    title: Text(
                      'Are you sure that you want to delete this coupon?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 1.47,
                      ),
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// No Button
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 48, vertical: 10),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0.50, color: AppCol.primary),
                                  borderRadius: BorderRadius.circular(23),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'No',
                                    style: TextStyle(
                                      color: AppCol.primary,
                                      fontSize: 16,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 24),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 48, vertical: 10),
                                  decoration: ShapeDecoration(
                                    color: AppCol.primary,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 0.50,
                                          color: AppCol.primary),
                                      borderRadius: BorderRadius.circular(23),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Yes',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.16,
                                        ),
                                      ),
                                    ],
                                  )))
                        ],
                      ),
                      SizedBox(height: 10),
                    ]);
              }),

          //   Navigator.of(context).pop();
          // },
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Image.asset(
                "assets/images/back.png",
                height: 24,
              )),
        ),
        centerTitle: false,
        title: Text(
          '${widget.statusName} Coupon - ${widget.couponName}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
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
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        controller: _discountValue,
                        onChanged: (value) {
                          _discountValue.text = value;
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          labelText: 'Discount Value*',
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
                    child: Container(
                      child: TextFormField(
                        controller: _skuIDValue,
                        onChanged: (value) {
                          _skuIDValue.text = value;
                          setState(() {});
                        },
                        readOnly: skuIdRadioValue ? false : true,
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
                              color: skuIdRadioValue
                                  ? AppCol.primary
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
              /// Category Dropdown
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButtonFormField<String>(
                  value: selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                  items: ['Category 1', 'Category 2', 'Category 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Category*',
                    hintText: 'Select Category',
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

              /// Sub Category Dropdown
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButtonFormField<String>(
                  value: selectedSubCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedSubCategory = newValue;
                    });
                  },
                  items: ['Sub Category 1', 'Sub Category 2', 'Sub Category 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Sub Category*',
                    hintText: 'Add Sub Category',
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

            if (additionalInfo) ...[
              /// Minimum order value
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _minimumOrderValue,
                  onChanged: (value) {
                    _minimumOrderValue.text = value;
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

              /// Specific customer
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 16),
                child: Row(
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
                          Text('SKU ID'),
                        ],
                      ),
                    ),
                    SizedBox(width: 34),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: _specificCustomerValue,
                          onChanged: (value) {
                            _specificCustomerValue.text = value;
                            setState(() {});
                          },
                          readOnly: specificCustomer ? false : true,
                          decoration: InputDecoration(
                            hintText: 'Enter customer mobile',
                            hintStyle: TextStyle(
                              color:
                                  specificCustomer ? Colors.black : Colors.grey,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: specificCustomer
                                    ? AppCol.primary
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                            allCustomer = true;
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
                child: Container(
                  child: TextFormField(
                    controller: _usagePerCustomerValue,
                    onChanged: (value) {
                      _usagePerCustomerValue.text = value;
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
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            ]
          ],
        ),
      ),
    );
  }
}
