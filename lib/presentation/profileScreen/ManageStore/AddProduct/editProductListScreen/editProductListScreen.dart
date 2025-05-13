import 'dart:async';
import 'dart:io';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/data/productCategoryModel/awsPhotoUploadApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/deleteProductApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/editProductApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/editProductListApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/manageCollectionApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/productCategoryApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/sizeChartFirstTimeDataModel.dart';
import 'package:taptohello/data/productCategoryModel/viewCategoryApiResModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/addProductDialog.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/CatalogueScreen/catalogueScreen.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageVariants/ManageVariantController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/SizeChart/sizeChartScreen.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageCollection/ManageCollectionController/manageCollectionController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageVariants/manageVariantsScreen.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ProductCategory/ProductCategoryController/productcategoryController.dart';
import 'package:taptohello/services/shared_preference_service.dart';
import 'package:video_player/video_player.dart';
import '../../../../../core/utils/commonFun.dart';
import '../../../../../helper/locator.dart';
import '../../../../../helper/user_detail_service.dart';
import '../../ManageAttributes/manageAttributesScreen.dart';
import 'package:html_editor_plus/html_editor.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';



class ManageVariantController1 extends StateNotifier<List<String>> {
  ManageVariantController1() : super(<String>[]); // Explicitly setting List<String>

  // Add images dynamically (avoiding duplicates)
  void addImage(List<String> newImages) {
    state = [...state, ...newImages.where((img) => !state.contains(img))];
  }

  // Set new images (replace all)
  void setImages(List<String> images) {
    state = List<String>.from(images); // Explicit conversion
  }

  // Clear images
  void clearImages() {
    state = <String>[]; // Explicitly setting List<String>
  }
}

// Define Riverpod provider
final manageVariantProvider =
    StateNotifierProvider<ManageVariantController1, List<String>>(
  (ref) => ManageVariantController1(),
);


class EditProductListScreen extends ConsumerStatefulWidget {
  const EditProductListScreen({
    super.key,
    required this.productId,
    required this.isFrom,
    required this.isFromCatalogue,
  });

  final String productId;
  final String isFrom;
  final bool isFromCatalogue;

  @override
  ConsumerState<EditProductListScreen> createState() => _EditProductListScreenState();
}

class _EditProductListScreenState extends ConsumerState<EditProductListScreen> {
  final TextEditingController _productTitleController = TextEditingController();
  // final TextEditingController _productDescriptionController = TextEditingController();
  final TextEditingController _mrpController = TextEditingController();
  final TextEditingController _discountPriceController = TextEditingController();
  final TextEditingController _inventoryController = TextEditingController();
  final TextEditingController _productCategoryController = TextEditingController();
  final TextEditingController _productSubCategoryController = TextEditingController();
  final TextEditingController _SKUIDController = TextEditingController();
  final TextEditingController _addToCollectionController = TextEditingController();
  final TextEditingController _productTagsController = TextEditingController();
  ViewCategoriesApiResModel viewCategoriesApiResModel =
      ViewCategoriesApiResModel();
  final ProductCategoryController _productController = ProductCategoryController();
   // late quill.QuillController _productDescriptionController;
     final HtmlEditorController _productDescriptionController = HtmlEditorController();
    String json = "";
    String productDescriptionData = '';
  final _formKey = GlobalKey<FormState>();

  final ManageVariantController _manageVariantController = ManageVariantController();

  bool isSizeChart = false;
  bool isUnlimitedStock = false;
  bool isDisplayOn = false;
  bool isAdditionalInformation = false;

  bool isProductPost = false;

  List selectedImages = [];
  List selectedVideos = [];
  List<VideoPlayerController> videoControllers = [];
  bool _isEditorReady = false;

  final ImagePicker _picker = ImagePicker();
  final bool _isLoading = false;
  // var json = jsonEncode("");
  String productDesc = '';
  late List<dynamic> deltaJson = [];

  bool isApiDataAvailable = false;
  late Future _future;

  List<String> adminCategories = [];
  List adminSubCategories = [];
  List selectAdminSubCategories = [];

  List selectedImageVideos = [];

  List<String> productTags = [];

  List sizeChart = [];

  String selectedCategoryId = '';
  String selectedSubCategoryId = '';
  String selectedCollection = '';

  bool isPageLoading = false;
  String selectedNewVariant = "";

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  /// Product Details Model
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  EditProductApiResModel editProductApiResModel = EditProductApiResModel();
  final AddProductController _addProductController = AddProductController();

  ProductCategoryApiResModel productCategoryApiResModel =
      ProductCategoryApiResModel();

  DeleteProductApiResModel deleteProductApiResModel =
      DeleteProductApiResModel();

  final ProductCategoryController _productCategoryListController =
      ProductCategoryController();

  ManageCollectionApiResModel manageCollectionApiResModel =
      ManageCollectionApiResModel();
  final ManageCollectionController _manageCollectionController =
      ManageCollectionController();

  EditProductDetailsApiResModel editProductDetailsApiResModel =
      EditProductDetailsApiResModel();

  AWSFileUploadApiResModel awsFileUploadApiResModel =
      AWSFileUploadApiResModel();

  bool isVideoUpload = false;

  SizeChartFirstTimeData sizeChartFirstTimeData = SizeChartFirstTimeData();

  final ValueNotifier<bool> submitClick = ValueNotifier<bool>(false);
 
    bool isFirstInit = true;  

   File? _imageFile;
  

   

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = getProductDetails();
    loadData();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.round();
      });
    });
    isUnlimitedStock = SharedPreferenceService.getString('productUnlimitedStockbyId${widget.productId}') == "true" ? true : false;
    debugPrint('Is my inventory: $isUnlimitedStock');
    
   // Delay the reset of manageVariantProvider state
  Future.delayed(Duration.zero, () {
    // Reset the provider state after widget is built
    ref.read(manageVariantProvider.notifier).clearImages();
    print("Cleared manageVariantProvider data during first initialization");
  });

  // Simulate loading future
  _future = Future.delayed(Duration(seconds: 2), () {
    setState(() {
      isApiDataAvailable = true;
      isPageLoading = false;
    });

    // Using Future.delayed to change the provider state after widget is built
   Future.delayed(Duration.zero, () {
  // Safely convert List<dynamic> to List<String>
  List<String> images = List<String>.from(selectedImages);
  List<String> videos = List<String>.from(selectedVideos);

  // Add the images to the provider
  ref.read(manageVariantProvider.notifier).addImage(images);
    ref.read(manageVariantProvider.notifier).addImage(videos);
  print("Images added: $images");
});

  });
  

   
   
  }

  

  Future<List<String>> fetchCategories(String? filter) async {
  // Simulate an API call
  await Future.delayed(Duration(seconds: 0));
  
  

  // Filter results if a search query is provided
  return adminSubCategories
      .where((category) =>
          filter == null || category['title'].toLowerCase().contains(filter.toLowerCase()))
      .map((e) => e['title'] as String)
      .toList();
}

