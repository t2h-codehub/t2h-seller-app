import 'dart:developer';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/add_product/saveVariantApiResModel.dart'
    as GetSaveVariants;
import 'package:taptohello/data/productCategoryModel/deleteProductApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/deleteVariantApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/editProductApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/manageInventoryAndPriceSkuIdApiResModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/InstagramAuth/instagramEditProducts.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageVariants/ManageVariantController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageVariants/manageInventoryPriceAndSKUIdDialog.dart';
import 'package:taptohello/services/shared_preference_service.dart';

import '../../../../data/add_product/add_product_body_model.dart';





class ManageInventoryAndPriceSKUIDScreen extends StatefulWidget {
  const ManageInventoryAndPriceSKUIDScreen(
      {super.key,
      required this.productId,
      required this.skuId,
      required this.mrp,
      required this.price,
      required this.stock, this.isFromInstagram, this.isNew});

  final String productId;
  final String stock;
  final String skuId;
  final String mrp;
  final String price;
  final bool? isFromInstagram;
  final bool? isNew;
  

  @override
  State<ManageInventoryAndPriceSKUIDScreen> createState() =>
      _ManageInventoryAndPriceSKUIDScreenState();
}

class _ManageInventoryAndPriceSKUIDScreenState
    extends State<ManageInventoryAndPriceSKUIDScreen> {
    ManageInventorySkuidPriceApiResModel manageInventorySkuidPriceApiResModel =
      ManageInventorySkuidPriceApiResModel();
 
    final ManageVariantController _manageVariantController = ManageVariantController();

  GetSaveVariants.GetSaveVariantApiResModel getSaveVariantApiResModel =
      GetSaveVariants.GetSaveVariantApiResModel();
  AddProductDataBody addProductDataBody =
      AddProductDataBody(variantDataArray: []);
  bool isUnlimitedInventory = false;
  final List<Map<String, dynamic>> _stockData = [];

  DeleteVariantApiResModel deleteVariantApiResModel = DeleteVariantApiResModel();
  DeleteProductApiResModel deleteProductApiResModel = DeleteProductApiResModel();
  final AddProductController _addProductController = AddProductController();
  EditProductDetailsApiResModel editProductDetailsApiResModel = EditProductDetailsApiResModel();

  final Map<String, dynamic> _body = {};

  bool isApiDataAvailable = false;
  late Future _future;
   bool _isChanged = false;
   bool _isLoading = true;

  

  Future<bool> _showExitConfirmation(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Unsaved Changes"),
        content: Text("You have unsaved changes. Are you sure you want to leave?"),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text("Cancel")),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text("Leave")),
        ],
      ),
    ) ?? false;
  }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    _future = syncProductVariants();

  }

  Map<String, dynamic> generateUpdatedPayload() {
  return {
    "productId": widget.productId,  
    "combinations": manageInventorySkuidPriceApiResModel.combinations?.map((item) {
      return {
        "_id": item.sId, 
        "variants": item.variants?.map((variant) {
          return {
            "_id": variant.sId,
            "title": variant.title,
            "value": {
              "_id": variant.value?.sId,
              "title": variant.value?.title,
            }
          };
        }).toList(),
        "stock": item.stock,
        "unlimitedStock": item.unlimitedStock,
        "mrp": item.mrp,
        "price": item.price,
        "images": item.images,
        "isDisabled": item.isDisabled,
        "sku_id": item.skuId
      };
    }).toList(),
  };
}

// Function to get payload
Map<String, dynamic> getPayload() {
  if (_isChanged) {
    // If there are changes, use the updated payload
    return generateUpdatedPayload();
  } else {
    // If no changes, use the original payload (without any edits)
    return {
      "productId": widget.productId,  
      "combinations": manageInventorySkuidPriceApiResModel.combinations?.map((item) {
        return {
          "_id": item.sId,
          "variants": item.variants?.map((variant) {
            return {
              "_id": variant.sId,
              "title": variant.title,
              "value": {
                "_id": variant.value?.sId,
                "title": variant.value?.title,
              }
            };
          }).toList(),
          "stock": item.stock,
          "unlimitedStock": item.unlimitedStock,
          "mrp": item.mrp,
          "price": item.price,
          "images": item.images,
          "isDisabled": item.isDisabled,
          "sku_id": item.skuId
        };
      }).toList(),
    };
  }
}

