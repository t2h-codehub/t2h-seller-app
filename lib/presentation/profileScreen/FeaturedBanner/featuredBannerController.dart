import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taptohello/core/apiFunction.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'package:taptohello/data/productCategoryModel/addBannerApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/awsPhotoUploadApiResModel.dart';
import 'package:taptohello/presentation/profileScreen/FeaturedBanner/featuredBannerDialog.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';


class FeaturedBannerControllers {
  bool isUploadImage = false;
  final ImagePicker _picker = ImagePicker();
  XFile? image; // Controller to store selected image

   final Dio dio = Dio();
     AWSFileUploadApiResModel awsFileUploadApiResModel =
      AWSFileUploadApiResModel();
       final AddProductController _addProductController = AddProductController();

  
  

Future<void> postFeatureBanner(
    BuildContext context, Map<String, dynamic> payload) async {
  var headers = {
    'token': AppConstants.token,
    'Content-Type': 'application/json',
  };

  print("Request Model (Payload): ${jsonEncode(payload)}");

  try {
    DialogBuilder(context).showLoadingIndicator("Uploading...");

    var response = await dio.post(
      '${AppConstants.baseUrl}user/manage-seller-banners',
      options: Options(headers: headers),
      data: payload,
    );

    print("Response from server: ${jsonEncode(response.data)}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (context.mounted) {
      //  DialogBuilder(context).hideOpenDialog();

        await Future.delayed(Duration(milliseconds: 200)); // Prevent UI lag
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const FeaturedBannerDialog(),
        );
      }
    } else {
      String errorMsg = response.data?['message'] ?? 'Failed to upload banners';
      print("Error: $errorMsg");
      await Fluttertoast.showToast(msg: errorMsg);
    }
  } catch (e) {
    print("Error posting banner: $e");
    await Fluttertoast.showToast(msg: 'Error occurred while uploading banners!');
  } finally {
    if (context.mounted) {
      DialogBuilder(context).hideOpenDialog();
    }
  }
}




  void printLongJson(String jsonString) {
  const int chunkSize = 1000; // Adjust as needed
  for (int i = 0; i < jsonString.length; i += chunkSize) {
    print(jsonString.substring(i, i + chunkSize > jsonString.length ? jsonString.length : i + chunkSize));
  }
}
   /// AWS Document Upload
  Future<String> awsDocumentUpload(BuildContext context,String file) async {
     DialogBuilder(context).showLoadingIndicator("Uploading...");
     
    String getFileFromAws = "";
    Map<String, dynamic> body = {};
    body['file'] = file;

    debugPrint('My file is: $file');
    awsFileUploadApiResModel =
        await _addProductController.getDocumentUpload(file);
    if (awsFileUploadApiResModel.success == true) {
      getFileFromAws = awsFileUploadApiResModel.fileUrl ?? '';
    }
    DialogBuilder(context).hideOpenDialog();
    return getFileFromAws;
  }

  Future<void> getImage(BuildContext context, Function onImageSelected) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take a Photo'),
                onTap: () async {
                  Navigator.pop(context);
                  image = await _picker.pickImage(source: ImageSource.camera);
                  _processImage(image, onImageSelected);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  image = await _picker.pickImage(source: ImageSource.gallery);
                  _processImage(image, onImageSelected);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _processImage(XFile? image, Function onImageSelected) async {
    if (image != null) {
      final int imageSizeInBytes = await image.length();
      final double imageSizeInMB = imageSizeInBytes / (1024 * 1024);

      if (imageSizeInMB <= 5) {
        this.image = image;
        isUploadImage = true;
        onImageSelected(); // Callback to update UI
      } else {
        debugPrint('The selected image is larger than 5 MB.');
      }
    }
  }

  Future<BannerGetResponseModel> getFeatureBanner({String? userId}) async {
    BannerGetResponseModel getProductApiResModel = BannerGetResponseModel();
    try {
      final response = await ApiFun.apiGet('user/get-all-seller-banner/${userId}');
      getProductApiResModel = BannerGetResponseModel.fromJson(response);
    } catch (e) {
      debugPrint('Get product list Api Error: $e');
    }
    //notifyListeners();
    return getProductApiResModel;
  }

  







}
