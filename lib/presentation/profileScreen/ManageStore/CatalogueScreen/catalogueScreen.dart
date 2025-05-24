// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:taptohello/core/constants.dart';
// import 'package:taptohello/core/utils/commonFun.dart';
// import 'package:taptohello/presentation/home/home_view.dart';
// import 'package:video_player/video_player.dart';
// import 'package:taptohello/core/app_export.dart';
// import 'package:taptohello/data/productCategoryModel/getProductListApiResModel.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/CatalogueScreen/catalogueDialogScreen.dart';

// class CatalogueScreen extends StatefulWidget {
//   const CatalogueScreen({Key? key}) : super(key: key);

//   @override
//   State<CatalogueScreen> createState() => _CatalogueScreenState();
// }

// class _CatalogueScreenState extends State<CatalogueScreen> {
//   final AddProductController _addProductController = AddProductController();
//   final Map<int, VideoPlayerController> _videoControllers = {};

//   late Future<List<Products>> _productsFuture;
//   List<Products> _products = [];

//   @override
//   void initState() {
//     super.initState();
//     _productsFuture = _fetchProducts();
//   }

//   @override
//   void dispose() {
//     for (var controller in _videoControllers.values) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   // This function is responsible for loading products and updating UI
//   Future<void> _loadProducts() async {
//     // Step 1: Show old products instantly (optional: use local storage if needed)
//     setState(() {
//       // Trigger UI update immediately with whatever _products have
//     });

//     // Step 2: Fetch fresh products from API in the background
//     final apiResponse = await _addProductController.getProductList();
//     final freshProducts = apiResponse.products?.map((product) {
//       return Products(
//         id: product.id,
//         images: product.images,
//         // add any other necessary fields here
//       );
//     }).toList() ?? [];

//     // Step 3: Update products and refresh UI
//     setState(() {
//       _products = freshProducts;
//     });
//   }

//   Future<List<Products>> _fetchProducts() async {
//     final apiResponse = await _addProductController.getProductList();
//     final products = apiResponse.products ?? [];

//     // Here, we map each item in the response to a Product object
//     return products.map((p) => Products(
//       id: p.id,
//       images: p.images,
//       // map other fields as needed
//     )).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF0F1F6),
//       appBar: _buildAppBar(),
//       body: FutureBuilder<List<Products>>(
//         future: _productsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No products found.'));
//           }

//           final products = snapshot.data!;
//           return _buildProductGrid(products);
//         },
//       ),
//     );
//   }

//   AppBar _buildAppBar() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       iconTheme: const IconThemeData(color: Colors.black),
//        leading: InkWell(
//           onTap: () {
//             openScreenWithoutBack(context, HomeView(indexfromPrevious: 1,));
//             // Navigator.of(context).pop();
//           },
//           child: Padding(
//               padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//               child: Image.asset(
//                 "assets/images/back.png",
//                 height: 24,
//               )),
//         ),
//       title: const Text('Catalogue', style: TextStyle(color: Colors.black, fontSize: 18)),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.filter_alt_outlined, color: AppCol.primary),
//           onPressed: _showFilterDialog,
//         ),
//       ],
//     );
//   }

//   Widget _buildProductGrid(List<Products> products) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(8),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//         childAspectRatio: 4 / 5,
//       ),
//       itemCount: products.length,
//       itemBuilder: (context, index) {
//         final product = products[index];
//         return _buildProductItem(product, index);
//       },
//     );
//   }

//   Widget _buildProductItem(Products product, int index) {
//     final firstImage = product.images?.firstOrNull;
//     final isVideo = firstImage?.endsWith('.mp4') ?? false;

//     if (isVideo && !_videoControllers.containsKey(index)) {
//       _initializeVideoController(firstImage!, index);
//     }

//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Stack(
//         children: [
//           Positioned.fill(
//             child: firstImage == null
//                 ? Image.asset('assets/newIcons/home_head.png', fit: BoxFit.cover)
//                 : isVideo
//                     ? _buildVideoPlayer(index)
//                     : 
//       //               CachedNetworkImage(
//       //                  // imageUrl: firstImage,
//       //                   imageUrl: firstImage
//       //         .contains(AppConstants.imageBaseUrl)
//       // ? firstImage
//       // :  AppConstants.imageBaseUrl   +
//       //     (firstImage ?? ''),
//       //                   fit: BoxFit.cover,
//       //                   placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//       //                   errorWidget: (context, url, error) => const Icon(Icons.error),
//       //                 ),
//       CachedNetworkImage(
//   imageUrl: firstImage.contains(AppConstants.imageBaseUrl)
//       ? firstImage
//       : AppConstants.imageBaseUrl + firstImage,
//   fit: BoxFit.cover,
//   placeholder: (context, url) => const Center(
//     child: SizedBox(
//       width: 24,
//       height: 24,
//       child: CircularProgressIndicator(strokeWidth: 2),
//     ),
//   ),
//   errorWidget: (context, url, error) => const Icon(Icons.broken_image),
//   memCacheHeight: 800, // Optional: Limit memory size to avoid GC issues
//   memCacheWidth: 800,
//   fadeInDuration: Duration(milliseconds: 300), // Smooth transition
//   fadeOutDuration: Duration(milliseconds: 100),
// ),

