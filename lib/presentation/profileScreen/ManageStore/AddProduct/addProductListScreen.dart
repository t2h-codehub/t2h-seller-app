import 'dart:async';
import 'dart:io';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swapnil_s_application4/core/app_export.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/addProductApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/awsPhotoUploadApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/manageCollectionApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/sizeChartFirstTimeDataModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/viewCategoryApiResModel.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/addProductDialog.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/SizeChart/sizeChartScreen.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageCollection/ManageCollectionController/manageCollectionController.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ProductCategory/ProductCategoryController/productcategoryController.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageAttributes/manageAttributesScreen.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageVariants/manageVariantsScreen.dart';
import 'package:swapnil_s_application4/services/shared_preference_service.dart';
import 'package:video_player/video_player.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/productCategoryApiResModel.dart'
    as productCategoryModel;
import '../../../../core/utils/commonFun.dart';
import 'package:mime/mime.dart';

class AddProductListScreen extends StatefulWidget {
  const AddProductListScreen({super.key, this.isFromCatalogue});
  final bool? isFromCatalogue;

  @override
  State<AddProductListScreen> createState() => _AddProductListScreenState();
}

class _AddProductListScreenState extends State<AddProductListScreen> {
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

  List<XFile> selectedImages = [];
  List<XFile> selectedVideos = [];
  List<VideoPlayerController> videoControllers = [];

  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  bool isApiDataAvailable = false;
  late Future _future;

  productCategoryModel.ProductCategoryApiResModel productCategoryApiResModel =
      productCategoryModel.ProductCategoryApiResModel();

  ProductCategoryController _productCategoryListController =
      ProductCategoryController();

  List<String> adminCategories = [];
  List adminSubCategories = [];
  List selectAdminSubCategories = [];

  AppProductApiResModel appProductApiResModel = AppProductApiResModel();
  AddProductController _addProductController = AddProductController();

  ManageCollectionApiResModel manageCollectionApiResModel =
      ManageCollectionApiResModel();
  ManageCollectionController _manageCollectionController =
      ManageCollectionController();

  List selectedImageVideos = [];

  List<String> productTags = [];

  String selectedCategoryId = '';
  String selectedSubCategoryId = '';
  String selectedCollection = '';

  AWSFileUploadApiResModel awsFileUploadApiResModel =
      AWSFileUploadApiResModel();

  PageController _pageController = PageController();
  int _currentIndex = 0;
  int selectedItemsIndex = 0;
  List<XFile> totalSelectedImageVideos = [];


  String selectedNewVariant = "";

  bool isProductAdd = false;

  List sizeChart = [];

  final ValueNotifier<bool> variantClick = ValueNotifier<bool>(false);
  final ValueNotifier<bool> attributeClick = ValueNotifier<bool>(false);
  final ValueNotifier<bool> submitClick = ValueNotifier<bool>(false);
  bool isVideoUpload = false;

