
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'package:taptohello/data/productCategoryModel/getProductCategoryResponceModel.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';

import 'ProductCategoryController/productcategoryController.dart';
import 'addProductCategory.dart';

class ProductCategoryListScreen extends StatefulWidget {
  const ProductCategoryListScreen({super.key});

  @override
  State<ProductCategoryListScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryListScreen> {

   final ProductCategoryController _productCategoryController =
      ProductCategoryController();
  GetProductCategoryResponceModel getProductCategoryResponceModel =
      GetProductCategoryResponceModel();
      final UserDetailService _userDetailService = getIt<UserDetailService>();
 
 

 
 

  void _confirmDelete(BuildContext context, VoidCallback onDelete) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Confirm Delete"),
      content: const Text("Are you sure you want to delete this category?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Close the dialog
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
            onDelete(); // Perform the delete action
          },
          child: const Text("Delete", style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
}

@override
  void initState() {
    super.initState();
    Future.microtask(() => getProductCategory());
  }

  @override
void didChangeDependencies() {
  super.didChangeDependencies();

  Future.microtask(() {
    final shouldRefresh = ModalRoute.of(context)?.settings.arguments as bool?;
    if (shouldRefresh == true) {
      getProductCategory();
    }
  });
}

void _showDeleteConfirmationDialog(BuildContext context, String? categoryId) {
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
                deleteProductCategory(categoryId); // Remove image
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

 Future<void> deleteProductCategory(String? categoryId) async {
    try {
      DialogBuilder(context).showLoadingIndicator("Loading...");
      
      final response = await _productCategoryController.deleteProductCategory(categoryId);
      if (response != null && mounted) {
        setState(() {
          
           getProductCategory();
          
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


  Future<void> getProductCategory() async {
    try {
      DialogBuilder(context).showLoadingIndicator("Loading...");
      
      final response = await _productCategoryController.getFeatureBanner(userId: _userDetailService.userDetailResponse?.user?.id);
      if (response != null && mounted) {
        setState(() {
          getProductCategoryResponceModel = response;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Product Categories Images", style: TextStyle(color: Colors.black, fontSize: 17)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Add Category",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                ElevatedButton.icon(
                 onPressed: () async {
  final result = await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => AddProductCategoryScreen(),
    ),
  );

  if (result == true) {
    getProductCategory(); // Refresh the data when returning
  }
},

                  icon: const Icon(Icons.add),
                  label: const Text("Add Category Images"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
  child: (getProductCategoryResponceModel.categories == null || 
          getProductCategoryResponceModel.categories!.isEmpty)
      ? const Center(
          child: Text(
            'No Data Found',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        )
      : ListView.builder(
          itemCount: getProductCategoryResponceModel.categories!.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        spreadRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: AspectRatio(
                            aspectRatio: 16 / 9, 
                            child: CachedNetworkImage(
                              imageUrl: getProductCategoryResponceModel.categories![index].categoryImage?.toString() ?? '',
                              width: double.infinity,
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
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          color: Colors.white,
                          child: Text(
                            getProductCategoryResponceModel.categories![index].title?.toString() ?? 'No Title',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      _showDeleteConfirmationDialog(context, getProductCategoryResponceModel.categories![index].categoryId);
                     // deleteProductCategory(getProductCategoryResponceModel.categories![index].categoryId);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppCol.primary, 
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(Icons.close, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
),

//             Expanded(
//               child: ListView.builder(
//                 itemCount: getProductCategoryResponceModel.categories?.length,
//                 itemBuilder: (context, index) {
//                 //  final category = categories[index];
//                   return Stack(
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.symmetric(vertical: 10),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 6,
//                               spreadRadius: 2,
//                               offset: const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(12),
//                           child: Column(
//                             children: [
//                            ClipRRect(
//   borderRadius: BorderRadius.circular(12),
//   child: AspectRatio(
//     aspectRatio: 16 / 9, // Maintain proper aspect ratio
//     child: CachedNetworkImage(
//       imageUrl: (getProductCategoryResponceModel.categories != null && 
//              getProductCategoryResponceModel.categories!.isNotEmpty && 
//              getProductCategoryResponceModel.categories![index].categoryImage != null) 
//             ? getProductCategoryResponceModel.categories![index].categoryImage.toString() 
//             : '',
//       width: double.infinity,
//       fit: BoxFit.cover, // Ensures the whole image is visible without cropping
//       placeholder: (context, url) => const Center(
//         child: CircularProgressIndicator(), // Loading Indicator
//       ),
//       errorWidget: (context, url, error) => const Icon(
//         Icons.image_not_supported,
//         size: 100,
//         color: Colors.grey,
//       ),
//     ),
//   ),
// ),



//                               Container(
//                                 width: double.infinity,
//                                 padding: const EdgeInsets.all(12),
//                                 color: Colors.white,
//                                 child: Text(
//                                   (getProductCategoryResponceModel.categories != null && 
//    getProductCategoryResponceModel.categories!.isNotEmpty && 
//    getProductCategoryResponceModel.categories![index].title != null)
//    ? getProductCategoryResponceModel.categories![index].title.toString()
//    : 'No Title',
//                                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Positioned(
//   top: 15,
//   right: 10,
//   child: GestureDetector(
//     onTap:() {
//       deleteProductCategory(getProductCategoryResponceModel.categories![index].categoryId);
//     },
//     child: Container(
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: AppCol.primary, // Use red for delete button
//       ),
//       padding: const EdgeInsets.all(6),
//       child: const Icon(Icons.close, color: Colors.white, size: 20),
//     ),
//   ),
// ),



//                     ],
//                   );
//                 },
//               ),
//             ),
         
         
          ],
        ),
      ),
    );
  }
}




