import 'dart:async';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swapnil_s_application4/core/app_export.dart';
import 'package:swapnil_s_application4/core/utils/commonFun.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/addProductApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/awsPhotoUploadApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/editProductApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/manageCollectionApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/productCategoryApiResModel.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/addProductDialog.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/SizeChart/sizeChartScreen.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageAttributes/manageAttributesScreen.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageCollection/ManageCollectionController/manageCollectionController.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageVariants/manageVariantsScreen.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ProductCategory/ProductCategoryController/productcategoryController.dart';
import 'package:video_player/video_player.dart';

class InstagramAddProductScreen extends StatefulWidget {
  const InstagramAddProductScreen({super.key, required this.imageMedia, required this.descriptionCaption, required this.isVideo});
  final String imageMedia;
  final String descriptionCaption;
  final bool isVideo;

  @override
  State<InstagramAddProductScreen> createState() => _InstagramAddProductScreenState();
}

class _InstagramAddProductScreenState extends State<InstagramAddProductScreen> {
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

  ProductCategoryApiResModel productCategoryApiResModel = ProductCategoryApiResModel();
  EditProductDetailsApiResModel editProductDetailsApiResModel = EditProductDetailsApiResModel();

  AddProductController _addProductController = AddProductController();
  PageController _pageController = PageController();
  List<VideoPlayerController> videoControllers = [];
  int _currentIndex = 0;

  final _formKey = GlobalKey<FormState>();

  bool isApiDataAvailable = false;

  bool isDisplayOn = false;
  bool isUnlimitedStock = false;

  List selectedImageVideos = [];

  List adminSubCategories = [];
  List<String> productTags = [];
  List<String> adminCategories = [];
  List selectAdminSubCategories = [];
  List selectedImages = [];
  List selectedVideos = [];

  List sizeChart = [];
  String selectedNewVariant = "";

  String selectedCategoryId = '';
  String selectedSubCategoryId = '';
  String selectedCollection = '';

  bool isProductAdd = false;

  AWSFileUploadApiResModel awsFileUploadApiResModel = AWSFileUploadApiResModel();

  ManageCollectionApiResModel manageCollectionApiResModel = ManageCollectionApiResModel();
  ManageCollectionController _manageCollectionController = ManageCollectionController();

