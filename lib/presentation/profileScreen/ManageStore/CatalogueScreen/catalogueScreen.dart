// import 'package:flutter/material.dart';
// import 'package:taptohello/core/app_export.dart';
// import 'package:taptohello/data/productCategoryModel/deleteProductApiResModel.dart';
// import 'package:taptohello/data/productCategoryModel/filterCatalogueApiResModel.dart';
// import 'package:taptohello/data/productCategoryModel/filterDataModel.dart';
// import 'package:taptohello/data/productCategoryModel/getProductListApiResModel.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/addProductListScreen.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/CatalogueScreen/catalogueDialogScreen.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/InstagramAuth/instagramAuthWebViewPage.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/InstagramAuth/instagramLogin.dart';
// import 'package:video_player/video_player.dart';

// class CatalogueScreen extends StatefulWidget {
//   const CatalogueScreen({super.key});

//   @override
//   State<CatalogueScreen> createState() => _CatalogueScreenState();
// }

// class _CatalogueScreenState extends State<CatalogueScreen> {
//   GetProductApiResModel getProductApiResModel = GetProductApiResModel();
//   final AddProductController _addProductController = AddProductController();

//   bool isApiDataAvailable = false;
//   late Future _future;

//   final Map<int, VideoPlayerController> _videoControllers = {};
//   final Map<int, bool> _isVideoControllerInitialized = {};

//   // final GlobalKey _menuKey = GlobalKey();

//   DeleteProductApiResModel deleteProductApiResModel =
//       DeleteProductApiResModel();

//   GetFilterCatalogueApiResModel getFilterCatalogueApiResModel =
//       GetFilterCatalogueApiResModel();

//   FilteredData filteredData = FilteredData();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _future = getProductList();
//     debugPrint('My filter data is: ${getFilterCatalogueApiResModel.products?.length}');
//   }

//   @override
//   Widget build(BuildContext context) {
//     // size of the screen
//     var size = MediaQuery.of(context).size;
//     /*24 is for notification bar on Android*/
//     final double itemHeight = (size.height - kToolbarHeight - 24) / 3.1;
//     final double itemWidth = size.width / 2;
//     return Scaffold(
//       backgroundColor: Color(0xFFF0F1F6),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//         title: Text(
//           'Catalogue',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//           ),
//         ),
//         actions: [
//           /// View Hello Store Button
//           InkWell(
//             onTap: () async {
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return CatalogueDialogScreen(
//                     filteredData: filteredData,
//                   );
//                 },
//               ).then((value) {
//                 if (value != null) {
//                    filteredData = value as FilteredData;
//                   // Access the selected values and the filtered data here
//                   print(filteredData.categories);
//                   print(filteredData.subcategories);
//                   print(filteredData.minPrice);
//                   print(filteredData.maxPrice);
//                   print(filteredData.dateFrom);
//                   print(filteredData.dateTo);
//                   print(filteredData.showOutOfStock);
//                   print(filteredData.filteredData);


//                   getFilterCatalogueApiResModel = filteredData.filteredData!;
//                   setState(() {});
//                 }
//               });
            
            
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(right: 16),
//               child: Icon(
//                 Icons.filter_alt_outlined,
//                 color: AppCol.primary,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: FutureBuilder(
//           future: _future,
//           builder: (context, snapshot) {
//             if (isApiDataAvailable) {
//               return SingleChildScrollView(
//                 physics: BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 16),

//                     /// Catalogue View
//                     if(getFilterCatalogueApiResModel.products?.length == null) (getProductApiResModel.products ?? []).isNotEmpty
//                         ? GridView.builder(
//                             itemCount: getProductApiResModel.products?.length,
//                             physics: NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               crossAxisSpacing: 2,
//                               mainAxisSpacing: 0,
//                               childAspectRatio: 4 / 5,
//                               // childAspectRatio: 1,
//                             ),
//                             itemBuilder: (context, index) {
//                               debugPrint(
//                                   'My catalogue screen image is: ${getProductApiResModel.products?[index].images?.length} ');
//                               bool isMp4 = getProductApiResModel
//                                       .products?[index].images?[0]
//                                       .contains('.mp4') ??
//                                   false;
//                               if (isMp4) {
//                                 if (!_videoControllers.containsKey(index)) {
//                                   _videoControllers[index] =
//                                       VideoPlayerController.networkUrl(Uri.parse(
//                                           '${getProductApiResModel.products?[index].images?[0]}'));
//                                   _videoControllers[index]!
//                                       .initialize()
//                                       .then((_) {
//                                     setState(() {
//                                       _isVideoControllerInitialized[index] =
//                                           true;
//                                       _videoControllers[index]!.pause();
//                                       _videoControllers[index]!.setVolume(0);
//                                     });
//                                   });
//                                 }
//                               }
//                               return Container(
//                                 child: Stack(
//                                   children: [
//                                     /// Catalogue Image
//                                     SizedBox(
//                                       width: double.infinity,
//                                       child: (getProductApiResModel
//                                                       .products?[index]
//                                                       .images ??
//                                                   [])
//                                               .isNotEmpty
//                                           ? isMp4
//                                               ? _videoControllers[index] !=
//                                                           null &&
//                                                       (_isVideoControllerInitialized[
//                                                               index] ??
//                                                           false)
//                                                   ? AspectRatio(
//                                                       aspectRatio:
//                                                           _videoControllers[
//                                                                   index]!
//                                                               .value
//                                                               .aspectRatio,
//                                                       child: VideoPlayer(
//                                                           _videoControllers[
//                                                               index]!),
//                                                     )
//                                                   : Center(
//                                                       child:
//                                                           CircularProgressIndicator())
//                                               : Image.network(
//                                                   '${getProductApiResModel.products?[index].images?[0]}',
//                                                   fit: BoxFit.contain,
//                                                 )
//                                           : Center(
//                                               child: Image.asset(
//                                                   'assets/newIcons/home_head.png')),
//                                     ),

//                                     /// Bottom Section
//                                     Align(
//                                       alignment: Alignment.bottomCenter,
//                                       child: Container(
//                                         padding: EdgeInsets.only(
//                                             left: 10, right: 10),
//                                         decoration: BoxDecoration(
//                                           color: Colors.black.withOpacity(.4),
//                                         ),
//                                         child: Row(
//                                           children: [
//                                             if (getProductApiResModel
//                                                     .products?[index]
//                                                     .images
//                                                     ?.length !=
//                                                 1)
//                                               Image.asset(
//                                                 'assets/newIcons/groupCopyIcon.png',
//                                                 height: 20,
//                                                 width: 20,
//                                               ),
//                                             /*Spacer(),
//                                             Icon(
//                                               Icons.remove_red_eye_outlined,
//                                               color: Colors.white,
//                                             ),
//                                             Text(
//                                               '2K',
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                               ),
//                                             ),*/
//                                             Spacer(),
//                                             PopupMenuButton<String>(
//                                               onSelected: (value) async {
//                                                 if (value == 'edit') {
//                                                   Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               EditProductListScreen(
//                                                                 productId:
//                                                                     "${getProductApiResModel.products?[index].id}",
//                                                                 isFrom:
//                                                                     "Variants",
//                                                                 isFromCatalogue:
//                                                                     true,
//                                                               )));
//                                                 } else if (value == 'delete') {
//                                                   showDialog(
//                                                     context: context,
//                                                     builder: (context) {
//                                                       return AlertDialog(
//                                                           shape: RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           16)),
//                                                           title: Text(
//                                                             'Do you want to delete this product? All your product details will be lost if you delete it.',
//                                                             textAlign: TextAlign
//                                                                 .center,
//                                                             style: TextStyle(
//                                                               color: Color(
//                                                                   0xFF666666),
//                                                               fontSize: 15,
//                                                               fontFamily:
//                                                                   'Roboto',
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w400,
//                                                               height: 1.47,
//                                                             ),
//                                                           ),
//                                                           actions: <Widget>[
//                                                             Row(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .center,
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 /// No Button
//                                                                 InkWell(
//                                                                   onTap: () {
//                                                                     Navigator.of(
//                                                                             context)
//                                                                         .pop();
//                                                                   },
//                                                                   child:
//                                                                       Container(
//                                                                     padding: const EdgeInsets
//                                                                         .symmetric(
//                                                                         horizontal:
//                                                                             48,
//                                                                         vertical:
//                                                                             10),
//                                                                     decoration:
//                                                                         ShapeDecoration(
//                                                                       color: Colors
//                                                                           .white,
//                                                                       shape:
//                                                                           RoundedRectangleBorder(
//                                                                         side: BorderSide(
//                                                                             width:
//                                                                                 0.50,
//                                                                             color:
//                                                                                 AppCol.primary),
//                                                                         borderRadius:
//                                                                             BorderRadius.circular(23),
//                                                                       ),
//                                                                     ),
//                                                                     child: Row(
//                                                                       mainAxisSize:
//                                                                           MainAxisSize
//                                                                               .min,
//                                                                       mainAxisAlignment:
//                                                                           MainAxisAlignment
//                                                                               .center,
//                                                                       crossAxisAlignment:
//                                                                           CrossAxisAlignment
//                                                                               .center,
//                                                                       children: [
//                                                                         Text(
//                                                                           'No',
//                                                                           style:
//                                                                               TextStyle(
//                                                                             color:
//                                                                                 AppCol.primary,
//                                                                             fontSize:
//                                                                                 16,
//                                                                             fontFamily:
//                                                                                 'Roboto',
//                                                                             fontWeight:
//                                                                                 FontWeight.w500,
//                                                                             letterSpacing:
//                                                                                 0.16,
//                                                                           ),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 const SizedBox(
//                                                                     width: 24),