//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.4),
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(8),
//                   bottomRight: Radius.circular(8),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   if ((product.images?.length ?? 0) > 1)
//                     Image.asset('assets/newIcons/groupCopyIcon.png', height: 20),
//                   const Spacer(),
//                   _buildProductMenu(product),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // void _initializeVideoController(String url, int index) {
//   //   final controller = VideoPlayerController.networkUrl(Uri.parse(url));
//   //   _videoControllers[index] = controller;
//   //   controller.initialize().then((_) {
//   //     setState(() {});
//   //     controller.setVolume(0);
//   //     controller.pause();
//   //   });
//   // }

//   void _initializeVideoController(String url, int index) {
//   // Check if the URL contains AppConstants.imageBaseUrl, if not, prepend it
//   String videoUrl = url;
//   if (!videoUrl.contains(AppConstants.imageBaseUrl)) {
//     videoUrl = AppConstants.imageBaseUrl + videoUrl;
//   }

//   // Create the VideoPlayerController with the updated URL
//   final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
//   _videoControllers[index] = controller;

//   controller.initialize().then((_) {
//     setState(() {});
//     controller.setVolume(0);  // Mute the video
//     controller.pause();  // Pause the video after initialization
//   });
// }


//   Widget _buildVideoPlayer(int index) {
//     final controller = _videoControllers[index];
//     if (controller == null || !controller.value.isInitialized) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     return VideoPlayer(controller);
//   }

//   Widget _buildProductMenu(Products product) {
//     return PopupMenuButton<String>(
//       onSelected: (value) => _onMenuSelected(value, product),
//       itemBuilder: (context) => [
//         const PopupMenuItem(value: 'edit', child: Text('Edit')),
//         const PopupMenuItem(value: 'delete', child: Text('Delete')),
//       ],
//       icon: const Icon(Icons.more_vert, color: Colors.white),
//     );
//   }

//   Future<void> _onMenuSelected(String value, Products product) async {
//     if (value == 'edit') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => EditProductListScreen(
//             productId: product.id ?? '',
//             isFrom: "Variants",
//             isFromCatalogue: true,
//           ),
//         ),
//       );
//     } else if (value == 'delete') {
//       final shouldDelete = await _showDeleteDialog();
//       if (shouldDelete) {
//         await _addProductController.deleteProduct(product.id ?? '');
//         setState(() {
//           _productsFuture = _fetchProducts();
//         });
//       }
//     }
//   }

//   Future<bool> _showDeleteDialog() async {
//     return await showDialog<bool>(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         title: const Text('Delete this product?', textAlign: TextAlign.center),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context, false),
//             child: const Text('No'),
//           ),
//           TextButton(
//             onPressed: () => Navigator.pop(context, true),
//             child: const Text('Yes'),
//           ),
//         ],
//       ),
//     ) ?? false;
//   }

//   Future<void> _showFilterDialog() async {
//     final result = await showDialog(
//       context: context,
//       builder: (context) => CatalogueDialogScreen(),
//     );
//     if (result != null) {
//       setState(() {
//         _productsFuture = _fetchProducts();
//       });
//     }
//   }
// }



// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:taptohello/core/constants.dart';
// import 'package:taptohello/core/utils/commonFun.dart';
// import 'package:taptohello/presentation/home/home_view.dart';
// import 'package:video_player/video_player.dart';
// import 'package:taptohello/core/app_export.dart';
// import 'package:taptohello/data/productCategoryModel/getProductListApiResModel.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/CatalogueScreen/catalogueDialogScreen.dart';

// class CatalogueScreen extends StatefulWidget {
//   const CatalogueScreen({Key? key}) : super(key: key);

//   @override
//   State<CatalogueScreen> createState() => _CatalogueScreenState();
// }

// class _CatalogueScreenState extends State<CatalogueScreen> {
//   final AddProductController _addProductController = AddProductController();
//   final Map<int, VideoPlayerController> _videoControllers = {};
//   late Future<List<Products>> _productsFuture;
//   List<Products> _products = [];