  AppProductApiResModel appProductApiResModel = AppProductApiResModel();
  ProductCategoryController _productCategoryListController = ProductCategoryController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    loadAdminCategoriesData();
    getCollection();
  }

  void loadData() async {
    debugPrint('My instagram image url is: ${widget.imageMedia}');
    debugPrint('My instagram image url is: ${widget.isVideo}');
    selectedImages.add(widget.imageMedia);
    if (widget.isVideo) {
      videoControllers.add(VideoPlayerController.networkUrl(Uri.parse(widget.imageMedia)));
      videoControllers.last.initialize().then((_) {

      });
    }
   /* if (widget.isVideo) {
      selectedVideos.add(widget.imageMedia);
    } else {
      selectedImages.add(widget.imageMedia);
    }*/
    _productDescriptionController.text = widget.descriptionCaption;
    productCategoryApiResModel = await _productCategoryListController.getCategoryList();
    if (productCategoryApiResModel.success == true) {
      await loadAdminCategoriesData();
      getCollection();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${productCategoryApiResModel.message}')));
    }
    setState(() {});
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
                      'Are you sure to discard this product',
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
                                /*deleteProductApiResModel = await _addProductController.deleteProduct(widget.productId);
                                if(deleteProductApiResModel.success == true) {
                                  openScreenWithoutBack(context, HomeView(indexfromPrevious: 1,));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(content: Text('Something went wrong')));
                                }*/
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
        actions: [
          /// View Hello Store Button
          InkWell(
            onTap: () async {
              // selectedImageVideos.clear();
              selectedImageVideos.clear();
              for (var images in selectedImages) {
                debugPrint('My real Image is: $images');
                selectedImageVideos.add(images);
              }
              /*for (var videos in selectedVideos) {
                final res = await awsDocumentUpload(videos.path);
                selectedImageVideos.add(res);
              }*/

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
                      "price": _discountPriceController.text,
                      "stock": isUnlimitedStock ? 0 : _inventoryController.text,
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
                      "price": _discountPriceController.text,
                      "stock": isUnlimitedStock ? 0 : _inventoryController.text,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),

                /// Image View
                selectedImages.isEmpty
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
                      height: MediaQuery.of(context).size.height *
                          0.25,
                      // width: MediaQuery.of(context).size.width / 1.8,
                    ),
                  ),
                )
                    : Container(
                  height:
                  MediaQuery.of(context).size.height * 0.25,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          itemCount: selectedImages.length,
                          scrollDirection: Axis.horizontal,
                          controller: _pageController,
                          itemBuilder: (context, index) {
                            debugPrint('My images list ifdgdfgdfhfds: $selectedImages');
                            if (index < selectedImages.length) {
                              int videoIndex = index - selectedImageVideos.length;
                              return widget.isVideo ? Center(
                                  child: AspectRatio(
                                    aspectRatio: videoControllers[videoIndex].value.aspectRatio,
                                    child: VideoPlayer(videoControllers[videoIndex]),
                                  )) : Image.network(selectedImages[index]);
                            } else {
                              int videoIndex = index - selectedImageVideos.length;
                              return Stack(
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
                                      icon: const Icon(
                                          Icons.play_arrow,
                                          color: Colors.white),
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
                                ],
                              );
                            }
                          },
                        ),
                      ),
                      DotsIndicator(
                        dotsCount: selectedImages.length,
                        position: _currentIndex.toDouble(),
                        decorator: DotsDecorator(
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(5.0)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),

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
                Row(
                  children: [
                    /// MRP Field
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: _mrpController,
                          // initialValue: '₹ ${_mrpController.text}',
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'MRP (inc GST)*',
                            floatingLabelBehavior:
                            FloatingLabelBehavior.always,
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
                                    _discountPriceController
                                        .text) >
                                    double.parse(
                                        _mrpController.text)
                                ? 'Discount price cannot be greater than MRP price'
                                : null,
                            floatingLabelBehavior:
                            FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Discount price is required';
                            } else if (double.parse(value) >
                                double.parse(_mrpController.text)) {
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
                SizedBox(height: 24),

                /// Inventory and unlimited stock button
                Row(
                  children: [
                    /// Inventory Field
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: _inventoryController,
                          // initialValue: '₹ ${_inventoryController.text}',
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Inventory*',
                            floatingLabelBehavior:
                            FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {
                            _inventoryController.text = value;
                          },
                        ),
                      ),
                    ),
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

                      /// Add/Edit button
                      InkWell(
                          onTap: () {
                            final res = openScreenAndReturnValue(
                                context, SizeChartScreen(
                              selectImage: (value) {
                                debugPrint(
                                    'My selected image aws link is: $value');
                              },
                              productId: '',
                            ));
                            debugPrint(
                                'My selected image aws link is: $res');
                            /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SizeChartScreen(),
                                    ),
                                  );*/
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
                InkWell(
                  onTap: () async {
                    selectedImageVideos.clear();
                    for (var images in selectedImages) {
                      selectedImageVideos.add(images);
                    }
                    /*for (var videos in selectedVideos) {
                      final res = await awsDocumentUpload(videos.path);
                      selectedImageVideos.add(res);
                    }*/

                    debugPrint(
                        'My images updated url is: $selectedImageVideos');

                    manageCollectionApiResModel.sellerCollections
                        ?.forEach((element) {
                      if (_addToCollectionController.text == element.title) {
                        selectedNewVariant = element.sId ?? '';
                        setState(() {});
                      }
                    });
                    if (selectedImageVideos.isNotEmpty) {
                      if (_formKey.currentState!.validate()) {
                        if(selectedNewVariant != "") {
                          debugPrint('My selected mrp price is: ${_mrpController.text}');
                          debugPrint('My selected mrp discount price is: ${_discountPriceController.text}');
                          addProduct({
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
                            "productCollection": selectedNewVariant,
                            "tags": productTags,
                            "sizeChart" : sizeChart
                          }, true);
                        } else {
                          addProduct({
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
                            // selectedNewVariant.isNotEmpty ? "productCollection": selectedNewVariant : null,
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
                              // "productCollection": selectedNewVariant,
                              "tags": productTags,
                              "sizeChart" : sizeChart
                            });*/
                        }
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please select atleast one image')));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/newIcons/add_out.png',
                          height: 20, width: 20),
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
                SizedBox(height: 24),

                /// Attributes Button
                InkWell(
                  onTap: () async {
                    selectedImageVideos.clear();
                    for (var images in selectedImages) {
                      selectedImageVideos.add(images);
                    }
                    /*for (var videos in selectedVideos) {
                      final res = await awsDocumentUpload(videos.path);
                      selectedImageVideos.add(res);
                    }*/

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
                      if (_formKey.currentState!.validate()) {
                        if(selectedNewVariant != "") {
                          debugPrint('My Add Product From Variant Button MRP is: ${_mrpController.text}');
                          debugPrint('My Add Product From Variant Button price is: ${_discountPriceController.text}');
                          addAttributeWithProduct({
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
                            "productCollection": selectedNewVariant,
                            "tags": productTags,
                            "sizeChart" : sizeChart
                          });
                        } else {
                          debugPrint('My Add Product From Variant Button MRP is: ${_mrpController.text}');
                          debugPrint('My Add Product From Variant Button price is: ${_discountPriceController.text}');
                          addAttributeWithProduct({
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
                            // "productCollection": selectedNewVariant,
                            "tags": productTags,
                            "sizeChart" : sizeChart
                          });
                        }
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please select atleast one image')));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/newIcons/add_out.png',
                          height: 20, width: 20),
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
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
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

  /// get collection
  void getCollection() async {
    manageCollectionApiResModel =
    await _manageCollectionController.getAllCollection();
    if (manageCollectionApiResModel.success == true) {
      manageCollectionApiResModel.sellerCollections?.forEach((element) {
        if(element.sId == _addToCollectionController.text) {
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
      builder: (context) => AddProductDialog(),
    );
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
      if (isComeVariant) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ManageVariantsScreen(
                productId: "${appProductApiResModel.product?.sId}",
                skuid: "${appProductApiResModel.product?.skuId}",
                mrp: "${appProductApiResModel.product?.mrp}",
                discountPrice: "${appProductApiResModel.product?.price}",
                stock: "${appProductApiResModel.product?.stock}", isFromInstagram: true),
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
              productId: "${appProductApiResModel.product?.sId}", inFromInstagram: true),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${appProductApiResModel.message}')));
    }
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
}