String? findIdByTitle(String title) {
  try {
    return adminSubCategories.firstWhere((category) => category['title'] == title)['_id'];
  } catch (e) {
    // Handle case where title is not found
    print("Error: $e");
    return null;
  }
}

 // Method to save image and get its path
  Future<String> saveImage(Uint8List imageData) async {

    // Compress image before saving
  var compressedImage = await FlutterImageCompress.compressWithList(
    imageData,
    minWidth: 800,  // Adjust these values as needed
    minHeight: 600,
    quality: 80,
  );
    // Get the directory to store the image file
    final directory = await getApplicationDocumentsDirectory();
    
    // Create a unique file name
      final filePath = '${directory.path}/compressed_image_${DateTime.now().millisecondsSinceEpoch}.jpg';

   // final filePath = '${directory.path}/image_${DateTime.now().millisecondsSinceEpoch}.jpg';

    // Create the file and write the image data into it
    final file = File(filePath);
    await file.writeAsBytes(imageData);

    // Return the file path
    return filePath;
  }

  

  @override
  void dispose() {
    for (final videoController in videoControllers) {
      videoController.dispose();
    }
    super.dispose();
  }
   Future<bool> _onBackPressed() async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Are you sure?'),
              content: Text("Do you want to Exit ?."),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false), // Return `false` if the user cancels.
          child: Text('No'),
        ),
        TextButton(
          onPressed:() {
            Navigator.of(context).pop(true);
             Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CatalogueScreen(),
                        ),
                      );
          //  openScreenWithoutBack(context, HomeView(indexfromPrevious: 1,));
            // Navigator.of(context).pop(true);
            // Navigator.of(context).pop(true);
          }, // Return `true` if the user confirms.
          child: Text('Yes'),
        ),
      ],
    ),
  ).then((value) => value ?? false); // Ensure a `bool` is returned even if `value` is null.
}



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
  onWillPop: _onBackPressed,
  child: Scaffold(
        backgroundColor: Color(0xFFF0F1F6),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.grey,
          ),
          title: Text(
            'Edit Product',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          leading: InkWell(
            onTap: _onBackPressed
            // widget.isFromCatalogue
            //     ? _onBackPressed
            //     : () => showDialog(
            //         context: context,
            //         builder: (context) {
            //           return AlertDialog(
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(16)),
            //               title: Text(
            //                 'Do you want to delete this product? All your product details will be lost if you delete it.',
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   color: Color(0xFF666666),
            //                   fontSize: 15,
            //                   fontFamily: 'Roboto',
            //                   fontWeight: FontWeight.w400,
            //                   height: 1.47,
            //                 ),
            //               ),
            //               actions: <Widget>[
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     /// No Button
            //                     InkWell(
            //                       onTap: () {
            //                         Navigator.of(context).pop();
            //                       },
            //                       child: Container(
            //                         padding: const EdgeInsets.symmetric(
            //                             horizontal: 48, vertical: 10),
            //                         decoration: ShapeDecoration(
            //                           color: Colors.white,
            //                           shape: RoundedRectangleBorder(
            //                             side: BorderSide(
            //                                 width: 0.50,
            //                                 color: AppCol.primary),
            //                             borderRadius: BorderRadius.circular(23),
            //                           ),
            //                         ),
            //                         child: Row(
            //                           mainAxisSize: MainAxisSize.min,
            //                           mainAxisAlignment: MainAxisAlignment.center,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.center,
            //                           children: [
            //                             Text(
            //                               'No',
            //                               style: TextStyle(
            //                                 color: AppCol.primary,
            //                                 fontSize: 16,
            //                                 fontFamily: 'Roboto',
            //                                 fontWeight: FontWeight.w500,
            //                                 letterSpacing: 0.16,
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                     ),
            //                     const SizedBox(width: 24),
            //                     InkWell(
            //                         onTap: () async {
            //                           deleteProductApiResModel =
            //                               await _addProductController
            //                                   .deleteProduct(widget.productId);
            //                           if (deleteProductApiResModel.success ==
            //                               true) {
            //                             openScreenWithoutBack(
            //                                 context,
            //                                 HomeView(
            //                                   indexfromPrevious: 1,
            //                                 ));
            //                           } else {
            //                             ScaffoldMessenger.of(context)
            //                                 .showSnackBar(SnackBar(
            //                                     content: Text(
            //                                         'Something went wrong')));
            //                           }
            //                         },
            //                         child: Container(
            //                             padding: const EdgeInsets.symmetric(
            //                                 horizontal: 48, vertical: 10),
            //                             decoration: ShapeDecoration(
            //                               color: AppCol.primary,
            //                               shape: RoundedRectangleBorder(
            //                                 side: BorderSide(
            //                                     width: 0.50,
            //                                     color: AppCol.primary),
            //                                 borderRadius:
            //                                     BorderRadius.circular(23),
            //                               ),
            //                             ),
            //                             child: Row(
            //                               mainAxisSize: MainAxisSize.min,
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.center,
            //                               crossAxisAlignment:
            //                                   CrossAxisAlignment.center,
            //                               children: [
            //                                 Text(
            //                                   'Yes',
            //                                   style: TextStyle(
            //                                     color: Colors.white,
            //                                     fontSize: 16,
            //                                     fontFamily: 'Roboto',
            //                                     fontWeight: FontWeight.w500,
            //                                     letterSpacing: 0.16,
            //                                   ),
            //                                 ),
            //                               ],
            //                             )))
            //                   ],
            //                 ),
            //                 SizedBox(height: 10),
            //               ]);
            //         })
                    ,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Image.asset(
                  "assets/images/back.png",
                  height: 24,
                )),
          ),
          actions: [
            /// View Hello Store Button
            Visibility(
              visible: !isPageLoading,
              child: InkWell(
                onTap: () async {
                  submitClick.value = true;
                  debugPrint('My real Image is: ${_mrpController.text}');
                  debugPrint('My real Image is: ${_discountPriceController.text}');
                  String? categoryId = "";
                  String? subCategoryId = "";
                  Map<String, dynamic> body = {};
                  selectedImageVideos.clear();
                  for (var images in selectedImages) {
                    debugPrint('My real Image is: $images');
                    /*final res = await awsDocumentUpload(images.path);
                    debugPrint('My Image is: $res');*/
                    selectedImageVideos.add(images);
                    
                  }
                  for (var videos in selectedVideos) {
                    debugPrint('My videos are: $videos');
                    // final res = await awsDocumentUpload(videos.path);
                    selectedImageVideos.add(videos);
                  }
      
                  debugPrint('My all image and videos is: $selectedImageVideos');
                  productCategoryApiResModel.categories?.forEach((element) {
                    if (element.title == _productCategoryController.text) {
                      categoryId = element.sId;
                    }
                  });
                  for (var element in adminSubCategories) {
                    if (element["title"] == _productSubCategoryController.text) {
                      subCategoryId = element["_id"];
                    }
                  }
      
                  manageCollectionApiResModel.collections?.forEach((element) {
                    if (_addToCollectionController.text == element.title) {
                      selectedNewVariant = element.id ?? '';
                      setState(() {});
                    }
                  });
                  isPageLoading = true;
                  Future.delayed(Duration(seconds: 2),() {
                    setState(() {
                      isPageLoading = false;
                    });
                  });
      
                  if(selectedImageVideos.isNotEmpty) {
                    if (selectedNewVariant.isNotEmpty) {
                      debugPrint('My mrp price is: ${_mrpController.text}');
                      debugPrint('My mrp price is: ${_discountPriceController.text}');
                      body = {
                        "title": _productTitleController.text,
                        "description": json,
                        "images": selectedImageVideos.map((e) => e).toList(),
                        "mrp": _mrpController.text,
                        "price": _discountPriceController.text.isNotEmpty ? _discountPriceController.text : "0",
                        "stock": isUnlimitedStock ? 100000 : _inventoryController.text,
                        "unlimitedStock": isUnlimitedStock,
                        "category": categoryId,
                        "subcategory": subCategoryId,
                        "active": isDisplayOn,
                        "skuId": _SKUIDController.text,
                        "productCollection": selectedNewVariant,
                        "tags": productTags,
                        "sizeChart" : sizeChart
                      };
                    }
                    else {
                      debugPrint('My mrp price is: ${_mrpController.text}');
                      debugPrint('My mrp price is: ${_discountPriceController.text}');
                      body = {
                        "title": _productTitleController.text,
                        "description": json,
                        "images": selectedImageVideos.map((e) => e).toList(),
                        "mrp": _mrpController.text,
                        "price": _discountPriceController.text.isNotEmpty ? _discountPriceController.text : "0",
                        "stock": isUnlimitedStock ? 100000 : _inventoryController.text,
                        "unlimitedStock": isUnlimitedStock,
                        "category": categoryId,
                        "subcategory": subCategoryId,
                        "active": isDisplayOn,
                        "skuId": _SKUIDController.text,
                        "tags": productTags,
                        "sizeChart" : sizeChart
                      };
                    }
                    debugPrint('My Final edit body list is: $body');
                    editProductDetailsApiResModel = await _addProductController
                        .editProduct(widget.productId, body);
                    if (editProductDetailsApiResModel.success == true) {
                      showProductDialog();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: widget.isFromCatalogue
                              ? Text("Product details saved")
                              : Text("Product added successfully")));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select atleast one image')));
                  }
                },
                child: ValueListenableBuilder(
                  valueListenable: submitClick,
                  builder: (context, value, child) {
                    Future.delayed(Duration(seconds: 3), () {
                      submitClick.value = false;
                    },);
                    return Visibility(
                      visible: submitClick.value ? false : true,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 14, top: 20),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color:  AppCol.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        body: FutureBuilder(
          
            future: _future,
            builder: (context, snapshot) {
          
              
              if (isApiDataAvailable) {
                return isPageLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : isVideoUpload ?  Center(child: CircularProgressIndicator(),) :  SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 20),
                       
                                /// Image View
                                selectedImages.isEmpty && selectedVideos.isEmpty
                                    ? Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    Colors.black.withOpacity(0.1),
                                                spreadRadius: 2,
                                                blurRadius: 10,
                                              ),
                                            ],
                                          ),
                                          child: Image.asset(
                                            'assets/newIcons/emptyImage.png',
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.25,
                                            // width: MediaQuery.of(context).size.width / 1.8,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: PageView.builder(
  itemCount: selectedVideos.isNotEmpty
      ? selectedImages.length + selectedVideos.length
      : selectedImages.length,
  scrollDirection: Axis.horizontal,
  controller: _pageController,
  itemBuilder: (context, index) {
    if (index < selectedImages.length) {
      final imageUrl = selectedImages[index].contains(AppConstants.imageBaseUrl)
          ? selectedImages[index]
          : AppConstants.imageBaseUrl + selectedImages[index];

      return Stack(
        alignment: Alignment.center,
        children: [
          CachedNetworkImage(
  imageUrl: (imageUrl != null && imageUrl.isNotEmpty)
      ? (imageUrl.contains(AppConstants.imageBaseUrl)
          ? imageUrl
          : AppConstants.imageBaseUrl + imageUrl)
      : '',
  placeholder: (context, url) => const CircularProgressIndicator(),
  errorWidget: (context, url, error) => const Icon(Icons.error),
  fit: BoxFit.cover,
),

          // CachedNetworkImage(
          //   imageUrl: imageUrl,
          //   placeholder: (context, url) => const CircularProgressIndicator(),
          //   errorWidget: (context, url, error) => const Icon(Icons.error),
          //   fit: BoxFit.cover,
          // ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.4),
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: () {
                  selectedImages.removeAt(index);
                  setState(() {});
                },
                child: const Center(
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      int videoIndex = index - selectedImages.length;
      return Stack(
        alignment: Alignment.center,
        children: [
          videoControllers[videoIndex].value.isInitialized
              ? Center(
                  child: AspectRatio(
                    aspectRatio: videoControllers[videoIndex].value.aspectRatio,
                    child: VideoPlayer(videoControllers[videoIndex]),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
          Center(
            child: IconButton(
              icon: const Icon(Icons.play_arrow, color: Colors.white),
              onPressed: () {
                setState(() {
                  videoControllers[videoIndex].value.isPlaying
                      ? videoControllers[videoIndex].pause()
                      : videoControllers[videoIndex].play();
                });
              },
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.4),
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: () {
                  selectedVideos.removeAt(videoIndex);
                  videoControllers.removeAt(videoIndex);
                  setState(() {
                    if (_currentIndex >=
                        selectedImages.length + selectedVideos.length) {
                      _currentIndex =
                          selectedImages.length + selectedVideos.length - 1;
                    }
                  });
                },
                child: const Center(
                  child: Icon(Icons.close_rounded, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      );
    }
  },
)
,
                                              // child: PageView.builder(
                                              //   itemCount: selectedVideos.isNotEmpty ? selectedImages.length +
                                              //       selectedVideos.length : selectedImages.length,
                                              //   scrollDirection: Axis.horizontal,
                                              //   controller: _pageController,
                                              //   itemBuilder: (context, index) {
                                              //     if (index <
                                              //         selectedImages.length) {
                                              //       return Stack(
                                              //         alignment: Alignment.center,
                                              //         children: [
//                                                         CachedNetworkImage(
//   imageUrl: selectedImages != null &&
//             selectedImages.contains(AppConstants.imageBaseUrl)
//       ? selectedImages
//       : AppConstants.imageBaseUrl + (selectedImages ?? ''),
//   placeholder: (context, url) => const CircularProgressIndicator(),
//   errorWidget: (context, url, error) => const Icon(Icons.error),
//   fit: BoxFit.cover, // or BoxFit.contain as needed
// )
                                              //           Image.network(
                                              //            AppConstants.imageBaseUrl + selectedImages[index],
                                                          
                                              //           ),
                                              //           Positioned(
                                              //             top: 0,
                                              //             right: 0,
                                              //             child: Container(
                                              //               padding:
                                              //               const EdgeInsets
                                              //                   .all(2),
                                              //               decoration:
                                              //               BoxDecoration(
                                              //                 color: Colors.grey
                                              //                     .withOpacity(
                                              //                     .4),
                                              //                 shape:
                                              //                 BoxShape.circle,
                                              //               ),
                                              //               child: InkWell(
                                              //                 onTap: () {
                                              //                   selectedImages.removeAt(index);
                                              //                   setState(() {});
                                              //                 },
                                              //                 child: Center(
                                              //                   child: Icon(
                                              //                     Icons
                                              //                         .close_rounded,
                                              //                     color:
                                              //                     Colors.black,
                                              //                   ),
                                              //                 ),
                                              //               ),
                                              //             ),
                                              //           ),
                                              //         ],
                                              //       );
                                              //     } else {
                                              //       int videoIndex = index -
                                              //           selectedImages.length;
                                              //       return Stack(
                                              //         alignment: Alignment.center,
                                              //         children: [
                                              //           videoControllers[
                                              //                       videoIndex]
                                              //                   .value
                                              //                   .isInitialized
                                              //               ? Center(
                                              //                   child:
                                              //                       AspectRatio(
                                              //                     aspectRatio:
                                              //                         videoControllers[
                                              //                                 videoIndex]
                                              //                             .value
                                              //                             .aspectRatio,
                                              //                     child: VideoPlayer(
                                              //                         videoControllers[
                                              //                             videoIndex]),
                                              //                   ),
                                              //                 )
                                              //               : const Center(
                                              //                   child:
                                              //                       CircularProgressIndicator()),
                                              //           Center(
                                              //             child: IconButton(
                                              //               icon: const Icon(
                                              //                   Icons.play_arrow,
                                              //                   color:
                                              //                       Colors.white),
                                              //               onPressed: () {
                                              //                 setState(() {
                                              //                   videoControllers[
                                              //                               videoIndex]
                                              //                           .value
                                              //                           .isPlaying
                                              //                       ? videoControllers[
                                              //                               videoIndex]
                                              //                           .pause()
                                              //                       : videoControllers[
                                              //                               videoIndex]
                                              //                           .play();
                                              //                 });
                                              //               },
                                              //             ),
                                              //           ),
                                              //           Positioned(
                                              //             top: 0,
                                              //             right: 0,
                                              //             child: Container(
                                              //               padding:
                                              //               const EdgeInsets
                                              //                   .all(2),
                                              //               decoration:
                                              //               BoxDecoration(
                                              //                 color: Colors.grey
                                              //                     .withOpacity(
                                              //                     .4),
                                              //                 shape:
                                              //                 BoxShape.circle,
                                              //               ),
                                              //               child: InkWell(
                                              //                 onTap: () {
                                              //                   if (index < selectedImages.length) {
                                              //                     selectedImages.removeAt(index);
                                              //                   } else {
                                              //                     int videoIndex = index - selectedImages.length;
                                              //                     selectedVideos.removeAt(videoIndex);
                                              //                     videoControllers.removeAt(videoIndex);
                                              //                   }
                                              //                   setState(() {
                                              //                     if (_currentIndex >= selectedImages.length + selectedVideos.length) {
                                              //                       _currentIndex = selectedImages.length + selectedVideos.length - 1;
                                              //                     }
                                              //                   });
                                              //                 },
                                              //                 child: Center(
                                              //                   child: Icon(
                                              //                     Icons
                                              //                         .close_rounded,
                                              //                     color:
                                              //                     Colors.black,
                                              //                   ),
                                              //                 ),
                                              //               ),
                                              //             ),
                                              //           ),
                                              //         ],
                                              //       );
                                              //     }
                                              //   },
                                              // ),
                                            ),
                                            selectedVideos.isNotEmpty ? DotsIndicator(
                                              dotsCount: selectedImages.length +
                                                  selectedVideos.length,
                                              position: _currentIndex,
                                              decorator: DotsDecorator(
                                                size: const Size.square(9.0),
                                                activeSize: const Size(18.0, 9.0),
                                                activeShape:
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5.0)),
                                              ),
                                            ) : DotsIndicator(
                                              dotsCount: selectedImages.length,
                                              position: _currentIndex,
                                              decorator: DotsDecorator(
                                                size: const Size.square(9.0),
                                                activeSize: const Size(18.0, 9.0),
                                                activeShape:
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                SizedBox(height: 24),
      
                                /// Click to Add Product Image/Video
                                InkWell(
                                  onTap: () => showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    builder: (context) => Container(
                                      // height: MediaQuery.of(context).size.height / 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 24, right: 24),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(height: 4),
                                            Container(
                                              height: 6,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                color:
                                                    Colors.grey.withOpacity(.4),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                            ),
                                            SizedBox(height: 16),
      
                                            /// Image Select Button
                                            InkWell(
                                              onTap: _pickImage,
                                              child: Container(
                                                padding: EdgeInsets.all(14),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(.1),
                                                      blurRadius: 10,
                                                      spreadRadius: 1,
                                                    ),
                                                  ],
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.image_rounded),
                                                    SizedBox(width: 16),
                                                    Text('Image'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 16),
      
                                            /// Video Select Button
                                            InkWell(
                                              onTap: _pickVideo,
                                              child: Container(
                                                padding: EdgeInsets.all(14),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(.1),
                                                      blurRadius: 10,
                                                      spreadRadius: 1,
                                                    ),
                                                  ],
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons
                                                        .video_camera_back_rounded),
                                                    SizedBox(width: 16),
                                                    Text('Video'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/newIcons/add_out.png',
                                          height: 20, width: 20),
                                      SizedBox(width: 10),
                                      Text(
                                        'Click to add product image/video',
                                        style: TextStyle(
                                          color: AppCol.primary,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 34),
      
                                /// Product Title Field
                                Container(
                                  child: TextFormField(
                                    controller: _productTitleController,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      labelText: 'Product Title*',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(height: 24),

                                Container(
           padding:
                             EdgeInsets.all(5),
                              decoration: BoxDecoration(
                           color: Colors.transparent, // Background color for the editor
                           border: Border.all(
                             color: Colors.grey, // Border color
                             width: 1, // Border width
                           ),
                           
                           borderRadius: BorderRadius.circular(
                               10), // Rounded corners (optional)
                         ),
          width: double.infinity, // Set the width of the container
          height: 435,
          child: Column(
            children: [
                HtmlEditor(
          controller: _productDescriptionController,
          
          htmlEditorOptions: HtmlEditorOptions(
            hint: "Product Description (optional) Type here...",
            shouldEnsureVisible: true,
          ),
          htmlToolbarOptions: HtmlToolbarOptions(
            toolbarPosition: ToolbarPosition.aboveEditor, // Place toolbar above
            defaultToolbarButtons: [
              StyleButtons(), // Font style buttons
              FontButtons(),  // Font family, size, and color
              ListButtons(),  // Bullet points and numbered lists
             // InsertButtons(),
              ColorButtons() // Images, links, etc.
            ],
          ),
           otherOptions: OtherOptions(
              height: 400,
            ),
            callbacks: Callbacks(
              
              onChangeContent: (String? content) {
                // Update the content when it changes
                if (content != null && content.isNotEmpty && !_isEditorReady) {
              setState(() {
                _isEditorReady = true; // Set editor as ready
              });
                }
              print("Editor is ready!");
                setState(() {
                  json = content ?? "";
                  print("html data ${json}");
                });
              },
            ),
        ),
            ],
          ),
        ),
      

                                SizedBox(height: 24),
      
                                /// MRP and Discount Price Row
                                Visibility(
                                  visible: (editProductApiResModel.product?.additionalInfo
                                      ?.productVariants ??
                                      []).isNotEmpty && (editProductApiResModel.product?.additionalInfo
                                      ?.attributes ??
                                      [])
                                      .isNotEmpty? false : (editProductApiResModel.product?.additionalInfo
                                      ?.productVariants ??
                                      []).isNotEmpty ? false : true,
                                  child: Row(
                                    children: [
                                      /// MRP Field
                                      Expanded(
                                        child: Container(
                                          child: TextFormField(
                                            controller: _mrpController,
                                            // initialValue: '₹ ${_mrpController.text}',
                                             inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'^[0-9]+.?[0-9]*'))
                                      ],
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                              decimal: true),
                                            readOnly: (editProductApiResModel.product?.additionalInfo
                                                ?.productVariants ??
                                                []).isNotEmpty && (editProductApiResModel.product?.additionalInfo
                                                ?.attributes ??
                                                [])
                                                .isNotEmpty? false : (editProductApiResModel.product?.additionalInfo
                                                ?.productVariants ??
                                                []).isNotEmpty ? true : false,
                                            decoration: InputDecoration(
                                              labelText: 'MRP (inc GST)*',
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              _mrpController.text = value;
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 16),
      
                                      /// Discount Field
                                      Expanded(
                                        child: Container(
                                          child: TextFormField(
                                            controller: _discountPriceController,
                                            // initialValue: '₹ ${_discountPriceController.text}',
                                           
                                             inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'^[0-9]+.?[0-9]*'))
                                      ],
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                              decimal: true),
                                            readOnly: (editProductApiResModel.product?.additionalInfo
                                                ?.productVariants ??
                                                []).isNotEmpty && (editProductApiResModel.product?.additionalInfo
                                                ?.attributes ??
                                                [])
                                                .isNotEmpty? false : (editProductApiResModel.product?.additionalInfo
                                                ?.productVariants ??
                                                []).isNotEmpty ? true : false,
                                                
                                            decoration: InputDecoration(
                                              labelText: 'Discounted Price',
                                              // errorText: _discountPriceController
                                              //             .text.isNotEmpty &&
                                              //         double.parse(
                                              //                 _discountPriceController
                                              //                     .text) >
                                              //             double.parse(
                                              //                 _mrpController.text)
                                              //     ? 'Discount price cannot be greater than MRP price'
                                              //     : null,
                                              errorText: _discountPriceController.text.isNotEmpty &&
           _mrpController.text.isNotEmpty &&
           double.tryParse(_discountPriceController.text) != null &&
           double.tryParse(_mrpController.text) != null &&
           double.parse(_discountPriceController.text) >
           double.parse(_mrpController.text)
    ? 'Discount price cannot be greater than MRP price'
    : null,


                                                  
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            // validator: (value) {
                                            //   if (value!.isEmpty) {
                                            //     return 'Discount price is required';
                                            //   } else if (double.parse(value) >
                                            //       double.parse(
                                            //           _mrpController.text)) {
                                            //     return 'Discount price cannot be greater than MRP price';
                                            //   }
                                            //   return null;
                                            // },
                                            validator: (value) {
  final discount = double.tryParse(value ?? '');
  final mrp = double.tryParse(_mrpController.text);

  if ((value ?? '').isEmpty) {
    return 'Discount price is required';
  } else if (discount != null && mrp != null && discount > mrp) {
    return 'Discount price cannot be greater than MRP price';
  }
  return null;
},

                                            onChanged: (value) {
                                              _discountPriceController.text = value;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 24),
      
                                /// Inventory and unlimited stock button
                                Row(
                                  children: [
                                    /// Inventory Field
                                    Visibility(
                                      visible: (editProductApiResModel.product?.additionalInfo
                                          ?.productVariants ??
                                          []).isNotEmpty && (editProductApiResModel.product?.additionalInfo
                                          ?.attributes ??
                                          [])
                                          .isNotEmpty? false : (editProductApiResModel.product?.additionalInfo
                                          ?.productVariants ??
                                          []).isNotEmpty ? false : isUnlimitedStock ? false : true,
                                      child: Expanded(
                                      child: Container(
                                        child: TextFormField(
                                          controller: _inventoryController,
                                          readOnly: (editProductApiResModel.product?.additionalInfo
                                              ?.productVariants ??
                                              []).isNotEmpty && (editProductApiResModel.product?.additionalInfo
                                              ?.attributes ??
                                              [])
                                              .isNotEmpty? false : (editProductApiResModel.product?.additionalInfo
                                              ?.productVariants ??
                                              []).isNotEmpty ? true : isUnlimitedStock ? true : false,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[0-9]"))
                                        ],
                                          decoration: InputDecoration(
                                            labelText: 'Inventory*',
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            _inventoryController.text = value;
                                          },
                                        ),
                                      ),
                                    ),),
                                    SizedBox(width: 16),
      
                                    /// Unlimited Stock Toogle
                                    SizedBox(
                                      height: 24,
                                      width: 45,
                                      child: AnimatedToggleSwitch<bool>.dual(
                                        current: isUnlimitedStock,
                                        first: false,
                                        second: true,
                                        innerColor: isUnlimitedStock
                                            ? AppCol.primary
                                            : Color(0xFFD0D5DD),
                                        dif: 1.0,
                                        borderColor: Colors.transparent,
                                        // borderWidth: 2.0,
                                        // height: 20,
                                        indicatorSize: Size(17, 18),
                                        indicatorColor: Colors.white,
                                        onChanged: (b) {
                                          isUnlimitedStock = b;
                                          SharedPreferenceService.setString('productUnlimitedStockbyId${widget.productId}', isUnlimitedStock == true ? "true" : "false");
                                          debugPrint('My ${widget.productId} stock is unlimited or not: ${SharedPreferenceService.getString("productUnlimitedStockbyId${widget.productId}")}');
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Unlimited Stock',
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24),
      
                                /// Product Category
                                Container(
                                  child: 
                                    DropdownSearch<String>(
          items: (filter, infiniteScrollProps) =>
                      adminCategories,
                      selectedItem: _productCategoryController.text,
             decoratorProps: DropDownDecoratorProps(

             
                  decoration: InputDecoration(
                        labelText: 'Product Category*',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                      ),
          ),
          popupProps: PopupProps.menu(
            showSearchBox: true,
          ),
         // selectedItem: (),
          onChanged: (value) {
            print("Selected: $value");
             print("responce model data   :");
             
    //         productCategoryApiResModel.categories?.forEach((element) {
    //   adminCategories.add(element.title ?? '');
    //   debugPrint('My Admin caetgpry is: $adminCategories');
    // });
           
                
                          adminSubCategories.clear();
                          _productCategoryController.text = value.toString();
                          _productSubCategoryController.text = "";
                          selectedCategoryId = productCategoryApiResModel
                              .categories!.firstWhere((element) => element.title == value)
                              .sId!;
                              debugPrint('res data 1$_productCategoryController.text');
                               debugPrint('res data 2$selectedCategoryId');
                          loadSubCategories(_productCategoryController.text);
                          setState(() {});


                         //  selectedSubCategoryId =
                             //
                             // adminSubCategories[index]['_id'];
                         
                        
          },
        )
                                 
                                 
                                ),
                                SizedBox(height: 24),
      
                          
                          
      
                                /// Product Sub Category
                                Container(
                                  child:
                                       DropdownSearch<String>(
                     // (String? filter) => fetchCategories(filter),
          items: 
          //adminSubCategories.map((e) => e['title'] as String).toList(),
          (filter, infiniteScrollProps) =>
                      fetchCategories(filter),
                      selectedItem: _productSubCategoryController.text,
             decoratorProps: DropDownDecoratorProps(
             
                     decoration: InputDecoration(
                        labelText: 'Product Sub Category*',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                      ),
          ),
          popupProps: PopupProps.menu(
            showSearchBox: true,
          ),
          
          onChanged: (value) {
            print("Selected: $value");
            debugPrint(
                                'My subcategpry list is: $adminSubCategories');
                            _productSubCategoryController.text = value!;
                            selectAdminSubCategories.add(value);
                           
                String? id = findIdByTitle(value);
                   debugPrint('akshay sub category id $id');
                   selectedSubCategoryId = id!;
                              // ;
                            //  debugPrint('selected sub data value $selectedSubCategoryId.text');
                              debugPrint('res data 1$_productCategoryController.text');
                               debugPrint('akshay bug data $adminSubCategories');
                                setState(() {});
          },
        )
                                  
                                 
                                 
                                ),
                                SizedBox(height: 16),
      
                                /// Size chart
                                Container(
                                  padding: EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      /// Display on Store Field
                                      Text(
                                        'Size chart',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 16),
      
                                  
                                  
      
                                      /// Add/Edit button
                                      InkWell(
                                          onTap: () async {
                                            sizeChartFirstTimeData = await openScreenAndReturnValue(
                                                context, SizeChartScreen(
                                              selectImage: (value) {
                                                debugPrint(
                                                    'My wrgfd selected image aws link is: $value');
                                                sizeChart.add(value);
                                                debugPrint(
                                                    'My size chart value is: $sizeChart');
                                              },
                                              productId: widget.productId,
                                            ));
                                            debugPrint(
                                                'My selected image aws link is: ${sizeChartFirstTimeData.customSizeChartImageData}');
                                          },
                                          child: Icon(
                                            Icons.edit_outlined,
                                            color: AppCol.primary,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 24),
      
                                /// Display on Store
                                Container(
                                  padding: EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(14),
                                 
                                 
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      /// Display on Store Field
                                      Text(
                                        'Display on Store',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 16),
      
                                      /// Toggle button
                                      SizedBox(
                                        height: 24,
                                        width: 45,
                                        child: AnimatedToggleSwitch<bool>.dual(
                                          current: isDisplayOn,
                                          first: false,
                                          second: true,
                                          innerColor: isDisplayOn
                                              ? AppCol.primary
                                              : Color(0xFFD0D5DD),
                                          dif: 1.0,
                                          borderColor: Colors.transparent,
                                          // borderWidth: 2.0,
                                          // height: 20,
                                          indicatorSize: Size(17, 18),
                                          indicatorColor: Colors.white,
                                          onChanged: (b) {
                                            isDisplayOn = b;
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 24),
      
                                /// SKU Id field
                                 Container(
            child: TextFormField(
              controller: _SKUIDController,
                     validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'SKU ID is required';
                              }
                              return null;
                            },
              decoration: InputDecoration(
                labelText: 'SKU ID*',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
                                // Container(
                                //   child: TextFormField(
                                //     controller: _SKUIDController,
                                //     decoration: InputDecoration(
                                //       labelText: 'SKU ID',
                                //       floatingLabelBehavior:
                                //           FloatingLabelBehavior.always,
                                //       border: OutlineInputBorder(
                                //         borderRadius: BorderRadius.circular(10),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                SizedBox(height: 24),
      
      
                                Container(
  child: TextFormField(
    controller: _addToCollectionController,
    readOnly: true,
    decoration: InputDecoration(
      labelText: 'Add to Collection (Optional)',
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      suffixIcon: Icon(
        Icons.keyboard_arrow_down_rounded,
      ),
    ),
    onTap: () async {
      final res = await showAdminCollectionModalSheet(context);
      debugPrint('My selected collection: $res');
      _addToCollectionController.text = res.isNotEmpty ? res : 'No Collection';
      selectedNewVariant = _addToCollectionController.text;
    },
  ),
),

                                SizedBox(height: 24),
      
                                /// Product Tags field
                                Container(
  child: TextFormField(
    controller: _productTagsController,
    decoration: InputDecoration(
      labelText: 'Product Tags',
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onChanged: (value) {
      setState(() {
        productTags = value.split(',').map((e) => e.trim()).toList();
      });
    },
    onFieldSubmitted: (value) {
      setState(() {
        productTags = value.split(',').map((e) => e.trim()).toList();
      });
    },
  ),
),

                                // Container(
                                //   child: TextFormField(
                                //     controller: _productTagsController,
                                //     decoration: InputDecoration(
                                //       labelText: 'Product Tags',
                                //       floatingLabelBehavior:
                                //           FloatingLabelBehavior.always,
                                //       border: OutlineInputBorder(
                                //         borderRadius: BorderRadius.circular(10),
                                //       ),
                                //     ),
                                //     onFieldSubmitted: (value) {
                                //       setState(() {
                                //         productTags = value.split(',');
                                        
                                //       });
                                //     },
                                //   ),
                                // ),
                                SizedBox(height: 24),
      
                                /// Add/Manage - Variants/Attributes Text
                                Text(
                                  'Add/Manage - Variants/Attributes',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 24),
      
                                /// Variants Button
                                (editProductApiResModel.product?.additionalInfo
                                                ?.productVariants ??
                                            [])
                                        .isNotEmpty
                                    ? SizedBox()
                                    : InkWell(
                                        onTap: () {
                                          isPageLoading = true;
                                          Future.delayed(Duration(seconds: 2),() {
                                            setState(() {
                                              isPageLoading = false;
                                            });
                                          });
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => ManageVariantsScreen(
                                                  productId:
                                                      "${editProductApiResModel.product?.id}",
                                                  skuid:
                                                      "${editProductApiResModel.product?.skuId}",
                                                  mrp:
                                                      "${editProductApiResModel.product?.mrp}",
                                                  discountPrice:
                                                      "${editProductApiResModel.product?.price}",
                                                  stock:
                                                      "${editProductApiResModel.product?.stock}"),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                                'assets/newIcons/add_out.png',
                                                height: 20,
                                                width: 20),
                                            SizedBox(width: 10),
                                            Text(
                                              'Variants',
                                              style: TextStyle(
                                                color: AppCol.primary,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                SizedBox(
                                    height: (editProductApiResModel
                                                    .product
                                                    ?.additionalInfo
                                                    ?.productVariants ??
                                                [])
                                            .isNotEmpty
                                        ? 0
                                        : 24),
      
                                /// Attributes Button
                                (editProductApiResModel.product?.additionalInfo
                                                ?.attributes ??
                                            [])
                                        .isNotEmpty
                                    ? SizedBox()
                                    : InkWell(
                                        onTap: () {
                                          isPageLoading = true;
                                          Future.delayed(Duration(seconds: 2),() {
                                            setState(() {
                                              isPageLoading = false;
                                            });
                                          });
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ManageAttributesScreen(
                                                      productId:
                                                          "${editProductApiResModel.product?.id}"),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                                'assets/newIcons/add_out.png',
                                                height: 20,
                                                width: 20),
                                            SizedBox(width: 10),
                                            Text(
                                              'Attributes',
                                              style: TextStyle(
                                                color: AppCol.primary,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                SizedBox(
                                    height: (editProductApiResModel
                                                    .product
                                                    ?.additionalInfo
                                                    ?.attributes ??
                                                [])
                                            .isNotEmpty
                                        ? 0
                                        : 24),
      
                                /// Variant view
                                Visibility(
                                  visible: (editProductApiResModel
                                                  .product
                                                  ?.additionalInfo
                                                  ?.productVariants ??
                                              [])
                                          .isNotEmpty
                                      ? true
                                      : false,
                                  child: InkWell(
                                    onTap: () async {
                                       Future.delayed(Duration.zero, () {
  // Safely convert List<dynamic> to List<String>
  List<String> images = List<String>.from(selectedImages);
  List<String> videos = List<String>.from(selectedImages);

  // Add the images to the provider
  ref.read(manageVariantProvider.notifier).addImage(images);
  ref.read(manageVariantProvider.notifier).addImage(videos);
  print("Images added: $images");
});


                                        submitClick.value = true;
                  debugPrint('My real Image is: ${_mrpController.text}');
                  debugPrint('My real Image is: ${_discountPriceController.text}');
                  String? categoryId = "";
                  String? subCategoryId = "";
                  Map<String, dynamic> body = {};
                  selectedImageVideos.clear();
                  for (var images in selectedImages) {
                    debugPrint('My real Image is: $images');
                    /*final res = await awsDocumentUpload(images.path);
                    debugPrint('My Image is: $res');*/
                    selectedImageVideos.add(images);
                    
                  }
                  for (var videos in selectedVideos) {
                    debugPrint('My videos are: $videos');
                    // final res = await awsDocumentUpload(videos.path);
                    selectedImageVideos.add(videos);
                  }
      
                  debugPrint('My all image and videos is: $selectedImageVideos');
                  productCategoryApiResModel.categories?.forEach((element) {
                    if (element.title == _productCategoryController.text) {
                      categoryId = element.sId;
                    }
                  });
                  for (var element in adminSubCategories) {
                    if (element["title"] == _productSubCategoryController.text) {
                      subCategoryId = element["_id"];
                    }
                  }
      
                  manageCollectionApiResModel.collections?.forEach((element) {
                    if (_addToCollectionController.text == element.title) {
                      selectedNewVariant = element.id ?? '';
                      setState(() {});
                    }
                  });
                  isPageLoading = true;
                  Future.delayed(Duration(seconds: 2),() {
                    setState(() {
                      isPageLoading = false;
                    });
                  });
      
                  if(selectedImageVideos.isNotEmpty) {
                    if (selectedNewVariant.isNotEmpty) {
                      debugPrint('My mrp price is: ${_mrpController.text}');
                      debugPrint('My mrp price is: ${_discountPriceController.text}');
                      body = {
                        "title": _productTitleController.text,
                        "description": json,
                        "images": selectedImageVideos.map((e) => e).toList(),
                        "mrp": _mrpController.text,
                        "price": _discountPriceController.text.isNotEmpty ? _discountPriceController.text : "0",
                        "stock": isUnlimitedStock ? 100000 : _inventoryController.text,
                        "unlimitedStock": isUnlimitedStock,
                        "category": categoryId,
                        "subcategory": subCategoryId,
                        "active": isDisplayOn,
                        "skuId": _SKUIDController.text,
                        "productCollection": selectedNewVariant,
                        "tags": productTags,
                        "sizeChart" : sizeChart
                      };
                    }
                    else {
                      debugPrint('My mrp price is: ${_mrpController.text}');
                      debugPrint('My mrp price is: ${_discountPriceController.text}');
                      body = {
                        "title": _productTitleController.text,
                        "description": json,
                        "images": selectedImageVideos.map((e) => e).toList(),
                        "mrp": _mrpController.text,
                        "price": _discountPriceController.text.isNotEmpty ? _discountPriceController.text : "0",
                        "stock": isUnlimitedStock ? 100000 : _inventoryController.text,
                        "unlimitedStock": isUnlimitedStock,
                        "category": categoryId,
                        "subcategory": subCategoryId,
                        "active": isDisplayOn,
                        "skuId": _SKUIDController.text,
                        "tags": productTags,
                        "sizeChart" : sizeChart
                      };
                    }
                    debugPrint('My Final edit body list is: $body');
                    editProductDetailsApiResModel = await _addProductController
                        .editProduct(widget.productId, body);
                    if (editProductDetailsApiResModel.success == true) {

                      // showProductDialog();
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //     content: widget.isFromCatalogue
                      //         ? Text("Product details saved")
                      //         : Text("Product added successfully")));

                      isPageLoading = true;
                                          Future.delayed(Duration(seconds: 2),() {
                                            setState(() {
                                              isPageLoading = false;
                                            });
                                          });
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => ManageVariantsScreen(
                                                  productId:
                                                      "${editProductApiResModel.product?.id}",
                                                  skuid:
                                                      "${editProductApiResModel.product?.skuId}",
                                                  mrp:
                                                      "${editProductApiResModel.product?.mrp}",
                                                  discountPrice:
                                                      "${editProductApiResModel.product?.price}",
                                                  stock:
                                                      "${editProductApiResModel.product?.stock}"),
                                            ),
                                          );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select atleast one image')));
                  }
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) => ManageVariantsScreen(
                                      //         productId:
                                      //             "${editProductApiResModel.product?.id}",
                                      //         skuid:
                                      //             "${editProductApiResModel.product?.skuId}",
                                      //         mrp:
                                      //             "${editProductApiResModel.product?.mrp}",
                                      //         discountPrice:
                                      //             "${editProductApiResModel.product?.price}",
                                      //         stock:
                                      //             "${editProductApiResModel.product?.stock}"),
                                      //   ),
                                      // );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(18),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Text('Variants'),
                                          Spacer(),
                                          Text(
                                            '${editProductApiResModel.product?.additionalInfo?.productVariants?.length} value',
                                            style:
                                                TextStyle(color: AppCol.primary),
                                          ),
                                          SizedBox(width: 10),
                                          Icon(Icons.arrow_forward_ios_rounded,
                                              size: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: (editProductApiResModel
                                                    .product
                                                    ?.additionalInfo
                                                    ?.productVariants ??
                                                [])
                                            .isNotEmpty
                                        ? 24
                                        : 0),
      
                                /// Attributes view
                                Visibility(
                                  visible: (editProductApiResModel.product
                                                  ?.additionalInfo?.attributes ??
                                              [])
                                          .isNotEmpty
                                      ? true
                                      : false,
                                  child: InkWell(
                                    onTap: () async {

    Future.delayed(Duration.zero, () {
  // Safely convert List<dynamic> to List<String>
  List<String> images = List<String>.from(selectedImages);
  List<String> videos = List<String>.from(selectedVideos);

  // Add the images to the provider
  ref.read(manageVariantProvider.notifier).addImage(images);
  ref.read(manageVariantProvider.notifier).addImage(videos);
  print("Images added: $images");
});


                                        submitClick.value = true;
                  debugPrint('My real Image is: ${_mrpController.text}');
                  debugPrint('My real Image is: ${_discountPriceController.text}');
                  String? categoryId = "";
                  String? subCategoryId = "";
                  Map<String, dynamic> body = {};
                  selectedImageVideos.clear();
                  for (var images in selectedImages) {
                    debugPrint('My real Image is: $images');
                    /*final res = await awsDocumentUpload(images.path);
                    debugPrint('My Image is: $res');*/
                    selectedImageVideos.add(images);
                    
                  }
                  for (var videos in selectedVideos) {
                    debugPrint('My videos are: $videos');
                    // final res = await awsDocumentUpload(videos.path);
                    selectedImageVideos.add(videos);
                  }
      
                  debugPrint('My all image and videos is: $selectedImageVideos');
                  productCategoryApiResModel.categories?.forEach((element) {
                    if (element.title == _productCategoryController.text) {
                      categoryId = element.sId;
                    }
                  });
                  for (var element in adminSubCategories) {
                    if (element["title"] == _productSubCategoryController.text) {
                      subCategoryId = element["_id"];
                    }
                  }
      
                  manageCollectionApiResModel.collections?.forEach((element) {
                    if (_addToCollectionController.text == element.title) {
                      selectedNewVariant = element.id ?? '';
                      setState(() {});
                    }
                  });
                  isPageLoading = true;
                  Future.delayed(Duration(seconds: 2),() {
                    setState(() {
                      isPageLoading = false;
                    });
                  });
      
                  if(selectedImageVideos.isNotEmpty) {
                    if (selectedNewVariant.isNotEmpty) {
                      debugPrint('My mrp price is: ${_mrpController.text}');
                      debugPrint('My mrp price is: ${_discountPriceController.text}');
                      body = {
                        "title": _productTitleController.text,
                        "description": json,
                        "images": selectedImageVideos.map((e) => e).toList(),
                        "mrp": _mrpController.text,
                        "price": _discountPriceController.text.isNotEmpty ? _discountPriceController.text : "0",
                        "stock": isUnlimitedStock ? 100000 : _inventoryController.text,
                        "unlimitedStock": isUnlimitedStock,
                        "category": categoryId,
                        "subcategory": subCategoryId,
                        "active": isDisplayOn,
                        "skuId": _SKUIDController.text,
                        "productCollection": selectedNewVariant,
                        "tags": productTags,
                        "sizeChart" : sizeChart
                      };
                    }
                    else {
                      debugPrint('My mrp price is: ${_mrpController.text}');
                      debugPrint('My mrp price is: ${_discountPriceController.text}');
                      body = {
                        "title": _productTitleController.text,
                        "description": json,
                        "images": selectedImageVideos.map((e) => e).toList(),
                        "mrp": _mrpController.text,
                        "price": _discountPriceController.text.isNotEmpty ? _discountPriceController.text : "0",
                        "stock": isUnlimitedStock ? 100000 : _inventoryController.text,
                        "unlimitedStock": isUnlimitedStock,
                        "category": categoryId,
                        "subcategory": subCategoryId,
                        "active": isDisplayOn,
                        "skuId": _SKUIDController.text,
                        "tags": productTags,
                        "sizeChart" : sizeChart
                      };
                    }
                    debugPrint('My Final edit body list is: $body');
                    editProductDetailsApiResModel = await _addProductController
                        .editProduct(widget.productId, body);
                    if (editProductDetailsApiResModel.success == true) {

                            final res = await openScreenAndReturnValue(
                                          context,
                                          ManageAttributesScreen(
                                              productId:
                                                  "${editProductApiResModel.product?.id}"));
                                      /*Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ManageAttributesScreen(
                                        productId: "${editProductApiResModel.product?.id}"),
                                  ),
                                );*/
                                      debugPrint('Mt res is: $res');
                                      if (res == true) {
                                        _future = getProductDetails();
                                      }
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select atleast one image')));
                  }

                                //       final res = await openScreenAndReturnValue(
                                //           context,
                                //           ManageAttributesScreen(
                                //               productId:
                                //                   "${editProductApiResModel.product?.id}"));
                                //       /*Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => ManageAttributesScreen(
                                //         productId: "${editProductApiResModel.product?.id}"),
                                //   ),
                                // );*/
                                //       debugPrint('Mt res is: $res');
                                //       if (res == true) {
                                //         _future = getProductDetails();
                                //       }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(18),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Text('Attributes'),
                                          Spacer(),
                                          Text(
                                            '${editProductApiResModel.product?.additionalInfo?.attributes?.length} value',
                                            style:
                                                TextStyle(color: AppCol.primary),
                                          ),
                                          SizedBox(width: 10),
                                          Icon(Icons.arrow_forward_ios_rounded,
                                              size: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24),
                              ],
                            ),
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

 
 


  Future<void> _pickImage() async {
  Future.delayed(Duration(seconds: 1), () {
  Navigator.pop(context); // Dismiss the bottom sheet
}); // Dismiss the bottom sheet

  // Allow the user to pick multiple images
  final pickedFiles = await ImagePicker().pickMultiImage();

  if (pickedFiles.isNotEmpty) {
    List<XFile> selectedImagesTemp = [];

    // Show loading indicator before processing images
    setState(() {
      // You can define isLoading as a boolean variable
    });


    for (var pickedFile in pickedFiles) {

      setState(() {
        _imageFile = File(pickedFile.path);
      });


      // Open ProImageEditor for each picked image
      final editedImagePath = await Navigator.push(

        context,
        MaterialPageRoute(
          builder: (context) => ProImageEditor.file(
            File(pickedFile.path),

            configs: ProImageEditorConfigs(),
            callbacks: ProImageEditorCallbacks(
              onImageEditingComplete: (editedImageData) async {
  try {
    // Save the image data and get the file path
    final String imagePath = await saveImage(editedImageData);
    print("✅ Image Path: $imagePath");

    // Create a XFile for the edited image
    XFile croppedXFile = XFile(imagePath);

    // Upload the image (ensure that this is awaited before continuing)
    final res = await awsDocumentUpload(croppedXFile.path);
    print("✅ Upload Response: $res");

    // Add the uploaded image to the selectedImages list
    setState(() {
      selectedImages.add(res); // Add the uploaded image reference
    });

    // You can now use the image path (for example, pass it to the previous screen)
    Navigator.pop(context, imagePath);  // Close the editor and return the image path

  } catch (e) {
    print("Error occurred during image processing or upload: $e");

    // Optionally, show an error message to the user
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text("An error occurred while processing the image. Please try again."),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
},


// },

              // onCloseEditor: () {
              //    print("❌ Editing Cancelled");
              //   Navigator.pop(context, null);
              // },
             

            ),
          ),
        ),
      );


      // If the user edited the image, the edited image path is returned
      if (editedImagePath != null) {
        print("✅ Final Edited Image: $editedImagePath");
      }
    }

    // After all images are processed, update the state with the selected images
    setState(() {
      selectedImages.addAll(selectedImagesTemp);
     // Hide loading indicator
    });

    print("✅ All Edited Images: $selectedImages");
  } else {
    print("No images selected.");
  }
}




  /// Add Video in a list
  Future<void> _pickVideo() async {
    try {
      final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
      setState(() {
        isVideoUpload = true;
      });
      if (video != null) {
        File videoFile = File(video.path);

        // Get the video file size in bytes
        int videoFileSize = await videoFile.length();

        // 1 MB = 1,000,000 bytes
        if (videoFileSize > 25000000) {
          // Show a SnackBar if the video size exceeds 1 MB
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Video is bigger than 25 MB, cannot upload!')),
          );
          setState(() {
            isVideoUpload = false;
          });
          Navigator.pop(context);
          return; // Do not upload the video
        } else {
          final res = await awsDocumentUpload(video.path);
          print("Error while picking video: $res");
          setState(() {
            selectedImageVideos.add(res);
            selectedVideos.add(res);
            videoControllers.add(VideoPlayerController.file(File(video.path))
              ..initialize().then((_) {
                setState(() {
                  isVideoUpload = false;
                });
              }));
          });
        }
      }else {
        setState(() {
          isVideoUpload = false;
        });
      }
      Navigator.pop(context);
    } catch (e) {
      print("Error while picking video: $e");
      setState(() {
        isVideoUpload = false;
      });
    }
  }

  /// crop image
  Future<CroppedFile?> _cropImage(File imageToCrop, BuildContext context) async {
    final CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imageToCrop.path,
     // cropStyle: CropStyle.rectangle,
     //compressQuality: 100,
      aspectRatio: CropAspectRatio(ratioX: 4, ratioY: 5),
    
    
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Crop Image',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    return croppedImage;
  }

  /// AWS Document Upload
  Future<String> awsDocumentUpload(String file) async {
    String getFileFromAws = "";
    Map<String, dynamic> body = {};
    body['file'] = file;

    debugPrint('My file is: $file');
    awsFileUploadApiResModel =
        await _addProductController.getDocumentUpload(file);
    if (awsFileUploadApiResModel.success == true) {
      getFileFromAws = awsFileUploadApiResModel.fileUrl ?? '';
    }
    return getFileFromAws;
  }




  Future<bool> getProductDetails() async {
    debugPrint('My user id is: ${_userDetailService.userDetailResponse?.user?.id}');
    // editProductApiResModel = await _addProductController.getProductDetails(
    //     _userDetailService.userDetailResponse?.user?.id.toString(), widget.productId);
    editProductApiResModel = await _addProductController.getProductDetails(
  _userDetailService.userDetailResponse?.user?.id?.toString() ?? '',
  widget.productId
);

    if (editProductApiResModel.success == true) {
      debugPrint('my MRP Price is when it is edit page : ${editProductApiResModel.product?.mrp}');
      debugPrint('my discount price is: ${editProductApiResModel.product?.price}');
      SharedPreferenceService.setString('productUnlimitedStockbyId${widget.productId}', editProductApiResModel.product?.unlimitedStock == true ? "true" : "false" );
      debugPrint("My ${widget.productId} stock is unlimited or not: ${SharedPreferenceService.getString("productUnlimitedStockbyId${widget.productId}")}");
      editProductApiResModel.product?.images?.forEach((element) {
        debugPrint('My value is: $element');
        if(element != "") {
          if(element.contains('.jpg')) {
            selectedImages.add(element);
          } 
          else {
  // Check if the element (video URL) contains the image base URL
  String videoUrl = element;

  if (!videoUrl.contains(AppConstants.imageBaseUrl)) {
    // If the URL doesn't contain the base URL, add AppConstants.imageBaseUrl to it
    videoUrl = AppConstants.imageBaseUrl + videoUrl;
  }

  // Now add the video with the correct (or modified) URL
  selectedVideos.add(videoUrl);
  videoControllers.add(
    VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((value) {
        setState(() {});
      }).catchError((error) {
        // Handle error if the video fails to load
        print("Failed to load video: $error");
      }),
  );
}

          // else {
          //   selectedVideos.add(element);
          //   videoControllers.add(VideoPlayerController.networkUrl(Uri.parse(element))..initialize().then((value) {
          //     setState(() {

          //     });
          //   }));
          // }
        }
      });
      _productTitleController.text =
          editProductApiResModel.product?.title ?? '';
    
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Timer(Duration(seconds: 4), () {
       _productDescriptionController.setText(editProductApiResModel.product?.description ?? '');

});
    
    });
      // _mrpController.text = "${editProductApiResModel.product?.mrp}";
      // _discountPriceController.text = "${editProductApiResModel.product?.price}";
      _mrpController.text = editProductApiResModel.product?.mrp?.toString() ?? '';
_discountPriceController.text = editProductApiResModel.product?.price?.toString() ?? '';

      _inventoryController.text = "${editProductApiResModel.product?.stock}";
      isUnlimitedStock = editProductApiResModel.product?.unlimitedStock ?? false;
      _productCategoryController.text = editProductApiResModel.product?.category?.title ?? '';
      _productSubCategoryController.text = editProductApiResModel.product?.subcategory?.title ?? '';
      isDisplayOn = editProductApiResModel.product?.active ?? false;
      _SKUIDController.text = "${editProductApiResModel.product?.skuId}";
      _addToCollectionController.text =
          editProductApiResModel.product?.productCollection ?? '';
      _productTagsController.text =
          editProductApiResModel.product!.tags!.join(',');
      editProductApiResModel.product!.tags!.forEach((element) {
        productTags.add(element);
      });
      isApiDataAvailable = true;
   

         
      setState(() {});
    }
    return isApiDataAvailable;
   
  }

  /// Load Api data
  Future<bool> loadData() async {
    debugPrint('Step 1');
    productCategoryApiResModel =
        await _productCategoryListController.getCategoryList();
    if (productCategoryApiResModel.success == true) {
      debugPrint('Step 2');
      await loadAdminCategoriesData();
      getCollection();
      // isApiDataAvailable = true;
    } else {
      debugPrint('Step 3');
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text('${productCategoryApiResModel.message}')));
    }
    debugPrint('Step 4');
    setState(() {});
    return isApiDataAvailable;
  }

  /// Load Admin categories data
  loadAdminCategoriesData() {
    debugPrint('My Admin category function');
    productCategoryApiResModel.categories?.forEach((element) {
      adminCategories.add(element.title ?? '');
     // debugPrint('My Admin caetgpry is: $adminCategories');
    });
    isApiDataAvailable = true;
    setState(() {});
  }

  /// add sub categories according to categories
  loadSubCategories(selectedCategories) {
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
  /// 
  Future<String> showAdminCollectionModalSheet(BuildContext context) async {
  final selectedString = Completer<String>();
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
    ),
    builder: (builder) => Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.only(left: 24, right: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 14),
          Text(
            'Select Collection',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14),
          Divider(color: Colors.grey),
          Expanded(
            child: manageCollectionApiResModel.collections?.isNotEmpty ?? false
                ? ListView.builder(
                    itemCount: manageCollectionApiResModel.collections?.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Column(
                      children: [
                        InkWell(
                          onTap: () {
                            selectedString.complete(
                              manageCollectionApiResModel
                                  .collections?[index].title,
                            );
                            selectedCollection = manageCollectionApiResModel
                                    .collections?[index].id ??
                                '';
                            setState(() {});
                            Navigator.pop(context, selectedString);
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10, top: 10),
                            child: Center(
                              child: Text(
                                '${manageCollectionApiResModel.collections?[index].title}',
                              ),
                            ),
                          ),
                        ),
                        Divider(color: Colors.grey),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Text(
                        'No Collection Available',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    ),
  );
  return selectedString.future;
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
                          /*selectedCategoryId.complete(
                              productCategoryApiResModel.categories?[index].sId);*/
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

  /// show admin sub category section modal
  Future<String> showAdminSubCategoryModalSheet(BuildContext context) async {
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
                          selectedSubCategoryId =
                              adminSubCategories[index]['_id'];
                          /*selectedSubCategoryId
                              .complete(adminSubCategories[index]['_id']);*/
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

  /// get collection
 void getCollection() async {
  manageCollectionApiResModel =
      await _manageCollectionController.getAllCollection();
  if (manageCollectionApiResModel.success == true) {
    bool isMatched = false;
    manageCollectionApiResModel.collections?.forEach((element) {
      if (element.id == _addToCollectionController.text) {
        _addToCollectionController.text = element.title ?? '';
        isMatched = true;
      }
    });
    if (!isMatched) {
      _addToCollectionController.text = '';
    }
  }
  isApiDataAvailable = true;
}

  /// add product dialog
  void showProductDialog() {
    showDialog(
      context: context,
      builder: (context) =>
          AddProductDialog(isFromVariant: true, isFromCatalogue: true),
    );
  }
}