//   @override
//   void initState() {
//     super.initState();
//     _productsFuture = _fetchProducts();
//   }

//   @override
//   void dispose() {
//     for (var controller in _videoControllers.values) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   Future<List<Products>> _fetchProducts() async {
//     final apiResponse = await _addProductController.getProductList();
//     final products = apiResponse.products ?? [];

//     final mappedProducts = products.map((p) => Products(
//       id: p.id,
//       images: p.images,
//     )).toList();

//     // Preload images
//     _precacheImages(context, mappedProducts);
//     return mappedProducts;
//   }

//   void _precacheImages(BuildContext context, List<Products> products) {
//     for (var product in products) {
//       final imageUrl = product.images?.firstOrNull;
//       if (imageUrl != null && !imageUrl.endsWith('.mp4')) {
//         final fullUrl = imageUrl.contains(AppConstants.imageBaseUrl)
//             ? imageUrl
//             : AppConstants.imageBaseUrl + imageUrl;
//         precacheImage(CachedNetworkImageProvider(fullUrl), context);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop:_onBackPressed, 
//       child: Scaffold(
//         backgroundColor: const Color(0xFFF0F1F6),
//         appBar: _buildAppBar(),
//         body: FutureBuilder<List<Products>>(
//           future: _productsFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return const Center(child: Text('No products found.'));
//             }
      
//             final products = snapshot.data!;
//             return _buildProductGrid(products);
//           },
//         ),
//       ),
//     );
//   }
//   Future<bool> _onBackPressed() async {
//   // Navigate back to HomeView or any other logic
//   openScreenWithoutBack(context, HomeView(indexfromPrevious: 1));
//   return false; // returning false means "don't pop this screen"
// }


//   AppBar _buildAppBar() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       iconTheme: const IconThemeData(color: Colors.black),
//       leading: InkWell(
//         onTap: () {
//           openScreenWithoutBack(context, HomeView(indexfromPrevious: 1));
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Image.asset("assets/images/back.png", height: 24),
//         ),
//       ),
//       title: const Text('Catalogue', style: TextStyle(color: Colors.black, fontSize: 18)),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.filter_alt_outlined, color: AppCol.primary),
//           onPressed: _showFilterDialog,
//         ),
//       ],
//     );
//   }

//   Widget _buildProductGrid(List<Products> products) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(8),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//         childAspectRatio: 4 / 5,
//       ),
//       itemCount: products.length,
//       itemBuilder: (context, index) {
//         final product = products[index];
//         return _buildProductItem(product, index);
//       },
//     );
//   }

//   Widget _buildProductItem(Products product, int index) {
//     final firstImage = product.images?.firstOrNull;
//     final isVideo = firstImage?.endsWith('.mp4') ?? false;

//     if (isVideo && !_videoControllers.containsKey(index)) {
//       _initializeVideoController(firstImage!, index);
//     }

//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Stack(
//         children: [
//           Positioned.fill(
//             // child: firstImage == null
//             //     ? Image.asset('assets/newIcons/home_head.png', fit: BoxFit.cover)
//             //     : isVideo
//             //         ? _buildVideoPlayer(index)
//             //         : CachedNetworkImage(
//             //             imageUrl: firstImage.contains(AppConstants.imageBaseUrl)
//             //                 ? firstImage
//             //                 : AppConstants.imageBaseUrl + firstImage,
//             //             fit: BoxFit.cover,
//             //             useOldImageOnUrlChange: true,
//             //             fadeInDuration: Duration.zero,
//             //             fadeOutDuration: Duration.zero,
//             //             placeholder: (context, url) =>
//             //                 Container(color: Colors.grey[200]),
//             //             errorWidget: (context, url, error) =>
//             //                 const Icon(Icons.broken_image),
//             //           ),
//             child: firstImage == null
//     ? Image.asset('assets/newIcons/home_head.png', fit: BoxFit.cover)
//     : isVideo
//         ? _buildVideoPlayer(index)
//         : CachedNetworkImage(
//             imageUrl: firstImage.contains(AppConstants.imageBaseUrl)
//                 ? firstImage
//                 : AppConstants.imageBaseUrl + firstImage,
//             fit: BoxFit.cover,
//             placeholder: (context, url) =>
//                 Center(child: CircularProgressIndicator()),
//             errorWidget: (context, url, error) =>
//                 const Icon(Icons.broken_image),
//           ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.4),
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(8),
//                   bottomRight: Radius.circular(8),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   if ((product.images?.length ?? 0) > 1)
//                     Image.asset('assets/newIcons/groupCopyIcon.png', height: 20),
//                   const Spacer(),
//                   _buildProductMenu(product),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _initializeVideoController(String url, int index) {
//     String videoUrl = url;
//     if (!videoUrl.contains(AppConstants.imageBaseUrl)) {
//       videoUrl = AppConstants.imageBaseUrl + videoUrl;
//     }