  SizeChartFirstTimeData sizeChartFirstTimeData = SizeChartFirstTimeData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = loadData();
    _productTitleController.text = '';
    _SKUIDController.text = '';
    _addToCollectionController.text = '';
    _productTagsController.text = '';
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    for (final videoController in videoControllers) {
      videoController.dispose();
      isProductAdd = false;
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
          'Add Product',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          /// View Hello Store Button
          InkWell(
            onTap: () async {
              submitClick.value = true;
              selectedImageVideos.clear();
              for (var images in selectedImages) {
                debugPrint('My real Image is: ${images.path}');
                final res = await awsDocumentUpload(images.path);
                debugPrint('My Image is: $res');
                selectedImageVideos.add(res);
              }
              for (var videos in selectedVideos) {
                final res = await awsDocumentUpload(videos.path);
                selectedImageVideos.add(res);
              }

              debugPrint('My images updated url is: $selectedImageVideos');

              manageCollectionApiResModel.sellerCollections?.forEach((element) {
                if (_addToCollectionController.text == element.title) {
                  selectedNewVariant = element.sId ?? '';
                  setState(() {});
                }
              });
              if (selectedImageVideos.isNotEmpty) {
                if (_formKey.currentState!.validate()) {
                  if(selectedNewVariant.isNotEmpty) {
                    addProduct({
                      "title": _productTitleController.text,
                      "description": _productDescriptionController.text,
                      "images": selectedImageVideos.map((e) => e).toList(),
                      "mrp": _mrpController.text,
                      "price": _discountPriceController.text.isEmpty ? 0 : _discountPriceController.text,
                      "stock": isUnlimitedStock ? 100000 : _inventoryController.text,
                      "unlimitedStock": isUnlimitedStock,
                      "category": selectedCategoryId,
                      "subcategory": selectedSubCategoryId,
                      "active": isDisplayOn,
                      "skuId": _SKUIDController.text.isEmpty ? "" : _SKUIDController.text,
                      "productCollection": selectedNewVariant,
                      "tags": productTags,
                      "sizeChart" : sizeChart
                    }, false);
                  } else {
                    addProduct({
                      "title": _productTitleController.text,
                      "description": _productDescriptionController.text,
                      "images": selectedImageVideos.map((e) => e).toList(),
                      "mrp": _mrpController.text,
                      "price": _discountPriceController.text.isEmpty ? 0 : _discountPriceController.text,
                      "stock": isUnlimitedStock ? 100000 : _inventoryController.text,
                      "unlimitedStock": isUnlimitedStock,
                      "category": selectedCategoryId,
                      "subcategory": selectedSubCategoryId,
                      "active": isDisplayOn,
                      "skuId": _SKUIDController.text.isEmpty ? "" : _SKUIDController.text,
                      "tags": productTags,
                      "sizeChart" : sizeChart
                    }, false);
                  }
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
                        color: value ? Colors.grey :  AppCol.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
      body: isProductAdd ? Center(child: CircularProgressIndicator(),) : isVideoUpload ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),

                /// Image View
                selectedImages.isEmpty && selectedVideos.isEmpty
                    ? Center(
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/newIcons/emptyImage.png',
                            height: MediaQuery.of(context).size.height * 0.25,
                            // width: MediaQuery.of(context).size.width / 1.8,
                          ),
                        ),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Expanded(
                              child: PageView.builder(
                                itemCount: totalSelectedImageVideos.length,
                                // selectedImages.length +
                                //     selectedVideos.length,
                                scrollDirection: Axis.horizontal,
                                controller: _pageController,
                                // reverse: true,
                                itemBuilder: (context, index) {
                                  String fileExtension = totalSelectedImageVideos[index].path.split('.').last.toLowerCase();
                                  if (fileExtension == 'mp4' || fileExtension == 'mov') {
                                    // Assuming video files have .mp4 or .mov extensions
                                    VideoPlayerController videoController = VideoPlayerController.file(File(totalSelectedImageVideos[index].path))
                                      ..initialize().then((_) {
                                        setState(() {});
                                      });

                                    return Stack(
                                      children: [
                                        Center(
                                          child: AspectRatio(
                                              aspectRatio: videoController.value.aspectRatio,
                                              child: VideoPlayer(videoController)),
                                        ),
                                        Center(
                                          child: IconButton(
                                            icon: Icon(
                                              videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (videoController.value.isPlaying) {
                                                  videoController.pause();
                                                } else {
                                                  videoController.play();
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    // Display image
                                    return Image.file(File(totalSelectedImageVideos[index].path));
                                  }
                                  /*if (index < selectedImages.length) {
                                    return Image.file(
                                        File(selectedImages[index].path));
                                  } else {
                                    int videoIndex =
                                        index - selectedImages.length;
                                    return Stack(
                                      children: [
                                        videoControllers[videoIndex]
                                                .value
                                                .isInitialized
                                            ? Center(
                                                child: AspectRatio(
                                                  aspectRatio: videoControllers[
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
                                            icon: const Icon(Icons.play_arrow,
                                                color: Colors.white),
                                            onPressed: () {
                                              setState(() {
                                                videoControllers[videoIndex]
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
                                      ],
                                    );
                                  }*/
                                },
                              ),
                            ),
                            DotsIndicator(
                              dotsCount: selectedItemsIndex,
                                  // selectedImages.length + selectedVideos.length,
                              position: _currentIndex.toDouble(),
                              decorator: DotsDecorator(
                                size: const Size.square(9.0),
                                activeSize: const Size(18.0, 9.0),
                                activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
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
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 4),
                            Container(
                              height: 6,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.4),
                                borderRadius: BorderRadius.circular(50),
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
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.1),
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
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.1),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.video_camera_back_rounded),
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: 'Product Title*',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      return validateProductTitle(value!);
                    },
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                /// MRP and Discount Price Row
                Row(
                  children: [
                    /// MRP Field
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: _mrpController,
                          // initialValue: '₹ ${_mrpController.text}',
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'MRP price is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'MRP (inc GST)*',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                          decoration: InputDecoration(
                            labelText: 'Discounted Price',
                            errorText: _discountPriceController
                                        .text.isNotEmpty &&
                                    double.parse(
                                            _discountPriceController.text) >
                                        double.parse(_mrpController.text)
                                ? 'Discount price cannot be greater than MRP price'
                                : null,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if(_mrpController.text.isNotEmpty && _discountPriceController.text.isNotEmpty) {
                              if (double.parse(value!) >
                                  double.parse(_mrpController.text)) {
                                return 'Discount price cannot be greater than MRP price';
                              }
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
                SizedBox(height: 24),

                /// Inventory and unlimited stock button
                Row(
                  children: [
                    /// Inventory Field
                    Visibility(
                      visible: isUnlimitedStock ? false : true,
                      child: Expanded(
                        child: Container(
                          child: TextFormField(
                            controller: _inventoryController,
                            // initialValue: '₹ ${_inventoryController.text}',
                            keyboardType: TextInputType.number,
                            readOnly: isUnlimitedStock ? true : false,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: isUnlimitedStock ? (value) {}: (value) {
                              if(!isUnlimitedStock) {
                                if (value != null && value.isEmpty) {
                                  return 'Fill the inventory quqantity';
                                }
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Inventory*',
                              labelStyle: TextStyle(
                                  color: isUnlimitedStock
                                      ? Colors.grey
                                      : AppCol.primary),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: isUnlimitedStock
                                      ? Colors.grey
                                      : AppCol.primary,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              _inventoryController.text = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),

                    /// Unlimited inventory toggle
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                      ),
                    ),
                    onTap: () async {
                      final res = await showCategoryModalSheet(context);
                      debugPrint('res $res');
                      if (res.isNotEmpty) {
                        adminSubCategories.clear();
                        _productCategoryController.text = '$res';
                        _productSubCategoryController.text = "";
                        selectedCategoryId = productCategoryApiResModel
                            .categories!.firstWhere((element) => element.title == res)
                            .sId!;
                        loadSubCategories(_productCategoryController.text);
                        setState(() {});
                      }
                      // _categories[index]['categoryId'].text = '';
                    },
                  ),
                ),
                SizedBox(height: 24),

                /// Want to add a new category?
                /*InkWell(
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                      ),
                    ),
                    onTap: _productCategoryController.text.isEmpty ? () {} : () async {
                      final res = await showAdminSubCategoryModalSheet(context);
                      if (res.isNotEmpty) {
                        if (adminSubCategories.contains(res)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Subcategory already selected')),
                          );
                        } else {
                          debugPrint(
                              'My subcategpry list is: $adminSubCategories');
                          _productSubCategoryController.text = res;
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                context,
                                SizeChartScreen(
                                  selectImage: (value) {
                                    debugPrint('My selected image aws link is: $value');
                                  },
                                  productId: '',
                                ));
                            // debugPrint('My res value isdfhbhjdf: ${res['genderData']}');
                            debugPrint('My res value isdfhbhjdf: ${sizeChartFirstTimeData.genderData}');
                            debugPrint('My res value isdfhbhjdf: ${sizeChartFirstTimeData.categoryData}');
                            debugPrint('My res value isdfhbhjdf: ${sizeChartFirstTimeData.sizeInchOrCm}');
                            debugPrint('My res value isdfhbhjdf: ${sizeChartFirstTimeData.sizeChartImageData}');
                            debugPrint('My res value isdfhbhjdf: ${sizeChartFirstTimeData.customSizeChartImageData}');
                            sizeChart.add(sizeChartFirstTimeData.customSizeChartImageData);
                            debugPrint('My sizechart data is: $sizeChart');
                            setState(() {});
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          innerColor:
                              isDisplayOn ? AppCol.primary : Color(0xFFD0D5DD),
                          dif: 1.0,
                          borderColor: Colors.transparent,
                          // borderWidth: 2.0,
                          // height: 20,
                          indicatorSize: Size(17, 18),
                          indicatorColor: Colors.white,
                          onChanged: (b) {
                            isDisplayOn = b;
                            setState(() {});
                            debugPrint('My display on store is: $isDisplayOn');
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
                      labelText: 'SKU ID (Optional)',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
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
                      _addToCollectionController.text = res;
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
                      labelText: 'Product Tags (Optional)',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
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
                InkWell(
                  onTap: () async {
                    variantClick.value = true;
                    setState(() {
                      isProductAdd = true;
                    });
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        isProductAdd = false;
                      });
                    });
                    selectedImageVideos.clear();
                    for (var images in selectedImages) {
                      debugPrint('My real image path is: ${images.path}');
                      final res = await awsDocumentUpload(images.path);
                      debugPrint('My result aws image is: $res');
                      selectedImageVideos.add(res);
                    }
                    for (var videos in selectedVideos) {
                      final res = await awsDocumentUpload(videos.path);
                      selectedImageVideos.add(res);
                    }

                    debugPrint('My images updated url is: $selectedImageVideos');

                    manageCollectionApiResModel.sellerCollections
                        ?.forEach((element) {
                      if (_addToCollectionController.text == element.title) {
                        selectedNewVariant = element.sId ?? '';
                        setState(() {});
                      }
                    });
                    if (selectedImageVideos.isNotEmpty) {
                      if(_productTitleController.text.isNotEmpty){
                        if(_productDescriptionController.text.isNotEmpty) {
                          if(_mrpController.text.isNotEmpty) {
                            if(_inventoryController.text.isNotEmpty) {
                              if(selectedNewVariant != "") {
                                debugPrint('My selected mrp price is: ${_mrpController.text}');
                                debugPrint('My selected mrp discount price is: ${_discountPriceController.text}');
                                addProduct({
                                  "title": _productTitleController.text,
                                  "description": _productDescriptionController.text,
                                  "images": selectedImageVideos.map((e) => e).toList(),
                                  "mrp": _mrpController.text,
                                  "price": _discountPriceController.text.isEmpty ? 0 : _discountPriceController.text,
                                  "stock":
                                  isUnlimitedStock ? 0 : _inventoryController.text,
                                  "unlimitedStock": isUnlimitedStock,
                                  "category": selectedCategoryId,
                                  "subcategory": selectedSubCategoryId,
                                  "active": isDisplayOn,
                                  "skuId": _SKUIDController.text.isEmpty ? "" : _SKUIDController.text,
                                  "productCollection": selectedNewVariant,
                                  "tags": productTags,
                                  "sizeChart" : sizeChart
                                }, true);
                              }
                              else {
                                addProduct({
                                  "title": _productTitleController.text,
                                  "description": _productDescriptionController.text,
                                  "images": selectedImageVideos.map((e) => e).toList(),
                                  "mrp": _mrpController.text,
                                  "price": _discountPriceController.text.isEmpty ? 0 : _discountPriceController.text,
                                  "stock":
                                  isUnlimitedStock ? 0 : _inventoryController.text,
                                  "unlimitedStock": isUnlimitedStock,
                                  "category": selectedCategoryId,
                                  "subcategory": selectedSubCategoryId,
                                  "active": isDisplayOn,
                                  "skuId": _SKUIDController.text.isEmpty ? "" : _SKUIDController.text,
                                  "tags": productTags,
                                  "sizeChart" : sizeChart
                                }, true);
                                /*addAttributeWithProduct({
                            "title": _productTitleController.text,
                            "description": _productDescriptionController.text,
                            "images": selectedImageVideos.map((e) => e).toList(),
                            "mrp": _mrpController.text,
                            "price": _discountPriceController.text,
                            "stock":
                            isUnlimitedStock ? 0 : _inventoryController.text,
                            "unlimitedStock": isUnlimitedStock,
                            "category": selectedCategoryId,
                            "subcategory": selectedSubCategoryId,
                            "active": isDisplayOn,
                            "skuId": _SKUIDController.text.isEmpty ? "" : _SKUIDController.text,
                            "tags": productTags,
                            "sizeChart" : sizeChart
                          });*/
                              }
                            }
                            else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('Please fill the inventory quantity')));
                            }
                          }
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Please fill the MRP price')));
                          }
                        }
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Please fill the product description')));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please fill the product title')));
                      }
                      // if (_formKey.currentState.validate()) {
                      //
                      // }
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please select atleast one image')));
                    }
                  },
                  child: ValueListenableBuilder(
                    valueListenable: variantClick,
                    builder: (context, value, child) {
                      Future.delayed(Duration(seconds: 3), () {
                        variantClick.value = false;
                      },);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/newIcons/add_out.png',
                              height: 20, width: 20),
                          SizedBox(width: 10),
                          Text(
                            'Variants',
                            style: TextStyle(
                              color: value ? Colors.grey : AppCol.primary,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                ),
                SizedBox(height: 24),

                /// Attributes Button
                InkWell(
                  onTap: () async {
                    attributeClick.value = true;
                    setState(() {
                      isProductAdd = true;
                    });
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        isProductAdd = false;
                      });
                    });
                    selectedImageVideos.clear();
                    for (var images in selectedImages) {
                      final res = await awsDocumentUpload(images.path);
                      selectedImageVideos.add(res);
                    }
                    for (var videos in selectedVideos) {
                      final res = await awsDocumentUpload(videos.path);
                      selectedImageVideos.add(res);
                    }

                    debugPrint(
                        'My images updated url is: $selectedImageVideos');

                    manageCollectionApiResModel.sellerCollections
                        ?.forEach((element) {
                      if (_addToCollectionController.text == element.title) {
                        selectedNewVariant = element.sId ?? '';
                        debugPrint('My selected new variant: $selectedNewVariant');
                        setState(() {});
                      }
                    });
                    if (selectedImageVideos.isNotEmpty) {
                      if (_productTitleController.text.isNotEmpty) {
                        if(_productDescriptionController.text.isNotEmpty) {
                          if(_mrpController.text.isNotEmpty) {
                            if(_inventoryController.text.isNotEmpty) {
                              if(selectedNewVariant != "") {
                                debugPrint('My Add Product From Variant Button MRP is: ${_mrpController.text}');
                                debugPrint('My Add Product From Variant Button price is: ${_discountPriceController.text}');
                                addAttributeWithProduct({
                                  "title": _productTitleController.text,
                                  "description": _productDescriptionController.text,
                                  "images": selectedImageVideos.map((e) => e).toList(),
                                  "mrp": _mrpController.text,
                                  "price": _discountPriceController.text.isEmpty ? 0 : _discountPriceController.text,
                                  "stock":
                                  isUnlimitedStock ? 0 : _inventoryController.text,
                                  "unlimitedStock": isUnlimitedStock,
                                  "category": selectedCategoryId,
                                  "subcategory": selectedSubCategoryId,
                                  "active": isDisplayOn,
                                  "skuId": _SKUIDController.text.isEmpty ? "" : _SKUIDController.text,
                                  "productCollection": selectedNewVariant,
                                  "tags": productTags,
                                  "sizeChart" : sizeChart
                                });
                              }
                              else {
                                debugPrint('My Add Product From Variant Button MRP is: ${_mrpController.text}');
                                debugPrint('My Add Product From Variant Button price is: ${_discountPriceController.text}');
                                addAttributeWithProduct({
                                  "title": _productTitleController.text,
                                  "description": _productDescriptionController.text,
                                  "images": selectedImageVideos.map((e) => e).toList(),
                                  "mrp": _mrpController.text,
                                  "price": _discountPriceController.text.isEmpty ? 0 : _discountPriceController.text,
                                  "stock":
                                  isUnlimitedStock ? 0 : _inventoryController.text,
                                  "unlimitedStock": isUnlimitedStock,
                                  "category": selectedCategoryId,
                                  "subcategory": selectedSubCategoryId,
                                  "active": isDisplayOn,
                                  "skuId": _SKUIDController.text.isEmpty ? "" : _SKUIDController.text,
                                  // "productCollection": selectedNewVariant,
                                  "tags": productTags,
                                  "sizeChart" : sizeChart
                                });
                              }
                            }
                            else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('Please fill the inventory quantity')));
                            }
                          }
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Please fill the MRP price')));
                          }
                        }
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Please fill the product description')));
                        }
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please fill the product title')));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please select atleast one image')));
                    }
                  },
                  child: ValueListenableBuilder(
                    valueListenable: attributeClick,
                    builder: (context, value, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/newIcons/add_out.png',
                              height: 20, width: 20),
                          SizedBox(width: 10),
                          Text(
                            'Attributes',
                            style: TextStyle(
                              color: value ? Colors.grey : AppCol.primary,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Add Image in a list
  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final cropImage = await _cropImage(File(image.path), context);
        if (cropImage != null) {
          XFile croppedXFile = XFile(cropImage.path);
          setState(() {
            selectedImages.add(croppedXFile); // Add the cropped image, not the original one
            totalSelectedImageVideos.add(croppedXFile);
          });

          // String? mimeType = lookupMimeType(cropImage.path); // e.g., "image/jpeg"
          // if (mimeType != null) {
          //   String fileType = mimeType.split('/').last; // e.g., "image"
          //   print("File type: $fileType");
          // }
        }
        selectedItemsIndex = selectedImages.length + selectedVideos.length;
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

        if (videoFileSize > 25000000) {
          // Show a SnackBar if the video size exceeds 1 MB
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Video is bigger than 25 MB, cannot upload!')),
          );
          setState(() {
            isVideoUpload = false;
          });
          Navigator.pop(context);
          return;
        } else {
          setState(() {
            selectedVideos.add(video);
            totalSelectedImageVideos.add(video);
            isVideoUpload = false;
            // videoControllers.add(VideoPlayerController.file(File(video.path))
            //   ..initialize().then((_) {
            //     setState(() {
            //       isVideoUpload = false;
            //     });
            //   }));
          });
        }
      } else {
        setState(() {
          isVideoUpload = false;
        });
      }
      selectedItemsIndex = selectedImages.length + selectedVideos.length;
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
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
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

  /// add product
  void addProduct(Map<String, dynamic> body, bool isComeVariant) async {
    isProductAdd = true;
    debugPrint('My payload body is: $body');
    if(isProductAdd) {
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          isProductAdd = false;
        });
      });
    }
    // Map<String, dynamic> body = {};
    appProductApiResModel = await _addProductController.addSellerProduct(body);
    if (appProductApiResModel.success == true) {
      debugPrint('My product id is: ${appProductApiResModel.product?.sId}');
      SharedPreferenceService.setString('productUnlimitedStockbyId${appProductApiResModel.product?.sId}', isUnlimitedStock == true ? "true" : "false");
      SharedPreferenceService.setString('mySizeChartGenderIsByProductId/${appProductApiResModel.product?.sId}', sizeChartFirstTimeData.genderData ?? '');
      SharedPreferenceService.setString('mySizeChartCategoryIsByProductId/${appProductApiResModel.product?.sId}', sizeChartFirstTimeData.categoryData ?? '');
      SharedPreferenceService.setString('mySizeChartImageIsByProductId/${appProductApiResModel.product?.sId}', sizeChartFirstTimeData.sizeChartImageData ?? '');
      SharedPreferenceService.setString('mySizeChartInchOrCMIsByProductId/${appProductApiResModel.product?.sId}', sizeChartFirstTimeData.sizeInchOrCm ?? '');
      SharedPreferenceService.setString('mySizeChartCustomImageIsByProductId/${appProductApiResModel.product?.sId}', sizeChartFirstTimeData.customSizeChartImageData ?? '');
      if (isComeVariant) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ManageVariantsScreen(
                productId: "${appProductApiResModel.product?.sId}",
                skuid: "${appProductApiResModel.product?.skuId}",
                mrp: "${appProductApiResModel.product?.mrp}",
                discountPrice: "${appProductApiResModel.product?.price}",
                stock: "${appProductApiResModel.product?.stock}"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Product Added Successfully')));
        showProductDialog();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Something went wrong')));
    }
  }

  /// add product
  void addAttributeWithProduct(Map<String, dynamic> body) async {
    isProductAdd = true;
    debugPrint('My payload body is: $body');
    if(isProductAdd) {
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          isProductAdd = false;
        });
      });
    }
    // Map<String, dynamic> body = {};
    appProductApiResModel = await _addProductController.addSellerProduct(body);
    if (appProductApiResModel.success == true) {
      debugPrint('My product id is: ${appProductApiResModel.product?.sId}');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ManageAttributesScreen(
              productId: "${appProductApiResModel.product?.sId}"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${appProductApiResModel.message}')));
    }
  }

  /// add product dialog
  void showProductDialog() {
    showDialog(
      context: context,
      builder: (context) => AddProductDialog(),
    );
  }

  /// get collection
  void getCollection() async {
    manageCollectionApiResModel =
        await _manageCollectionController.getAllCollection();
    if (manageCollectionApiResModel.success == true) {
      isApiDataAvailable = true;
    } else {
      isApiDataAvailable = true;
    }
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

  /// Validate Product Title
  String? validateProductTitle(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Product title is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Title must be a-z and A-Z";
    }
    return null;
  }

}
