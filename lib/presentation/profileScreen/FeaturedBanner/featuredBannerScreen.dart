
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reorderable_grid/reorderable_grid.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/data/productCategoryModel/addBannerApiResModel.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/profileScreen/FeaturedBanner/featuredBannerController.dart';
import 'package:cached_network_image/cached_network_image.dart';





class FeaturedBannerScreen extends StatefulWidget {
  const FeaturedBannerScreen({super.key});

  @override
  State<FeaturedBannerScreen> createState() => _FeaturedBannerScreenState();
}

class _FeaturedBannerScreenState extends State<FeaturedBannerScreen> {
  List<File> _selectedImages = [];
  Map<String, TextEditingController> _imageTitles = {};
  Map<String, TextEditingController> _imageLinks = {};
  BannerGetResponseModel getProductApiResModel = BannerGetResponseModel();
  final FeaturedBannerControllers _productController = FeaturedBannerControllers();
  final UserDetailService _userDetailService = getIt<UserDetailService>();

  final ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    Future.microtask(() => getFeatureBanner());
  }



  Future<void> getFeatureBanner() async {
    try {
      DialogBuilder(context).showLoadingIndicator("Loading...");
      
      final response = await _productController.getFeatureBanner(userId: _userDetailService.userDetailResponse?.user?.id);
      if (response != null && mounted) {
        setState(() {
          getProductApiResModel = response;
        });
      }
    } catch (e, stackTrace) {
      print("Error fetching banner: $e\n$stackTrace");
    } finally {
      if (mounted) {
        DialogBuilder(context).hideOpenDialog();
      }
    }
  }

//   Future<void> _pickImages() async {
//   final ImagePicker picker = ImagePicker();
//   final List<XFile>? images = await picker.pickMultiImage();

//   if (images != null && images.isNotEmpty) {
//     setState(() {
//       for (var img in images) {
//         File file = File(img.path);
//         String filePath = file.path;
//         _selectedImages.insert(0, file); // Add new images at the top
//         _imageTitles[filePath] = TextEditingController();
//         _imageLinks[filePath] = TextEditingController();
//       }
//     });

//     // Scroll to top after adding images
//     Future.delayed(Duration(milliseconds: 300), () {
//       if (_scrollController.hasClients) {
//         _scrollController.animateTo(
//           0.0,
//           duration: Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//       }
//     });
//   }
// }

