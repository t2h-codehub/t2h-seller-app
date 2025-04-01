import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/productCategoryModel/editSellerCategoriesApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/productCategoryApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/saveSellerCategoriesApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/viewCategoryApiResModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ProductCategory/ProductCategoryController/productcategoryController.dart';

class EditCategoryScreen extends StatefulWidget {
  const EditCategoryScreen({super.key, required this.categoryTitleId, required this.subCategoryId, required this.isCustom});

  final String categoryTitleId;
  final List subCategoryId;
  final bool isCustom;

  @override
  State<EditCategoryScreen> createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  final ProductCategoryController _productCategoryController =
      ProductCategoryController();
  ViewCategoriesApiResModel viewCategoriesApiResModel =
      ViewCategoriesApiResModel();

  ProductCategoryApiResModel productCategoryApiResModel =
  ProductCategoryApiResModel();

  SaveSellerCategoriesApiResModel saveSellerCategoriesApiResModel =
      SaveSellerCategoriesApiResModel();

  EditSellerCategoriesApiResModel editSellerCategoriesApiResModel = EditSellerCategoriesApiResModel();

  bool isApiDataAvailable = false;
  late Future _future;

  final TextEditingController _categoryValueController = TextEditingController();
  final TextEditingController _subCategoryValueController = TextEditingController();
  final TextEditingController _adminCategoryValueController = TextEditingController();

  String getCategoryMatchName = '';
  List selectedSubCategoryList = [];
  List<Map<String, dynamic>> getMatchedSubcategory = [];
  List<Map<String, dynamic>> selectedSubcategories  = [];

