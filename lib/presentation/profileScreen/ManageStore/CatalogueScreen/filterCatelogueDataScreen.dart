import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/app_export.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/deleteProductApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/filterCatalogueApiResModel.dart' as getFilterCatalogueApiResModel;
import 'package:swapnil_s_application4/data/productCategoryModel/getProductListApiResModel.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/addProductListScreen.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/InstagramAuth/importFromInstagramScreen.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/CatalogueScreen/catalogueDialogScreen.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/InstagramAuth/instagramAuthWebViewPage.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/InstagramAuth/instagramLogin.dart';
import 'package:video_player/video_player.dart';

class FilterCatalogueScreen extends StatefulWidget {
  const FilterCatalogueScreen({super.key,required this.products});
  final List<getFilterCatalogueApiResModel.Product> products;


  @override
  State<FilterCatalogueScreen> createState() => _FilterCatalogueScreenState();
}

class _FilterCatalogueScreenState extends State<FilterCatalogueScreen> {
  GetProductApiResModel getProductApiResModel = GetProductApiResModel();
  AddProductController _addProductController = AddProductController();


  bool isApiDataAvailable = false;
  late Future _future;

  Map<int, VideoPlayerController> _videoControllers = {};
  Map<int, bool> _isVideoControllerInitialized = {};

  // final GlobalKey _menuKey = GlobalKey();

  DeleteProductApiResModel deleteProductApiResModel =
  DeleteProductApiResModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _future = getProductList();
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
            onTap: () => showDialog(
                context: context,
                barrierColor: Colors.black.withOpacity(.4),
                useSafeArea: true,
                builder: (context) {
                  return CatalogueDialogScreen();
                }),
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 16),

            /// Catalogue View
            (widget.products ?? []).isNotEmpty
                ? GridView.builder(
              itemCount:widget.products.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 0,
                childAspectRatio: 4 / 5,
              ),
              itemBuilder: (context, index) {
                debugPrint(
                    'My catalogue screen image is: ${widget.products[index].images} ');
                bool isMp4 = widget.products[index].images?[0].contains('.mp4') ?? false;
                if (isMp4) {
                  if (!_videoControllers.containsKey(index)) {
                    _videoControllers[index] = VideoPlayerController.networkUrl(Uri.parse('${widget.products[index].images?[0]}'));
                    _videoControllers[index]!.initialize().then((_) {
                      setState(() {
                        _isVideoControllerInitialized[index] = true;
                        _videoControllers[index]!.pause();
                      });
                    });
                  }
                }
                return Container(
                  child: Stack(
                    children: [
                      /// Catalogue Image
                      Container(
                        width: double.infinity,
                        child: (widget.products[index]
                            .images ??
                            [])
                            .isNotEmpty
                            ? isMp4 ? _videoControllers[index] != null && (_isVideoControllerInitialized[index] ?? false)
                            ? AspectRatio(
                          aspectRatio: _videoControllers[index]!.value.aspectRatio,
                          child: VideoPlayer(_videoControllers[index]!),
                        )
                            : Center(child: CircularProgressIndicator()): Image.network(
                          '${widget.products[index].images?[0]}',
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
                              Image.asset(
                                'assets/newIcons/groupCopyIcon.png',
                                height: 20,
                                width: 20,
                              ),
                              Spacer(),
                              Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                '2K',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
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
                                                  "${widget.products[index].id}",
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
                                              'Attributes will get discarded if you go back without saving them.',
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
                                                              Color(0xFF3371A5)),
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

                                                  /// Yes Button
                                                  InkWell(
                                                    onTap:
                                                        () async {
                                                      deleteProductApiResModel =
                                                      await _addProductController.deleteProduct(widget.products[index]
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
                                icon: Icon(
                                  Icons.more_vert_rounded,
                                  color: Colors.white,
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
                    builder: (context) => AddProductListScreen(),
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
      ),
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
    _videoControllers.values.forEach((controller) {
      controller.dispose();
    });
    super.dispose();
  }

/*void _showPopupMenu(BuildContext context, productId) async {
    // final RenderBox renderBox = _menuKey.currentContext!.findRenderObject() as RenderBox;
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    final position = RelativeRect.fromRect(
      Rect.fromLTWH(
        renderBox.localToGlobal(Offset.zero).dx,
        renderBox.localToGlobal(Offset.zero).dy + renderBox.size.height,
        renderBox.size.width,
        renderBox.size.height,
      ),
      Offset.zero & overlay.size,
    );

    await showMenu(
      context: context,
      position: position,
      items: <PopupMenuEntry>[
        PopupMenuItem<String>(
          value: 'edit',
          child: Text('Edit'),
        ),
        PopupMenuItem<String>(
          value: 'delete',
          child: Text('Delete'),
        ),
      ],
    ).then((value) async {
      if (value != null) {
        print('Selected: $value');
        if (value == 'edit') {  // Call your edit function here
        } else if (value == 'delete') {
          deleteProductApiResModel = await _addProductController.deleteProduct(productId);
          if(deleteProductApiResModel.success == true) {
            _future = getProductList();
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Something went wrong')));
          }
        }
      }
    });
  }*/
}

/// ---------- Catalogue Class ----------
class Catalogue {
  String viewer;
  String postImageUrl;

  Catalogue({required this.viewer, required this.postImageUrl});
}
