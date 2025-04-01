import 'dart:async';
import 'dart:io';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/data/productCategoryModel/addSellerCategoriesApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/getProductCategoryResponceModel.dart';
import 'package:taptohello/data/productCategoryModel/productCategoryApiResModel.dart'
    as productCategoryModel;
import 'package:taptohello/data/productCategoryModel/saveSellerCategoriesApiResModel.dart';
import 'package:taptohello/presentation/profileScreen/FeaturedBanner/featuredBannerController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ProductCategory/ProductCategoryController/productcategoryController.dart';
import 'package:taptohello/data/productCategoryModel/getProductCategoryResponceModel.dart';
import 'package:taptohello/data/productCategoryModel/getProductCategoryResponceModel.dart' as getProduct;
import 'package:taptohello/data/productCategoryModel/saveSellerCategoriesApiResModel.dart' as saveSeller;


class AddProductCategoryScreen extends StatefulWidget {
  //  final Categories? category; 
   final getProduct.Categories? category;
// Nullable, since it's used for both add & edit

  const AddProductCategoryScreen({super.key, this.category});

  @override
  State<AddProductCategoryScreen> createState() => _AddProductCategoryScreenState();
}

class _AddProductCategoryScreenState extends State<AddProductCategoryScreen> {
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

      GetProductCategoryResponceModel getProductCategoryResponceModel = GetProductCategoryResponceModel();

  bool isCustomCategory = false;

  bool isApiDataAvailable = false;
  late Future _future;

  int selectedCategoryIndex = 0;

  String customSelectedSubCategory = '';
   String productCategoryId = '';

  bool allCategoriesNotEmpty = true;

  List<String> adminCategories = [];
  List adminSubCategories = [];
  List selectAdminSubCategories = [];
   final FeaturedBannerControllers _productController = FeaturedBannerControllers();

   //String filePath = '';

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

  File? _selectedImage; // Stores the picked image

  /// Function to pick an image
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  
  void _showDeleteConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text("Remove Image"),
        content: Text("Are you sure you want to remove this image?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop(); // Close the dialog
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _selectedImage = null; // Remove image
              });
              Navigator.of(dialogContext).pop(); // Close the dialog
            },
            child: Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}


  bool isShowProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
     if (widget.category != null) {
    // Pre-fill existing category values
    _categories[0]['categoryId'].text = widget.category!.title ?? "";
    _selectedImage = _selectedImage != null 
    ? File(_selectedImage!.path) 
    : null;
    // _selectedImage = widget.category!.categoryImage != null ? File(widget.category!.categoryImage!) : null; 
  }
    _future = loadData();
  }

 
 Future<void> submitProduct() async {
  bool isValid = true;
  String? productCategoryId; // Ensure it's null initially

  // Validate that all custom category titles are filled
  for (var element in _categories) {
    if (element['custom'] == true && element['title'].text.isEmpty) {
      isValid = false;
    }
  }

  if (!isValid) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please fill all custom category titles')),
    );
    return;
  }

  // Validate that at least one category is selected
  if (_categories.isEmpty || _categories.every((c) => c['categoryId'].text.isEmpty)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please select a category')),
    );
    return;
  }

  // Validate image selection
  if (_selectedImage == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please upload an image')),
    );
    return;
  }

  // Map selected category ID
  for (var category in _categories) {
    productCategoryApiResModel.categories?.forEach((element) {
      if (category['categoryId'].text == element.title) {
        productCategoryId = element.sId ?? '';
      }
    });
  }

  // Ensure a category ID is set
  if (productCategoryId == null || productCategoryId!.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Invalid category selection')),
    );
    return;
  }

  // Upload image
  String uploadedLink = await _productController.awsDocumentUpload(context, _selectedImage!.path);
  print("Uploaded Image URL: $uploadedLink");

  // Prepare payload
  Map<String, dynamic> payload = {
    "categories": [
      {
        "categoryId": productCategoryId,
        "categoryImage": uploadedLink // Send only one object
      }
    ]
  };

  print("Payload: $payload"); // Debugging

  // API Call
  getProductCategoryResponceModel = await _productCategoryController.addProductCategory(payload);

  if (getProductCategoryResponceModel.success == true) {
    Navigator.of(context).pop(true); 
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${getProductCategoryResponceModel.message}')),
    );
  } else {
   Navigator.of(context).pop(true); 
  }
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
              submitProduct();
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
                                             
                                             
                                              //  loadSubCategories(
                                              //      _categories[index]['categoryId'].text);
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

               ///Custom Upload Button
ElevatedButton.icon(
  onPressed: _pickImage,
  icon: const Icon(Icons.upload,color: Colors.white,),
  label: const Text("Upload image"),
  style: ElevatedButton.styleFrom(
    backgroundColor: AppCol.primary,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    textStyle: const TextStyle(fontSize: 14),
  ),
),

SizedBox(height: 16),

/// 🖼️ Show Selected Image with Shadowed Container & Delete Button
if (_selectedImage != null || (widget.category?.categoryImage?.isNotEmpty ?? false))
  Stack(
    children: [
      Container(
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: 

        ClipRRect(
  borderRadius: BorderRadius.circular(12),
  child: _selectedImage != null
      ? Image.file(
          _selectedImage!,
          width: double.infinity,
          height: 180,
          fit: BoxFit.cover,
        )
      : CachedNetworkImage(
          imageUrl: widget.category?.categoryImage?.isNotEmpty == true
              ? widget.category!.categoryImage!
              : 'https://via.placeholder.com/200', // Fallback URL
          width: double.infinity,
          height: 180,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.image_not_supported,
            size: 100,
            color: Colors.grey,
          ),
        ),
),
       
       
      ),

      Positioned(
        top: 6,
        right: 6,
        child: GestureDetector(
          onTap: () {
            _showDeleteConfirmationDialog(context);
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppCol.primary,
            ),
            padding: const EdgeInsets.all(6),
            child: const Icon(Icons.close, color: Colors.white, size: 18),
          ),
        ),
      ),
    ],
  )




else
  Text("No image selected", style: TextStyle(color: Colors.grey)),



                                    ],

                                  ],
                                ),
                              );
                            }),

                     
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