//                                                                 /// Yes Button
//                                                                 InkWell(
//                                                                   onTap:
//                                                                       () async {
//                                                                     deleteProductApiResModel =
//                                                                         await _addProductController.deleteProduct(getProductApiResModel
//                                                                             .products?[index]
//                                                                             .id);
//                                                                     if (deleteProductApiResModel
//                                                                             .success ==
//                                                                         true) {
//                                                                       _future =
//                                                                           getProductList();
//                                                                       Navigator.pop(
//                                                                           context);
//                                                                       setState(
//                                                                           () {});
//                                                                     } else {
//                                                                       ScaffoldMessenger.of(
//                                                                               context)
//                                                                           .showSnackBar(
//                                                                         SnackBar(
//                                                                             content:
//                                                                                 Text('Something went wrong')),
//                                                                       );
//                                                                     }
//                                                                   },
//                                                                   child:
//                                                                       Container(
//                                                                           padding: const EdgeInsets
//                                                                               .symmetric(
//                                                                               horizontal:
//                                                                                   48,
//                                                                               vertical:
//                                                                                   10),
//                                                                           decoration:
//                                                                               ShapeDecoration(
//                                                                             color:
//                                                                                 AppCol.primary,
//                                                                             shape:
//                                                                                 RoundedRectangleBorder(
//                                                                               side: BorderSide(width: 0.50, color: AppCol.primary),
//                                                                               borderRadius: BorderRadius.circular(23),
//                                                                             ),
//                                                                           ),
//                                                                           child:
//                                                                               Row(
//                                                                             mainAxisSize:
//                                                                                 MainAxisSize.min,
//                                                                             mainAxisAlignment:
//                                                                                 MainAxisAlignment.center,
//                                                                             crossAxisAlignment:
//                                                                                 CrossAxisAlignment.center,
//                                                                             children: [
//                                                                               Text(
//                                                                                 'Yes',
//                                                                                 style: TextStyle(
//                                                                                   color: Colors.white,
//                                                                                   fontSize: 16,
//                                                                                   fontFamily: 'Roboto',
//                                                                                   fontWeight: FontWeight.w500,
//                                                                                   letterSpacing: 0.16,
//                                                                                 ),
//                                                                               ),
//                                                                             ],
//                                                                           )),
//                                                                 )
//                                                               ],
//                                                             ),
//                                                             SizedBox(
//                                                                 height: 10),
//                                                           ]);
//                                                     },
//                                                   );
//                                                 }
//                                               },
//                                               itemBuilder:
//                                                   (BuildContext context) {
//                                                 return <PopupMenuEntry<String>>[
//                                                   PopupMenuItem<String>(
//                                                     value: 'edit',
//                                                     child: Text('Edit'),
//                                                   ),
//                                                   PopupMenuItem<String>(
//                                                     value: 'delete',
//                                                     child: Text('Delete'),
//                                                   ),
//                                                 ];
//                                               },
//                                               icon: Container(
//                                                 height: 36,
//                                                 width: 0,
//                                                 alignment:
//                                                     Alignment.centerRight,
//                                                 child: Icon(
//                                                   Icons.more_vert,
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           )
//                         : Center(
//                             child: Text('No Product Found'),
//                           ),

