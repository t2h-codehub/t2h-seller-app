import 'dart:async';
import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/productCategoryModel/deleteProductApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/deleteVariantApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/getTempSellerVariantsApiResModel.dart'
    as GetUserVariants;
import 'package:taptohello/data/productCategoryModel/manageVariantsApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/manageVariantsCollectionApiResModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/InstagramAuth/instagramEditProducts.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageVariants/ManageVariantController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageVariants/editVariantsPopUpDialog.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageVariants/manageInvertoryAndPriceSKUID.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageVariants/manageVariantsPopUpDialog.dart';

class ManageVariantsScreen extends StatefulWidget {
  const ManageVariantsScreen({super.key, required this.productId, required this.skuid, required this.mrp, required this.discountPrice, required this.stock, this.isFromInstagram});

  final String productId;
  final String skuid;
  final String mrp;
  final String discountPrice;
  final String stock;
  final bool? isFromInstagram;

  @override
  State<ManageVariantsScreen> createState() => _ManageVariantsScreenState();
}

class _ManageVariantsScreenState extends State<ManageVariantsScreen> {
  TextEditingController variantTypeController = TextEditingController();
  TextEditingController variantValueController = TextEditingController();
  TextEditingController selectedVariantTypeController = TextEditingController();
  TextEditingController selectedVariantPopUpController =
      TextEditingController();

  bool isCustomVariant = false;
  bool isUnlimitedInventory = false;

  bool isApiDataAvailable = false;
  late Future _future;

  ManageVariantsApiResModel manageVariantsApiResModel =
      ManageVariantsApiResModel();
  ManageVariantsCollectionApiResModel manageVariantsCollectionApiResModel =
      ManageVariantsCollectionApiResModel();
  final ManageVariantController _manageVariantController = ManageVariantController();
  final TextEditingController _customVariantController = TextEditingController();
  GetUserVariants.GetTempSellerVariantsApiResModel
      getTempSellerVariantsApiResModel =
      GetUserVariants.GetTempSellerVariantsApiResModel();

  DeleteVariantApiResModel deleteVariantApiResModel = DeleteVariantApiResModel();
  DeleteProductApiResModel deleteProductApiResModel = DeleteProductApiResModel();
  final AddProductController _addProductController = AddProductController();

  List adminVariantType = [];
  List customVariantValue = [];
  List<Map<String, dynamic>> adminVariantValue = [];

  /// Variant List
  final List<GetUserVariants.Datum> _categories = [];

   bool _isChanged = false;