  List<String> adminCategories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = loadApiData();
    debugPrint('My selected category is: ${widget.categoryTitleId}');
    debugPrint('My selected subcategory is: ${widget.subCategoryId}');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.subCategoryId.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context,true);
          },
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Image.asset(
                "assets/images/back.png",
                height: 24,
              )),
        ),
        title: Text(
          'Edit Category',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          /// View Hello Store Button
          InkWell(
            onTap: () {
              /// store all my category title
              for (var element in selectedSubcategories) {
                selectedSubCategoryList.add('${element['title']}');
              }
              debugPrint('My category is: ${_categoryValueController.text}');
              debugPrint('My sub category list: $selectedSubCategoryList');

              sendEditCategory();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 14, top: 20),
              child: Text(
                'Submit',
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
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),

                      /// First Text
                      Text(
                        'Edit Categories/Sub Categories',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 28),
                      if(!widget.isCustom)...[
                        /// View category section
                        Text(
                          'Category',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16),

                        /// category section
                        TextFormField(
                          controller: _adminCategoryValueController,
                          // initialValue: '$getCategoryMatchName',
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Category *',
                            border: OutlineInputBorder(),
                            floatingLabelBehavior:
                            FloatingLabelBehavior.always,
                          ),
                          onTap: () async {
                            final res = await showCategoryModalSheet(
                                context);
                            debugPrint('res $res');
                            debugPrint('My selected name is: ${_adminCategoryValueController.text}');
                            if (res.isNotEmpty) {
                              _adminCategoryValueController.text = res;
                              setState(() {});
                              debugPrint('My selected name is: ${_adminCategoryValueController.text}');
                            }
                          },
                        ),
                        SizedBox(height: 16),

                        /// Sub-Category Heading
                        Text(
                          'Sub-category',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16),

                        /// Sub category section
                        TextFormField(
                          controller: _subCategoryValueController,
                          // initialValue: '',
                          // readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Sub-category',
                            border: OutlineInputBorder(),
                            floatingLabelBehavior:
                            FloatingLabelBehavior.always,
                         
                         
                          ),
                          onTap: () async {
                            // final res = await showSubCategoryModal();
                            // debugPrint('My category is: $res');
                          },
                        ),
                        SizedBox(height: 10),
                        ListView.builder(
                          itemCount: selectedSubcategories.length,
                          padding: EdgeInsets.only(top: 2, left: 4),
                          shrinkWrap: true,
                          // scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(
                                  right: 10, bottom: 16),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.1),
                                borderRadius:
                                BorderRadius.circular(6),
                                border: Border.all(
                                  color: Colors.grey,
                                  strokeAlign: 0.8,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${selectedSubcategories[index]['title']}',
                                  ),
                                  SizedBox(width: 6),
                                  InkWell(
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
                                                'Are you sure that you want to remove this category?',
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
                                                                AppCol.primary),
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
                                                                AppCol.primary,
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
                                                        onTap: () {
                                                          //       categoryListOne
                                                          // .removeAt(index);
                                                          selectedSubcategories.removeAt(index);
                                                          Navigator.pop(
                                                              context);
                                                          setState(() {

                                                          });
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
                                                              AppCol.primary,
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                side: BorderSide(width: 0.50, color: AppCol.primary),
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
                                    child: Icon(
                                      Icons.close_rounded,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],

                      if(widget.isCustom) ...[
                        /// View category section
                        Text(
                          'Category',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16),

                        /// category section
                        TextFormField(
                          controller: _categoryValueController,
                          // initialValue: '$getCategoryMatchName',
                          readOnly: false,
                          decoration: InputDecoration(
                            labelText: 'Category *',
                            border: OutlineInputBorder(),
                            floatingLabelBehavior:
                            FloatingLabelBehavior.always,
                          ),
                          onTap: () async {
                          },
                        ),
                        SizedBox(height: 16),

                        /// Sub-Category Heading
                        Text(
                          'Sub-category',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16),

                        /// Sub category section
                        SizedBox(
                          height: 125,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: _subCategoryValueController,
                                // initialValue: '',
                                // readOnly: true,
                                decoration: InputDecoration(
                                  labelText: 'Sub-category',
                                  border: OutlineInputBorder(),
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      /*_categories[index]['subcategories'].add(
                                              '${_customSubCategoryValueController.text}');
                                          _customSubCategoryValueController.clear();
                                          setState(() {});*/
                                    },
                                    child:  InkWell(
                                      onTap: () {
                                        if(_subCategoryValueController.text == "") {

                                        } else {
                                          // selectedSubCategoryList.add(_subCategoryValueController.text);
                                          selectedSubcategories.add({
                                            'id': '',
                                            'title': _subCategoryValueController.text
                                          });
                                          
                                          
                                          setState(() {});
                                          _subCategoryValueController
                                              .clear();
                                        }
                                      },
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(top: 16),
                                        child: Text(
                                          'Add',
                                          style: TextStyle(
                                              color: AppCol.primary),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () async {
                                  // final res = await showSubCategoryModal();
                                  // debugPrint('My category is: $res');
                                },
                              ),
                              SizedBox(height: 10),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: selectedSubcategories.length,
                                  padding: EdgeInsets.only(top: 2, left: 4),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(
                                          right: 10, bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(.1),
                                        borderRadius:
                                        BorderRadius.circular(6),
                                        border: Border.all(
                                          color: Colors.grey,
                                          strokeAlign: 0.8,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '${selectedSubcategories[index]['title']}',
                                          ),
                                          SizedBox(width: 6),
                                          InkWell(
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
                                                        'Are you sure that you want to remove this category?',
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
                                                                        AppCol.primary),
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
                                                                        AppCol.primary,
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
                                                                onTap: () {
                                                                  //       categoryListOne
                                                                  // .removeAt(index);
                                                                  selectedSubcategories.removeAt(index);
                                                                  Navigator.pop(
                                                                      context);
                                                                  setState(() {

                                                                  });
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
                                                                      AppCol.primary,
                                                                      shape:
                                                                      RoundedRectangleBorder(
                                                                        side: BorderSide(width: 0.50, color: AppCol.primary),
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
                                            child: Icon(
                                              Icons.close_rounded,
                                              size: 15,
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
                      ],
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

  /// Load Api data
  Future<bool> loadApiData() async {
    viewCategoriesApiResModel = await _productCategoryController.viewCategory();
    if (viewCategoriesApiResModel.success == true) {
      isApiDataAvailable = true;

      debugPrint('My View Category Section Is: ${viewCategoriesApiResModel.categories}');
      loadMatchCategoryIdDataNameAndSubCategory();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${viewCategoriesApiResModel.message}')));
    }
    setState(() {});
    return isApiDataAvailable;
  }

  /// Load particular data match with selected category id
  loadMatchCategoryIdDataNameAndSubCategory () {
    viewCategoriesApiResModel.categories?.forEach((element) {
      debugPrint('My category id : ${widget.categoryTitleId}');
      debugPrint('My element category id : ${element.sId}');
      adminCategories.add(element.title ?? '');
      if(widget.categoryTitleId == element.sId) {
        debugPrint('Id is matched');
        debugPrint('The Title is: ${element.title}');
        _adminCategoryValueController.text = element.title ?? '';
        getCategoryMatchName = element.title ?? '';
        _categoryValueController.text = getCategoryMatchName;
        getMatchedSubcategory = element.subcategories
            ?.map((sub) => {"title": sub.title ?? '', "_id": sub.sId ?? ''})
            .toList() ??
            [];
      }
    });
    loadSubCategory();
  }

  /// Load Sub Category
  loadSubCategory() {
    debugPrint('My sub category list: ${getMatchedSubcategory.length}');
    for(var i =0; i< getMatchedSubcategory.length; i++) {
      debugPrint('My subcategory id: ${widget.subCategoryId[i]}');
      if(widget.subCategoryId[i] == getMatchedSubcategory[i]['_id']) {
        selectedSubcategories.add({
          'id': '${getMatchedSubcategory[i]['_id']}',
          'title': '${getMatchedSubcategory[i]['title']}'
        });

      }
    }
    debugPrint('My selected subcategory id: $selectedSubcategories');
  }

  /// select category modal
  Future<String> showSubCategoryModal() async {
    String? selectedString;

    List<Map<String, dynamic>> availableSubcategories = getMatchedSubcategory
        .where((sub) => !selectedSubcategories.contains(sub))
        .toList();

    if (availableSubcategories.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('All subcategories are selected.')));
    }
    await showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
        ),
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 18),

                  /// Sub Category Heading
                  Text(
                    'Select Sub Category',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 28),

                  /// List Of sub Category
                  ListView.builder(
                    itemCount: getMatchedSubcategory.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index2) {
                      return InkWell(
                        onTap: () {
                          if (selectedSubcategories.any((element) => element['title'] == getMatchedSubcategory[index2]['title'])) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This subcategory already exists')));
                          } else {
                            selectedSubcategories.add({
                              'id': '${getMatchedSubcategory[index2]['_id']}',
                              'title': '${getMatchedSubcategory[index2]['title']}'
                            });
                            Navigator.pop(context);
                            setState(() {});
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: Text(
                            '${getMatchedSubcategory[index2]['title']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        });
    debugPrint('My selected string is: $selectedString');
    return selectedString ?? '';
  }

  /// Submit edit seller categories
  sendEditCategory() async {
    Map<String, dynamic> body = {
        "categories": [
          {
            "categoryId": widget.categoryTitleId,
            "title": _categoryValueController.text,
            "subcategories": selectedSubCategoryList,
            "custom": true,
            "active": true
          }
        ]
      };
    editSellerCategoriesApiResModel = await _productCategoryController.editSellerCategory(body);
    if(editSellerCategoriesApiResModel.success == true) {
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${editSellerCategoriesApiResModel.message}')));
    }
  }

  /// show category section modal
  Future<String> showCategoryModalSheet(BuildContext context) async {
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
                'Select Category',
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
                  itemCount: adminCategories.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // selectedString = adminCategories[index];
                          selectedString.complete(adminCategories[index]);
                          debugPrint(
                              'My selected string: ${selectedString.future}');
                          setState(() {});
                          Navigator.pop(context, selectedString);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10, top: 10),
                          child:
                          Center(child: Text(adminCategories[index])),
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
}