//                     if(getFilterCatalogueApiResModel.products?.length != null) GridView.builder(
//                       itemCount: getFilterCatalogueApiResModel.products?.length,
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       gridDelegate:
//                       SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 2,
//                         mainAxisSpacing: 0,
//                         childAspectRatio: 4 / 5,
//                         // childAspectRatio: 1,
//                       ),
//                       itemBuilder: (context, index) {
//                         debugPrint(
//                             'My catalogue screen image is: ${getFilterCatalogueApiResModel.products?[index].images?.length} ');
//                         bool isMp4 = getFilterCatalogueApiResModel
//                             .products?[index].images?[0]
//                             .contains('.mp4') ??
//                             false;
//                         if (isMp4) {
//                           if (!_videoControllers.containsKey(index)) {
//                             _videoControllers[index] =
//                                 VideoPlayerController.networkUrl(Uri.parse(
//                                     '${getFilterCatalogueApiResModel.products?[index].images?[0]}'));
//                             _videoControllers[index]!
//                                 .initialize()
//                                 .then((_) {
//                               setState(() {
//                                 _isVideoControllerInitialized[index] =
//                                 true;
//                                 _videoControllers[index]!.pause();
//                                 _videoControllers[index]!.setVolume(0);
//                               });
//                             });
//                           }
//                         }
//                         return Container(
//                           child: Stack(
//                             children: [
//                               /// Catalogue Image
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: (getFilterCatalogueApiResModel
//                                     .products?[index]
//                                     .images ??
//                                     [])
//                                     .isNotEmpty
//                                     ? isMp4
//                                     ? _videoControllers[index] !=
//                                     null &&
//                                     (_isVideoControllerInitialized[
//                                     index] ??
//                                         false)
//                                     ? AspectRatio(
//                                   aspectRatio:
//                                   _videoControllers[
//                                   index]!
//                                       .value
//                                       .aspectRatio,
//                                   child: VideoPlayer(
//                                       _videoControllers[
//                                       index]!),
//                                 )
//                                     : Center(
//                                     child:
//                                     CircularProgressIndicator())
//                                     : Image.network(
//                                   '${getFilterCatalogueApiResModel.products?[index].images?[0]}',
//                                   fit: BoxFit.contain,
//                                 )
//                                     : Center(
//                                     child: Image.asset(
//                                         'assets/newIcons/home_head.png')),
//                               ),

//                               /// Bottom Section
//                               Align(
//                                 alignment: Alignment.bottomCenter,
//                                 child: Container(
//                                   padding: EdgeInsets.only(
//                                       left: 10, right: 10),
//                                   decoration: BoxDecoration(
//                                     color: Colors.black.withOpacity(.4),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       if (getFilterCatalogueApiResModel
//                                           .products?[index]
//                                           .images
//                                           ?.length !=
//                                           1)
//                                         Image.asset(
//                                           'assets/newIcons/groupCopyIcon.png',
//                                           height: 20,
//                                           width: 20,
//                                         ),
//                                       /*Spacer(),
//                                             Icon(
//                                               Icons.remove_red_eye_outlined,
//                                               color: Colors.white,
//                                             ),
//                                             Text(
//                                               '2K',
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                               ),
//                                             ),*/
//                                       Spacer(),
//                                       PopupMenuButton<String>(
//                                         onSelected: (value) async {
//                                           if (value == 'edit') {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         EditProductListScreen(
//                                                           productId:
//                                                           "${getFilterCatalogueApiResModel.products?[index].id}",
//                                                           isFrom:
//                                                           "Variants",
//                                                           isFromCatalogue:
//                                                           true,
//                                                         )));
//                                           } else if (value == 'delete') {
//                                             showDialog(
//                                               context: context,
//                                               builder: (context) {
//                                                 return AlertDialog(
//                                                     shape: RoundedRectangleBorder(
//                                                         borderRadius:
//                                                         BorderRadius
//                                                             .circular(
//                                                             16)),
//                                                     title: Text(
//                                                       'Do you want to delete this product? All your product details will be lost if you delete it.',
//                                                       textAlign: TextAlign
//                                                           .center,
//                                                       style: TextStyle(
//                                                         color: Color(
//                                                             0xFF666666),
//                                                         fontSize: 15,
//                                                         fontFamily:
//                                                         'Roboto',
//                                                         fontWeight:
//                                                         FontWeight
//                                                             .w400,
//                                                         height: 1.47,
//                                                       ),
//                                                     ),
//                                                     actions: <Widget>[
//                                                       Row(
//                                                         mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                         crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                         children: [
//                                                           /// No Button
//                                                           InkWell(
//                                                             onTap: () {
//                                                               Navigator.of(
//                                                                   context)
//                                                                   .pop();
//                                                             },
//                                                             child:
//                                                             Container(
//                                                               padding: const EdgeInsets
//                                                                   .symmetric(
//                                                                   horizontal:
//                                                                   48,
//                                                                   vertical:
//                                                                   10),
//                                                               decoration:
//                                                               ShapeDecoration(
//                                                                 color: Colors
//                                                                     .white,
//                                                                 shape:
//                                                                 RoundedRectangleBorder(
//                                                                   side: BorderSide(
//                                                                       width:
//                                                                       0.50,
//                                                                       color:
//                                                                       AppCol.primary),
//                                                                   borderRadius:
//                                                                   BorderRadius.circular(23),
//                                                                 ),
//                                                               ),
//                                                               child: Row(
//                                                                 mainAxisSize:
//                                                                 MainAxisSize
//                                                                     .min,
//                                                                 mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .center,
//                                                                 crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .center,
//                                                                 children: [
//                                                                   Text(
//                                                                     'No',
//                                                                     style:
//                                                                     TextStyle(
//                                                                       color:
//                                                                       AppCol.primary,
//                                                                       fontSize:
//                                                                       16,
//                                                                       fontFamily:
//                                                                       'Roboto',
//                                                                       fontWeight:
//                                                                       FontWeight.w500,
//                                                                       letterSpacing:
//                                                                       0.16,
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           const SizedBox(
//                                                               width: 24),

//                                                           /// Yes Button
//                                                           InkWell(
//                                                             onTap:
//                                                                 () async {
//                                                               deleteProductApiResModel =
//                                                               await _addProductController.deleteProduct(getFilterCatalogueApiResModel
//                                                                   .products?[index]
//                                                                   .id);
//                                                               if (deleteProductApiResModel
//                                                                   .success ==
//                                                                   true) {
//                                                                 _future =
//                                                                     getProductList();
//                                                                 Navigator.pop(
//                                                                     context);
//                                                                 setState(
//                                                                         () {});
//                                                               } else {
//                                                                 ScaffoldMessenger.of(
//                                                                     context)
//                                                                     .showSnackBar(
//                                                                   SnackBar(
//                                                                       content:
//                                                                       Text('Something went wrong')),
//                                                                 );
//                                                               }
//                                                             },
//                                                             child:
//                                                             Container(
//                                                                 padding: const EdgeInsets
//                                                                     .symmetric(
//                                                                     horizontal:
//                                                                     48,
//                                                                     vertical:
//                                                                     10),
//                                                                 decoration:
//                                                                 ShapeDecoration(
//                                                                   color:
//                                                                   AppCol.primary,
//                                                                   shape:
//                                                                   RoundedRectangleBorder(
//                                                                     side: BorderSide(width: 0.50, color: AppCol.primary),
//                                                                     borderRadius: BorderRadius.circular(23),
//                                                                   ),
//                                                                 ),
//                                                                 child:
//                                                                 Row(
//                                                                   mainAxisSize:
//                                                                   MainAxisSize.min,
//                                                                   mainAxisAlignment:
//                                                                   MainAxisAlignment.center,
//                                                                   crossAxisAlignment:
//                                                                   CrossAxisAlignment.center,
//                                                                   children: [
//                                                                     Text(
//                                                                       'Yes',
//                                                                       style: TextStyle(
//                                                                         color: Colors.white,
//                                                                         fontSize: 16,
//                                                                         fontFamily: 'Roboto',
//                                                                         fontWeight: FontWeight.w500,
//                                                                         letterSpacing: 0.16,
//                                                                       ),
//                                                                     ),
//                                                                   ],
//                                                                 )),
//                                                           )
//                                                         ],
//                                                       ),
//                                                       SizedBox(
//                                                           height: 10),
//                                                     ]);
//                                               },
//                                             );
//                                           }
//                                         },
//                                         itemBuilder:
//                                             (BuildContext context) {
//                                           return <PopupMenuEntry<String>>[
//                                             PopupMenuItem<String>(
//                                               value: 'edit',
//                                               child: Text('Edit'),
//                                             ),
//                                             PopupMenuItem<String>(
//                                               value: 'delete',
//                                               child: Text('Delete'),
//                                             ),
//                                           ];
//                                         },
//                                         icon: Container(
//                                           height: 36,
//                                           width: 0,
//                                           alignment:
//                                           Alignment.centerRight,
//                                           child: Icon(
//                                             Icons.more_vert,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                     /// Import From Instagram
//                     InkWell(
//                       onTap: () async {
//                         final value = await Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => InstagramLoginScreen(authResponse: (value) {
//                               debugPrint('My vlaue is: $value');
//                             },),
//                           ),
//                         );

//                         if (value != null) {
//                           debugPrint('My product length is: $value');
//                           debugPrint('My product length is: ${value['data'].length}');
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => InstagramAuthWebViewPage(instagramAuthResModel: value),));
//                         } else {
//                           print('Auth response is null');
//                         }
//                       },
//                       child: Container(
//                         height: 50,
//                         width: double.infinity,
//                         margin: EdgeInsets.only(left: 24, right: 24, top: 24),
//                         decoration: BoxDecoration(
//                           color: AppCol.gray200,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset('assets/newIcons/share_insta.png',
//                                 height: 20, width: 20),
//                             SizedBox(width: 10),
//                             Text(
//                               'Import from Instagram',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w200,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 16),