//     final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
//     _videoControllers[index] = controller;

//     controller.initialize().then((_) {
//       setState(() {});
//       controller.setVolume(0);
//       controller.pause();
//     });
//   }

//   // Widget _buildVideoPlayer(int index) {
//   //   final controller = _videoControllers[index];
//   //   if (controller == null || !controller.value.isInitialized) {
//   //     return const Center(child: CircularProgressIndicator());
//   //   }
//   //   return VideoPlayer(controller);
//   // }

//   Widget _buildVideoPlayer(int index) {
//   final controller = _videoControllers[index];
//   if (controller == null || !controller.value.isInitialized) {
//     return const Center(
//       child: CircularProgressIndicator(
//         color: Colors.white,
//         strokeWidth: 2,
//       ),
//     );
//   }
//   return AspectRatio(
//     aspectRatio: controller.value.aspectRatio,
//     child: VideoPlayer(controller),
//   );
// }


//   Widget _buildProductMenu(Products product) {
//     return PopupMenuButton<String>(
//       onSelected: (value) => _onMenuSelected(value, product),
//       itemBuilder: (context) => [
//         const PopupMenuItem(value: 'edit', child: Text('Edit')),
//         const PopupMenuItem(value: 'delete', child: Text('Delete')),
//       ],
//       icon: const Icon(Icons.more_vert, color: Colors.white),
//     );
//   }

//   Future<void> _onMenuSelected(String value, Products product) async {
//     if (value == 'edit') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => EditProductListScreen(
//             productId: product.id ?? '',
//             isFrom: "Variants",
//             isFromCatalogue: true,
//           ),
//         ),
//       );
//     } else if (value == 'delete') {
//       final shouldDelete = await _showDeleteDialog();
//       if (shouldDelete) {
//         await _addProductController.deleteProduct(product.id ?? '');
//         setState(() {
//           _productsFuture = _fetchProducts();
//         });
//       }
//     }
//   }

//   Future<bool> _showDeleteDialog() async {
//     return await showDialog<bool>(
//           context: context,
//           builder: (context) => AlertDialog(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//             title: const Text('Delete this product?', textAlign: TextAlign.center),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context, false),
//                 child: const Text('No'),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.pop(context, true),
//                 child: const Text('Yes'),
//               ),
//             ],
//           ),
//         ) ??
//         false;
//   }

//   Future<void> _showFilterDialog() async {
//     final result = await showDialog(
//       context: context,
//       builder: (context) => CatalogueDialogScreen(),
//     );
//     if (result != null) {
//       setState(() {
//         _productsFuture = _fetchProducts();
//       });
//     }
//   }
// }


// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:taptohello/core/constants.dart';
// import 'package:taptohello/core/utils/commonFun.dart';
// import 'package:taptohello/presentation/home/home_view.dart';
// import 'package:video_player/video_player.dart';
// import 'package:taptohello/core/app_export.dart';
// import 'package:taptohello/data/productCategoryModel/getProductListApiResModel.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/CatalogueScreen/catalogueDialogScreen.dart';

// class CatalogueScreen extends StatefulWidget {
//   const CatalogueScreen({Key? key}) : super(key: key);

//   @override
//   State<CatalogueScreen> createState() => _CatalogueScreenState();
// }

// class _CatalogueScreenState extends State<CatalogueScreen> {
//   final AddProductController _addProductController = AddProductController();
//   final Map<String, VideoPlayerController> _videoControllers = {};
//   late Future<List<Products>> _productsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _productsFuture = _fetchProducts();
//   }

//   @override
//   void dispose() {
//     for (var controller in _videoControllers.values) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   Future<List<Products>> _fetchProducts() async {
//     final apiResponse = await _addProductController.getProductList();
//     final products = apiResponse.products ?? [];

//     _precacheImages(context, products);
//     return products;
//   }

//   void _precacheImages(BuildContext context, List<Products> products) {
//     for (var product in products) {
//       final imageUrl = product.images?.firstOrNull;
//       if (imageUrl != null && !imageUrl.endsWith('.mp4')) {
//         final fullUrl = imageUrl.contains(AppConstants.imageBaseUrl)
//             ? imageUrl
//             : AppConstants.imageBaseUrl + imageUrl;
//         precacheImage(CachedNetworkImageProvider(fullUrl), context);
//       }
//     }
//   }

