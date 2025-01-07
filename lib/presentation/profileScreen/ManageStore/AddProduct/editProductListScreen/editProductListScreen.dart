import 'dart:async';
import 'dart:io';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swapnil_s_application4/core/app_export.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/awsPhotoUploadApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/deleteProductApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/editProductApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/editProductListApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/manageCollectionApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/productCategoryApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/sizeChartFirstTimeDataModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/viewCategoryApiResModel.dart';
import 'package:swapnil_s_application4/presentation/home/home_view.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/addProductDialog.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/SizeChart/sizeChartScreen.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageCollection/ManageCollectionController/manageCollectionController.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageVariants/manageVariantsScreen.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ProductCategory/ProductCategoryController/productcategoryController.dart';
import 'package:swapnil_s_application4/services/shared_preference_service.dart';
import 'package:video_player/video_player.dart';
import '../../../../../core/utils/commonFun.dart';
import '../../../../../helper/locator.dart';
import '../../../../../helper/user_detail_service.dart';
import '../../ManageAttributes/manageAttributesScreen.dart';

class EditProductListScreen extends StatefulWidget {
  const EditProductListScreen(
      {super.key,
      required this.productId,
      required this.isFrom,
      required this.isFromCatalogue});

  final String productId;
  final String isFrom;
  final bool isFromCatalogue;

  @override
  State<EditProductListScreen> createState() => _EditProductListScreenState();
}

class _EditProductListScreenState extends State<EditProductListScreen> {
  TextEditingController _productTitleController = TextEditingController();
  TextEditingController _productDescriptionController = TextEditingController();
  TextEditingController _mrpController = TextEditingController();
  TextEditingController _discountPriceController = TextEditingController();
  TextEditingController _inventoryController = TextEditingController();
  TextEditingController _productCategoryController = TextEditingController();
  TextEditingController _productSubCategoryController = TextEditingController();
  TextEditingController _SKUIDController = TextEditingController();
  TextEditingController _addToCollectionController = TextEditingController();
  TextEditingController _productTagsController = TextEditingController();
  ViewCategoriesApiResModel viewCategoriesApiResModel =
      ViewCategoriesApiResModel();
  ProductCategoryController _productController = ProductCategoryController();

  final _formKey = GlobalKey<FormState>();

  bool isSizeChart = false;
  bool isUnlimitedStock = false;
  bool isDisplayOn = false;
  bool isAdditionalInformation = false;

  bool isProductPost = false;

  List selectedImages = [];
  List selectedVideos = [];
  List<VideoPlayerController> videoControllers = [];

  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

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

  PageController _pageController = PageController();
  int _currentIndex = 0;

  /// Product Details Model
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  EditProductApiResModel editProductApiResModel = EditProductApiResModel();
  AddProductController _addProductController = AddProductController();

  ProductCategoryApiResModel productCategoryApiResModel =
      ProductCategoryApiResModel();

  DeleteProductApiResModel deleteProductApiResModel =
      DeleteProductApiResModel();

  ProductCategoryController _productCategoryListController =
      ProductCategoryController();

  ManageCollectionApiResModel manageCollectionApiResModel =
      ManageCollectionApiResModel();
  ManageCollectionController _manageCollectionController =
      ManageCollectionController();

  EditProductDetailsApiResModel editProductDetailsApiResModel =
      EditProductDetailsApiResModel();

  AWSFileUploadApiResModel awsFileUploadApiResModel =
      AWSFileUploadApiResModel();

  bool isVideoUpload = false;

  SizeChartFirstTimeData sizeChartFirstTimeData = SizeChartFirstTimeData();