//                     /// OR Text
//                     Text(
//                       'OR',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w200,
//                       ),
//                     ),
//                     SizedBox(height: 16),

//                     /// Add Product Manually Button
//                     InkWell(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 AddProductListScreen(isFromCatalogue: true),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         height: 50,
//                         width: double.infinity,
//                         margin: EdgeInsets.only(left: 24, right: 24),
//                         decoration: BoxDecoration(
//                           color: AppCol.gray200,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset('assets/newIcons/add_out.png',
//                                 height: 20, width: 20),
//                             SizedBox(width: 10),
//                             Text(
//                               'Add Product Manually',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w200,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 24),
//                   ],
//                 ),
//               );
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           }),
//     );
//   }

//   /// Get product list
//   Future<bool> getProductList() async {
//     getProductApiResModel = await _addProductController.getProductList();
//     if (getProductApiResModel.success == true) {
//       isApiDataAvailable = true;
//     } else {
//       isApiDataAvailable = true;
//     }
//     return isApiDataAvailable;
//   }

//   @override
//   void dispose() {
//     for (var controller in _videoControllers.values) {
//       controller.dispose();
//     }
//     super.dispose();
//   }



// }

// /// ---------- Catalogue Class ----------
// class Catalogue {
//   String viewer;
//   String postImageUrl;

//   Catalogue({required this.viewer, required this.postImageUrl});
// }







// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:taptohello/core/app_export.dart';
// import 'package:taptohello/data/productCategoryModel/deleteProductApiResModel.dart';
// import 'package:taptohello/data/productCategoryModel/filterCatalogueApiResModel.dart';
// import 'package:taptohello/data/productCategoryModel/filterDataModel.dart';
// import 'package:taptohello/data/productCategoryModel/getProductListApiResModel.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/addProductListScreen.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/CatalogueScreen/catalogueDialogScreen.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/InstagramAuth/instagramAuthWebViewPage.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/InstagramAuth/instagramLogin.dart';
// import 'package:video_player/video_player.dart';

// class CatalogueScreen extends StatefulWidget {
//   const CatalogueScreen({super.key});

//   @override
//   State<CatalogueScreen> createState() => _CatalogueScreenState();
// }

// class _CatalogueScreenState extends State<CatalogueScreen> {
//   final AddProductController _addProductController = AddProductController();
  
//   // State variables
//   GetProductApiResModel getProductApiResModel = GetProductApiResModel();
//   DeleteProductApiResModel deleteProductApiResModel = DeleteProductApiResModel();
//   GetFilterCatalogueApiResModel getFilterCatalogueApiResModel = GetFilterCatalogueApiResModel();
//   FilteredData filteredData = FilteredData();
  
//   bool isApiDataAvailable = false;
//   late Future _future;
  
//   // Video controllers management
//   final Map<int, VideoPlayerController> _videoControllers = {};
//   final Map<int, bool> _isVideoControllerInitialized = {};

//   @override
//   void initState() {
//     super.initState();
//     _future = getProductList();
//   }

//   @override
//   void dispose() {
//     // Dispose all video controllers
//     for (var controller in _videoControllers.values) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF0F1F6),
//       appBar: _buildAppBar(),
//       body: FutureBuilder(
//         future: _future,
//         builder: (context, snapshot) {
//           if (isApiDataAvailable) {
//             return _buildContent();
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }

//   AppBar _buildAppBar() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       iconTheme: IconThemeData(color: Colors.black),
//       title: Text(
//         'Catalogue',
//         style: TextStyle(color: Colors.black, fontSize: 18),
//       ),
//       actions: [
//         InkWell(
//           onTap: _showFilterDialog,
//           child: Padding(
//             padding: const EdgeInsets.only(right: 16),
//             child: Icon(Icons.filter_alt_outlined, color: AppCol.primary),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildContent() {
//     return SingleChildScrollView(
//       physics: BouncingScrollPhysics(),
//       child: Column(
//         children: [
//           SizedBox(height: 16),
//           _buildProductGrid(),
//           _buildImportFromInstagramButton(),
//           SizedBox(height: 16),
//           _buildOrText(),
//           SizedBox(height: 16),
//           _buildAddProductManuallyButton(),
//           SizedBox(height: 24),
//         ],
//       ),
//     );
//   }

// Widget _buildProductGrid() {
//   // Convert Products to Product if needed
//   List<Product>? availableProducts;
  
//   // Check filtered products first
//   if (getFilterCatalogueApiResModel.products != null && 
//       getFilterCatalogueApiResModel.products!.isNotEmpty) {
//     availableProducts = getFilterCatalogueApiResModel.products!
//         .map((p) => _convertToProduct(p))  // Conversion function
//         .toList();
//   } 
//   // Fall back to regular products
//   else if (getProductApiResModel.products != null && 
//            getProductApiResModel.products!.isNotEmpty) {
//     availableProducts = getProductApiResModel.products!
//         .map((p) => _convertToProduct(p))  // Conversion function
//         .toList();
//   }

//   if (availableProducts == null || availableProducts.isEmpty) {
//     return Center(child: Text('No Product Found'));
//   }

//   return _buildProductList(availableProducts);
// }

// // Add this conversion method
// Product _convertToProduct(dynamic product) {
//   if (product is Product) {
//     return product;
//   } else if (product is Products) {
//     // Convert Products to Product
//     return Product(
//       id: product.id,
//       //name: product.name,
//       images: product.images,
//       // Map all other required fields
//     );
//   }
//   throw Exception('Unknown product type: ${product.runtimeType}');
// }
// Widget _buildProductList(List<Product> products) {
//   return GridView.builder(
//     itemCount: products.length,
//     physics: NeverScrollableScrollPhysics(),
//     shrinkWrap: true,
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       crossAxisSpacing: 2,
//       mainAxisSpacing: 0,
//       childAspectRatio: 4 / 5,
//     ),
//     itemBuilder: (context, index) => _buildProductItem(products[index], index),
//   );
// }

//   Widget _buildProductItem(Product product, int index) {
//     final hasMultipleImages = (product.images?.length ?? 0) > 1;
//     final firstImage = product.images?.isNotEmpty == true ? product.images![0] : null;
//     final isVideo = firstImage?.contains('.mp4') == true;

//     if (isVideo && !_videoControllers.containsKey(index)) {
//       _initializeVideoController(firstImage!, index);
//     }

//     return Container(
//       child: Stack(
//         children: [
//           // Product media (image or video)
//           _buildProductMedia(firstImage, isVideo, index),
          
//           // Bottom overlay with actions
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               decoration: BoxDecoration(color: Colors.black.withOpacity(.4)),
//               child: Row(
//                 children: [
//                   if (hasMultipleImages) 
//                     Image.asset(
//                       'assets/newIcons/groupCopyIcon.png',
//                       height: 20,
//                       width: 20,
//                     ),
//                   Spacer(),
//                   _buildProductMenu(product),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProductMedia(String? mediaUrl, bool isVideo, int index) {
//     if (mediaUrl == null) {
//       return Center(child: Image.asset('assets/newIcons/home_head.png'));
//     }
    
//     if (isVideo) {
//       return _buildVideoPlayer(index);
//     } else {
//       return CachedNetworkImage(
//         imageUrl: mediaUrl,
//         fit: BoxFit.contain,
//         placeholder: (context, url) => Center(child: CircularProgressIndicator()),
//         errorWidget: (context, url, error) => Icon(Icons.error),
//       );
//     }
//   }

//   Widget _buildVideoPlayer(int index) {
//     if (_videoControllers[index] == null || 
//         !(_isVideoControllerInitialized[index] ?? false)) {
//       return Center(child: CircularProgressIndicator());
//     }
    
//     return AspectRatio(
//       aspectRatio: _videoControllers[index]!.value.aspectRatio,
//       child: VideoPlayer(_videoControllers[index]!),
//     );
//   }

//   Widget _buildProductMenu(Product product) {
//     return PopupMenuButton<String>(
//       onSelected: (value) => _handleMenuSelection(value, product),
//       itemBuilder: (BuildContext context) => [
//         PopupMenuItem(value: 'edit', child: Text('Edit')),
//         PopupMenuItem(value: 'delete', child: Text('Delete')),
//       ],
//       icon: Container(
//         height: 36,
//         width: 0,
//         alignment: Alignment.centerRight,
//         child: Icon(Icons.more_vert, color: Colors.white),
//       ),
//     );
//   }

//   Widget _buildImportFromInstagramButton() {
//     return InkWell(
//       onTap: _navigateToInstagramLogin,
//       child: Container(
//         height: 50,
//         width: double.infinity,
//         margin: EdgeInsets.symmetric(horizontal: 24),
//         decoration: BoxDecoration(
//           color: AppCol.gray200,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/newIcons/share_insta.png', height: 20, width: 20),
//             SizedBox(width: 10),
//             Text(
//               'Import from Instagram',
//               style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildOrText() {
//     return Text(
//       'OR',
//       textAlign: TextAlign.center,
//       style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),
//     );
//   }

//   Widget _buildAddProductManuallyButton() {
//     return InkWell(
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => AddProductListScreen(isFromCatalogue: true),
//         ),
//       ),
//       child: Container(
//         height: 50,
//         width: double.infinity,
//         margin: EdgeInsets.symmetric(horizontal: 24),
//         decoration: BoxDecoration(
//           color: AppCol.gray200,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/newIcons/add_out.png', height: 20, width: 20),
//             SizedBox(width: 10),
//             Text(
//               'Add Product Manually',
//               style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _showFilterDialog() async {
//     final result = await showDialog(
//       context: context,
//       builder: (context) => CatalogueDialogScreen(filteredData: filteredData),
//     );

//     if (result != null) {
//       filteredData = result as FilteredData;
//       getFilterCatalogueApiResModel = filteredData.filteredData!;
//       setState(() {});
//     }
//   }

