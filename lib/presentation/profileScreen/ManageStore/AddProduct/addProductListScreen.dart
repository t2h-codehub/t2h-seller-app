import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'package:taptohello/data/productCategoryModel/addProductApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/awsPhotoUploadApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/manageCollectionApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/sizeChartFirstTimeDataModel.dart';
import 'package:taptohello/data/productCategoryModel/viewCategoryApiResModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/addProductDialog.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/SizeChart/sizeChartScreen.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageCollection/ManageCollectionController/manageCollectionController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ProductCategory/ProductCategoryController/productcategoryController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageAttributes/manageAttributesScreen.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageVariants/manageVariantsScreen.dart';
import 'package:taptohello/services/shared_preference_service.dart';
import 'package:video_player/video_player.dart';
import 'package:taptohello/data/productCategoryModel/productCategoryApiResModel.dart'
    as productCategoryModel;
import '../../../../core/utils/commonFun.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:html_editor_plus/html_editor.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'editProductListScreen/editProductListScreen.dart';




class AddProductListScreen extends ConsumerStatefulWidget {
  const AddProductListScreen({super.key, this.isFromCatalogue});
  final bool? isFromCatalogue;

  @override
  ConsumerState<AddProductListScreen> createState() => _AddProductListScreenState();
}

class _AddProductListScreenState extends ConsumerState<AddProductListScreen> {
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

  final _formKey = GlobalKey<FormState>();
var currentIndex = 0;
  bool isSizeChart = false;
  bool isUnlimitedStock = false;
  bool isDisplayOn = false;
  bool isAdditionalInformation = false;
  // late quill.QuillController _productDescriptionController;
   final HtmlEditorController _productDescriptionController = HtmlEditorController();
  

    final List<String> variants = ["Type A", "Type B", "Type C", "Type D"];

  File? _imageFile;
  bool isProductPost = false;
  bool isButtonDisabled = false;

  List<XFile> selectedImages = [];
  List<XFile> selectedVideos = [];
  List<VideoPlayerController> videoControllers = [];

  final ImagePicker _picker = ImagePicker();
  final bool _isLoading = false;

  bool isApiDataAvailable = false;
  late Future _future;
    int? selectedIndex; // To store the selected index
  String? selectedValue;

  productCategoryModel.ProductCategoryApiResModel productCategoryApiResModel =
      productCategoryModel.ProductCategoryApiResModel();

  final ProductCategoryController _productCategoryListController =
      ProductCategoryController();

  List<String> adminCategories = [];
  List adminSubCategories = [];
  List selectAdminSubCategories = [];
  final ScrollController _scrollController = ScrollController();

  AppProductApiResModel appProductApiResModel = AppProductApiResModel();
  final AddProductController _addProductController = AddProductController();

  ManageCollectionApiResModel manageCollectionApiResModel =
      ManageCollectionApiResModel();
  final ManageCollectionController _manageCollectionController =
      ManageCollectionController();

  List selectedImageVideos = [];

  List<String> productTags = [];

  String selectedCategoryId = '';
  String selectedSubCategoryId = '';
  String selectedCollection = '';

  AWSFileUploadApiResModel awsFileUploadApiResModel =
      AWSFileUploadApiResModel();

  final PageController _pageController = PageController();
  int _currentIndex = 0;
  int selectedItemsIndex = 0;
  List<XFile> totalSelectedImageVideos = [];


  String selectedNewVariant = "";

  bool isProductAdd = false;

  List sizeChart = [];

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  

  final ValueNotifier<bool> variantClick = ValueNotifier<bool>(false);
  final ValueNotifier<bool> attributeClick = ValueNotifier<bool>(false);
  final ValueNotifier<bool> submitClick = ValueNotifier<bool>(false);
  bool isVideoUpload = false;
  // var json = jsonEncode("");
  String json = "";

  SizeChartFirstTimeData sizeChartFirstTimeData = SizeChartFirstTimeData();
int _state = 0;
 bool isPageLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
          // Future.delayed(
          //             Duration(seconds: 5),
          //             () {
          //               imageload();
          //             },
          //           );
     
    //  _productDescriptionController = quill.QuillController.basic();
    //   _productDescriptionController.addListener(_getJsonData);
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

//   void imageload(){
// DialogBuilder(navigatorKey.currentContext ?? context)
//     .showLoadingIndicator('Loading...');
//   }

  