//   Future<void> _initializeVideoController(String url, String key) async {
//     if (_videoControllers.containsKey(key)) return;

//     final fullUrl = url.contains(AppConstants.imageBaseUrl)
//         ? url
//         : AppConstants.imageBaseUrl + url;

//     final controller = VideoPlayerController.networkUrl(Uri.parse(fullUrl));
//     try {
//       await controller.initialize();
//       controller.setVolume(0);
//       controller.pause();

//       if (mounted) {
//         setState(() {
//           _videoControllers[key] = controller;
//         });
//       }
//     } catch (e) {
//       debugPrint('Failed to initialize video for $key: $e');
//     }
//   }

//   Future<bool> _onBackPressed() async {
//     openScreenWithoutBack(context, HomeView(indexfromPrevious: 1));
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onBackPressed,
//       child: Scaffold(
//         backgroundColor: const Color(0xFFF0F1F6),
//         appBar: _buildAppBar(),
//         body: FutureBuilder<List<Products>>(
//           future: _productsFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return const Center(child: Text('No products found.'));
//             }

//             final products = snapshot.data!;
//             return _buildProductGrid(products);
//           },
//         ),
//       ),
//     );
//   }

//   AppBar _buildAppBar() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       iconTheme: const IconThemeData(color: Colors.black),
//       leading: InkWell(
//         onTap: () => openScreenWithoutBack(context, HomeView(indexfromPrevious: 1)),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Image.asset("assets/images/back.png", height: 24),
//         ),
//       ),
//       title: const Text('Catalogue', style: TextStyle(color: Colors.black, fontSize: 18)),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.filter_alt_outlined, color: AppCol.primary),
//           onPressed: _showFilterDialog,
//         ),
//       ],
//     );
//   }

//   Widget _buildProductGrid(List<Products> products) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(8),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//         childAspectRatio: 4 / 5,
//       ),
//       itemCount: products.length,
//       itemBuilder: (context, index) {
//         final product = products[index];
//         return _buildProductItem(product);
//       },
//     );
//   }

//   Widget _buildProductItem(Products product) {
//     final firstMedia = product.images?.firstOrNull;
//     final isVideo = firstMedia?.endsWith('.mp4') ?? false;
//     final productKey = product.id ?? UniqueKey().toString();

//     if (isVideo && !_videoControllers.containsKey(productKey)) {
//       _initializeVideoController(firstMedia!, productKey);
//     }

//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Stack(
//         children: [
//           Positioned.fill(
//             child: firstMedia == null
//                 ? Image.asset('assets/newIcons/home_head.png', fit: BoxFit.cover)
//                 : isVideo
//                     ? _buildVideoPlayer(productKey)
//                     : CachedNetworkImage(
//                         imageUrl: firstMedia.contains(AppConstants.imageBaseUrl)
//                             ? firstMedia
//                             : AppConstants.imageBaseUrl + firstMedia,
//                         fit: BoxFit.cover,
//                         placeholder: (context, url) =>
//                             const Center(child: CircularProgressIndicator()),
//                         errorWidget: (context, url, error) =>
//                             const Icon(Icons.broken_image),
//                       ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.4),
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(8),
//                   bottomRight: Radius.circular(8),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   if ((product.images?.length ?? 0) > 1)
//                     Image.asset('assets/newIcons/groupCopyIcon.png', height: 20),
//                   const Spacer(),
//                   _buildProductMenu(product),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildVideoPlayer(String key) {
//     final controller = _videoControllers[key];
//     if (controller == null || !controller.value.isInitialized) {
//       return const Center(
//         child: CircularProgressIndicator(
//           color: Colors.white,
//           strokeWidth: 2,
//         ),
//       );
//     }
//     return AspectRatio(
//       aspectRatio: controller.value.aspectRatio,
//       child: VideoPlayer(controller),
//     );
//   }

//   Widget _buildProductMenu(Products product) {
//     return PopupMenuButton<String>(
//       onSelected: (value) => _onMenuSelected(value, product),
//       itemBuilder: (context) => [
//         const PopupMenuItem(value: 'edit', child: Text('Edit')),
//         const PopupMenuItem(value: 'delete', child: Text('Delete')),
//       ],
//       icon: const Icon(Icons.more_vert, color: Colors.white),
//     );
//   }