   Widget saveVariantsButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 16, top: 16),
      width: double.infinity,
      child: ElevatedButton(
        // onPressed: () {
        //   // Check if variants are empty, and pass new data accordingly
        // bool noDataInVariants = _categories.isEmpty || _categories.every((category) => category.values?.isEmpty ?? true);
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => ManageInventoryAndPriceSKUIDScreen(
        //         productId: widget.productId,
        //         skuId: widget.skuid,
        //         mrp: widget.mrp,
        //         price: widget.discountPrice,
        //         stock: widget.stock,
        //         isFromInstagram: widget.isFromInstagram,
        //         isNew: noDataInVariants,
        //       ),
        //     ),
        //   );
        // },
        onPressed: () {
  // Check if variants are empty, and pass new data accordingly
  bool noDataInVariants = _categories.isEmpty || _categories.every((category) => category.values?.isEmpty ?? true);

  if (noDataInVariants) {
    // Show popup if no variant is added
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            'No Variants Added',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Please add at least one variant before proceeding.',
            style: TextStyle(fontSize: 14, color: Colors.blueGrey),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'OK',
                style: TextStyle(color: AppCol.primary),
              ),
            ),
          ],
        );
      },
    );
  } else {
    // Navigate to ManageInventoryAndPriceSKUIDScreen if variant exists
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ManageInventoryAndPriceSKUIDScreen(
          productId: widget.productId,
          skuId: widget.skuid,
          mrp: widget.mrp,
          price: widget.discountPrice,
          stock: widget.stock,
          isFromInstagram: widget.isFromInstagram,
          isNew: noDataInVariants,
        ),
      ),
    );
  }
},

        style: buttonStyle(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_circle, color: AppCol.primary),
            const SizedBox(height: 10),
            Text(
              'Review and Save Variants',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      backgroundColor: Colors.grey.withOpacity(.1),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );
  }
 


  AlertDialog deleteConfirmationDialog() {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        'Are you sure you want to delete all variants?',
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0xFF666666), fontSize: 15),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel', style: TextStyle(color: Colors.grey, fontSize: 16)),
            ),
            SizedBox(width: 20),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Delete', style: TextStyle(color: Colors.red, fontSize: 16)),
            ),
          ],
        ),
      ],
    );
  }

  Widget buttonContent(IconData icon, String text, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 20, color: color),
        SizedBox(width: 6),
        Text(text, style: TextStyle(fontSize: 14, color: color)),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    debugPrint('my Variant Screen MRP Price is: ${widget.mrp}');
    debugPrint('my Variant Screen discount price is: ${widget.discountPrice}');
    _future = loadVariantData();
  }

  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // return true;
      //   return await _showExitConfirmation(context);
          bool shouldExit = await _handleBackPress(context);
            if (shouldExit) {
              // Navigator.pop(context);
                if(widget.isFromInstagram ?? false) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InstagramEditProductListScreen(productId: widget.productId, isFrom: "Variants", isFromCatalogue: false,)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProductListScreen(productId: widget.productId, isFrom: "Variants", isFromCatalogue: false,)));
                  }
            }

            return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF0F1F6),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.grey,
          ),
          leading: InkWell(
             onTap: () async {
            bool shouldExit = await _handleBackPress(context);
            if (shouldExit) {
              // Navigator.pop(context);
                if(widget.isFromInstagram ?? false) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InstagramEditProductListScreen(productId: widget.productId, isFrom: "Variants", isFromCatalogue: false,)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProductListScreen(productId: widget.productId, isFrom: "Variants", isFromCatalogue: false,)));
                  }
            }
          },

            child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Image.asset(
                  "assets/images/back.png",
                  height: 24,
                )),
          ),
          title: Text(
            'Manage Variants',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
         
        ),
         body: FutureBuilder(
  future: _future,
  builder: (context, snapshot) {
    if (!isApiDataAvailable) {
      return Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (_categories.isEmpty) ...[
        variantButtons(variantType: 1),
        variantButtons(variantType: 2),
      ] else ...[
        // Loop through each category to display variants
        ...List.generate(_categories.length, (index) {
          final variant = _categories[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Variant Type ${index + 1}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // Edit and Delete button placed in a Column for vertical stacking
                  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    // Edit Button
    SizedBox(
      width: MediaQuery.of(context).size.width * 0.25, // Set 45% width
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: InkWell(
          onTap: () async {
            final res = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return EditVariantsPopDialog(
                  productID: widget.productId,
                  selectedVariantType: "${variant.variantType?.title.toString().split(' || ')?.first.trim() ?? ''}",
                  selectedVariantValue: variant.values!,
                  objectId: "${variant.id}",
                );
              },
            );
            if (res == true) {
              setState(() {
                _future = loadVariantData();
                _isChanged = true;
              });
            }
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit, color: AppCol.primary, size: 20),
                SizedBox(width: 10),
                Text(
                  'Edit',
                  style: TextStyle(
                    color: AppCol.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),

    SizedBox(height: 10),

    // Delete Button
    SizedBox(
      width: MediaQuery.of(context).size.width * 0.25, // Same width as Edit Button
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: InkWell(
          onTap: () async {
            bool? confirmDelete = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  title: Text(
                    'Are you sure you want to delete this variant?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                           
                            Navigator.of(context).pop(false);
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ),
                        SizedBox(width: 20),
                        TextButton(
                          onPressed: () {
                            
                            Navigator.of(context).pop(true);
                          },
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );

   
   
    if (confirmDelete == true) {
  Map<String, dynamic> body = {
    "sellerVariantId": variant.id
  };

  deleteVariantApiResModel = await _manageVariantController.deleteVariantValue(widget.productId, body);

  if (deleteVariantApiResModel.success == true) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Variant deleted successfully')),
    );

    setState(() {
      _future = loadVariantData();  // Reload the variants
      _categories.clear(); // Ensure UI reflects empty state
      _isChanged = true;  // Track changes
    });
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to delete variant')),
    );
  }
}

          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delete, color: Colors.red, size: 20),
                SizedBox(width: 10),
                Text(
                  'Delete',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ],
),

                
                
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10, bottom: 12, right: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey, strokeAlign: 0.8),
                ),
                child: Text('${variant.variantType?.title.toString().split(' || ')?.first.trim() ?? ''}'),
              ),
              Wrap(
                spacing: 10,
                children: variant.values!.map((value) {
                  return Chip(
                    label: Text(value.title.toString().toString().split(' || ')?.first.trim() ?? ''),
                  );
                }).toList(),
              ),
              // Show variant buttons for the next variant if needed
              if (index == 0 && _categories.length == 1)
                variantButtons(variantType: 2, vaariantType: "${variant.variantType?.title.toString().split(' || ')?.first.trim() ?? ''}"),
              if (index < _categories.length - 1) Divider(color: Colors.grey),
            ],
          );
        }),
      ],
     // if (_categories.isNotEmpty) deleteVariantsButton(),
      saveVariantsButton(),
    ],
  ),
)

    );
  },
),

      ),
    );
  }

   Future<bool> _handleBackPress(BuildContext context) async {
    if (_isChanged) {
      return await _showExitConfirmation(context);
    }
    return true;
  }

  /// Variant Button
  Widget variantButtons({int? variantType, String? vaariantType}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
        onPressed: () async {
          bool res = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return ManageVariantsPopDialog(productId: widget.productId, variantType: vaariantType ?? '',);
            },
          );
          if (res) {
            debugPrint('My variant value is: $res');
            _future = loadVariantData();
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          backgroundColor: Colors.grey.withOpacity(.1),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle,
              color: AppCol.primary,
            ),
            const SizedBox(width: 10),
            Text(
              'Add Variant Type $variantType',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Selected Variant
  /*Widget selectedVariant() {

  }*/

  void saveVariants() async {
    List<Map<String, dynamic>> variants = [];
    for (var category in _categories) {
      List<String> valueIds = category.values!.map((e) => e.id!).toList();
      variants.add({
        "variantType": category.variantType!.id,
        "valueIds": valueIds,
      });
    }
    Map<String, dynamic> body = {
      "productId": widget.productId,
      "variants": variants,
    };
    debugPrint('My body is: $body');
    manageVariantsCollectionApiResModel = await _manageVariantController.addVariantValue(body);
    if (manageVariantsCollectionApiResModel.success == true) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(manageVariantsCollectionApiResModel.message.toString())));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(manageVariantsCollectionApiResModel.message.toString())));
    }
  }

  /// load variant type values
  Future<String> showAddedVariantTypesModalSheet(BuildContext context) async {
    final selectedString = Completer<String>();
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14), topRight: Radius.circular(14))),
      builder: (builder) => Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.only(left: 24, right: 24),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14), topRight: Radius.circular(14))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 14),
              Text(
                'Select Variant Value',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 14),
              Divider(
                color: Colors.grey,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: adminVariantType.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // selectedString = adminCategories[index];
                          selectedString.complete(adminVariantType[index]);
                          debugPrint(
                              'My selected string: ${selectedString.future}');
                          setState(() {});
                          Navigator.pop(context, selectedString);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10, top: 10),
                          child:
                              Center(child: Text('${adminVariantType[index]}')),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
    return selectedString.future;
  }

  /// load variant data
  Future<bool> loadVariantData() async {
    getTempSellerVariantsApiResModel =
        await _manageVariantController.getVariantValue(widget.productId);
    if (getTempSellerVariantsApiResModel.success == true) {
      isApiDataAvailable = true;
      getVariantData();
    } else {
      isApiDataAvailable = true;
    }
    return isApiDataAvailable;
  }

  /// get added variant data
  getVariantData() {
    _categories.clear();
    debugPrint('My this fun is run');
    getTempSellerVariantsApiResModel.data?.forEach((element) {
      _categories.add(
        GetUserVariants.Datum(
            variantType: element.variantType,
            id: element.id,
            product: element.product,
            user: element.user,
            values: element.values),
      );
    });
    setState(() {});
    debugPrint('my category length is: ${_categories.length}');
  }

  /// Add Variant Value
  updateVariantValue() async {
    Map<String, dynamic> body = {
      "productId": widget.productId,
      "variants": [

        // {"variantType": "$variantTypeId", "valueIds": variantValueIds}
      ]
    };
    debugPrint('My body is: $body');
    manageVariantsCollectionApiResModel =
    await _manageVariantController.addVariantValue(body);
    if (manageVariantsCollectionApiResModel.success == true) {
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
          Text(manageVariantsCollectionApiResModel.message.toString())));
    }
  }

  
}

@override
Widget build(BuildContext context) {
  return WillPopScope(
    onWillPop: () async {
      return await _showExitConfirmation(context);
    },
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        leading: InkWell(
          onTap: () async {
            bool shouldExit = await _showExitConfirmation(context);
            if (shouldExit) {
              Navigator.pop(context);
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Image.asset(
              "assets/images/back.png",
              height: 24,
            ),
          ),
        ),
        title: Text(
          'Manage Variants',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: Text("Manage your variants here!"), // Placeholder for your content
      ),
    ),
  );

  
}

/// Function to show exit confirmation dialog
Future<bool> _showExitConfirmation(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Exit from Manage Variants?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF666666),
            fontSize: 15,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        ),
        content: Text(
          'Unsaved changes will be lost if you leave this screen without saving variants.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// No Button
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  'No',
                  style: TextStyle(color: AppCol.primary, fontSize: 16),
                ),
              ),
              SizedBox(width: 20),
              /// Yes Button
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      );
    },
  ) ?? false;
}