  // Method to save image and get its path
  Future<String> saveImage(Uint8List imageData) async {

    // Compress image before saving
  var compressedImage = await FlutterImageCompress.compressWithList(
    imageData,
    minWidth: 800,  // Adjust these values as needed
    minHeight: 600,
    quality: 80,
  );

  if (compressedImage == null) {
    throw Exception('Image compression failed');
  }
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
    // Remove the listener when the widget is disposed
    
    _productDescriptionController.clear();
    _productDescriptionController..setText("");
    _productCategoryController.dispose();
    _productSubCategoryController.dispose();
    //.dispose();
    for (final videoController in videoControllers) {
      videoController.dispose();
      isProductAdd = false;

    }
    super.dispose();
  }
Widget setUpButtonChild() {
    if (_state == 0) {
      return Text(
        "Submit",
        style: TextStyle(
          color: AppCol.primary,
          //AppCol.primary,
          fontSize: 16.0,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
      );
    } else {
      return Icon(Icons.check, color: Color(0xff0c0b0b));
    }
  }
  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });
  }



 Future<Object> uploadImage() async {
  try {
    // Assume you upload the image and get a URL as a response
     selectedImageVideos.clear();
                    for (var images in selectedImages) {
                debugPrint('My real Image is: ${images.path}');
                final res = await awsDocumentUpload(images.path);
                debugPrint('My Image data is: $res');
                selectedImageVideos.add(res);
                
              }
                    for (var videos in selectedVideos) {
                final res = await awsDocumentUpload(videos.path);
                selectedImageVideos.add(res);
                
              }
    return selectedImageVideos;  // Return the uploaded image URL
  } catch (e) {
    print("Upload failed: $e");
    return "";  // Return an empty string on failure
  }
}

 Future<void> handleButtonClick() async {
  
 setState(() {
      isButtonDisabled = true; // Disable the button
    });
                  
                  submitClick.value = true;
              
// setState(()   {
   if (_state == 0) {
    
              debugPrint('My images updated url is: $selectedImageVideos');

              manageCollectionApiResModel.collections?.forEach((element) {
                if (_addToCollectionController.text == element.title) {
                  selectedNewVariant = element.id ?? '';
                  setState(() {});
                }
              });
              // if (selectedImageVideos.isNotEmpty) {
                if (_formKey.currentState!.validate()) {
                 if(_productCategoryController.text.isNotEmpty && _productSubCategoryController.text.isNotEmpty){

                 
                          DialogBuilder(navigatorKey.currentContext ?? context)
    .showLoadingIndicator('Loading...');
    await uploadImage();
    if (selectedImageVideos.isNotEmpty) {
                  if (selectedNewVariant.isNotEmpty) {
    
                    setState(() {
                  animateButton();
                    });
           
                    
                    addProduct({
                      "title": _productTitleController.text,
                      "description": json,
                      "images": selectedImageVideos.map((e) => e).toList(),
                      "mrp": _mrpController.text,
                      "price": _discountPriceController.text.isEmpty
                          ? 0
                          : _discountPriceController.text,
                      "stock":
                          isUnlimitedStock ? 100000 : _inventoryController.text,
                      "unlimitedStock": isUnlimitedStock,
                      "category": selectedCategoryId,
                      "subcategory": selectedSubCategoryId,
                      "active": isDisplayOn,
                      "skuId": _SKUIDController.text.isEmpty
                          ? ""
                          : _SKUIDController.text,
                      "productCollection": selectedNewVariant,
                      "tags": productTags,
                      "sizeChart": sizeChart
                    }, false);
                  } else {
   
                     setState(() {
                  animateButton();
                    });
                    addProduct({
                      "title": _productTitleController.text,
                      "description": json,
                      "images": selectedImageVideos.map((e) => e).toList(),
                      "mrp": _mrpController.text,
                      "price": _discountPriceController.text.isEmpty
                          ? 0
                          : _discountPriceController.text,
                      "stock":
                          isUnlimitedStock ? 100000 : _inventoryController.text,
                      "unlimitedStock": isUnlimitedStock,
                      "category": selectedCategoryId,
                      "subcategory": selectedSubCategoryId,
                      "active": isDisplayOn,
                      "skuId": _SKUIDController.text.isEmpty
                          ? ""
                          : _SKUIDController.text,
                      "tags": productTags,
                      "sizeChart": sizeChart
                    }, false);
                  }
                   } else {
                setState(() {
      isButtonDisabled = false;
    });
              DialogBuilder(context).hideOpenDialog();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select atleast one image')));
              }
                }
                 else{
                   ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select Category')));
                }
                }
               
   
              
                }
               
              
              // Perform an action when the button is pressed
              print("MaterialButton pressed");
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
          onPressed: () => Navigator.of(context).pop(true), // Return `true` if the user confirms.
          child: Text('Yes'),
        ),
      ],
    ),
  ).then((value) => value ?? false); // Ensure a `bool` is returned even if `value` is null.
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


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
  onWillPop: _onBackPressed,
  child: Scaffold(
        backgroundColor: Color.fromRGBO(240, 241, 246, 1),
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
           automaticallyImplyLeading: false,
          /*iconTheme: IconThemeData(
            color: Colors.grey,
          ),*/
          leading: 
          
          
          InkWell(
            onTap: () async {
              debugPrint("testttt656");
              // Navigator.of(context).pop();
               final value = await showDialog<bool>(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text("Are you sure?"),
              content: Text("Do you want to Exit ?."),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop(false);
                }, child: Text("No")),
                TextButton(onPressed: (){
                  Navigator.of(context).pop(true);
                  Navigator.of(context).pop(true);
                }, child: Text("Yes")),
              ],
            );
          });
            },
            child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Image.asset(
                  "assets/images/back.png",
                  height: 24,
                )),
          ),
        
         actions: [
            MaterialButton(
              onPressed:  handleButtonClick,
            
              child: setUpButtonChild(),
              
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
                               Stack(
                                 children: [
                                   Align(
                                     alignment: Alignment.topRight,
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
                                         
                                           
                                            // selectedImages.removeAt(index);
                                   setState(() {
                                     if(totalSelectedImageVideos.isNotEmpty){
                                     totalSelectedImageVideos.removeAt(currentIndex);
                                     }
                                                                                        
                                                                                        if(_currentIndex > 0){
                                                                                          _currentIndex --;
                                                                                        }
                                                                                        if(totalSelectedImageVideos.isEmpty){
                                                                                         selectedImages = [];
                                                                                         selectedVideos = [];
                                                                                        }
                                                                                       
                                                                                       
                                   });
                                         },
                                         child: Icon(
                                           Icons
                                               .close_rounded,
                                           color:
                                           Colors.black,
                                         ),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
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
                                  
                                  
                                  },
                                ),
                              ),
                              DotsIndicator(
                                dotsCount: totalSelectedImageVideos.length,
                                    // selectedImages.length + selectedVideos.length,
                                position: _currentIndex,
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
                       inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r"[!*'\(\);:@&=\+\$,\/\?\#\[\] A-Za-z0-9_.~%-]"))
                                      ],
                      validator: (value) {
                        return validateProductTitle(value!);
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
          child: Scrollbar(
            controller: _scrollController, 
                    thumbVisibility: true,
            child: SingleChildScrollView(
            
              controller: _scrollController,
              child: HtmlEditor(
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
                             
                             
                            print("Editor is ready!");
              setState(() {
                json = content ?? "";
                print("html data ${json}");
              });
                            },
                          ),
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
                            // inputFormatters: [AmountInputFormatter()],
                            // // [
                            // //             FilteringTextInputFormatter.allow(
                            // //                 RegExp(r'^[0-9]+(\.[0-9]*)?$'))
                            // //           ],
                            //           //r'^[0-9]+.?[0-9]*'
                            //           keyboardType:
                            //               TextInputType.numberWithOptions(
                            //                   decimal: true),
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
  inputFormatters: [AmountInputFormatter()],
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
                              // inputFormatters: [AmountInputFormatter()],
                              // // [
                              // //           FilteringTextInputFormatter.allow(
                              // //               RegExp(r'^[0-9]+(\.[0-9]*)?$'))
                              // //         ],
                              //         keyboardType:
                              //             TextInputType.numberWithOptions(
                              //                 decimal: true),
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
  inputFormatters: [AmountInputFormatter()],
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
                                inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[0-9]"))
                                        ],
                              controller: _inventoryController,
                              // initialValue: '₹ ${_inventoryController.text}',
                              keyboardType: TextInputType.number,
                              readOnly: isUnlimitedStock ? true : false,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: isUnlimitedStock ? (value) {
                                return null;
                              }: (value) {
                                if(!isUnlimitedStock) {
                                  if (value != null && value.isEmpty) {
                                    return 'Fill the inventory quqantity';
                                  }
                                  return null;
                                }
                                return null;
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
             
    
                
                          adminSubCategories.clear();
                          _productCategoryController.text = value.toString();
                          loadSubCategories(_productCategoryController.text);
                          _productSubCategoryController.text = "";
                          selectedCategoryId = productCategoryApiResModel
                              .categories!.firstWhere((element) => element.title == value)
                              .sId!;
                              debugPrint('res data 1$_productCategoryController.text');
                               debugPrint('res data 2$selectedCategoryId');
                          
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
             decoratorProps: DropDownDecoratorProps(
             
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
                        SizedBox(
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
                  //       labelText: 'Product Tags (Optional)',
                  //       floatingLabelBehavior: FloatingLabelBehavior.always,
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //     ),
                  //     onFieldSubmitted: (value) {
                  //       setState(() {
                  //         productTags = value.split(',');
                  //         // _productTagsController.clear(); // Clear the text field
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
                      // Delay the reset of manageVariantProvider state
 
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

                       Future.delayed(Duration.zero, () {
    // Reset the provider state after widget is built
    ref.read(manageVariantProvider.notifier).clearImages();
    print("Cleared manageVariantProvider data during first initialization");
  });

  // Simulate loading future
  _future = Future.delayed(Duration(seconds: 0), () {
    setState(() {
      isApiDataAvailable = true;
      isPageLoading = false;
    });

    // Using Future.delayed to change the provider state after widget is built
   Future.delayed(Duration.zero, () {
  // Safely convert List<dynamic> to List<String>
  List<String> images = List<String>.from(selectedImageVideos);

  // Add the images to the provider
  ref.read(manageVariantProvider.notifier).addImage(images);
  print("Images added: $images");
});

  });
      
                      debugPrint('My images updated url is: $selectedImageVideos');
      
                      manageCollectionApiResModel.collections
                          ?.forEach((element) {
                        if (_addToCollectionController.text == element.title) {
                          selectedNewVariant = element.id ?? '';
                          setState(() {});
                        }
                      });
                      if (selectedImageVideos.isNotEmpty) {
                        if(_productTitleController.text.isNotEmpty){
                          // if(_productDescriptionController.isNotEmpty) {
                            if(_mrpController.text.isNotEmpty) {
                              if(_inventoryController.text.isNotEmpty) {
                                if(selectedNewVariant != "") {
                                  debugPrint('My selected mrp price is: ${_mrpController.text}');
                                  debugPrint('My selected mrp discount price is: ${_discountPriceController.text}');
                                   DialogBuilder(navigatorKey.currentContext ?? context)
                                   .showLoadingIndicator('Loading...');
                                  addProduct({
                                    "title": _productTitleController.text,
                                    "description": json,
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
                                   DialogBuilder(navigatorKey.currentContext ?? context)
                                  .showLoadingIndicator('Socioshop Loading...');
                                  addProduct({
                                    "title": _productTitleController.text,
                                    "description": json,
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
                          // }
                          // else {
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       content: Text('Please fill the product description')));
                          // }
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
      
                      manageCollectionApiResModel.collections
                          ?.forEach((element) {
                        if (_addToCollectionController.text == element.title) {
                          selectedNewVariant = element.id ?? '';
                          debugPrint('My selected new variant: $selectedNewVariant');
                          setState(() {});
                        }
                      });
                      if (selectedImageVideos.isNotEmpty) {
                        if (_productTitleController.text.isNotEmpty) {
                          // if(_productDescriptionController.text.isNotEmpty) {
                            if(_mrpController.text.isNotEmpty) {
                              if(_inventoryController.text.isNotEmpty) {
                                if(selectedNewVariant != "") {
                                  debugPrint('My Add Product From Variant Button MRP is: ${_mrpController.text}');
                                  debugPrint('My Add Product From Variant Button price is: ${_discountPriceController.text}');
                                  addAttributeWithProduct({
                                    "title": _productTitleController.text,
                                    "description": json,
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
                                    "description": json,
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
                          // }
                          // else {
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       content: Text('Please fill the product description')));
                          // }
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
      ),
    );
  }

  Future<void> _pickImage() async {
  // Dismiss the bottom sheet after a slight delay
Future.delayed(Duration(seconds: 1), () {
  Navigator.pop(context); // Dismiss the bottom sheet
});

  // Allow the user to pick multiple images
  final pickedFiles = await ImagePicker().pickMultiImage();


  

  if (pickedFiles.isNotEmpty) {
    List<XFile> selectedImagesTemp = [];

    for (var pickedFile in pickedFiles) {

      setState(() {
        _imageFile = File(pickedFile.path);
      });



//       // Open ProImageEditor for each picked image
      final editedImagePath = await Navigator.push(

        context,
        MaterialPageRoute(
          builder: (context) => ProImageEditor.file(
            File(pickedFile.path),



            configs: ProImageEditorConfigs(),
            callbacks: ProImageEditorCallbacks(
              onImageEditingComplete: (editedImageData) async {
                // Save the image data and get the file path
                final String imagePath = await saveImage(editedImageData);
                print("✅ Image Path: $imagePath");

                // Add the edited image to the list
                selectedImagesTemp.add(XFile(imagePath));

                // Pop the editor screen with the image path
                Navigator.pop(context, imagePath);

                
                
              },

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
      totalSelectedImageVideos.addAll(selectedImagesTemp);
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

// void _openEditor(File file, BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => ProImageEditor.network(
//         file,
//         callbacks: ProImageEditorCallbacks(
//           onImageEditingComplete: (Uint8List bytes) async {
//             /*
//               Your code to handle the edited image. Upload it to your server as an example.
//               You can choose to use await, so that the loading-dialog remains visible until your code is ready, or no async, so that the loading-dialog closes immediately.
//               By default, the bytes are in `jpg` format.
//             */
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     ),
//   );
// }
  /// crop image
  Future<CroppedFile?> _cropImage(File imageToCrop, BuildContext context) async {
    final CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imageToCrop.path,
      //cropStyle: CropStyle.rectangle,
     // compressQuality: 100,
      aspectRatio: CropAspectRatio(ratioX: 1080, ratioY: 1360),
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
    productCategoryApiResModel.categories?.forEach((element) {
      if (element.title == selectedCategories) {
        element.subcategories?.forEach((subcategory) {
          adminSubCategories.add(
              {"_id": "${subcategory.sId}", "title": "${subcategory.title}"});
              print(" attached list data ${adminSubCategories}");
          
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
     DialogBuilder(context).hideOpenDialog();
    
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
  /// 
  // Future<String> showAdminCollectionModalSheet(BuildContext context) async {
  //   final selectedString = Completer<String>();
  //   showModalBottomSheet(
  //     context: context,
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(14), topRight: Radius.circular(14))),
  //     builder: (builder) => Container(
  //         height: MediaQuery.of(context).size.height * 0.5,
  //         padding: EdgeInsets.only(left: 24, right: 24),
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(14), topRight: Radius.circular(14))),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             SizedBox(height: 14),
  //             Text(
  //               'Select Collection',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             SizedBox(height: 14),
  //             Divider(
  //               color: Colors.grey,
  //             ),
  //             Expanded(
  //               child: ListView.builder(
  //                 itemCount:
  //                     manageCollectionApiResModel.collections?.length,
  //                 shrinkWrap: true,
  //                 physics: BouncingScrollPhysics(),
  //                 itemBuilder: (context, index) => Column(
  //                   children: [
  //                     InkWell(
  //                       onTap: () {
  //                         // selectedString = adminCategories[index];
  //                         selectedString.complete(manageCollectionApiResModel
  //                             .collections?[index].title);
  //                         selectedCollection = manageCollectionApiResModel
  //                                 .collections?[index].id ??
  //                             '';
  //                         /*selectedSubCategoryId
  //                             .complete(adminSubCategories[index]['_id']);*/
  //                         debugPrint(
  //                             'My selected string: ${selectedString.future}');
  //                         setState(() {});
  //                         Navigator.pop(context, selectedString);
  //                       },
  //                       child: Container(
  //                         margin: EdgeInsets.only(bottom: 10, top: 10),
  //                         child: Center(
  //                             child: Text(
  //                                 '${manageCollectionApiResModel.collections?[index].title}')),
  //                       ),
  //                     ),
  //                     Divider(
  //                       color: Colors.grey,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         )),
  //   );
  //   return selectedString.future;
  // }

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
    } 
   
   
    return null;
  }
   String? validateProductCate(String value) {
     
    if (value.isEmpty) {
      return "Product title is Required";
    }
     
    return null;
  }
  

}



class AmountInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    
    // Allow empty input (so users can delete everything)
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Regex to allow only numbers and a single optional dot
    final regex = RegExp(r'^[0-9]+(\.[0-9]*)?$');

    // Allow valid input; otherwise, revert to old value
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}