//   Future<void> _onMenuSelected(String value, Products product) async {
//     if (value == 'edit') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => EditProductListScreen(
//             productId: product.id ?? '',
//             isFrom: "Variants",
//             isFromCatalogue: true,
//           ),
//         ),
//       );
//     } else if (value == 'delete') {
//       final shouldDelete = await _showDeleteDialog();
//       if (shouldDelete) {
//         await _addProductController.deleteProduct(product.id ?? '');
//         setState(() {
//           _productsFuture = _fetchProducts();
//         });
//       }
//     }
//   }

//   Future<bool> _showDeleteDialog() async {
//     return await showDialog<bool>(
//           context: context,
//           builder: (context) => AlertDialog(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//             title: const Text('Delete this product?', textAlign: TextAlign.center),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context, false),
//                 child: const Text('No'),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.pop(context, true),
//                 child: const Text('Yes'),
//               ),
//             ],
//           ),
//         ) ??
//         false;
//   }

//   Future<void> _showFilterDialog() async {
//     final result = await showDialog(
//       context: context,
//       builder: (context) => CatalogueDialogScreen(),
//     );
//     if (result != null) {
//       setState(() {
//         _productsFuture = _fetchProducts();
//       });
//     }
//   }
// }





// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:taptohello/core/constants.dart';
// import 'package:video_player/video_player.dart';
// import 'package:taptohello/core/app_export.dart';
// import 'package:taptohello/data/productCategoryModel/getProductListApiResModel.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';

// class CatalogueScreen extends StatefulWidget {
//   const CatalogueScreen({Key? key}) : super(key: key);

//   @override
//   State<CatalogueScreen> createState() => _CatalogueScreenState();
// }

// class _CatalogueScreenState extends State<CatalogueScreen> {
//   final AddProductController _addProductController = AddProductController();
//   final ScrollController _scrollController = ScrollController();
//   final Map<int, VideoPlayerController> _videoControllers = {};

//   List<Products> _allProducts = [];
//   List<Products> _displayedProducts = [];
//   bool _isLoading = false;
//   final int _batchSize = 10;