//   void _initializeVideoController(String url, int index) {
//     _videoControllers[index] = VideoPlayerController.networkUrl(Uri.parse(url));
//     _videoControllers[index]!.initialize().then((_) {
//       if (mounted) {
//         setState(() {
//           _isVideoControllerInitialized[index] = true;
//           _videoControllers[index]!.pause();
//           _videoControllers[index]!.setVolume(0);
//         });
//       }
//     });
//   }

//   Future<void> _handleMenuSelection(String value, Product product) async {
//     if (value == 'edit') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => EditProductListScreen(
//             productId: "${product.id}",
//             isFrom: "Variants",
//             isFromCatalogue: true,
//           ),
//         ),
//       );
//     } else if (value == 'delete') {
//       await _showDeleteConfirmationDialog(product.id);
//     }
//   }

//   Future<void> _showDeleteConfirmationDialog(String? productId) async {
//     final shouldDelete = await showDialog<bool>(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         title: Text(
//           'Do you want to delete this product? All your product details will be lost if you delete it.',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Color(0xFF666666),
//             fontSize: 15,
//             fontFamily: 'Roboto',
//             fontWeight: FontWeight.w400,
//             height: 1.47,
//           ),
//         ),
//         actions: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // No Button
//               _buildDialogButton(
//                 text: 'No',
//                 isPrimary: false,
//                 onPressed: () => Navigator.of(context).pop(false),
//               ),
//               SizedBox(width: 24),
//               // Yes Button
//               _buildDialogButton(
//                 text: 'Yes',
//                 isPrimary: true,
//                 onPressed: () => Navigator.of(context).pop(true),
//               ),
//             ],
//           ),
//           SizedBox(height: 10),
//         ],
//       ),
//     );

//     if (shouldDelete == true && productId != null) {
//       await _deleteProduct(productId);
//     }
//   }

//   Widget _buildDialogButton({
//     required String text,
//     required bool isPrimary,
//     required VoidCallback onPressed,
//   }) {
//     return InkWell(
//       onTap: onPressed,
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 48, vertical: 10),
//         decoration: ShapeDecoration(
//           color: isPrimary ? AppCol.primary : Colors.white,
//           shape: RoundedRectangleBorder(
//             side: BorderSide(width: 0.50, color: AppCol.primary),
//             borderRadius: BorderRadius.circular(23),
//           ),
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             color: isPrimary ? Colors.white : AppCol.primary,
//             fontSize: 16,
//             fontFamily: 'Roboto',
//             fontWeight: FontWeight.w500,
//             letterSpacing: 0.16,
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _deleteProduct(String productId) async {
//     deleteProductApiResModel = await _addProductController.deleteProduct(productId);
//     if (deleteProductApiResModel.success == true) {
//       _future = getProductList();
//       setState(() {});
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Something went wrong')),
//       );
//     }
//   }

//   Future<void> _navigateToInstagramLogin() async {
//     final value = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => InstagramLoginScreen(
//           authResponse: (value) => debugPrint('Auth response: $value'),
//         ),
//       ),
//     );

//     if (value != null) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => InstagramAuthWebViewPage(instagramAuthResModel: value),
//         ),
//       );
//     }
//   }

//   Future<bool> getProductList() async {
//     getProductApiResModel = await _addProductController.getProductList();
//     isApiDataAvailable = true;
//     return isApiDataAvailable;
//   }
// }













// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:taptohello/core/app_export.dart';
// import 'package:taptohello/data/productCategoryModel/deleteProductApiResModel.dart';
// import 'package:taptohello/data/productCategoryModel/filterCatalogueApiResModel.dart';
// import 'package:taptohello/data/productCategoryModel/filterDataModel.dart';
// import 'package:taptohello/data/productCategoryModel/getProductListApiResModel.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/addProductListScreen.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/CatalogueScreen/catalogueDialogScreen.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/InstagramAuth/instagramAuthWebViewPage.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/InstagramAuth/instagramLogin.dart';
// import 'package:video_player/video_player.dart';

// class CatalogueScreen extends StatefulWidget {
//   const CatalogueScreen({super.key});

//   @override
//   State<CatalogueScreen> createState() => _CatalogueScreenState();
// }

// class _CatalogueScreenState extends State<CatalogueScreen> {
//   final AddProductController _addProductController = AddProductController();

//   GetProductApiResModel getProductApiResModel = GetProductApiResModel();
//   DeleteProductApiResModel deleteProductApiResModel = DeleteProductApiResModel();
//   GetFilterCatalogueApiResModel getFilterCatalogueApiResModel = GetFilterCatalogueApiResModel();
//   FilteredData filteredData = FilteredData();

//   bool isApiDataAvailable = false;
//   late Future _future;

//   final Map<int, VideoPlayerController> _videoControllers = {};
//   final Map<int, bool> _isVideoControllerInitialized = {};

//   @override
//   void initState() {
//     super.initState();
//     _future = getProductList();
//   }

//   @override
//   void dispose() {
//     for (var controller in _videoControllers.values) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF0F1F6),
//       appBar: _buildAppBar(),
//       body: FutureBuilder(
//         future: _future,
//         builder: (context, snapshot) {
//           if (isApiDataAvailable) {
//             return _buildContent();
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }

//   AppBar _buildAppBar() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       iconTheme: const IconThemeData(color: Colors.black),
//       title: const Text(
//         'Catalogue',
//         style: TextStyle(color: Colors.black, fontSize: 18),
//       ),
//       actions: [
//         InkWell(
//           onTap: _showFilterDialog,
//           child: Padding(
//             padding: const EdgeInsets.only(right: 16),
//             child: Icon(Icons.filter_alt_outlined, color: AppCol.primary),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildContent() {
//     return SingleChildScrollView(
//       physics: const BouncingScrollPhysics(),
//       child: Column(
//         children: [
//           const SizedBox(height: 16),
//           _buildProductGrid(),
//           _buildImportFromInstagramButton(),
//           const SizedBox(height: 16),
//           _buildOrText(),
//           const SizedBox(height: 16),
//           _buildAddProductManuallyButton(),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }

//   Widget _buildProductGrid() {
//     List<Product>? availableProducts;

//     if (getFilterCatalogueApiResModel.products != null && getFilterCatalogueApiResModel.products!.isNotEmpty) {
//       availableProducts = getFilterCatalogueApiResModel.products!
//           .map((p) => _convertToProduct(p))
//           .toList();
//     } else if (getProductApiResModel.products != null && getProductApiResModel.products!.isNotEmpty) {
//       availableProducts = getProductApiResModel.products!
//           .map((p) => _convertToProduct(p))
//           .toList();
//     }

