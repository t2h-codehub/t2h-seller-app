import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/data/productCategoryModel/awsPhotoUploadApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/sizeChartApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/sizeChartFirstTimeDataModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/SizeChart/SizeChartController/sizeChartController.dart';
import 'package:taptohello/services/shared_preference_service.dart';

class SizeChartScreen extends StatefulWidget {
  const SizeChartScreen({super.key, required this.selectImage, required this.productId});

  final Function(String) selectImage;
  final String productId;

  @override
  State<SizeChartScreen> createState() => _SizeChartScreenState();
}

class _SizeChartScreenState extends State<SizeChartScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  SizeChartApiResModel sizeChartApiResModel = SizeChartApiResModel();
  final SizeChartController _sizeChartController = SizeChartController();

  AWSFileUploadApiResModel awsFileUploadApiResModel =
      AWSFileUploadApiResModel();
  final AddProductController _addProductController = AddProductController();

  SizeChartFirstTimeData sizeChartFirstTimeData = SizeChartFirstTimeData();

//  final sharedPrefKey = 'mySizeChartImageIsByProductId/${widget.productId}';
// final sharedPrefImage = SharedPreferenceService.getString(sharedPrefKey) ?? '';
late String sharedPrefImage;

  String? _selectedGender;
  String? _selectedCategory;

  final List<String> _genders = ['Male', 'Female'];
  final List<String> _categories = ['Topware', 'Bottomware', 'Footware'];

  XFile? _image;
  String loadedImage = "";

  int selectedInchOrCM = 0;

  final ImagePicker _picker = ImagePicker();

  /// get image
  Future<void> _getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final int imageSizeInBytes =
          await image.length(); // Get the image size in bytes
      final double imageSizeInMB =
          imageSizeInBytes / (1024 * 1024); // Convert bytes to MB

      if (imageSizeInMB <= 5) {
        final File imageFile = File(image.path); // Convert XFile to File
        final bytes = await imageFile.readAsBytes(); // Read image bytes
        final base64String = base64Encode(bytes); // Convert bytes to base64 string


        setState(() {
          _image = image;
          loadedImage = "";
          // SharedPreferenceService.setString('mySizeChartCustomImageIsByProductId/${widget.productId}', "$_image");
          debugPrint('my image data is: $_image');
        });

        await SharedPreferenceService.setString(
          'mySizeChartCustomImageIsByProductId/${widget.productId}',
          base64String,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('The selected image is larger than 5 MB.')));
        print('The selected image is larger than 5 MB.');
      }
    }
  }

  // Future<void> _loadImage() async {
  //   loadedImage = (SharedPreferenceService.getString('mySizeChartCustomImageIsByProductId/${widget.productId}') != "" ? SharedPreferenceService.getString('mySizeChartCustomImageIsByProductId/${widget.productId}') : '')!;
  //   debugPrint('My image data is: $loadedImage');
  // }

  @override
  void initState() {
    super.initState();
    final sharedPrefKey = 'mySizeChartImageIsByProductId/${widget.productId}';
    sharedPrefImage = SharedPreferenceService.getString(sharedPrefKey) ?? '';
    _tabController = TabController(length: 2, vsync: this);
    getDataFromLocal();
    getSizeChart();
  }

  void getDataFromLocal() {
    debugPrint('My Product id is: ${SharedPreferenceService.getString('mySizeChartInchOrCMIsByProductId/${widget.productId}')}');
    if(widget.productId != "") {
      _selectedGender = SharedPreferenceService.getString('mySizeChartGenderIsByProductId/${widget.productId}');
      _selectedCategory = SharedPreferenceService.getString('mySizeChartCategoryIsByProductId/${widget.productId}');
      selectedInchOrCM = SharedPreferenceService.getString('mySizeChartInchOrCMIsByProductId/${widget.productId}') == "in" ? 0 : 1;
      loadedImage = SharedPreferenceService.getString('mySizeChartCustomImageIsByProductId/${widget.productId}') ?? '';
      _image = null;
    }
    // _loadImage();
    // debugPrint('My custom chart image iss: ${SharedPreferenceService.getString('mySizeChartCustomImageIsByProductId/${widget.productId}')}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            widget.selectImage('');
            Navigator.pop(context, '');
          },
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Image.asset(
                "assets/images/back.png",
                height: 24,
              )),
        ),
        centerTitle: false,
        title: Text(
          'Size chart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          /// View Hello Store Button
          InkWell(
            onTap: () async {
              debugPrint('My index is: ${_tabController.index}');
              debugPrint('My image is: $_image');
              debugPrint('My image path is: ${_image?.path}');
              if(_tabController.index == 0) {
                widget.selectImage(sizeChartApiResModel.data?[0].images?[0].url ?? '');
                Navigator.pop(context, sizeChartApiResModel.data?[0].images?[0].url ?? '');
              } else {
                final res = await awsDocumentUpload('${_image?.path}');
                debugPrint('My aws url is: $res');
                widget.selectImage(res);
                widget.productId != "" ? SharedPreferenceService.setString('mySizeChartCustomImageIsByProductId/${widget.productId}', res) : sizeChartFirstTimeData.customSizeChartImageData = res;
                debugPrint('My data is: ${sizeChartFirstTimeData.genderData}');
                debugPrint('My data is: ${sizeChartFirstTimeData.categoryData}');
                debugPrint('My data is: ${sizeChartFirstTimeData.sizeInchOrCm}');
                debugPrint('My data is: ${sizeChartFirstTimeData.sizeChartImageData}');
                debugPrint('My data is: ${sizeChartFirstTimeData.customSizeChartImageData}');
                Navigator.pop(context, sizeChartFirstTimeData);
              }
              /*final res = await awsDocumentUpload('${_image?.path}');
              widget.selectImage(res);
              Navigator.pop(context, res);*/
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
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            /// Tab bar View
            TabBar(
              controller: _tabController,
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              labelColor: AppCol.primary,
              indicatorColor: AppCol.primary,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'Standard chart'),
                Tab(text: 'Custom chart'),
              ],
            ),

            /// Tab bar view
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 16),

                      /// Gender Field
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Gender',
                          border: OutlineInputBorder(),
                        ),
                        value: _selectedGender,
                        hint: const Text('Select Gender'),
                        onChanged: (String? newValue) {
                          _selectedGender = newValue;
                          widget.productId != "" ? SharedPreferenceService.setString('mySizeChartGenderIsByProductId/${widget.productId}', newValue ?? '') :  sizeChartFirstTimeData.genderData = newValue;
                          // _selectedCategory != "" ? _selectedCategory = "" : null;
                          setState(() {});
                        },
                        items: _genders.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),

                      /// Size Chart Category Field
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Size chart category',
                          border: OutlineInputBorder(),
                        ),
                        value: _selectedCategory,
                        hint: const Text('Select Category'),
                        onChanged: (String? newValue) {
                          _selectedCategory = newValue;
                          widget.productId != "" ? SharedPreferenceService.setString('mySizeChartCategoryIsByProductId/${widget.productId}', newValue ?? '') : sizeChartFirstTimeData.categoryData = newValue;
                          getSizeChart();
                          // setState(() {});
                        },
                        items: _categories.map((String value) {
                          debugPrint('My subcategpry value is: $value');
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),

                      /// Category name and in/cm bar
                      sizeChartApiResModel.success == true
                          ? Row(
                              children: [
                                /// selected category heading
                                Text(
                                  '$_selectedCategory size chart',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),

                                /// in button
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedInchOrCM = 0;
                                      widget.productId != '' ? SharedPreferenceService.setString('mySizeChartImageIsByProductId/${widget.productId}', '${sizeChartApiResModel.data?[0].images?[selectedInchOrCM].url}' ?? '') : sizeChartFirstTimeData.sizeChartImageData = sizeChartApiResModel.data?[0].images?[selectedInchOrCM].url;
                                      widget.productId != '' ? SharedPreferenceService.setString('mySizeChartInchOrCMIsByProductId/${widget.productId}', 'in') : sizeChartFirstTimeData.sizeInchOrCm = 'in';
                                    });
                                  },
                                  child: Container(
                                    // width: 50,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: sizeChartApiResModel.data?[0]
                                                    .images?[selectedInchOrCM].metrics ==
                                                "in" || SharedPreferenceService.getString('mySizeChartInchOrCMIsByProductId/${widget.productId}') == "in" || sizeChartFirstTimeData.sizeInchOrCm == 'in'
                                            ? AppCol.primary
                                            : Colors.transparent,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      'in',
                                      style: TextStyle(
                                          color: sizeChartApiResModel.data?[0]
                                                      .images?[selectedInchOrCM].metrics ==
                                                  "in" || SharedPreferenceService.getString('mySizeChartInchOrCMIsByProductId/${widget.productId}') == "in" || sizeChartFirstTimeData.sizeInchOrCm == 'in'
                                              ? AppCol.primary
                                              : Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),

                                /// cm button
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedInchOrCM = 1;
                                      widget.productId != '' ? SharedPreferenceService.setString('mySizeChartImageIsByProductId/${widget.productId}', '${sizeChartApiResModel.data?[0].images?[selectedInchOrCM].url}') : sizeChartFirstTimeData.sizeChartImageData = sizeChartApiResModel.data?[0].images?[selectedInchOrCM].url;
                                      debugPrint('My size chart image is: ${SharedPreferenceService.getString('mySizeChartImageIsByProductId/${widget.productId}')}');
                                      widget.productId != '' ? SharedPreferenceService.setString('mySizeChartInchOrCMIsByProductId/${widget.productId}', 'cm') : sizeChartFirstTimeData.sizeInchOrCm = 'cm';
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: sizeChartApiResModel.data?[0]
                                                    .images?[selectedInchOrCM].metrics ==
                                                "cm" || SharedPreferenceService.getString('mySizeChartInchOrCMIsByProductId/${widget.productId}') == "cm" || sizeChartFirstTimeData.sizeInchOrCm == 'cm'
                                            ? AppCol.primary
                                            : Colors.transparent,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: Text(
                                      'cm',
                                      style: TextStyle(
                                          color: sizeChartApiResModel.data?[0]
                                                      .images?[selectedInchOrCM].metrics ==
                                                  "cm" || SharedPreferenceService.getString('mySizeChartInchOrCMIsByProductId/${widget.productId}') == "cm" || sizeChartFirstTimeData.sizeInchOrCm == 'cm'
                                              ? AppCol.primary
                                              : Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(),
                      SizedBox(height: 16),

                      // if (sizeChartApiResModel.data != null && sizeChartApiResModel.success == true) ...[
                      //   Image.network(
                      //     '${sizeChartApiResModel.data?[0].images?[selectedInchOrCM].url}',
                      //     fit: BoxFit.fill,
                      //   )
                      // ],

                      // if(sizeChartApiResModel.data == null && SharedPreferenceService.getString('mySizeChartImageIsByProductId/${widget.productId}') != '') ...[
                      //   Image.network(
                      //     '${SharedPreferenceService.getString('mySizeChartImageIsByProductId/${widget.productId}')}',
                      //     fit: BoxFit.fill,
                      //   )
                      // ],

                   

if (sizeChartApiResModel.data != null && sizeChartApiResModel.success == true) ...[
  CachedNetworkImage(
    imageUrl: (() {
      final url = sizeChartApiResModel.data?[0].images?[selectedInchOrCM].url ?? '';
      return url.contains(AppConstants.imageBaseUrl)
          ? url
          : AppConstants.imageBaseUrl + url;
    })(),
    fit: BoxFit.fill,
    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  )
] else if (sizeChartApiResModel.data == null && sharedPrefImage.isNotEmpty) ...[
  CachedNetworkImage(
    imageUrl: sharedPrefImage.contains(AppConstants.imageBaseUrl)
        ? sharedPrefImage
        : AppConstants.imageBaseUrl + sharedPrefImage,
    fit: BoxFit.fill,
    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  )
],



                      if (sizeChartApiResModel.success == false) ...[
                        Center(
                          child: Text("${sizeChartApiResModel.message}"),
                        ),
                      ]
                      // ? sizeChartApiResModel.data?[0].images?[0].url != "" ? : SizedBox(),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 40),

                      /// Heading Text
                      Text(
                        'Upload your custom size chart',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      SizedBox(height: 40),

                      /// Image Show Container
                      Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Column(
                          children: [
                            if(_image != null)...[
                              Image.file(
                                File(_image!.path),
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              )
                            ],
                            if(_image == null && loadedImage == "")...[
                              Icon(Icons.cloud_upload_outlined,
                                  size: 100, color: Colors.grey),
                            ],
      //                       if(loadedImage != "")...[
      //                          loadedImage.contains(AppConstants.imageBaseUrl)
      // ? loadedImage
      // : AppConstants.imageBaseUrl + loadedImage,
      //                         Image.network(loadedImage)
      //                       ],
      if (loadedImage != '') ...[
  Image.network(
    loadedImage.contains(AppConstants.imageBaseUrl)
        ? loadedImage
        : AppConstants.imageBaseUrl + loadedImage,
  ),
]
,
                            SizedBox(height: 20),
                            Text(
                              'Upload',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 18, right: 18),
                              child: Text(
                                'Supported format: PNG, JPG (Max file size: 5mb, Preferred image ratio 1:2)',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: _getImage,
                              child: Text('Upload'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Get Size Chart
  void getSizeChart() async {
    sizeChartApiResModel = await _sizeChartController.getSizeChart(
        _selectedGender?.toLowerCase(), _selectedCategory?.toLowerCase());
    debugPrint('My size chart data is: ${sizeChartApiResModel.toJson()}');
    if (sizeChartApiResModel.success == true) {
      // sizeChartFirstTimeData.sizeChartImageData = sizeChartApiResModel.data?[0].images?[0].url;
      widget.productId != "" ? SharedPreferenceService.setString('mySizeChartInchOrCMIsByProductId/${widget.productId}', '${sizeChartApiResModel.data?[0].images?[0].metrics}') : sizeChartFirstTimeData.sizeInchOrCm = sizeChartApiResModel.data?[0].images?[0].metrics;
      setState(() {});
    } else {
      debugPrint('My size chart data is: ${sizeChartApiResModel.data}');
      // SharedPreferenceService.setString('mySizeChartInchOrCMIsByProductId/${widget.productId}', '');
      setState(() {});
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