//   @override
//   void initState() {
//     super.initState();
//     _fetchProducts();
//     _scrollController.addListener(_scrollListener);
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     for (var controller in _videoControllers.values) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   Future<void> _fetchProducts() async {
//     setState(() => _isLoading = true);
//     final apiResponse = await _addProductController.getProductList();
//     final products = apiResponse.products ?? [];

//     setState(() {
//       _allProducts = products;
//       _displayedProducts = _allProducts.take(_batchSize).toList();
//       _isLoading = false;
//     });
//   }

//   void _scrollListener() {
//     if (_scrollController.position.pixels >=
//             _scrollController.position.maxScrollExtent - 200 &&
//         !_isLoading) {
//       _loadMoreProducts();
//     }
//   }

//   void _loadMoreProducts() {
//     final remaining = _allProducts.length - _displayedProducts.length;
//     if (remaining > 0) {
//       final nextBatch = _allProducts.skip(_displayedProducts.length).take(_batchSize);
//       setState(() {
//         _displayedProducts.addAll(nextBatch);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Catalogue")),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : RefreshIndicator(
//               onRefresh: _fetchProducts,
//               child: GridView.builder(
//                 controller: _scrollController,
//                 padding: const EdgeInsets.all(8),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 8,
//                   mainAxisSpacing: 8,
//                   childAspectRatio: 0.75,
//                 ),
//                 itemCount: _displayedProducts.length,
//                 itemBuilder: (context, index) => _buildProductItem(_displayedProducts[index], index),
//               ),
//             ),
//     );
//   }

//   Widget _buildProductItem(Products product, int index) {
//     final firstImage = product.images?.firstOrNull;
//     final isVideo = firstImage?.endsWith('.mp4') ?? false;

//     if (isVideo && !_videoControllers.containsKey(index)) {
//       _initializeVideoController(firstImage!, index);
//     }

//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Stack(
//         children: [
//           Positioned.fill(
//             child: firstImage == null
//                 ? Image.asset('assets/newIcons/home_head.png', fit: BoxFit.cover)
//                 : isVideo
//                     ? _buildVideoPlayer(index)
//                     : CachedNetworkImage(
//                         imageUrl: firstImage.contains(AppConstants.imageBaseUrl)
//                             ? firstImage
//                             : AppConstants.imageBaseUrl + firstImage,
//                         fit: BoxFit.cover,
//                         placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//                         errorWidget: (context, url, error) => const Icon(Icons.broken_image),
//                       ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.4),
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(8),
//                   bottomRight: Radius.circular(8),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   if ((product.images?.length ?? 0) > 1)
//                     Image.asset('assets/newIcons/groupCopyIcon.png', height: 20),
//                   const Spacer(),
//                   _buildProductMenu(product),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _initializeVideoController(String url, int index) {
//     String videoUrl = url.contains(AppConstants.imageBaseUrl)
//         ? url
//         : AppConstants.imageBaseUrl + url;

//     final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
//     _videoControllers[index] = controller;
//     controller.initialize().then((_) {
//       setState(() {});
//       controller.setVolume(0);
//       controller.pause();
//     });
//   }

//   Widget _buildVideoPlayer(int index) {
//     final controller = _videoControllers[index];
//     if (controller == null || !controller.value.isInitialized) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     return AspectRatio(
//       aspectRatio: controller.value.aspectRatio,
//       child: VideoPlayer(controller),
//     );
//   }

//   Widget _buildProductMenu(Products product) {
//     return PopupMenuButton<String>(
//       onSelected: (value) => _onMenuSelected(value, product),
//       itemBuilder: (context) => [
//         const PopupMenuItem(value: 'edit', child: Text('Edit')),
//         const PopupMenuItem(value: 'delete', child: Text('Delete')),
//       ],
//       icon: const Icon(Icons.more_vert, color: Colors.white),
//     );
//   }

//   Future<void> _onMenuSelected(String value, Products product) async {
//     if (value == 'edit') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => EditProductListScreen(
//             productId: product.id ?? '',
//             isFrom: "Variants",
//             isFromCatalogue: true,
//           ),
//         ),
//       );
//     } else if (value == 'delete') {
//       final shouldDelete = await showDialog<bool>(
//             context: context,
//             builder: (context) => AlertDialog(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//               title: const Text('Delete this product?', textAlign: TextAlign.center),
//               actions: [
//                 TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('No')),
//                 TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Yes')),
//               ],
//             ),
//           ) ??
//           false;

//       if (shouldDelete) {
//         await _addProductController.deleteProduct(product.id ?? '');
//         _fetchProducts();
//       }
//     }
//   }
// } 


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/core/utils/commonFun.dart';
import 'package:taptohello/presentation/home/home_view.dart';
import 'package:taptohello/data/productCategoryModel/getProductListApiResModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/CatalogueScreen/catalogueDialogScreen.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({Key? key}) : super(key: key);

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  final AddProductController _addProductController = AddProductController();
  final Map<int, VideoPlayerController> _videoControllers = {};
  final ScrollController _scrollController = ScrollController();
  List<Products> _products = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentBatch = 0;
  final int _batchSize = 10;

  @override
  void initState() {
    super.initState();
    _fetchMoreProducts();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 300 &&
          !_isLoading && _hasMore) {
        _fetchMoreProducts();
      }
    });
  }

  // @override
  // void dispose() {
  //   for (var controller in _videoControllers.values) {
  //     controller.dispose();
  //   }
  //   _scrollController.dispose();
  //   super.dispose();
  // }

  @override
