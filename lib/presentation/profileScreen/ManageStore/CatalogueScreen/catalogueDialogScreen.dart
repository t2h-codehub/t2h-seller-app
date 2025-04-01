import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/productCategoryModel/catalogueCategoryFilterApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/filterCatalogueApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/filterDataModel.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/CatalogueScreen/CatalogueController/catalogueController.dart';

class CatalogueDialogScreen extends StatefulWidget {
  const CatalogueDialogScreen({super.key, this.filteredData,});
  final FilteredData? filteredData;

  @override
  State<CatalogueDialogScreen> createState() => _CatalogueDialogScreenState();
}

class _CatalogueDialogScreenState extends State<CatalogueDialogScreen> {
  bool categoryOne = true;
  bool categoryTwo = true;

  bool showOutOfStock = true;

  final UserDetailService _userDetailService = getIt<UserDetailService>();

  bool isApiDataAvailable = false;
  late Future _future;

  List<CatalogueCategoryFilterApiResModel> catalogueCategoryFilterApiResModel =
      <CatalogueCategoryFilterApiResModel>[];
  final CatalogueController _catalogueController = CatalogueController();
  GetFilterCatalogueApiResModel getFilterCatalogueApiResModel = GetFilterCatalogueApiResModel();

  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _fromDateAddedController = TextEditingController();
  final TextEditingController _toDateAddedController = TextEditingController();

  String categories = '';

