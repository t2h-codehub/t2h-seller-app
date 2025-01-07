import 'dart:developer';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/app_export.dart';
import 'package:swapnil_s_application4/data/add_product/saveVariantApiResModel.dart'
    as GetSaveVariants;
import 'package:swapnil_s_application4/data/productCategoryModel/deleteProductApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/deleteVariantApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/editProductApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/manageInventoryAndPriceSkuIdApiResModel.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/addProductDialog.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/InstagramAuth/instagramEditProducts.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageVariants/ManageVariantController.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageVariants/defaultVariantScreen.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageVariants/manageInventoryPriceAndSKUIdDialog.dart';
import 'package:swapnil_s_application4/services/shared_preference_service.dart';

import '../../../../data/add_product/add_product_body_model.dart';

class ManageInventoryAndPriceSKUIDScreen extends StatefulWidget {
  const ManageInventoryAndPriceSKUIDScreen(
      {super.key,
      required this.productId,
      required this.skuId,
      required this.mrp,
      required this.price,
      required this.stock, this.isFromInstagram});

  final String productId;
  final String stock;
  final String skuId;
  final String mrp;
  final String price;
  final bool? isFromInstagram;

  @override
  State<ManageInventoryAndPriceSKUIDScreen> createState() =>
      _ManageInventoryAndPriceSKUIDScreenState();
}

