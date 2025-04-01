import 'dart:async';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/data/productCategoryModel/addSellerCategoriesApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/productCategoryApiResModel.dart'
    as productCategoryModel;
import 'package:taptohello/data/productCategoryModel/saveSellerCategoriesApiResModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ProductCategory/ProductCategoryController/productcategoryController.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key});

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  final TextEditingController _subCategoryValueController = TextEditingController();
  final TextEditingController _customSubCategoryValueController =
      TextEditingController();

  productCategoryModel.ProductCategoryApiResModel productCategoryApiResModel =
      productCategoryModel.ProductCategoryApiResModel();
  SaveSellerCategoriesApiResModel saveSellerCategoriesApiResModel =
      SaveSellerCategoriesApiResModel();
  final ProductCategoryController _productCategoryController =
      ProductCategoryController();
  AddSellerCategoriesApiResModel addSellerCategoriesApiResModel =
      AddSellerCategoriesApiResModel();

  bool isCustomCategory = false;

  bool isApiDataAvailable = false;
  late Future _future;

  int selectedCategoryIndex = 0;

  String customSelectedSubCategory = '';

  bool allCategoriesNotEmpty = true;

  List<String> adminCategories = [];
  List adminSubCategories = [];
  List selectAdminSubCategories = [];

  /// Another sub category List
  final List<Map<String, dynamic>> _categories = [
    {
      'selectedCategoryIndex': 0, // Index for managing the category
      'categoryId': TextEditingController(), // Stores the category title
      'subcategoryIds': <String>[], // Holds subcategories
      'custom': false, // Flag for custom category
      'title': TextEditingController(), // Controller for the custom category
      'subcategories': <String>[], // List of custom subcategories
    },
  ];

  void _addAnotherCategory() {
    setState(() {
      _categories.add({
        'selectedCategoryIndex': int,
        'categoryId': TextEditingController(),
        'subcategoryIds': <String>[],
        'custom': false,
        'title': TextEditingController(),
        'subcategories': <String>[],
      });
    });
  }

  bool isShowProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = loadData();
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
            Navigator.of(context).pop(true);
          },
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Image.asset(
                "assets/images/back.png",
                height: 24,
              )),
        ),
        title: Text(
          'Product Category Images',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          /// View Hello Store Button
          InkWell(
            onTap: () {
              bool isValid = true;
              for (var element in _categories) {
                if (element['custom'] == true && element['title'].text.isEmpty) {
                  isValid = false;
                }
              }

              if(isValid) {
                /// for storing the ids with replacement of title
                for (var category in _categories) {
                  productCategoryApiResModel.categories?.forEach((element) {
                    if (category['categoryId'].text == element.title) {
                      category['categoryId'].text = element.sId ?? '';
                    }
                    category['subcategoryIds'].clear();
                    for (var subCategory in adminSubCategories) {
                      debugPrint('My list is: ${subCategory['_id']}');
                      if (selectAdminSubCategories
                          .contains(subCategory['title'])) {
                        category['subcategoryIds'].add("${subCategory['_id']}");
                        setState(() {});
                      }
                    }
                  });
                }
                debugPrint('My Category list is: $_categories');
                isShowProgress = true;
                addCategoryList();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please fill all custom category titles')),
                );
              }
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
      body: isShowProgress
          ? Center(
              child: CircularProgressIndicator(),
            )
          : FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                if (isApiDataAvailable) {
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ListView.builder(
                            itemCount: _categories.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              debugPrint('My index is: ${_categories.length}');
                              return Padding(
                                padding: const EdgeInsets.only(left: 24, right: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (index == 0) ...[
                                      SizedBox(height: 20),

                                      /// First Text
                                      Center(
                                        child: Text(
                                          'Add the product categories you offer!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 28),
                                    ],

                                    if(!_categories[index]['custom'])...[
                                      /// Add category list
                                      TextFormField(
                                        controller: _categories[index]['categoryId'],
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          labelText: 'Category *',
                                          labelStyle: TextStyle(
                                            color: _categories[index]['custom'] ? Colors.grey : AppCol.primary,
                                          ),
                                          hintText: 'Select Category',
                                          floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: _categories[index]['custom'] ? Colors.grey : AppCol.primary, width: 2.0),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          suffixIcon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                          ),
                                        ),
                                        onTap: _categories[index]['custom'] ? () {} : () async {
                                          final res = await showCategoryModalSheet(
                                              context, index);
                                          debugPrint('res $res');
                                          if (res.isNotEmpty) {
                                            if(_categories[index]['categoryId'].text != res) {
                                              _categories[index]['subcategoryIds'].clear();
                                              _categories[index]['categoryId'].text =
                                              res;
                                              loadSubCategories(
                                                  _categories[index]['categoryId'].text);
                                              setState(() {});
                                            } else {
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                  content: Text("Category already selected")));
                                            }
                                          }
                                          // _categories[index]['categoryId'].text = '';
                                        },
                                      ),
                                      SizedBox(height: 16),

                                      /// sub category field
                                      TextFormField(
                                        controller: _subCategoryValueController,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          labelText: 'Sub Category',
                                          labelStyle: TextStyle(
                                            color: _categories[index]['custom'] ? Colors.grey : AppCol.primary,
                                          ),
                                          hintText: 'Select Sub Category',
                                          floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: _categories[index]['custom'] ? Colors.grey : AppCol.primary, width: 2.0),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          suffixIcon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                          ),
                                        ),
                                        onTap:  _categories[index]['custom'] ? () {} : () async {
                                          if(_categories[index]['categoryId'].text != "") {
                                            final res =
                                            await showAdminSubCategoryModalSheet(
                                                context, index);
                                            if (res.isNotEmpty) {
                                              if (_categories[index]['subcategoryIds'].contains(res)) {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(content: Text('Subcategory already selected')),
                                                );
                                              } else {
                                                _categories[index]['subcategoryIds']
                                                    .add(res);
                                                debugPrint(
                                                    'My subcategpry list is: ${_categories[index]['subcategoryIds']}');
                                                selectAdminSubCategories.add(res);
                                              }
                                              /*
                                      debugPrint(
                                          'My selected sub categpries is: $selectAdminSubCategories');*/
                                              // loadAdminSubCategoryId(index);
                                              /*debugPrint(
                                          'My index wise subcategpry list is: ${_categories[index]['subcategoryIds']}');*/
                                              setState(() {});
                                            }
                                          }
                                        },
                                      ),
                                      SizedBox(height: 16),
                                      SingleChildScrollView(
                                        child: Row(
                                          children: List.generate(
                                              _categories[index]['subcategoryIds'].length,
                                                  (subIndex) {
                                                return Container(
                                                  padding: EdgeInsets.all(10),
                                                  margin:
                                                  EdgeInsets.only(bottom: 16, right: 10),
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
                                                          '${_categories[index]['subcategoryIds'][subIndex]}'),
                                                      SizedBox(width: 6),
                                                      InkWell(
                                                        onTap: () {
                                                          _categories[index]['subcategoryIds']
                                                              .removeAt(subIndex);
                                                          setState(() {});
                                                          debugPrint(
                                                              'My updated list is: ${_categories[index]['subcategoryIds']}');
                                                        },
                                                        child: Icon(
                                                          Icons.close_rounded,
                                                          size: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),

                                      /// Divider
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 16),
                                    ],

                                    /// Add relevant category text
                                    Text(
                                      'Didn\'t find any relevant category?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(height: 16),

                                    /// Add custom category text and button
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Add Category Images',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AppCol.primary,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 24,
                                          width: 45,
                                          child: AnimatedToggleSwitch<bool>.dual(
                                            current: _categories[index]['custom'],
                                            first: false,
                                            second: true,
                                            innerColor: _categories[index]['custom']
                                                ? AppCol.primary
                                                : Color(0xFFD0D5DD),
                                            dif: 1.0,
                                            borderColor: Colors.transparent,
                                            // borderWidth: 2.0,
                                            // height: 20,
                                            indicatorSize: Size(17, 18),
                                            indicatorColor: Colors.white,
                                            onChanged: (b) {
                                              _categories[index]['custom'] = b;
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),

                                    if (_categories[index]['custom']) ...[
                                      /// Add sub category list
                                      TextFormField(
                                        controller: _categories[index]['title'],
                                        decoration: InputDecoration(
                                          labelText: 'Custom Category *',
                                          border: OutlineInputBorder(),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                        ),
                                        onTap: () async {},
                                      ),
                                      SizedBox(height: 16),

                                      /// sub category field
                                      TextFormField(
                                        controller: _customSubCategoryValueController,
                                        decoration: InputDecoration(
                                          hintText: customSelectedSubCategory,
                                          labelText: 'Sub Category',
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
                                                if(_customSubCategoryValueController.text == "") {

                                                } else {
                                                  _categories[index]['subcategories'].add(
                                                      _customSubCategoryValueController.text.trim());
                                                  setState(() {});
                                                  debugPrint(
                                                      'My sub categories list is: ${_categories[index]['subcategories']}');
                                                  _customSubCategoryValueController
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
                                        onChanged: (value) {
                                          _customSubCategoryValueController.text =
                                              value;
                                        },
                                        onTap: () {},
                                      ),
                                      SizedBox(height: 16),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        physics: BouncingScrollPhysics(),
                                        child: Row(
                                          children: List.generate(
                                              _categories[index]['subcategories']
                                                  .length, (subIndex) {
                                            return Container(
                                              padding: EdgeInsets.all(10),
                                              margin: EdgeInsets.only(
                                                  bottom: 16, right: 10,top: 10, left: 4),
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
                                                      '${_categories[index]['subcategories'][subIndex]}'),
                                                  SizedBox(width: 6),
                                                  InkWell(
                                                    onTap: () {
                                                      _categories[index]
                                                      ['subcategories']
                                                          .removeAt(subIndex);
                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.close_rounded,
                                                      size: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                    ],

                                    /// Divider
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 16),

                                  ],
                                ),
                              );
                            }),

                        /// Add category text
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: InkWell(
                            onTap: _addAnotherCategory,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset('assets/newIcons/add_out.png',
                                    height: 20, width: 20),
                                SizedBox(width: 10),
                                Text(
                                  'Add another category',
                                  style: TextStyle(
                                    color: AppCol.primary,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                      ],
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
  Future<bool> loadData() async {
    debugPrint('Step 1');
    productCategoryApiResModel =
        await _productCategoryController.getCategoryList();
    if (productCategoryApiResModel.success == true) {
      debugPrint('Step 2');
      loadAdminCategoriesData();
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
    productCategoryApiResModel.categories?.forEach((element) {
      adminCategories.add(element.title ?? '');
      /*element.subcategories?.forEach((element) {
        adminSubCategories
            .add({"_id": "${element.sId}", "title": "${element.title}"});
      });*/
    });
    isApiDataAvailable = true;
    setState(() {});
  }

  /// show category section modal
  Future<String> showCategoryModalSheet(BuildContext context, index) async {
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

  /// add sub categories according to categories
  loadSubCategories(selectedCategories) {
    adminSubCategories.clear();
    productCategoryApiResModel.categories?.forEach((element) {
      if (element.title == selectedCategories) {
        element.subcategories?.forEach((subcategory) {
          adminSubCategories.add(
              {"_id": "${subcategory.sId}", "title": "${subcategory.title}"});
        });
      }
    });
  }

  /// show admin sub category section modal
  Future<String> showAdminSubCategoryModalSheet(BuildContext context, index) async {
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
                'Select Sub Category',
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
                  itemCount: adminSubCategories.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // selectedString = adminCategories[index];
                          selectedString
                              .complete(adminSubCategories[index]['title']);
                          debugPrint(
                              'My selected string: ${selectedString.future}');
                          setState(() {});
                          Navigator.pop(context, selectedString);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10, top: 10),
                          child: Center(
                              child: Text(
                                  '${adminSubCategories[index]['title']}')),
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

  /// Category List
  void addCategoryList() async {
    List<Map<String, dynamic>> finaList = [];
    for (var element in _categories) {
      if (element['custom'] == true) {
        finaList.add({
          "title": "${element['title'].text}",
          "subcategories": element['subcategories'],
          "custom": true
        });
      } else {
        finaList.add({
          "categoryId": "${element['categoryId'].text}",
          "subcategoryIds": element['subcategoryIds'],
          "custom": false
        });
      }
    }
    debugPrint('My final list is: $finaList');
    Map<String, dynamic> body = {"categories": finaList};
    addSellerCategoriesApiResModel =
        await _productCategoryController.addSellerCategory(body);
    if (addSellerCategoriesApiResModel.success == true) {
      Navigator.pop(context, true);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${addSellerCategoriesApiResModel.message}')));
    } else if (addSellerCategoriesApiResModel.message == null) {
      Navigator.pop(context, true);
    }
    else {
      Navigator.pop(context, true);
    }
  }
}
