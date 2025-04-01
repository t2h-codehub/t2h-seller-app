import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/productCategoryModel/deleteProductApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/filterCatalogueApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/filterDataModel.dart';
import 'package:taptohello/data/productCategoryModel/getProductListApiResModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/addProductListScreen.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/CatalogueScreen/catalogueDialogScreen.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/InstagramAuth/instagramAuthWebViewPage.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/InstagramAuth/instagramLogin.dart';
import 'package:video_player/video_player.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  GetProductApiResModel getProductApiResModel = GetProductApiResModel();
  final AddProductController _addProductController = AddProductController();

  bool isApiDataAvailable = false;
  late Future _future;

  final Map<int, VideoPlayerController> _videoControllers = {};
  final Map<int, bool> _isVideoControllerInitialized = {};

  // final GlobalKey _menuKey = GlobalKey();

  DeleteProductApiResModel deleteProductApiResModel =
      DeleteProductApiResModel();

  GetFilterCatalogueApiResModel getFilterCatalogueApiResModel =
      GetFilterCatalogueApiResModel();

  FilteredData filteredData = FilteredData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = getProductList();
    debugPrint('My filter data is: ${getFilterCatalogueApiResModel.products?.length}');
  }

  @override
  Widget build(BuildContext context) {
    // size of the screen
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3.1;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Catalogue',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          /// View Hello Store Button
          InkWell(
            onTap: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CatalogueDialogScreen(
                    filteredData: filteredData,
                  );
                },
              ).then((value) {
                if (value != null) {
                   filteredData = value as FilteredData;
                  // Access the selected values and the filtered data here
                  print(filteredData.categories);
                  print(filteredData.subcategories);
                  print(filteredData.minPrice);
                  print(filteredData.maxPrice);
                  print(filteredData.dateFrom);
                  print(filteredData.dateTo);
                  print(filteredData.showOutOfStock);
                  print(filteredData.filteredData);


                  getFilterCatalogueApiResModel = filteredData.filteredData!;
                  setState(() {});
                }
              });
            
            
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                Icons.filter_alt_outlined,
                color: AppCol.primary,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (isApiDataAvailable) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 16),

                    /// Catalogue View
                    if(getFilterCatalogueApiResModel.products?.length == null) (getProductApiResModel.products ?? []).isNotEmpty
                        ? GridView.builder(
                            itemCount: getProductApiResModel.products?.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 0,
                              childAspectRatio: 4 / 5,
                              // childAspectRatio: 1,
                            ),
                            itemBuilder: (context, index) {
                              debugPrint(
                                  'My catalogue screen image is: ${getProductApiResModel.products?[index].images?.length} ');
                              bool isMp4 = getProductApiResModel
                                      .products?[index].images?[0]
                                      .contains('.mp4') ??
                                  false;
                              if (isMp4) {
                                if (!_videoControllers.containsKey(index)) {
                                  _videoControllers[index] =
                                      VideoPlayerController.networkUrl(Uri.parse(
                                          '${getProductApiResModel.products?[index].images?[0]}'));
                                  _videoControllers[index]!
                                      .initialize()
                                      .then((_) {
                                    setState(() {
                                      _isVideoControllerInitialized[index] =
                                          true;
                                      _videoControllers[index]!.pause();
                                      _videoControllers[index]!.setVolume(0);
                                    });
                                  });
                                }
                              }
                              return Container(
                                child: Stack(
                                  children: [
                                    /// Catalogue Image
                                    SizedBox(
                                      width: double.infinity,
                                      child: (getProductApiResModel
                                                      .products?[index]
                                                      .images ??
                                                  [])
                                              .isNotEmpty
                                          ? isMp4
                                              ? _videoControllers[index] !=
                                                          null &&
                                                      (_isVideoControllerInitialized[
                                                              index] ??
                                                          false)
                                                  ? AspectRatio(
                                                      aspectRatio:
                                                          _videoControllers[
                                                                  index]!
                                                              .value
                                                              .aspectRatio,
                                                      child: VideoPlayer(
                                                          _videoControllers[
                                                              index]!),
                                                    )
                                                  : Center(
                                                      child:
                                                          CircularProgressIndicator())
                                              : Image.network(
                                                  '${getProductApiResModel.products?[index].images?[0]}',
                                                  fit: BoxFit.contain,
                                                )
                                          : Center(
                                              child: Image.asset(
                                                  'assets/newIcons/home_head.png')),
                                    ),

                                    /// Bottom Section
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(.4),
                                        ),
                                        child: Row(
                                          children: [
                                            if (getProductApiResModel
                                                    .products?[index]
                                                    .images
                                                    ?.length !=
                                                1)
                                              Image.asset(
                                                'assets/newIcons/groupCopyIcon.png',
                                                height: 20,
                                                width: 20,
                                              ),
                                            /*Spacer(),
                                            Icon(
                                              Icons.remove_red_eye_outlined,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              '2K',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),*/
                                            Spacer(),
                                            PopupMenuButton<String>(
                                              onSelected: (value) async {
                                                if (value == 'edit') {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditProductListScreen(
                                                                productId:
                                                                    "${getProductApiResModel.products?[index].id}",
                                                                isFrom:
                                                                    "Variants",
                                                                isFromCatalogue:
                                                                    true,
                                                              )));
                                                } else if (value == 'delete') {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                          title: Text(
                                                            'Do you want to delete this product? All your product details will be lost if you delete it.',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF666666),
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
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
                                                                                AppCol.primary),
                                                                        borderRadius:
                                                                            BorderRadius.circular(23),
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
                                                                                AppCol.primary,
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

                                                                /// Yes Button
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    deleteProductApiResModel =
                                                                        await _addProductController.deleteProduct(getProductApiResModel
                                                                            .products?[index]
                                                                            .id);
                                                                    if (deleteProductApiResModel
                                                                            .success ==
                                                                        true) {
                                                                      _future =
                                                                          getProductList();
                                                                      Navigator.pop(
                                                                          context);
                                                                      setState(
                                                                          () {});
                                                                    } else {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                            content:
                                                                                Text('Something went wrong')),
                                                                      );
                                                                    }
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
                                                                                AppCol.primary,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              side: BorderSide(width: 0.50, color: AppCol.primary),
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
                                                                          )),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                          ]);
                                                    },
                                                  );
                                                }
                                              },
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return <PopupMenuEntry<String>>[
                                                  PopupMenuItem<String>(
                                                    value: 'edit',
                                                    child: Text('Edit'),
                                                  ),
                                                  PopupMenuItem<String>(
                                                    value: 'delete',
                                                    child: Text('Delete'),
                                                  ),
                                                ];
                                              },
                                              icon: Container(
                                                height: 36,
                                                width: 0,
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Icon(
                                                  Icons.more_vert,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : Center(
                            child: Text('No Product Found'),
                          ),

                    if(getFilterCatalogueApiResModel.products?.length != null) GridView.builder(
                      itemCount: getFilterCatalogueApiResModel.products?.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 0,
                        childAspectRatio: 4 / 5,
                        // childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        debugPrint(
                            'My catalogue screen image is: ${getFilterCatalogueApiResModel.products?[index].images?.length} ');
                        bool isMp4 = getFilterCatalogueApiResModel
                            .products?[index].images?[0]
                            .contains('.mp4') ??
                            false;
                        if (isMp4) {
                          if (!_videoControllers.containsKey(index)) {
                            _videoControllers[index] =
                                VideoPlayerController.networkUrl(Uri.parse(
                                    '${getFilterCatalogueApiResModel.products?[index].images?[0]}'));
                            _videoControllers[index]!
                                .initialize()
                                .then((_) {
                              setState(() {
                                _isVideoControllerInitialized[index] =
                                true;
                                _videoControllers[index]!.pause();
                                _videoControllers[index]!.setVolume(0);
                              });
                            });
                          }
                        }
                        return Container(
                          child: Stack(
                            children: [
                              /// Catalogue Image
                              SizedBox(
                                width: double.infinity,
                                child: (getFilterCatalogueApiResModel
                                    .products?[index]
                                    .images ??
                                    [])
                                    .isNotEmpty
                                    ? isMp4
                                    ? _videoControllers[index] !=
                                    null &&
                                    (_isVideoControllerInitialized[
                                    index] ??
                                        false)
                                    ? AspectRatio(
                                  aspectRatio:
                                  _videoControllers[
                                  index]!
                                      .value
                                      .aspectRatio,
                                  child: VideoPlayer(
                                      _videoControllers[
                                      index]!),
                                )
                                    : Center(
                                    child:
                                    CircularProgressIndicator())
                                    : Image.network(
                                  '${getFilterCatalogueApiResModel.products?[index].images?[0]}',
                                  fit: BoxFit.contain,
                                )
                                    : Center(
                                    child: Image.asset(
                                        'assets/newIcons/home_head.png')),
                              ),

                              /// Bottom Section
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(.4),
                                  ),
                                  child: Row(
                                    children: [
                                      if (getFilterCatalogueApiResModel
                                          .products?[index]
                                          .images
                                          ?.length !=
                                          1)
                                        Image.asset(
                                          'assets/newIcons/groupCopyIcon.png',
                                          height: 20,
                                          width: 20,
                                        ),
                                      /*Spacer(),
                                            Icon(
                                              Icons.remove_red_eye_outlined,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              '2K',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),*/
                                      Spacer(),
                                      PopupMenuButton<String>(
                                        onSelected: (value) async {
                                          if (value == 'edit') {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditProductListScreen(
                                                          productId:
                                                          "${getFilterCatalogueApiResModel.products?[index].id}",
                                                          isFrom:
                                                          "Variants",
                                                          isFromCatalogue:
                                                          true,
                                                        )));
                                          } else if (value == 'delete') {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            16)),
                                                    title: Text(
                                                      'Do you want to delete this product? All your product details will be lost if you delete it.',
                                                      textAlign: TextAlign
                                                          .center,
                                                      style: TextStyle(
                                                        color: Color(
                                                            0xFF666666),
                                                        fontSize: 15,
                                                        fontFamily:
                                                        'Roboto',
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
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
                                                                      AppCol.primary),
                                                                  borderRadius:
                                                                  BorderRadius.circular(23),
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
                                                                      AppCol.primary,
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

                                                          /// Yes Button
                                                          InkWell(
                                                            onTap:
                                                                () async {
                                                              deleteProductApiResModel =
                                                              await _addProductController.deleteProduct(getFilterCatalogueApiResModel
                                                                  .products?[index]
                                                                  .id);
                                                              if (deleteProductApiResModel
                                                                  .success ==
                                                                  true) {
                                                                _future =
                                                                    getProductList();
                                                                Navigator.pop(
                                                                    context);
                                                                setState(
                                                                        () {});
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                    context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                      content:
                                                                      Text('Something went wrong')),
                                                                );
                                                              }
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
                                                                  AppCol.primary,
                                                                  shape:
                                                                  RoundedRectangleBorder(
                                                                    side: BorderSide(width: 0.50, color: AppCol.primary),
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
                                                                )),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                          height: 10),
                                                    ]);
                                              },
                                            );
                                          }
                                        },
                                        itemBuilder:
                                            (BuildContext context) {
                                          return <PopupMenuEntry<String>>[
                                            PopupMenuItem<String>(
                                              value: 'edit',
                                              child: Text('Edit'),
                                            ),
                                            PopupMenuItem<String>(
                                              value: 'delete',
                                              child: Text('Delete'),
                                            ),
                                          ];
                                        },
                                        icon: Container(
                                          height: 36,
                                          width: 0,
                                          alignment:
                                          Alignment.centerRight,
                                          child: Icon(
                                            Icons.more_vert,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    /// Import From Instagram
                    InkWell(
                      onTap: () async {
                        final value = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => InstagramLoginScreen(authResponse: (value) {
                              debugPrint('My vlaue is: $value');
                            },),
                          ),
                        );

                        if (value != null) {
                          debugPrint('My product length is: $value');
                          debugPrint('My product length is: ${value['data'].length}');
                          Navigator.push(context, MaterialPageRoute(builder: (context) => InstagramAuthWebViewPage(instagramAuthResModel: value),));
                        } else {
                          print('Auth response is null');
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 24, right: 24, top: 24),
                        decoration: BoxDecoration(
                          color: AppCol.gray200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/newIcons/share_insta.png',
                                height: 20, width: 20),
                            SizedBox(width: 10),
                            Text(
                              'Import from Instagram',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    /// OR Text
                    Text(
                      'OR',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 16),

                    /// Add Product Manually Button
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                AddProductListScreen(isFromCatalogue: true),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 24, right: 24),
                        decoration: BoxDecoration(
                          color: AppCol.gray200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/newIcons/add_out.png',
                                height: 20, width: 20),
                            SizedBox(width: 10),
                            Text(
                              'Add Product Manually',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
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

  /// Get product list
  Future<bool> getProductList() async {
    getProductApiResModel = await _addProductController.getProductList();
    if (getProductApiResModel.success == true) {
      isApiDataAvailable = true;
    } else {
      isApiDataAvailable = true;
    }
    return isApiDataAvailable;
  }

  @override
  void dispose() {
    for (var controller in _videoControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }



}

/// ---------- Catalogue Class ----------
class Catalogue {
  String viewer;
  String postImageUrl;

  Catalogue({required this.viewer, required this.postImageUrl});
}