//     if (availableProducts == null || availableProducts.isEmpty) {
//       return const Center(child: Text('No Product Found'));
//     }

//     return GridView.builder(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       itemCount: availableProducts.length,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       cacheExtent: 500,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//         childAspectRatio: 4 / 5,
//       ),
//       itemBuilder: (context, index) {
//         final product = availableProducts![index];
//         return RepaintBoundary(
//           child: _buildProductItem(product, index),
//         );
//       },
//     );
//   }

//   Product _convertToProduct(dynamic product) {
//     if (product is Product) {
//       return product;
//     } else if (product is Products) {
//       return Product(
//         id: product.id,
//         images: product.images,
//       );
//     }
//     throw Exception('Unknown product type: ${product.runtimeType}');
//   }

//   Widget _buildProductItem(Product product, int index) {
//     final hasMultipleImages = (product.images?.length ?? 0) > 1;
//     final firstImage = product.images?.isNotEmpty == true ? product.images![0] : null;
//     final isVideo = firstImage?.contains('.mp4') == true;

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
//           _buildProductMedia(firstImage, isVideo, index),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.4),
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(8),
//                   bottomRight: Radius.circular(8),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   if (hasMultipleImages)
//                     Image.asset(
//                       'assets/newIcons/groupCopyIcon.png',
//                       height: 20,
//                       width: 20,
//                     ),
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

//   Widget _buildProductMedia(String? mediaUrl, bool isVideo, int index) {
//     if (mediaUrl == null) {
//       return Center(child: Image.asset('assets/newIcons/home_head.png'));
//     }

//     if (isVideo) {
//       return _buildVideoPlayer(index);
//     } else {
//       return CachedNetworkImage(
//         imageUrl: mediaUrl,
//         fit: BoxFit.cover,
//         placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//         errorWidget: (context, url, error) => const Icon(Icons.error),
//       );
//     }
//   }

//   Widget _buildVideoPlayer(int index) {
//     if (_videoControllers[index] == null || !(_isVideoControllerInitialized[index] ?? false)) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     return AspectRatio(
//       aspectRatio: _videoControllers[index]!.value.aspectRatio,
//       child: VideoPlayer(_videoControllers[index]!),
//     );
//   }

//   Widget _buildProductMenu(Product product) {
//     return PopupMenuButton<String>(
//       onSelected: (value) => _handleMenuSelection(value, product),
//       itemBuilder: (context) => [
//         const PopupMenuItem(value: 'edit', child: Text('Edit')),
//         const PopupMenuItem(value: 'delete', child: Text('Delete')),
//       ],
//       icon: const Icon(Icons.more_vert, color: Colors.white),
//     );
//   }

//   Widget _buildImportFromInstagramButton() {
//     return InkWell(
//       onTap: _navigateToInstagramLogin,
//       child: Container(
//         height: 50,
//         width: double.infinity,
//         margin: const EdgeInsets.symmetric(horizontal: 24),
//         decoration: BoxDecoration(
//           color: AppCol.gray200,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/newIcons/share_insta.png', height: 20, width: 20),
//             const SizedBox(width: 10),
//             const Text(
//               'Import from Instagram',
//               style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildOrText() {
//     return const Text(
//       'OR',
//       textAlign: TextAlign.center,
//       style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),
//     );
//   }

//   Widget _buildAddProductManuallyButton() {
//     return InkWell(
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const AddProductListScreen(isFromCatalogue: true),
//         ),
//       ),
//       child: Container(
//         height: 50,
//         width: double.infinity,
//         margin: const EdgeInsets.symmetric(horizontal: 24),
//         decoration: BoxDecoration(
//           color: AppCol.gray200,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/newIcons/add_out.png', height: 20, width: 20),
//             const SizedBox(width: 10),
//             const Text(
//               'Add Product Manually',
//               style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _showFilterDialog() async {
//     final result = await showDialog(
//       context: context,
//       builder: (context) => CatalogueDialogScreen(filteredData: filteredData),
//     );

//     if (result != null) {
//       filteredData = result as FilteredData;
//       getFilterCatalogueApiResModel = filteredData.filteredData!;
//       setState(() {});
//     }
//   }

//   void _initializeVideoController(String url, int index) {
//     _videoControllers[index] = VideoPlayerController.networkUrl(Uri.parse(url))
//       ..initialize().then((_) {
//         if (mounted) {
//           setState(() {
//             _isVideoControllerInitialized[index] = true;
//             _videoControllers[index]!
//               ..pause()
//               ..setVolume(0);
//           });
//         }
//       });
//   }

//   Future<void> _handleMenuSelection(String value, Product product) async {
//     if (value == 'edit') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => EditProductListScreen(
//             productId: "${product.id}",
//             isFrom: "Variants",
//             isFromCatalogue: true,
//           ),
//         ),
//       );
//     } else if (value == 'delete') {
//       await _showDeleteConfirmationDialog(product.id);
//     }
//   }

//   Future<void> _showDeleteConfirmationDialog(String? productId) async {
//     final shouldDelete = await showDialog<bool>(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         title: const Text(
//           'Do you want to delete this product? All your product details will be lost if you delete it.',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Color(0xFF666666),
//             fontSize: 15,
//             fontFamily: 'Roboto',
//             fontWeight: FontWeight.w400,
//             height: 1.47,
//           ),
//         ),
//         actions: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _buildDialogButton(text: 'No', isPrimary: false, onPressed: () => Navigator.pop(context, false)),
//               const SizedBox(width: 24),
//               _buildDialogButton(text: 'Yes', isPrimary: true, onPressed: () => Navigator.pop(context, true)),
//             ],
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );

//     if (shouldDelete == true && productId != null) {
//       await _deleteProduct(productId);
//     }
//   }