  /// Another sub category List
  final List<Map<String, dynamic>> _categories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _future = getCatalogueFilter().then((value) {
      if (widget.filteredData != null) {
        for (var category in _categories) {
          if (widget.filteredData!.categories!.contains(category['categoryId'])) {
            category['categoryValue'] = true;
            category['subcategroyValue'].forEach((subcategory) {
              if (widget.filteredData!.subcategories!.contains(subcategory['subCategoryId'])) {
                subcategory['isChecked'] = true;
              }
            });
          }
        }

        _fromController.text = '₹${widget.filteredData!.minPrice}';
        _toController.text = '₹${widget.filteredData!.maxPrice}';
        _fromDateAddedController.text = widget.filteredData!.dateFrom ?? '';
        _toDateAddedController.text = widget.filteredData!.dateTo ?? '';
        showOutOfStock = widget.filteredData!.showOutOfStock ?? true;
      } else {
        for (var category in _categories) {
          category['categoryValue'] = true;
          category['subcategroyValue'].forEach((subcategory) {
            subcategory['isChecked'] = true;
          });
        }
      }
    });

  
  
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.25,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                if (isApiDataAvailable) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Row(
                          children: [
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width / 1.65),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close_rounded,
                                size: 22,
                              ),
                            ),
                          ],
                        ),

                        /// Filter Text
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            'Filters',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),

                        /// Divider
                        Divider(
                          color: Colors.black,
                          thickness: 1.2,
                        ),

                        /// Filter List Items
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            itemCount: _categories.length,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  /// Category Box
                                  SizedBox(
                                    height: 40,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          value: _categories[index]
                                              ['categoryValue'],
                                          activeColor: AppCol.primary,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          visualDensity: VisualDensity(
                                              horizontal: -4, vertical: -4),
                                          onChanged: (value) {
                                            _categories[index]['categoryValue'] =
                                                value!;
                                            if (value) {
                                              _categories[index]['subcategroyValue'].forEach((subcategory) {
                                                subcategory['isChecked'] = true;
                                              });
                                            } else {
                                              _categories[index]['subcategroyValue'].forEach((subcategory) {
                                                subcategory['isChecked'] = false;
                                              });
                                            }
                                            setState(() {});
                                          },
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '${_categories[index]['categoryName']}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 0),

                                  /// Sub Category Option Box One
                                  Container(
                                    // height: 80,
                                    child: GridView.builder(
                                      itemCount: _categories[index]
                                              ['subcategroyValue']
                                          .length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 0,
                                        crossAxisSpacing: 0,
                                        mainAxisExtent: 30,
                                      ),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, subIndex) {
                                        return Row(
                                          children: [
                                            Checkbox(
                                              value: _categories[index]['subcategroyValue'][subIndex]['isChecked'],
                                              activeColor: AppCol.primary,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              side: WidgetStateBorderSide
                                                  .resolveWith(
                                                (states) => BorderSide(
                                                    width: 1, color: Colors.grey),
                                              ),
                                              visualDensity: VisualDensity(
                                                  horizontal: -4, vertical: -4),
                                              onChanged: (value) {
                                                _categories[index]['subcategroyValue'][subIndex]['isChecked'] =
                                                    value!;
                                                setState(() {});
                                              },
                                            ),
                                            SizedBox(width: 2),
                                            SizedBox(
                                              width: 100,
                                              child: Text(
                                                '${_categories[index]['subcategroyValue'][subIndex]['subCategoryName']}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                 
                                 
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 16),

                      
                      

                        /// Price Range
                        Text(
                          'Price range',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),

                        /// From MRP and To MRP Row
                        Row(
                          children: [
                            /// From Field
                            Expanded(
                              child: Container(
                                child: TextFormField(
                                  controller: _fromController,
                                  decoration: InputDecoration(
                                    hintText: '₹',
                                    labelText: 'From',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16),

                            /// To Field
                            Expanded(
                              child: Container(
                                child: TextFormField(
                                  controller: _toController,
                                  decoration: InputDecoration(
                                    hintText: '₹',
                                    labelText: 'To',
                                    alignLabelWithHint: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        /// Date added
                        Text(
                          'Date added',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),

                        /// From Added and To Added Row
                        Row(
                          children: [
                            /// From Added Field
                            Expanded(
                              child: Container(
                                child: TextFormField(
                                  controller: _fromDateAddedController,
                                  decoration: InputDecoration(
                                    labelText: 'From',
                                    hintText: 'dd/mm/yy',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.calendar_today),
                                      onPressed: () async {
                                        final DateTime? picked = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2020),
                                          lastDate: DateTime(2030),
                                        );
                                        if (picked != null) {
                                          setState(() {
                                            _fromDateAddedController.text = DateFormat('yyyy-MM-dd').format(picked);
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16),

                            /// To Added Field
                            Expanded(
                              child: Container(
                                child: TextFormField(
                                  controller: _toDateAddedController,
                                  decoration: InputDecoration(
                                    hintText: 'dd/mm/yy',
                                    labelText: 'To',
                                    alignLabelWithHint: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.calendar_today),
                                      onPressed: () async {
                                        final DateTime? picked = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2020),
                                          lastDate: DateTime(2030),
                                        );
                                        if (picked != null) {
                                          setState(() {
                                            _toDateAddedController.text = DateFormat('yyyy-MM-dd').format(picked);
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        /// Show out of Text
                        Row(
                          children: [
                            Checkbox(
                              value: showOutOfStock,
                              activeColor: AppCol.primary,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity:
                                  VisualDensity(horizontal: -4, vertical: -4),
                              onChanged: (value) {
                                showOutOfStock = value!;
                                setState(() {});
                              },
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Show Out of Stock Product',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        /// Reset and Apply Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                resetValues();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 34, vertical: 10),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50, color: AppCol.primary),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Reset',
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
                                  _fromController.text = _fromController.text.replaceAll("₹", "");
                                  _toController.text = _toController.text.replaceAll("₹", "");

                                  Map<String, dynamic> filterBody = {};

                                  List<String> categories = [];
                                  List<String> subcategories = [];

                                  for (var category in _categories) {
                                    if (category['categoryValue']) {
                                      categories.add(category['categoryId']); // or category['categoryId'] if you have it
                                      category['subcategroyValue'].forEach((subcategory) {
                                        if (subcategory['isChecked']) {
                                          subcategories.add("${subcategory['subCategoryId']}"); // or subcategory['subCategoryId'] if you have it
                                        }
                                      });
                                    }
                                  }

                                  if (categories.isNotEmpty) {
                                    filterBody['categories'] = categories;
                                  }

                                  if (subcategories.isNotEmpty) {
                                    filterBody['subcategories'] = subcategories;
                                  }

                                  if (_fromController.text.trim().isNotEmpty) {
                                    filterBody['minPrice'] = _fromController.text.trim();
                                  }

                                  if (_toController.text.trim().isNotEmpty) {
                                    filterBody['maxPrice'] = _toController.text.trim();
                                  }

                                  if (_fromDateAddedController.text.trim().isNotEmpty) {
                                    filterBody['dateFrom'] = _fromDateAddedController.text;
                                  }

                                  if (_toDateAddedController.text.trim().isNotEmpty) {
                                    filterBody['dateTo'] = _toDateAddedController.text;
                                  }

                                  if (showOutOfStock) {
                                    filterBody['showOutOfStock'] = showOutOfStock;
                                  }
                                  /*"subcategories": subcategories,
                                  "minPrice": _fromController.text.trim(),
                                  "maxPrice": _toController.text.trim(),
                                  "dateFrom": _fromDateAddedController.text,
                                  "dateTo": _toDateAddedController.text,
                                  "showOutOfStock": showOutOfStock*/

                                  debugPrint('My filter body is: $filterBody');

                                  filterCatalogueData(filterBody);
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 34, vertical: 10),
                                    decoration: ShapeDecoration(
                                      color: AppCol.primary,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 0.50,
                                            color: AppCol.primary),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Apply',
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
                        SizedBox(height: 16),
                      ],
                    ),
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }

  /// Get Filter Data
  Future<bool> getCatalogueFilter() async {
    List<CatalogueCategoryFilterApiResModel>
        catalogueCategoryFilterApiResModel =
        await _catalogueController.getFilterCategory(
            _userDetailService.userDetailResponse?.user?.id ?? '');
    debugPrint(
        'My filter catalgue category is: $catalogueCategoryFilterApiResModel');
    debugPrint(
        'My filters text is: ${catalogueCategoryFilterApiResModel.first.title}');
    if (catalogueCategoryFilterApiResModel.isNotEmpty) {
      for (var element in catalogueCategoryFilterApiResModel) {
        var categoryId = element.id;
        var categoryName = element.title;
        var categoryValue = [];
        var subcategories = element.subcategories?.map((subcategory) => {
          "subCategoryId": subcategory.id,
          "subCategoryName": subcategory.title,
          "isChecked": false,
        }).toList();
        element.subcategories?.forEach((subElement) {
          categoryValue.add(subElement.title);
        });
        _categories.add({
          "categoryId": categoryId,
          "categoryName": categoryName,
          "categoryValue": false,
          "subcategroyValue": subcategories,
        });
      }
      isApiDataAvailable = true;
      debugPrint('My categories is: $_categories');
    }
    return isApiDataAvailable;
  }

  /// Filter the data
  void filterCatalogueData(body) async {
    getFilterCatalogueApiResModel = await _catalogueController.getFilterCatalogueData(body);
    if(getFilterCatalogueApiResModel.success == true) {
      List<String> categories = [];
      List<String> subcategories = [];

      for (var category in _categories) {
        if (category['categoryValue']) {
          categories.add(category['categoryId']); // or category['categoryId'] if you have it
          category['subcategroyValue'].forEach((subcategory) {
            if (subcategory['isChecked']) {
              subcategories.add("${subcategory['subCategoryId']}"); // or subcategory['subCategoryId'] if you have it
            }
          });
        }
      }
      String minPrice = _fromController.text.trim().replaceAll("₹", "");
      String maxPrice = _toController.text.trim().replaceAll("₹", "");
      String dateFrom = _fromDateAddedController.text;
      String dateTo = _toDateAddedController.text;


      FilteredData filteredData = FilteredData(
        categories: categories,
        subcategories: subcategories,
        minPrice: minPrice,
        maxPrice: maxPrice,
        dateFrom: dateFrom,
        dateTo: dateTo,
        showOutOfStock: showOutOfStock,
        filteredData: getFilterCatalogueApiResModel,
      );

      Navigator.pop(context, filteredData);
      // Navigator.pop(context,getFilterCatalogueApiResModel);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => FilterCatalogueScreen(products: getFilterCatalogueApiResModel.products ?? []),));
    }
  }

  /// Reset the data
  void resetValues() {
    setState(() {
      for (var category in _categories) {
        category['categoryValue'] = false;
        category['subcategroyValue'].forEach((subcategory) {
          subcategory['isChecked'] = false;
        });
      }
      _fromController.text = '₹';
      _toController.text = '₹';
      _fromDateAddedController.text = 'dd/mm/yy';
      _toDateAddedController.text = 'dd/mm/yy';
      showOutOfStock = true;
    });
  }
}

/// -------- Sub Category ----------
class SubCategory {
  String subCategoryName;
  bool isChecked;

  SubCategory({required this.subCategoryName, required this.isChecked});
}