  final ValueNotifier<bool> submitClick = ValueNotifier<bool>(false);

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
    /*_productTitleController.text = '';
    _SKUIDController.text = '';
    _addToCollectionController.text = '';
    _productTagsController.text = '';
   */
  }

  @override
  void dispose() {
    for (final videoController in videoControllers) {
      videoController.dispose();
    }
    super.dispose();
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
        title: Text(
          'Edit Product',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        leading: InkWell(
          onTap: widget.isFromCatalogue
              ? () {
                  Navigator.pop(context);
                }
              : () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        title: Text(
                          'Do you want to delete this product? All your product details will be lost if you delete it.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 1.47,
                          ),
                        ),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// No Button
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 48, vertical: 10),
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 0.50,
                                          color: Color(0xFF3371A5)),
                                      borderRadius: BorderRadius.circular(23),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'No',
                                        style: TextStyle(
                                          color: Color(0xFF3371A5),
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
                                  onTap: () async {
                                    deleteProductApiResModel =
                                        await _addProductController
                                            .deleteProduct(widget.productId);
                                    if (deleteProductApiResModel.success ==
                                        true) {
                                      openScreenWithoutBack(
                                          context,
                                          HomeView(
                                            indexfromPrevious: 1,
                                          ));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Something went wrong')));
                                    }
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 48, vertical: 10),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF3371A5),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 0.50,
                                              color: Color(0xFF3371A5)),
                                          borderRadius:
                                              BorderRadius.circular(23),
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
                adminSubCategories.forEach((element) {
                  if (element["title"] == _productSubCategoryController.text) {
                    subCategoryId = element["_id"];
                  }
                });

                manageCollectionApiResModel.sellerCollections?.forEach((element) {
                  if (_addToCollectionController.text == element.title) {
                    selectedNewVariant = element.sId ?? '';
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
                      "description": _productDescriptionController.text,
                      "images": selectedImageVideos.map((e) => e).toList(),
                      "mrp": _mrpController.text,
                      "price": _discountPriceController.text.isNotEmpty ? _discountPriceController.text : "0",
                      "stock": isUnlimitedStock ? 100000 : _inventoryController.text,
                      "unlimitedStock": isUnlimitedStock,
                      "category": categoryId,
                      "subcategory": subCategoryId,
                      "active": isDisplayOn,
                      "skuId": "${_SKUIDController.text}",
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
                      "description": _productDescriptionController.text,
                      "images": selectedImageVideos.map((e) => e).toList(),
                      "mrp": _mrpController.text,
                      "price": _discountPriceController.text.isNotEmpty ? _discountPriceController.text : "0",
                      "stock": isUnlimitedStock ? 100000 : _inventoryController.text,
                      "unlimitedStock": isUnlimitedStock,
                      "category": categoryId,
                      "subcategory": subCategoryId,
                      "active": isDisplayOn,
                      "skuId": "${_SKUIDController.text}",
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
                                              itemCount: selectedVideos.length != 0 ? selectedImages.length +
                                                  selectedVideos.length : selectedImages.length,
                                              scrollDirection: Axis.horizontal,
                                              controller: _pageController,
                                              itemBuilder: (context, index) {
                                                if (index <
                                                    selectedImages.length) {
                                                  return Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Image.network(
                                                        selectedImages[index],
                                                      ),
                                                      Positioned(
                                                        top: 0,
                                                        right: 0,
                                                        child: Container(
                                                          padding:
                                                          const EdgeInsets
                                                              .all(2),
                                                          decoration:
                                                          BoxDecoration(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                .4),
                                                            shape:
                                                            BoxShape.circle,
                                                          ),
                                                          child: InkWell(
                                                            onTap: () {
                                                              selectedImages.removeAt(index);
                                                              setState(() {});
                                                            },
                                                            child: Center(
                                                              child: Icon(
                                                                Icons
                                                                    .close_rounded,
                                                                color:
                                                                Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  int videoIndex = index -
                                                      selectedImages.length;
                                                  return Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      videoControllers[
                                                                  videoIndex]
                                                              .value
                                                              .isInitialized
                                                          ? Center(
                                                              child:
                                                                  AspectRatio(
                                                                aspectRatio:
                                                                    videoControllers[
                                                                            videoIndex]
                                                                        .value
                                                                        .aspectRatio,
                                                                child: VideoPlayer(
                                                                    videoControllers[
                                                                        videoIndex]),
                                                              ),
                                                            )
                                                          : const Center(
                                                              child:
                                                                  CircularProgressIndicator()),
                                                      Center(
                                                        child: IconButton(
                                                          icon: const Icon(
                                                              Icons.play_arrow,
                                                              color:
                                                                  Colors.white),
                                                          onPressed: () {
                                                            setState(() {
                                                              videoControllers[
                                                                          videoIndex]
                                                                      .value
                                                                      .isPlaying
                                                                  ? videoControllers[
                                                                          videoIndex]
                                                                      .pause()
                                                                  : videoControllers[
                                                                          videoIndex]
                                                                      .play();
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 0,
                                                        right: 0,
                                                        child: Container(
                                                          padding:
                                                          const EdgeInsets
                                                              .all(2),
                                                          decoration:
                                                          BoxDecoration(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                .4),
                                                            shape:
                                                            BoxShape.circle,
                                                          ),
                                                          child: InkWell(
                                                            onTap: () {
                                                              if (index < selectedImages.length) {
                                                                selectedImages.removeAt(index);
                                                              } else {
                                                                int videoIndex = index - selectedImages.length;
                                                                selectedVideos.removeAt(videoIndex);
                                                                videoControllers.removeAt(videoIndex);
                                                              }
                                                              setState(() {
                                                                if (_currentIndex >= selectedImages.length + selectedVideos.length) {
                                                                  _currentIndex = selectedImages.length + selectedVideos.length - 1;
                                                                }
                                                              });
                                                            },
                                                            child: Center(
                                                              child: Icon(
                                                                Icons
                                                                    .close_rounded,
                                                                color:
                                                                Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                          selectedVideos.length != 0 ? DotsIndicator(
                                            dotsCount: selectedImages.length +
                                                selectedVideos.length,
                                            position: _currentIndex.toDouble(),
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
                                            position: _currentIndex.toDouble(),
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
                                  validator: (value) {},
                                ),
                              ),
                              SizedBox(height: 24),

                              /// Product Description Field
                              Container(
                                child: TextFormField(
                                  controller: _productDescriptionController,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    labelText: 'Product Description (optional)',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
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
                                          keyboardType: TextInputType.number,
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
                                          keyboardType: TextInputType.number,
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
                                            errorText: _discountPriceController
                                                        .text.isNotEmpty &&
                                                    double.parse(
                                                            _discountPriceController
                                                                .text) >
                                                        double.parse(
                                                            _mrpController.text)
                                                ? 'Discount price cannot be greater than MRP price'
                                                : null,
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Discount price is required';
                                            } else if (double.parse(value) >
                                                double.parse(
                                                    _mrpController.text)) {
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
                                  Container(
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
                                child: TextFormField(
                                  controller: _productCategoryController,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: 'Product Category*',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                    ),
                                  ),
                                  onTap: () async {
                                    final res =
                                        await showCategoryModalSheet(context);
                                    debugPrint('res $res');
                                    if (res.isNotEmpty) {
                                      adminSubCategories.clear();
                                      _productCategoryController.text = '$res';
                                      _productSubCategoryController.text = "";
                                      selectedCategoryId =
                                          productCategoryApiResModel.categories!
                                              .firstWhere((element) =>
                                                  element.title == res)
                                              .sId!;
                                      loadSubCategories(
                                          _productCategoryController.text);
                                      setState(() {});
                                    }
                                    // _categories[index]['categoryId'].text = '';
                                  },
                                ),
                              ),
                              SizedBox(height: 24),

                              /*/// Want to add a new category?
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductCategoryScreen(),
                            ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/newIcons/add_out.png',
                                  height: 20, width: 20),
                              SizedBox(width: 10),
                              Text(
                                'Want to add a new category?',
                                style: TextStyle(
                                  color: AppCol.primary,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 34),*/

                              /// Product Sub Category
                              Container(
                                child: TextFormField(
                                  controller: _productSubCategoryController,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: 'Product Sub Category',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                    ),
                                  ),
                                  onTap: () async {
                                    final res =
                                        await showAdminSubCategoryModalSheet(
                                            context);
                                    if (res.isNotEmpty) {
                                      if (adminSubCategories.contains(res)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'Subcategory already selected')),
                                        );
                                      } else {
                                        debugPrint(
                                            'My subcategpry list is: $adminSubCategories');
                                        _productSubCategoryController.text =
                                            res;
                                        selectAdminSubCategories.add(res);
                                      }
                                      setState(() {});
                                    }
                                  },
                                ),
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

                                    /// Toggle button
                                    /*Container(
                            height: 24,
                            width: 45,
                            child: AnimatedToggleSwitch<bool>.dual(
                              current: isSizeChart,
                              first: false,
                              second: true,
                              innerColor: isSizeChart
                                  ? AppCol.primary
                                  : Color(0xFFD0D5DD),
                              dif: 1.0,
                              borderColor: Colors.transparent,
                              // borderWidth: 2.0,
                              // height: 20,
                              indicatorSize: Size(17, 18),
                              indicatorColor: Colors.white,
                              onChanged: (b) {
                                isSizeChart = b;
                                setState(() {});
                              },
                            ),
                          ),*/

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
                                  /*boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],*/
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
                                    Container(
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
                                  decoration: InputDecoration(
                                    labelText: 'SKU ID',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 24),

                              /// Add to Collection field
                              Container(
                                child: TextFormField(
                                  controller: _addToCollectionController,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: 'Add to Collection(Optional)',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                    ),
                                  ),
                                  onTap: () async {
                                    final res =
                                        await showAdminCollectionModalSheet(
                                            context);
                                    debugPrint('My selected collection: $res');
                                    _addToCollectionController.text = res;
                                    selectedNewVariant =
                                        _addToCollectionController.text;
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
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onFieldSubmitted: (value) {
                                    setState(() {
                                      productTags = value.split(',');
                                      // _productTagsController.clear(); // Clear the text field
                                    });
                                  },
                                ),
                              ),
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
                                  onTap: () {
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
    );
  }

  /// Add Image in a list
  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final cropImage = await _cropImage(File(image.path), context);
        if (cropImage != null) {
          /*XFile croppedXFile = XFile(cropImage.path);
          setState(() {
            selectedImages.add(croppedXFile); // Add the cropped image, not the original one
          });*/
          final res = await awsDocumentUpload(image.path);
          setState(() {
            selectedImages.add(res);
            selectedImageVideos.add(res);
          });
        }
      }
      Navigator.pop(context);
    } catch (e) {
      print("Error while picking image: $e");
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
      cropStyle: CropStyle.rectangle,
      aspectRatio: CropAspectRatio(ratioX: 4, ratioY: 5),
      /*aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],*/
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
    editProductApiResModel = await _addProductController.getProductDetails(
        _userDetailService.userDetailResponse?.user?.id, widget.productId);
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
          } else {
            selectedVideos.add(element);
            videoControllers.add(VideoPlayerController.networkUrl(Uri.parse(element))..initialize().then((value) {
              setState(() {

              });
            }));
          }
        }
      });
      _productTitleController.text =
          editProductApiResModel.product?.title ?? '';
      _productDescriptionController.text =
          editProductApiResModel.product?.description ?? '';
      _mrpController.text = "${editProductApiResModel.product?.mrp}";
      _discountPriceController.text = "${editProductApiResModel.product?.price}";
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
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${productCategoryApiResModel.message}')));
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
      debugPrint('My Admin caetgpry is: $adminCategories');
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
  Future<String> showAdminCollectionModalSheet(BuildContext context) async {
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
                'Select Collection',
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
                  itemCount:
                      manageCollectionApiResModel.sellerCollections?.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // selectedString = adminCategories[index];
                          selectedString.complete(manageCollectionApiResModel
                              .sellerCollections?[index].title);
                          selectedCollection = manageCollectionApiResModel
                                  .sellerCollections?[index].sId ??
                              '';
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
                                  '${manageCollectionApiResModel.sellerCollections?[index].title}')),
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
                              Center(child: Text('${adminCategories[index]}')),
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
      manageCollectionApiResModel.sellerCollections?.forEach((element) {
        if (element.sId == _addToCollectionController.text) {
          _addToCollectionController.text = element.title ?? '';
        }
      });
      isApiDataAvailable = true;
    } else {
      isApiDataAvailable = true;
    }
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