class _ManageInventoryAndPriceSKUIDScreenState
    extends State<ManageInventoryAndPriceSKUIDScreen> {
  ManageInventorySkuidPriceApiResModel manageInventorySkuidPriceApiResModel =
      ManageInventorySkuidPriceApiResModel(combinations: []);
  ManageVariantController _manageVariantController = ManageVariantController();
  GetSaveVariants.GetSaveVariantApiResModel getSaveVariantApiResModel =
      GetSaveVariants.GetSaveVariantApiResModel();
  AddProductDataBody addProductDataBody =
      AddProductDataBody(variantDataArray: []);
  bool isUnlimitedInventory = false;
  final List<Map<String, dynamic>> _stockData = [];

  DeleteVariantApiResModel deleteVariantApiResModel = DeleteVariantApiResModel();
  DeleteProductApiResModel deleteProductApiResModel = DeleteProductApiResModel();
  AddProductController _addProductController = AddProductController();
  EditProductDetailsApiResModel editProductDetailsApiResModel = EditProductDetailsApiResModel();

  Map<String, dynamic> _body = {};

  bool isApiDataAvailable = false;
  late Future _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = getAllCombination();
    debugPrint('My MRP is: ${widget.productId}');
    debugPrint('My MRP is: ${widget.mrp}');
    debugPrint('My discount price is: ${widget.price}');
    debugPrint('My sku id is: ${widget.skuId}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        leading: InkWell(
          onTap: () => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius
                            .circular(
                            16)),
                    title: Text(
                      'Variants will get discarded if you go back without saving them.',
                      textAlign:
                      TextAlign.center,
                      style: TextStyle(
                        color: Color(
                            0xFF666666),
                        fontSize: 15,
                        fontFamily:
                        'Roboto',
                        fontWeight:
                        FontWeight.w400,
                        height: 1.47,
                      ),
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .center,
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                        children: [
                          /// No Button
                          InkWell(
                            onTap: () {
                              Navigator.of(
                                  context)
                                  .pop();
                            },
                            child:
                            Container(
                              padding: const EdgeInsets
                                  .symmetric(
                                  horizontal:
                                  48,
                                  vertical:
                                  10),
                              decoration:
                              ShapeDecoration(
                                color: Colors
                                    .white,
                                shape:
                                RoundedRectangleBorder(
                                  side: BorderSide(
                                      width:
                                      0.50,
                                      color:
                                      Color(0xFF3371A5)),
                                  borderRadius:
                                  BorderRadius.circular(
                                      23),
                                ),
                              ),
                              child: Row(
                                mainAxisSize:
                                MainAxisSize
                                    .min,
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .center,
                                children: [
                                  Text(
                                    'No',
                                    style:
                                    TextStyle(
                                      color:
                                      Color(0xFF3371A5),
                                      fontSize:
                                      16,
                                      fontFamily:
                                      'Roboto',
                                      fontWeight:
                                      FontWeight.w500,
                                      letterSpacing:
                                      0.16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                              width: 24),
                          InkWell(
                              onTap: () async {
                                deleteVariantApiResModel = await _manageVariantController.deleteVariantValue(widget.productId);
                                deleteProductApiResModel = await _addProductController.deleteProduct(widget.productId);
                                if(deleteVariantApiResModel.success == true && deleteProductApiResModel.success == true) {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(content: Text('Something went wrong')));
                                }
                              },
                              child:
                              Container(
                                  padding: const EdgeInsets
                                      .symmetric(
                                      horizontal:
                                      48,
                                      vertical:
                                      10),
                                  decoration:
                                  ShapeDecoration(
                                    color:
                                    Color(0xFF3371A5),
                                    shape:
                                    RoundedRectangleBorder(
                                      side: BorderSide(width: 0.50, color: Color(0xFF3371A5)),
                                      borderRadius: BorderRadius.circular(23),
                                    ),
                                  ),
                                  child:
                                  Row(
                                    mainAxisSize:
                                    MainAxisSize.min,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
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
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Image.asset(
                "assets/images/back.png",
                height: 24,
              )),
        ),
        title: Text(
          'Manage Inventory Screen',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
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
              getSaveVariantApiResModel = await _manageVariantController
                  .getSaveVariant(addProductDataBody.toJson());
              editProductDetailsApiResModel = await _addProductController.editProduct(widget.productId, body);
              log("Body: ${addProductDataBody.toJson()}");
              if (getSaveVariantApiResModel.success == true && editProductDetailsApiResModel.success == true) {
                debugPrint('My variant body is: ${getSaveVariantApiResModel.toJson()}');
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${getSaveVariantApiResModel.message}")));
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
      body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (isApiDataAvailable) {
              return Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),

                      /// Manage Variants
                      Text(
                        'Manage Inventory, Price and SKU ID',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// Unlimited Inventory
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Unlimited Inventory',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 24,
                            width: 45,
                            child: AnimatedToggleSwitch<bool>.dual(
                              current: isUnlimitedInventory,
                              first: false,
                              second: true,
                              innerColor: isUnlimitedInventory
                                  ? AppCol.primary
                                  : Color(0xFFD0D5DD),
                              dif: 1.0,
                              borderColor: Colors.transparent,
                              // borderWidth: 2.0,
                              // height: 20,
                              indicatorSize: Size(17, 18),
                              indicatorColor: Colors.white,
                              onChanged: (b) {
                                isUnlimitedInventory = b;
                                SharedPreferenceService.setString("productUnlimitedStockbyId${widget.productId}", isUnlimitedInventory == true ? "true" : "false");
                                addProductDataBody.variantDataArray?.forEach((element) {
                                  element.isDefault = isUnlimitedInventory;
                                });
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      /// Stock name
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 50,
                                child: Text(
                                    '${manageInventorySkuidPriceApiResModel.combinations?[0][0].variantType}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.visible))),
                            Visibility(
                              visible: (manageInventorySkuidPriceApiResModel
                                          .combinations?.first.length ??
                                      0) >
                                  1,
                              child: SizedBox(
                                  width: 50,
                                  child: Text(
                                      '${(manageInventorySkuidPriceApiResModel.combinations?.first.last.variantType)}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.visible))),
                            ),
                            // SizedBox(width: 20),
                            // customVariantValue.isNotEmpty
                            //     ?
                            // Text('Colour',
                            //     style: TextStyle(fontWeight: FontWeight.bold)),
                            // : SizedBox(),
                            // manageInventorySkuidPriceApiResModel.combinations?[0][1] != null ? Text('${manageInventorySkuidPriceApiResModel.combinations?[0][1].variantType}', style: TextStyle(fontWeight: FontWeight.bold)) : SizedBox(),
                            SizedBox(width: 80),
                            isUnlimitedInventory ? SizedBox() : Text('Stock',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      for (int i = 0; i < _stockData.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: InkWell(
                            onTap: () async {
                              debugPrint('My stock length is: ${_stockData.length}');

                              debugPrint('My variant id is: ${manageInventorySkuidPriceApiResModel.combinations}');

                              debugPrint('---- My setttt discount mrp price is: ${addProductDataBody
                                  .variantDataArray?[i].price}');

                              final res = await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ManageInventoryPriceAndSKUIdDialog(
                                      productId: widget.productId,
                                      firstVariantName: _stockData[i]
                                          ['varient1_type'],
                                      secondVariantName: _stockData[i]
                                          ['varient2_type'],
                                      color: _stockData[i]['varient2'],
                                      size: _stockData[i]['varient1'],
                                      skuid: widget.skuId,
                                      stock: "${ _stockData[i]['stock_quantity']}",
                                      mrp:
                                      // "${_stockData[i]['mrp']}",
                                      "${addProductDataBody
                                          .variantDataArray?[i].mrp}",
                                      discountPrice:
                                      // "${_stockData[i]['price']}",
                                      "${addProductDataBody.variantDataArray?[i].price}",
                                      body: (value) {
                                        debugPrint('---- Body: $value');
                                        debugPrint('---- My sidefisf mrp price is: ${value['price']}');
                                        debugPrint('---- My sidefisf discount mrp price is: ${value['discount']}');
                                        // final index = addProductDataBody.variantDataArray?.where((element) => false);
                                        addProductDataBody
                                                .variantDataArray?[i].price =
                                            int.tryParse(value['discount']) ?? 0;
                                        addProductDataBody
                                                .variantDataArray?[i].stock =
                                            int.tryParse(value['stock']) ?? 0;
                                        addProductDataBody
                                                .variantDataArray?[i].mrp =
                                            int.tryParse(value['price']) ??
                                                0;
                                        addProductDataBody.variantDataArray?[i]
                                            .skuId = value['sku_id'].toString();
                                        addProductDataBody.variantDataArray?[i].isDefault = isUnlimitedInventory;
                                        _stockData[i]['stock_quantity'] =
                                            addProductDataBody
                                                .variantDataArray?[i].stock;
                                        setState(() {});

                                        debugPrint('---- My setttt discount mrp price is: ${addProductDataBody.variantDataArray?[i].price}');
                                        debugPrint('---- My setttt discount mrp price is: ${addProductDataBody.variantDataArray?[i].mrp}');
                                      },
                                    );
                                  });
                            },
                            child: Column(
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  '${_stockData[i]['varient1']}'),
                                              SizedBox(width: 40),
                                              Visibility(
                                                visible: _stockData[i]
                                                            ['varient2'] !=
                                                        null &&
                                                    _stockData[i]['varient2']
                                                        .isNotEmpty,
                                                child: SizedBox(
                                                    width: 50,
                                                    child: Text(
                                                        _stockData[i]
                                                                ['varient2'] ??
                                                            '',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            overflow:
                                                                TextOverflow
                                                                    .visible))),
                                              ),
                                            ],
                                          ),
                                          Visibility(
                                            visible: _stockData[i]['isDefault'],
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            DefaultVariantScreen(
                                                          variantList:
                                                              _stockData,
                                                        ),
                                                      ));
                                                },
                                                child: Text(
                                                  'Default',
                                                  style: TextStyle(
                                                    color: AppCol.primary,
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 80),
                                    Visibility(
                                      visible: !isUnlimitedInventory,
                                      child: Container(
                                      padding: EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(_stockData[i]
                                      ['stock_quantity']
                                          .toString()),
                                    ),),
                                    Spacer(),
                                    Icon(Icons.cancel, color: Colors.grey),
                                    Spacer(),
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                                Divider(
                                  color: Colors.grey,
                                  thickness: 1.2,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  /// Get all combination
  Future<bool> getAllCombination() async {
    debugPrint('This is my product id: ${widget.productId}');
    isUnlimitedInventory = SharedPreferenceService.getString("productUnlimitedStockbyId${widget.productId}") == "true" ? true : false;
    manageInventorySkuidPriceApiResModel = await _manageVariantController
        .getAllCombinationValues(widget.productId);
    log('My response is first: ${manageInventorySkuidPriceApiResModel.combinations?.first[0].variantType}');
    log('My response is json: ${manageInventorySkuidPriceApiResModel.toJson()}');
    if ((manageInventorySkuidPriceApiResModel.combinations ?? []).isNotEmpty) {
      isApiDataAvailable = true;
      log('My response is: ${manageInventorySkuidPriceApiResModel.combinations?.first}');
      getAllCombinationList();
    } else {
      debugPrint('Api error');
      log('My get all combination value error');
    }
    return isApiDataAvailable;
  }

  /*/// Get save variant
  void getSaveVariant() async {
    getSaveVariantApiResModel = _manageVariantController.getSaveVariant(body);
  }*/

  /// Store all combination
  void getAllCombinationList() async {
    debugPrint('My mrp price is: ${widget.mrp}');
    debugPrint('My discount price is: ${widget.price}');
    _stockData.clear();
    int i = 0;
    addProductDataBody.productId = '${widget.productId}';
    manageInventorySkuidPriceApiResModel.combinations?.forEach((element) {
      debugPrint('My mrp price is: ${element.first}');
      debugPrint('My mrp price is: ${element.first.price}');
      debugPrint('My mrp price is: ${element.last.price}');
      _stockData.add({
        "stock_quantity": isUnlimitedInventory ? 100000 : element.first.stock != null ? element.first.stock : widget.stock,
        "varient1": element.first.variantValue,
        "varient1_type": element.first.variantType,
        "isDefault": element.length == 0 ? true : false,
        "varient2": element.length > 1 ? element.last.variantValue : "",
        "varient2_type": element.length > 1 ? element.last.variantType : "",
        "mrp": element.last.mrp != null ? element.last.mrp : widget.mrp,
        "price": element.last.price != null ? element.last.price : widget.price
      });
      addProductDataBody.variantDataArray?.add(VariantDataArray(
          isDefault: manageInventorySkuidPriceApiResModel
                      .combinations?.first.first.variantValue ==
                  element.first.variantValue
              ? true
              : false,
          mrp: int.parse('${element.last.mrp != null ? element.last.mrp : widget.mrp}'),
          price: int.parse('${element.last.price != null ? element.last.price : widget.price}'),
          skuId: '${widget.skuId}',
          stock: isUnlimitedInventory ? int.parse('100000') : int.parse('${element.last.stock != null ? element.last.stock : widget.stock}'),
          variants: [
            Variants(
                valueId: element.first.variantValueId,
                variantId: element.first.variantTypeId),
            Variants(
                valueId: element.last.variantValueId,
                variantId: element.last.variantTypeId)
          ]));
    });
    debugPrint(
        '---- Length of body: ${addProductDataBody.variantDataArray?.length}');
    setState(() {});
    log('My stock list is: $_stockData');
  }
}