Future<void> _pickImages() async {
  final ImagePicker picker = ImagePicker();
  final List<XFile>? images = await picker.pickMultiImage();

  if (images != null && images.isNotEmpty) {
    setState(() {
      for (var img in images) {
        File file = File(img.path);
        String filePath = file.path;

        // Check if the image already exists
        if (!_selectedImages.any((element) => element.path == filePath)) {
          _selectedImages.insert(0, file); // Add new images at the top
          _imageTitles[filePath] = TextEditingController();
          _imageLinks[filePath] = TextEditingController();
        }
      }
    });

    // Scroll to top after adding images
    Future.delayed(Duration(milliseconds: 300), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0.0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}



  bool _isValidUrl(String url) {
    final Uri? uri = Uri.tryParse(url);
    return uri != null && uri.hasScheme && uri.hasAuthority;
  }

 Future<void> _uploadBanners() async {
  List<Map<String, dynamic>> banners = [];
  int orderCounter = 1; // Default order counter

  // Find the highest existing order
  if (getProductApiResModel.data != null) {
    for (var seller in getProductApiResModel.data!) {
      if (seller.banners != null) {
        for (var banner in seller.banners!) {
          if (!(banner.isDeleted ?? false)) { 
            orderCounter = banner.order != null && banner.order! >= orderCounter
                ? banner.order! + 1
                : orderCounter;
          }
        }
      }
    }
  }

  // Handle existing banners first
  for (var seller in getProductApiResModel.data ?? []) {
    for (var banner in seller.banners ?? []) {
      if (banner.isDeleted == true) {
        banners.add({"status": "DELETED", "_id": banner.sId});
      } else {
        // Get the new title from the UI input field
        String newTitle = _imageTitles[banner.sId]?.text ?? banner.title ?? "";
         String newLink = _imageLinks[banner.sId]?.text ?? banner.link ?? "";
        // Maintain the existing order
          banners.add({
               "status": "UPDATED",
          "_id": banner.sId,
          "link": newLink, // Use the updated link value
          "title": newTitle,
          "order": banner.order ?? orderCounter++,
          "banner_image": banner.bannerImage ?? "",
                 // Update title only
              });
       
       
      }
    }
  }

  // Handle newly uploaded banners (starting from the next available order)
  for (var file in _selectedImages) {
    String filePath = file.path;
    String title = _imageTitles[filePath]?.text ?? '';
    String link = _imageLinks[filePath]?.text ?? '';

    if (link.isNotEmpty && !_isValidUrl(link)) {
      Fluttertoast.showToast(msg: "Invalid URL: $link");
      return;
    }

    String uploadedLink = await _productController.awsDocumentUpload(context, filePath);

    banners.add({
      "link": link,
      "title": title,
      "order": orderCounter++, // New banners start from the next available order
      "status": "NEW",
      "banner_image": uploadedLink.isNotEmpty ? uploadedLink : "https://defaulturl.com",
    });
  }

  if (banners.isEmpty) {
    Fluttertoast.showToast(msg: "No banners to upload.");
    return;
  }

  // Send the updated banners
  Map<String, dynamic> payload = {
    "banners": banners
  };

  _productController.postFeatureBanner(context, payload).then((value) {
     
      
     
      setState(() {
        _selectedImages.clear();
        getFeatureBanner();
      });
    });
}

void _confirmDeleteBanner(int index, {bool isNewUpload = false, String? bannerId}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Confirm Deletion"),
      content: const Text("Are you sure you want to delete this banner?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              if (isNewUpload) {
                // Handling deletion for new uploads
                var file = _selectedImages[index];
                _selectedImages.removeAt(index);
                _imageTitles.remove(file.path);
                _imageLinks.remove(file.path);
              } else {
                // Handling deletion for existing banners
                var allBanners = getProductApiResModel.data!
                    ?.expand((seller) => seller.banners ?? [])
                    .toList() ?? [];

                allBanners.sort((a, b) => (b.order ?? 0).compareTo(a.order ?? 0));

                // Check if the index is valid before proceeding
                if (index < 0 || index >= allBanners.length) {
                  debugPrint("Invalid index: $index for existingBanners.");
                  return;
                }

                // Use bannerId if provided to find the banner to delete
                if (bannerId != null) {
                  var bannerToDelete = allBanners.firstWhere(
                    (banner) => banner.sId == bannerId,
                    orElse: () => null,
                  );

                  if (bannerToDelete != null) {
                    // Mark the banner as deleted
                    bannerToDelete.isDeleted = true;
                  }
                }

                // Refresh the UI after deletion
                setState(() {
                 
                 
                });
              }
            });
          },
          child: const Text("Delete", style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
}






  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Featured Banner", style: TextStyle(color: Colors.black, fontSize: 17)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: _uploadBanners,
            child:  Text("Submit", style: TextStyle(color: AppCol.primary, fontSize: 16)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // const Text("Upload files", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
             Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align text left & button right
        children: [
          const Text(
            "Upload files",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          ElevatedButton.icon(
            onPressed: _pickImages,
            icon: const Icon(Icons.upload),
            label: const Text("Upload banner"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
            const SizedBox(height: 10),
            if ((getProductApiResModel.data != null && getProductApiResModel.data!.isNotEmpty) || _selectedImages.isNotEmpty)
            Expanded(
  child: ReorderableGridView.builder(
     controller: _scrollController,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1, // Full-width card layout
      mainAxisSpacing: 10,
      mainAxisExtent: 305, // Adjust height dynamically
    ),
    itemCount: _selectedImages.length +
        (getProductApiResModel.data
                ?.expand((seller) => seller.banners ?? [])
                .where((banner) => !banner.isDeleted)
                .length ??
            0),
    itemBuilder: (context, index) {
      var existingBanners = getProductApiResModel.data
              ?.expand((seller) => seller.banners ?? [])
              .where((banner) => !banner.isDeleted)
              .toList() ??
          [];
      //  var existingBanners = getProductApiResModel.data
      //       ?.expand((seller) => seller.banners ?? [])
      //       .where((banner) => !banner.isDeleted)
      //       .toList() ?? [];

            

    existingBanners.sort((a, b) => (b.order ?? 0).compareTo(a.order ?? 0)); 

      int newImageCount = _selectedImages.length;
      int existingBannerCount = existingBanners.length;

      if (index < newImageCount) {
        // Newly Uploaded Images
        File file = _selectedImages[index];

        return Material(
          key: ValueKey(file.path),
          elevation: 4, // Shadow for depth
          borderRadius: BorderRadius.circular(12),
          shadowColor: Colors.black26,
          child: Container(
             margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        file,
                        width: double.infinity,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 6,
                      right: 6,
                      child: GestureDetector(
                        onTap: () => _confirmDeleteBanner(index, isNewUpload: true),
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
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _imageTitles[file.path],
                 
                  decoration: InputDecoration(
                    labelText: 'Title (optional)',
                                        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0), // Adjust height

                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _imageLinks[file.path],
                  decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0), // Adjust height

                    labelText: 'URL (optional)',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  keyboardType: TextInputType.url,
                ),
              ],
            ),
          ),
        );
      } else {



        // Existing Banners
        int existingIndex = index - newImageCount;
        var banner = existingBanners[existingIndex];

        return Material(
          key: ValueKey(banner.sId),
          elevation: 4, // Same shadow effect
          borderRadius: BorderRadius.circular(12),
          shadowColor: Colors.black26,
          child: Container(
             margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: 
                      // CachedNetworkImage(
                      //   imageUrl: banner.bannerImage ?? '',
                      //   width: double.infinity,
                      //   height: 140,
                      //   fit: BoxFit.cover,
                      //   placeholder: (context, url) =>
                      //       const Center(child: CircularProgressIndicator()),
                      //   errorWidget: (context, url, error) =>
                      //       const Icon(Icons.image_not_supported, size: 100, color: Colors.grey),
                      // ),
                       CachedNetworkImage(
  imageUrl: banner.bannerImage != null &&
          banner.bannerImage
              .contains(AppConstants.imageBaseUrl)
      ? banner.bannerImage
      :  AppConstants.imageBaseUrl   +
          (banner.bannerImage ?? ''),
    width: double.infinity,
                        height: 140,
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
                    Positioned(
                      top: 6,
                      right: 6,
                      child: GestureDetector(
                        onTap: () {
  int existingIndex = existingBanners.indexWhere((b) => b.sId == banner.sId);
  if (existingIndex != -1) {
   // _confirmDeleteBanner(existingIndex, isNewUpload: false);
  // Call with the bannerId parameter
_confirmDeleteBanner(index, bannerId: existingBanners[index].sId);


  } else {
    debugPrint("Banner not found in existingBanners.");
  }
},
                        //_confirmDeleteBanner(existingIndex, isNewUpload: false),
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
                ),
                const SizedBox(height: 10),
                TextFormField(
  controller: _imageTitles.putIfAbsent(
    banner.sId, 
    () => TextEditingController(text: banner.title ?? ''),
  ),
  decoration: InputDecoration(
    labelText: 'Title (optional)',
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  ),
),

                const SizedBox(height: 8),
                TextFormField(
                  // controller: TextEditingController(text: banner.link ?? ''),
                  controller: _imageLinks.putIfAbsent(
    banner.sId, 
    () => TextEditingController(text: banner.link ?? ''),
  ),
                  decoration: InputDecoration(
                    labelText: 'URL (optional)',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  keyboardType: TextInputType.url,
                ),
              ],
            ),
          ),
        );
      }
    },
    onReorder: (int oldIndex, int newIndex) {
  setState(() {
    if (oldIndex < newIndex) newIndex -= 1;

    int newImageCount = _selectedImages.length;
    var existingBanners = getProductApiResModel.data
            ?.expand((seller) => seller.banners ?? [])
            .where((banner) => !banner.isDeleted)
            .toList() ??
        [];

    existingBanners.sort((a, b) => (b.order ?? 0).compareTo(a.order ?? 0));

    if (oldIndex < newImageCount && newIndex < newImageCount) {
      // Reorder within new uploads
      final file = _selectedImages.removeAt(oldIndex);
      _selectedImages.insert(newIndex, file);

      // Maintain text controllers in sync
      final titleController = _imageTitles.remove(file.path);
      final linkController = _imageLinks.remove(file.path);
      _imageTitles[file.path] = titleController!;
      _imageLinks[file.path] = linkController!;
    } else if (oldIndex >= newImageCount && newIndex >= newImageCount) {
      // Reorder within existing banners
      int existingOldIndex = oldIndex - newImageCount;
      int existingNewIndex = newIndex - newImageCount;
      final banner = existingBanners.removeAt(existingOldIndex);
      existingBanners.insert(existingNewIndex, banner);

      // Update order values for existing banners
      for (int i = 0; i < existingBanners.length; i++) {
        existingBanners[i].order = existingBanners.length - i;
      }
    } else {
      // Moving between new and existing items
      debugPrint("Reordering between new and existing banners is not supported.");
    }
  });
},

  ),
),
      
          ],
        ),
      ),
    );
  }
}