//   Widget _buildDialogButton({required String text, required bool isPrimary, required VoidCallback onPressed}) {
//     return InkWell(
//       onTap: onPressed,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 10),
//         decoration: ShapeDecoration(
//           color: isPrimary ? AppCol.primary : Colors.white,
//           shape: RoundedRectangleBorder(
//             side: BorderSide(width: 0.5, color: AppCol.primary),
//             borderRadius: BorderRadius.circular(23),
//           ),
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             color: isPrimary ? Colors.white : AppCol.primary,
//             fontSize: 16,
//             fontFamily: 'Roboto',
//             fontWeight: FontWeight.w500,
//             letterSpacing: 0.16,
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _deleteProduct(String productId) async {
//     deleteProductApiResModel = await _addProductController.deleteProduct(productId);
//     if (deleteProductApiResModel.success == true) {
//       _future = getProductList();
//       setState(() {});
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Something went wrong')),
//       );
//     }
//   }

//   Future<void> _navigateToInstagramLogin() async {
//     final value = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => InstagramLoginScreen(
//           authResponse: (value) => debugPrint('Auth response: $value'),
//         ),
//       ),
//     );

//     if (value != null) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => InstagramAuthWebViewPage(instagramAuthResModel: value),
//         ),
//       );
//     }
//   }

  

//   Future<bool> getProductList() async {
//     getProductApiResModel = await _addProductController.getProductList();
//     isApiDataAvailable = true;
//     return isApiDataAvailable;
//   }
// }













// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:taptohello/core/app_export.dart';
// import 'package:taptohello/data/productCategoryModel/filterCatalogueApiResModel.dart';
// import 'package:taptohello/data/productCategoryModel/getProductListApiResModel.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/addProductListScreen.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/CatalogueScreen/catalogueDialogScreen.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/InstagramAuth/instagramAuthWebViewPage.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/InstagramAuth/instagramLogin.dart';
// import 'package:video_player/video_player.dart';

// class CatalogueScreen extends StatefulWidget {
//   const CatalogueScreen({Key? key}) : super(key: key);

//   @override
//   State<CatalogueScreen> createState() => _CatalogueScreenState();
// }

// class _CatalogueScreenState extends State<CatalogueScreen> {
//   final AddProductController _addProductController = AddProductController();
//   final Map<int, VideoPlayerController> _videoControllers = {};

//   late Future<List<Product>> _productsFuture;

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

//   Future<List<Product>> _fetchProducts() async {
//   final apiResponse = await _addProductController.getProductList();
//   final products = apiResponse.products ?? [];

//   return products.map((p) => Product(
//     id: p.id,
//     images: p.images,
//     // map other fields as needed
//   )).toList();
// }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF0F1F6),
//       appBar: _buildAppBar(),
//       body: FutureBuilder<List<Product>>(
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
//       title: const Text('Catalogue', style: TextStyle(color: Colors.black, fontSize: 18)),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.filter_alt_outlined, color: AppCol.primary),
//           onPressed: _showFilterDialog,
//         ),
//       ],
//     );
//   }

//   Widget _buildProductGrid(List<Product> products) {
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

//   Widget _buildProductItem(Product product, int index) {
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
//                         imageUrl: firstImage,
//                         fit: BoxFit.cover,
//                         placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//                         errorWidget: (context, url, error) => const Icon(Icons.error),
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
//     final controller = VideoPlayerController.networkUrl(Uri.parse(url));
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
//     return VideoPlayer(controller);
//   }

//   Widget _buildProductMenu(Product product) {
//     return PopupMenuButton<String>(
//       onSelected: (value) => _onMenuSelected(value, product),
//       itemBuilder: (context) => [
//         const PopupMenuItem(value: 'edit', child: Text('Edit')),
//         const PopupMenuItem(value: 'delete', child: Text('Delete')),
//       ],
//       icon: const Icon(Icons.more_vert, color: Colors.white),
//     );
//   }

//   Future<void> _onMenuSelected(String value, Product product) async {
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









import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taptohello/core/constants.dart';
import 'package:video_player/video_player.dart';
import 'package:taptohello/core/app_export.dart';
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

  late Future<List<Products>> _productsFuture;
  List<Products> _products = [];

  @override
  void initState() {
    super.initState();
    _productsFuture = _fetchProducts();
  }

  @override
  void dispose() {
    for (var controller in _videoControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  // This function is responsible for loading products and updating UI
  Future<void> _loadProducts() async {
    // Step 1: Show old products instantly (optional: use local storage if needed)
    setState(() {
      // Trigger UI update immediately with whatever _products have
    });

    // Step 2: Fetch fresh products from API in the background
    final apiResponse = await _addProductController.getProductList();
    final freshProducts = apiResponse.products?.map((product) {
      return Products(
        id: product.id,
        images: product.images,
        // add any other necessary fields here
      );
    }).toList() ?? [];

    // Step 3: Update products and refresh UI
    setState(() {
      _products = freshProducts;
    });
  }

  Future<List<Products>> _fetchProducts() async {
    final apiResponse = await _addProductController.getProductList();
    final products = apiResponse.products ?? [];

    // Here, we map each item in the response to a Product object
    return products.map((p) => Products(
      id: p.id,
      images: p.images,
      // map other fields as needed
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F1F6),
      appBar: _buildAppBar(),
      body: FutureBuilder<List<Products>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found.'));
          }

          final products = snapshot.data!;
          return _buildProductGrid(products);
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      title: const Text('Catalogue', style: TextStyle(color: Colors.black, fontSize: 18)),
      actions: [
        IconButton(
          icon: Icon(Icons.filter_alt_outlined, color: AppCol.primary),
          onPressed: _showFilterDialog,
        ),
      ],
    );
  }

  Widget _buildProductGrid(List<Products> products) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 4 / 5,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildProductItem(product, index);
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
                       // imageUrl: firstImage,
                        imageUrl: firstImage
              .contains(AppConstants.imageBaseUrl)
      ? firstImage
      :  AppConstants.imageBaseUrl   +
          (firstImage ?? ''),
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
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

  // void _initializeVideoController(String url, int index) {
  //   final controller = VideoPlayerController.networkUrl(Uri.parse(url));
  //   _videoControllers[index] = controller;
  //   controller.initialize().then((_) {
  //     setState(() {});
  //     controller.setVolume(0);
  //     controller.pause();
  //   });
  // }

  void _initializeVideoController(String url, int index) {
  // Check if the URL contains AppConstants.imageBaseUrl, if not, prepend it
  String videoUrl = url;
  if (!videoUrl.contains(AppConstants.imageBaseUrl)) {
    videoUrl = AppConstants.imageBaseUrl + videoUrl;
  }

  // Create the VideoPlayerController with the updated URL
  final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
  _videoControllers[index] = controller;

  controller.initialize().then((_) {
    setState(() {});
    controller.setVolume(0);  // Mute the video
    controller.pause();  // Pause the video after initialization
  });
}


  Widget _buildVideoPlayer(int index) {
    final controller = _videoControllers[index];
    if (controller == null || !controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return VideoPlayer(controller);
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
          _productsFuture = _fetchProducts();
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
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }

  Future<void> _showFilterDialog() async {
    final result = await showDialog(
      context: context,
      builder: (context) => CatalogueDialogScreen(),
    );
    if (result != null) {
      setState(() {
        _productsFuture = _fetchProducts();
      });
    }
  }
}