List<Widget> _getDynamicHeaders(dynamic response) {
  Set<String> headers = {};

  // Iterate over each combination in the response
  for (var combination in response.combinations ?? []) {
    // Check if the combination is not disabled
    if (!combination.isDisabled) {
      // Iterate over the variants of the combination and add their titles
      for (var variant in combination.variants ?? []) {
        headers.add(variant.title);
      }
    }
  }

  // Create a list of Expanded widgets based on the headers
  return headers
      .map((title) => Expanded(
            child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ))
      .toList();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        leading: InkWell(
          onTap: () async {
            if (_isChanged) {
              bool shouldExit = await _showExitConfirmation(context);
              if (shouldExit) Navigator.pop(context);
            } else {
              Navigator.pop(context);
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Image.asset("assets/images/back.png", height: 24),
          ),
        ),
        title: Text(
          'Manage Inventory',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      
         actions: [
            /// View Hello Store Button
            InkWell(
              onTap: () async {
                debugPrint('My variant body is: ${addProductDataBody.toJson()}');
                debugPrint('My variant body is: ${addProductDataBody.variantDataArray?.length}');
                for (var i = 0; i < addProductDataBody.variantDataArray!.length; i++) {
                  debugPrint('My variant body is: ${addProductDataBody.variantDataArray?[i].toJson()}');
                }
                Map<String, dynamic> body = {};
                body = {
                  "unlimitedStock": isUnlimitedInventory
                };
                var payloadToSend = getPayload();
                getSaveVariantApiResModel = await _manageVariantController
                    .getSaveVariant(payloadToSend);
                editProductDetailsApiResModel = await _addProductController.editProduct(widget.productId, body);
                log("Body: ${addProductDataBody.toJson()}");
                if (getSaveVariantApiResModel.success == true && editProductDetailsApiResModel.success == true) {
                  debugPrint('My variant body is: ${getSaveVariantApiResModel.toJson()}');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${getSaveVariantApiResModel.message}")));
                      _isChanged = false;
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
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${getSaveVariantApiResModel.message}")));
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 14, top: 20),
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: AppCol.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
      ),
      body: Padding(
  padding: const EdgeInsets.all(20.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// Title
      Text(
        'Manage Inventory, Price, and SKU ID',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      SizedBox(height: 20),

      /// Unlimited Inventory Toggle
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Unlimited Inventory',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Switch(
            value: isUnlimitedInventory,
            activeColor: Colors.green,
            onChanged: (b) {
               isUnlimitedInventory = b;
                                  SharedPreferenceService.setString("productUnlimitedStockbyId${widget.productId}", isUnlimitedInventory == true ? "true" : "false");
                                  addProductDataBody.variantDataArray?.forEach((element) {
                                    element.isDefault = isUnlimitedInventory;
                                  });
                                  setState(() {});
            
            },
          ),
        ],
      ),
      SizedBox(height: 20),

      /// Table Header
      /// 
    

   Container(
  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
  decoration: BoxDecoration(
    color: Colors.grey.shade200,
    borderRadius: BorderRadius.circular(8),
  ),
  child: Row(
    children: [
      ..._getDynamicHeaders(manageInventorySkuidPriceApiResModel),
      Expanded(
        child: Text('Stock', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Expanded(
        child: Text('Action', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    ],
  ),
),






      if (_isLoading)
            Center(child: CircularProgressIndicator())
          else

Expanded(
  child: ListView.builder(
    itemCount: manageInventorySkuidPriceApiResModel.combinations?.length ?? 0,
    itemBuilder: (context, index) {
      final item = manageInventorySkuidPriceApiResModel.combinations![index];

      // Skip if the row is disabled
     // if (item.isDisabled == true) return SizedBox.shrink();

      final variants = item.variants ?? [];
      final weight = variants.isNotEmpty ? variants[0].value?.title ?? '' : '';
      final color = variants.length > 1 ? variants[1].value?.title ?? '' : '';
      final isDisabled = item.isDisabled == true;

      return Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          // color: Colors.white,
          // border: Border.all(color: Colors.grey.shade300),
           color: isDisabled ? Colors.grey.shade200 : Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            if (variants.length == 2) ...[
              Expanded(child: Text(weight, style: TextStyle(color: Colors.black))),
              Expanded(child: Text(color, style: TextStyle(color: Colors.black))),
            ] else
              Expanded(child: Text(weight, style: TextStyle(color: Colors.black))),

            Expanded(
              child: Text(
                item.stock == 0
                    ? '0'
                    : (item.unlimitedStock == true ? '-' : item.stock.toString()),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            // Expanded(
            //   child: IconButton(
            //     icon: Icon(Icons.edit, size: 22, color: Colors.blueAccent),
            //     onPressed: () {
            //       // Edit logic
            //     },
            //   ),
            // ),
             Expanded(
              child: item.isDisabled == true
                  ? Icon(Icons.block, color: Colors.red, size: 22) // Disabled icon
                  : IconButton(
                      icon: Icon(Icons.edit, size: 22, color: AppCol.primary),
                      onPressed: () async {
                        var selectedItem = manageInventorySkuidPriceApiResModel.combinations?.firstWhere(
                          (combination) => combination.sId == item.sId,
                          orElse: () => Combinations(),
                        );

                        if (selectedItem != null) {
                          // String size = selectedItem.variants?[0].value?.title ?? "";
                          // String color = selectedItem.variants?[1].value?.title ?? "";
                          String size = "";
String color = "";

// Check if variants list is not null and has at least 1 element for size
if (selectedItem.variants != null && selectedItem.variants!.isNotEmpty) {
  size = selectedItem.variants![0].value?.title ?? "";
}

// Check if variants list has at least 2 elements for color
if (selectedItem.variants != null && selectedItem.variants!.length > 1) {
  color = selectedItem.variants![1].value?.title ?? "";
}


                       
                       
                          var result = await showDialog(
  context: context,
  builder: (context) => ManageInventoryPriceAndSKUIdDialog(
    size: size,
    color: color,
    stock: selectedItem.stock?.toString() ?? '0',
    firstVariantName: selectedItem.variants?.isNotEmpty == true
        ? selectedItem.variants![0].title ?? ""
        : "", 
    secondVariantName: selectedItem.variants!.length > 1
        ? selectedItem.variants![1].title ?? ""
        : "",
    body: (updatedData) {
      Navigator.pop(context, updatedData);
    },
    image: selectedItem.images,
    skuid: selectedItem.skuId ?? '',
    mrp: selectedItem.mrp?.toString() ?? '0',
    discountPrice: selectedItem.price?.toString() ?? '0',
    productId: selectedItem.sId ?? '',
    isUnlimitedInventory: isUnlimitedInventory,
  ),
);


                          if (result != null) {
                            setState(() {
                              // Handle stock value based on unlimited inventory
                              if (isUnlimitedInventory) {
                                selectedItem.stock = 0; // Set to 0 for unlimited
                                selectedItem.unlimitedStock = true;
                              } else {
                                selectedItem.stock = int.parse(result['stock'] ?? '0');
                                selectedItem.unlimitedStock = false;
                              }
                              
                              selectedItem.sId = selectedItem.sId;
                              selectedItem.skuId = result['sku_id'] ?? '';
                              selectedItem.mrp = double.parse(result['price']?.toString() ?? '0.0');
                              selectedItem.price = double.parse(result['discount']?.toString() ?? '0.0');
                              selectedItem.images = result['selectedImages'] ?? '';
                             
                              int index = manageInventorySkuidPriceApiResModel.combinations?.indexWhere((item) => item.sId == selectedItem.sId) ?? -1;
                              if (index != -1) {
                                manageInventorySkuidPriceApiResModel.combinations![index] = selectedItem;
                              }

                              _isChanged = true;
                            });

                            var payloadToSend = getPayload();
                            print("Updated Payload: $payloadToSend");
                          }
                        }
                      }, 
                    ),
            ),

          ],
        ),
      );
    },
  ),
),




    ],
  ),
),

    );
  }

Future<ManageInventorySkuidPriceApiResModel> syncProductVariants() async {
  setState(() {
    _isLoading = true;
  });
  manageInventorySkuidPriceApiResModel = await _manageVariantController.syncProductVariants(widget.productId, false);
  await getAllCombination();

  setState(() {
    _isLoading = false; // Hide the loader after data is fetched
  });
  return manageInventorySkuidPriceApiResModel;
}



 Future<bool> getAllCombination() async {
  debugPrint('This is my product id: ${widget.productId}');
  isUnlimitedInventory = SharedPreferenceService.getString("productUnlimitedStockbyId${widget.productId}") == "true" ? true : false;

  // Fetch combinations and print the data
  manageInventorySkuidPriceApiResModel = await _manageVariantController
      .getAllCombinationValues(widget.productId);

  // Print the response to see if data is being fetched
  //log('My response is: ${manageInventorySkuidPriceApiResModel.toJson()}');
  if (manageInventorySkuidPriceApiResModel.combinations != null && manageInventorySkuidPriceApiResModel.combinations!.isNotEmpty) {
    // isApiDataAvailable = true;
    setState(() {
  if (!isApiDataAvailable) {
    isApiDataAvailable = true;
  }
});
  } else {
    debugPrint('Api returned no data');
    log('No combinations available.');
  }

  return isApiDataAvailable;
}

}