void dispose() {
  for (var controller in _videoControllers.values) {
    if (controller.value.isInitialized) {
      controller.dispose();
    }
  }
  _videoControllers.clear();
  super.dispose();
}


  Future<void> _fetchMoreProducts() async {
    setState(() => _isLoading = true);
    final response = await _addProductController.getProductList();
    final allProducts = response.products ?? [];

    final nextBatch = allProducts.skip(_currentBatch * _batchSize).take(_batchSize).toList();
    if (nextBatch.isEmpty) {
      _hasMore = false;
    } else {
      _currentBatch++;
      _products.addAll(nextBatch);
      _precacheImages(context, nextBatch);
    }
    setState(() => _isLoading = false);
  }

  void _precacheImages(BuildContext context, List<Products> products) {
    for (var product in products) {
      final imageUrl = product.images?.firstOrNull;
      if (imageUrl != null && !imageUrl.endsWith('.mp4')) {
        final fullUrl = imageUrl.contains(AppConstants.imageBaseUrl)
            ? imageUrl
            : AppConstants.imageBaseUrl + imageUrl;
        precacheImage(CachedNetworkImageProvider(fullUrl), context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F1F6),
        appBar: _buildAppBar(),
        body: _buildProductList(),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    openScreenWithoutBack(context, HomeView(indexfromPrevious: 1));
    return false;
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      leading: InkWell(
        onTap: () => openScreenWithoutBack(context, HomeView(indexfromPrevious: 1)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset("assets/images/back.png", height: 24),
        ),
      ),
      title: const Text('Catalogue', style: TextStyle(color: Colors.black, fontSize: 18)),
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_alt_outlined, color: Colors.blue),
          onPressed: _showFilterDialog,
        ),
      ],
    );
  }

  Widget _buildProductList() {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(8),
      itemCount: (_products.length / 2).ceil() + (_isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (_isLoading && index == (_products.length / 2).ceil()) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final leftProduct = _products[index * 2];
        final rightProduct = (index * 2 + 1 < _products.length) ? _products[index * 2 + 1] : null;

        return Row(
          children: [
            Expanded(child: _buildProductItem(leftProduct, index * 2)),
            const SizedBox(width: 8),
            Expanded(child: rightProduct != null ? _buildProductItem(rightProduct, index * 2 + 1) : Container()),
          ],
        );
      },
    );
  }

  Widget _buildProductItem(Products product, int index) {
    final firstImage = product.images?.firstOrNull;
    final isVideo = firstImage?.endsWith('.mp4') ?? false;

    if (isVideo && !_videoControllers.containsKey(index)) {
      _initializeVideoController(firstImage!, index);
    }

    return Container(
      key: ValueKey('product_$index'),
      height: 240,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: firstImage == null
                ? Image.asset('assets/newIcons/home_head.png', fit: BoxFit.cover)
                : isVideo
                    ? _buildVideoPlayer(index)
                    : CachedNetworkImage(
                        imageUrl: firstImage.contains(AppConstants.imageBaseUrl)
                            ? firstImage
                            : AppConstants.imageBaseUrl + firstImage,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(Icons.broken_image),
                      ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  if ((product.images?.length ?? 0) > 1)
                    Image.asset('assets/newIcons/groupCopyIcon.png', height: 20),
                  const Spacer(),
                  _buildProductMenu(product),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

//  void _initializeVideoController(String url, int index) {
//   String videoUrl = url.contains(AppConstants.imageBaseUrl)
//       ? url
//       : AppConstants.imageBaseUrl + url;

//   final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
//   _videoControllers[index] = controller;

//   controller.initialize().then((_) {
//     controller.setVolume(0);
//     controller.pause();
//     if (mounted) {
//       setState(() {});
//     }
//   }).catchError((e) {
//     debugPrint("Video initialization failed: $e");
//   });
// }

void _initializeVideoController(String url, int index) {
  if (_videoControllers.containsKey(index)) {
    final existing = _videoControllers[index];
    if (existing != null && existing.value.isInitialized) {
      return; // Already initialized
    }
  }

  final videoUrl = url.contains(AppConstants.imageBaseUrl)
      ? url
      : AppConstants.imageBaseUrl + url;

  final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
  _videoControllers[index] = controller;

  controller.initialize().then((_) {
    if (!mounted) return; // Don't update if widget is disposed

    controller.setVolume(0);
    controller.pause();

    if (mounted) {
      setState(() {});
    }
  }).catchError((e) {
    debugPrint("Video initialization failed for index $index: $e");
  });
}




 Widget _buildVideoPlayer(int index) {
  final controller = _videoControllers[index];
  if (controller == null || !controller.value.isInitialized) {
    return const Center(child: CircularProgressIndicator());
  }
  return AspectRatio(
    key: ValueKey("video_$index"), // <-- ensures unique platform view
    aspectRatio: controller.value.aspectRatio,
    child: VideoPlayer(controller),
  );
}


  Widget _buildProductMenu(Products product) {
    return PopupMenuButton<String>(
      onSelected: (value) => _onMenuSelected(value, product),
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'edit', child: Text('Edit')),
        const PopupMenuItem(value: 'delete', child: Text('Delete')),
      ],
      icon: const Icon(Icons.more_vert, color: Colors.white),
    );
  }

  Future<void> _onMenuSelected(String value, Products product) async {
    if (value == 'edit') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditProductListScreen(
            productId: product.id ?? '',
            isFrom: "Variants",
            isFromCatalogue: true,
          ),
        ),
      );
    } else if (value == 'delete') {
      final shouldDelete = await _showDeleteDialog();
      if (shouldDelete) {
        await _addProductController.deleteProduct(product.id ?? '');
        setState(() {
          _products.clear();
          _currentBatch = 0;
          _hasMore = true;
          _fetchMoreProducts();
        });
      }
    }
  }

  Future<bool> _showDeleteDialog() async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Text('Delete this product?', textAlign: TextAlign.center),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('No')),
              TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Yes')),
            ],
          ),
        ) ??
        false;
  }

  Future<void> _showFilterDialog() async {
    final result = await showDialog(
      context: context,
      builder: (context) => CatalogueDialogScreen(),
    );
    if (result != null) {
      setState(() {
        _products.clear();
        _currentBatch = 0;
        _hasMore = true;
        _fetchMoreProducts();
      });
    }
  }
}




