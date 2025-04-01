import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/utils/commonFun.dart';
import 'package:taptohello/data/productCategoryModel/editSellerCategoriesApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/viewCategoryApiResModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ProductCategory/ProductCategoryController/productcategoryController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ProductCategory/editCategoryScreen.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ProductCategory/productCategoryScreen.dart';

class ViewCategoryScreen extends StatefulWidget {
  const ViewCategoryScreen({super.key});

  @override
  State<ViewCategoryScreen> createState() => _ViewCategoryScreenState();
}

class _ViewCategoryScreenState extends State<ViewCategoryScreen> {
  final ProductCategoryController _productCategoryController =
      ProductCategoryController();
  ViewCategoriesApiResModel viewCategoriesApiResModel =
      ViewCategoriesApiResModel();

  EditSellerCategoriesApiResModel editSellerCategoriesApiResModel = EditSellerCategoriesApiResModel();

  bool isApiDataAvailable = false;
  late Future _future;

  List selectedSubCategoryListID = [];

  List forDeleteCategory = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = loadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    selectedSubCategoryListID.clear();
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
        title: Text(
          'View Category',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          /// View Hello Store Button
          InkWell(
            onTap: () async {
              var res = await openScreenAndReturnValue(
                  context, ProductCategoryScreen());
              if (res) {
                _future = loadData();
              }
              debugPrint('My value is: $res');
              /*Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductCategoryScreen(),
                ),
              );*/
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 14, top: 20),
              child: Text(
                'Add',
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
                        'Added Categories/Sub Categories',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 28),

                      /// View category section
                      ListView.builder(
                        itemCount: viewCategoriesApiResModel.categories?.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var categoryIndex = index;
                          debugPrint(
                              'My category index are is: $categoryIndex');
                          debugPrint(
                              'My Subcategory length is: ${viewCategoriesApiResModel.categories?[categoryIndex].subcategories?.length}');
                          // debugPrint('My sub category index are is: ${productCategoryApiResModel.categories?[categoryIndex].subcategories?[index]}');
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Category Heading and Edit button
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  /// Category Heading
                                  Text(
                                    'Category',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Spacer(),

                                  /// Edit Icon
                                  IconButton(
                                    onPressed: () async {
                                      debugPrint(
                                          'My selectedd categpry is: ${viewCategoriesApiResModel.categories?[index].sId}');

                                      viewCategoriesApiResModel
                                          .categories?[index].subcategories
                                          ?.forEach((element) {
                                        selectedSubCategoryListID
                                            .add(element.sId);
                                      });

                                      debugPrint(
                                          'My selected sub category is: $selectedSubCategoryListID');

                                      var res = await openScreenAndReturnValue(
                                          context,
                                          EditCategoryScreen(
                                            isCustom: viewCategoriesApiResModel.categories?[index].isCustom ?? false,
                                              categoryTitleId:
                                                  "${viewCategoriesApiResModel.categories?[index].sId}",
                                              subCategoryId:
                                                  selectedSubCategoryListID));
                                      if (res) {
                                        // selectedSubCategoryListID.clear();
                                        _future = loadData();
                                      }
                                    },
                                    icon: Icon(Icons.edit_outlined),
                                  ),

                                  /// Delete Icon
                                  IconButton(
                                    onPressed: () async {
                                      viewCategoriesApiResModel.categories?[categoryIndex].subcategories?.forEach((element) {
                                        forDeleteCategory.add(element.title);
                                      });
                                      debugPrint('My Sub category list is: $forDeleteCategory');

                                      final Map<String, dynamic> res = {
                                        "categories": [
                                          {
                                            "categoryId":
                                                "${viewCategoriesApiResModel.categories?[index].sId}",
                                            "title": "${viewCategoriesApiResModel.categories?[index].title}",
                                            "subcategories": forDeleteCategory,
                                            "custom": viewCategoriesApiResModel.categories?[index].isCustom,
                                            "active": false
                                          }
                                        ]
                                      };

                                      editSellerCategoriesApiResModel = await _productCategoryController.editSellerCategory(res);
                                      if(editSellerCategoriesApiResModel.success == true) {
                                        _future = loadData();
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('${editSellerCategoriesApiResModel.message}')));
                                      }
                                    },
                                    icon: Icon(Icons.delete_rounded),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),

                              /// category section
                              Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: Colors.grey,
                                    strokeAlign: 0.8,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${viewCategoriesApiResModel.categories?[index].title}',
                                    ),
                                   
                                   
                                  ],
                                ),
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
                                height: 55,
                                child: ListView.builder(
                                  itemCount: viewCategoriesApiResModel
                                          .categories?[categoryIndex]
                                          .subcategories
                                          ?.length ??
                                      0,
                                  padding: EdgeInsets.only(top: 2, left: 4),
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    /*viewCategoriesApiResModel.categories?[index].subcategories?.forEach((element) {
                                      if(element.title == viewCategoriesApiResModel.categories?[categoryIndex].subcategories?[index].title) {

                                      }
                                    });*/
                                    // selectedSubCategoryListID.add('${viewCategoriesApiResModel.categories?[categoryIndex].subcategories?[index].sId}');
                                    return Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(
                                          right: 10, bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(.1),
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: Colors.grey,
                                          strokeAlign: 0.8,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '${viewCategoriesApiResModel.categories?[categoryIndex].subcategories?[index].title}',
                                          ),
                                       
                                       
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                            
                            

                              /// Divider
                              Divider(
                                thickness: 2,
                              ),
                              SizedBox(height: 16),
                            ],
                          );
                        },
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

  /// Load Api data
  Future<bool> loadData() async {
    viewCategoriesApiResModel = await _productCategoryController.viewCategory();
    if (viewCategoriesApiResModel.success == true) {
      isApiDataAvailable = true;
    } else if (viewCategoriesApiResModel.message == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Server Problem')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${viewCategoriesApiResModel.message}')));
    }
    setState(() {});
    return isApiDataAvailable;
  }
}
