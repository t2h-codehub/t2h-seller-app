import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/app_export.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/deleteProductApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/deleteVariantApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/getTempSellerVariantsApiResModel.dart'
    as GetUserVariants;
import 'package:swapnil_s_application4/data/productCategoryModel/manageVariantsApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/manageVariantsCollectionApiResModel.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageVariants/ManageVariantController.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageVariants/editVariantsPopUpDialog.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageVariants/manageInvertoryAndPriceSKUID.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageVariants/manageVariantsPopUpDialog.dart';

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
  ManageVariantController _manageVariantController = ManageVariantController();
  TextEditingController _customVariantController = TextEditingController();
  GetUserVariants.GetTempSellerVariantsApiResModel
      getTempSellerVariantsApiResModel =
      GetUserVariants.GetTempSellerVariantsApiResModel();

  DeleteVariantApiResModel deleteVariantApiResModel = DeleteVariantApiResModel();
  DeleteProductApiResModel deleteProductApiResModel = DeleteProductApiResModel();
  AddProductController _addProductController = AddProductController();

  List adminVariantType = [];
  List customVariantValue = [];
  List<Map<String, dynamic>> adminVariantValue = [];

  /// Variant List
  List<GetUserVariants.Datum> _categories = [];

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
                                 // deleteProductApiResModel = await _addProductController.deleteProduct(widget.productId);
                                 if(deleteVariantApiResModel.success == true) {
                                   Navigator.pop(context,true);
                                   Navigator.pop(context,true);
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
            'Manage Variants',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          /*actions: [
            /// View Hello Store Button
            *//*InkWell(
              onTap: saveVariants,
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
            ),*//*
          ],*/
        ),
        body: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (isApiDataAvailable) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_categories.length == 0) ...[
                          variantButtons(variantType: 1),
                          variantButtons(variantType: 2),
                        ],
                        if (_categories.length == 1) ...[
                          /// Variant One Text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Variant Type 1',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  final res = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return EditVariantsPopDialog(productID: widget.productId,selectedVariantType: "${_categories[0].variantType?.title}", selectedVariantValue: _categories[0].values!, objectId: "${_categories[0].id}",);
                                    },
                                  );

                                  if(res) {
                                    _future = loadVariantData();
                                  }
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: AppCol.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          /// Variant One Variant Type Value
                          Container(
                            padding: EdgeInsets.all(10),
                            margin:
                                EdgeInsets.only(top: 10, bottom: 12, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: Colors.grey,
                                strokeAlign: 0.8,
                              ),
                            ),
                            child: Text('${_categories[0].variantType?.title}'),
                          ),

                          /// Variant One Variant Type Values
                          Container(
                            height: 60,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  _categories[0].values!.length,
                                  (index) => Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(bottom: 16, right: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.1),
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: Colors.grey,
                                        strokeAlign: 0.8,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                            '${_categories[0].values![index].title}'),
                                        /*SizedBox(width:4),
                                        InkWell(
                                          onTap: () {
                                            _categories[0].values?.removeAt(index);
                                            setState(() {});
                                          },
                                          child: Icon(Icons.close_rounded),
                                        ),*/
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          variantButtons(variantType: 2, vaariantType: "${_categories[0].variantType?.title}"),
                        ],
                        if (_categories.length == 2) ...[
                          /// Variant One Text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Variant Type 1',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  final res = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return EditVariantsPopDialog(productID: widget.productId,selectedVariantType: "${_categories[0].variantType?.title}", selectedVariantValue: _categories[0].values!, objectId: "${_categories[0].id}",);
                                    },
                                  );

                                  if(res) {
                                    _future = loadVariantData();
                                  }
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: AppCol.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          /// Variant One Variant Type Value
                          Container(
                            padding: EdgeInsets.all(10),
                            margin:
                                EdgeInsets.only(top: 10, bottom: 12, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: Colors.grey,
                                strokeAlign: 0.8,
                              ),
                            ),
                            child: Text('${_categories[0].variantType?.title}'),
                          ),

                          /// Variant One Variant Type Values
                          Row(
                            children: List.generate(
                              _categories[0].values!.length,
                              (index) => Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(bottom: 16, right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: Colors.grey,
                                    strokeAlign: 0.8,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                        '${_categories[0].values![index].title}'),
                                    /*SizedBox(width:4),
                                    InkWell(
                                      onTap: () {
                                        _categories[0].values?.removeAt(index);
                                        setState(() {});
                                      },
                                      child: Icon(Icons.close_rounded),
                                    ),*/
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Divider(color: Colors.grey),
                          ),

                          /// Variant Two Text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Variant Type 2',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  final res = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return EditVariantsPopDialog(productID: widget.productId,selectedVariantType: "${_categories[1].variantType?.title}", selectedVariantValue: _categories[1].values!, objectId: "${_categories[1].id}");
                                    },
                                  );

                                  if(res) {
                                    _future = loadVariantData();
                                  }
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: AppCol.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          /// Variant Two Variant Type Value
                          Container(
                            padding: EdgeInsets.all(10),
                            margin:
                                EdgeInsets.only(top: 10, bottom: 12, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: Colors.grey,
                                strokeAlign: 0.8,
                              ),
                            ),
                            child: Text('${_categories[1].variantType?.title}'),
                          ),

                          /// Variant Two Variant Type Values
                          Row(
                            children: List.generate(
                              _categories[1].values!.length,
                              (index) => Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(bottom: 16, right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: Colors.grey,
                                    strokeAlign: 0.8,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                        '${_categories[1].values![index].title}'),
                                    /*SizedBox(width:4),
                                    InkWell(
                                      onTap: () {
                                        _categories[1].values?.removeAt(index);
                                        setState(() {});
                                      },
                                      child: Icon(Icons.close_rounded),
                                    ),*/
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                        Divider(color: Colors.grey),

                        /// Update price, Inventory and SKU ID for variants button
                        Container(
                          margin: EdgeInsets.only(bottom: 16, top: 16),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ManageInventoryAndPriceSKUIDScreen(
                                            productId: widget.productId, skuId: widget.skuid, mrp: widget.mrp, price: widget.discountPrice, stock: widget.stock, isFromInstagram: widget.isFromInstagram),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              backgroundColor: Colors.grey.withOpacity(.1),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle,
                                  color: AppCol.primary,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Review and Save Variants',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
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
      ),
    );
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
      "productId": "${widget.productId}",
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
