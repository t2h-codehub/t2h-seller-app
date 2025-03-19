// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:taptohello/core/app_export.dart';
// import 'package:taptohello/core/constants.dart';
// import 'package:taptohello/core/utils/commonFun.dart';
// import 'package:taptohello/data/productCategoryModel/addCollectionApiResModel.dart';
// import 'package:taptohello/data/productCategoryModel/manageCollectionApiResModel.dart';
// import 'package:taptohello/helper/locator.dart';
// import 'package:taptohello/helper/user_detail_service.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/ManageCollection/ManageCollectionController/manageCollectionController.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/ManageCollection/addNewCollection.dart';

// class ManageCollectionScreen extends StatefulWidget {
//   const ManageCollectionScreen({super.key});

//   @override
//   State<ManageCollectionScreen> createState() => _ManageCollectionScreenState();
// }

// class _ManageCollectionScreenState extends State<ManageCollectionScreen> {
//   ManageCollectionApiResModel manageCollectionApiResModel =
//       ManageCollectionApiResModel();
//   final ManageCollectionController _manageCollectionController =
//       ManageCollectionController();

//   bool isApiDataAvailable = false;
//   late Future _future;
//   final UserDetailService _userDetailService = getIt<UserDetailService>();

//   List<ManageCollection> manegeCollectionList = [];
//    AddCollectionApiResModel addCollectionApiResModel =
//       AddCollectionApiResModel();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _future = getCollection();
//   }

//   void showDeleteConfirmationDialog(String title ,BuildContext context, VoidCallback onConfirm) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: title == "" ? Text("Delete Product") : Text(title) ,
//         content: Text("Are you sure you want to delete this product? This action cannot be undone."),
//         actions: [
//           // Cancel Button
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Close the dialog
//             },
//             child: Text("Cancel"),
//           ),
//           // Confirm Button
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Close the dialog
//               onConfirm(); // Call the delete function
//             },
//             child: Text("Delete", style: TextStyle(color: Colors.red)),
//           ),
//         ],
//       );
//     },
//   );
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF0F1F6),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//         title: Text(
//           'Manage Collections',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//           ),
//         ),
//       ),
//       body: FutureBuilder(
//           future: _future,
//           builder: (context, snapshot) {
//             if (isApiDataAvailable) {
//               return SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     /// Manage Collection List
//                     ListView.builder(
//                       padding: EdgeInsets.only(left: 24, right: 24, top: 16),
//                       itemCount:
//                           manageCollectionApiResModel.sellerCollections?.length,
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           margin: EdgeInsets.only(bottom: 16),
//                           padding: EdgeInsets.only(
//                               left: 14, right: 14, top: 16, bottom: 16),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(.1),
//                                 blurRadius: 6,
//                                 spreadRadius: 1,
//                               ),
//                             ],
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.remove_red_eye_outlined,
//                               ),
//                               SizedBox(width: 4),
//                               Text(
//                                 '1K',
//                               ),
//                               Spacer(),
//                               Expanded(
//                                 flex: 3,
//                                 child: Text(
//                                   '${manageCollectionApiResModel.sellerCollections?[index].title}',
//                                 ),
//                               ),
//                               Spacer(),
//                               InkWell(
//                                 onTap: () {
//                                   Clipboard.setData(ClipboardData(text: "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}/collection/${manageCollectionApiResModel.sellerCollections?[index].title?.trim().replaceAll(RegExp(r'\s+'), "-").toLowerCase()}"))
//                                       .then((_) {
                                    
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                         SnackBar(
//                                             content: Text(
//                                                 "Collection copied to clipboard")));
//                                   });
//                                 },
//                                 child: Image.asset(
//                                   'assets/newIcons/pro_link.png',
//                                   height: 20,
//                                   width: 20,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               Spacer(),
//                               InkWell(
//                                 onTap: () {
//                                   // manegeCollectionList.removeAt(index);
//                                   // setState(() {});
//                                   showDeleteConfirmationDialog(manageCollectionApiResModel.sellerCollections![index].title.toString(),context, () async {
//                                      addCollectionApiResModel =
//         await _manageCollectionController.deleteCollection(manageCollectionApiResModel.sellerCollections![index].sId.toString());
//     if (addCollectionApiResModel.success == true) {
//       ScaffoldMessenger.of(context).showSnackBar(
//   SnackBar(content: Text(addCollectionApiResModel.message.toString()))
// );
// _future = getCollection();
// setState(() {});
//      // Navigator.pop(context, true);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('${addCollectionApiResModel.message}')));
//     }
//       // Perform the delete action here
//       print("Product Deleted");
//                                 });
//                                 },
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     border: Border.all(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   child: Icon(
//                                     Icons.close_rounded,
//                                     size: 14,
//                                   ),
//                                 ),
//                               ),
//                               Spacer(),
//                               InkWell(
//                                 onTap: () async {
//                                   final res = await openScreenAndReturnValue(
//                                       context, AddNewCollectionScreen(title: manageCollectionApiResModel.sellerCollections![index].title.toString(), tag: manageCollectionApiResModel.sellerCollections![index].tag.toString(), sid: [manageCollectionApiResModel.sellerCollections![index].productIds!.toString()],isEdit:true, collectionId: manageCollectionApiResModel.sellerCollections![index].sId.toString()));
//                                   if (res) {
//                                     _future = getCollection();
//                                     setState(() {});
//                                   }
//                                 },
//                                 child: Icon(
//                                   Icons.arrow_forward_ios_rounded,
//                                   size: 18,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),

//                     /// Add product manually
//                     InkWell(
//                       onTap: () async {
//                         final res = await openScreenAndReturnValue(
//                             context, AddNewCollectionScreen(isEdit: false,));
//                         if (res) {
//                           _future = getCollection();
//                           setState(() {});
//                         }
//                       },
//                       child: Container(
//                         height: 50,
//                         width: double.infinity,
//                         margin: EdgeInsets.only(left: 24),
//                         decoration: BoxDecoration(
//                           color: Colors.transparent,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Image.asset('assets/newIcons/add_out.png',
//                                 height: 20, width: 20),
//                             SizedBox(width: 10),
//                             Text(
//                               'Add New Collection',
//                               style: TextStyle(
//                                 color: AppCol.primary,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
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

//   /// get collection
//   Future<bool> getCollection() async {
//     manageCollectionApiResModel =
//         await _manageCollectionController.getAllCollection();
//     if (manageCollectionApiResModel.success == true) {
//       isApiDataAvailable = true;
//     } else {
//       isApiDataAvailable = true;
//     }
//     return isApiDataAvailable;
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/core/utils/commonFun.dart';
import 'package:taptohello/data/productCategoryModel/addCollectionApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/manageCollectionApiResModel.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageCollection/ManageCollectionController/manageCollectionController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageCollection/addNewCollection.dart';

class ManageCollectionScreen extends StatefulWidget {
  const ManageCollectionScreen({super.key});

  @override
  State<ManageCollectionScreen> createState() => _ManageCollectionScreenState();
}

class _ManageCollectionScreenState extends State<ManageCollectionScreen> {
  ManageCollectionApiResModel manageCollectionApiResModel =
      ManageCollectionApiResModel();
  final ManageCollectionController _manageCollectionController =
      ManageCollectionController();

  bool isApiDataAvailable = false;
  late Future _future;
  final UserDetailService _userDetailService = getIt<UserDetailService>();

  List<ManageCollection> manegeCollectionList = [];
  AddCollectionApiResModel addCollectionApiResModel =
      AddCollectionApiResModel();

  @override
  void initState() {
    super.initState();
    _future = getCollection();
  }

  void showDeleteConfirmationDialog(String title ,BuildContext context, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title == "" ? Text("Delete Product") : Text(title),
          content: Text("Are you sure you want to delete this product? This action cannot be undone."),
          actions: [
            // Cancel Button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            // Confirm Button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                onConfirm(); // Call the delete function
              },
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Manage Collections',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: FutureBuilder(
  future: _future,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }
    
    bool hasCollections = manageCollectionApiResModel.collections != null &&
                          manageCollectionApiResModel.collections!.isNotEmpty;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Show Reorderable List if collections exist
          if (hasCollections)
            ReorderableListView(
              padding: EdgeInsets.only(left: 24, right: 24, top: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) newIndex -= 1;
                  final item = manageCollectionApiResModel.collections!.removeAt(oldIndex);
                  manageCollectionApiResModel.collections!.insert(newIndex, item);

                  // Save new order locally after reordering
                  _manageCollectionController.saveCollectionOrder();
                });
              },
              children: [
                for (int index = 0; index < manageCollectionApiResModel.collections!.length; index++)
                  Card(
                    key: ValueKey(manageCollectionApiResModel.collections![index].id),
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      title: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              manageCollectionApiResModel.collections![index].title ?? "",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),

                          /// Copy Collection Link
                          InkWell(
                            onTap: () {
                              Clipboard.setData(
                                ClipboardData(
                                  text: "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}/collection/${manageCollectionApiResModel.collections![index].title?.trim().replaceAll(RegExp(r'\s+'), "-").toLowerCase()}",
                                ),
                              ).then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Collection copied to clipboard")),
                                );
                              });
                            },
                            child: Image.asset(
                              'assets/newIcons/pro_link.png',
                              height: 20,
                              width: 20,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),

                          /// Delete Collection
                          InkWell(
                            onTap: () {
                              showDeleteConfirmationDialog(
                                manageCollectionApiResModel.collections![index].title ?? "",
                                context,
                                () async {
                                  addCollectionApiResModel = await _manageCollectionController.deleteCollection(
                                    manageCollectionApiResModel.collections![index].id ?? "",
                                  );
                                  if (addCollectionApiResModel.success == true) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(addCollectionApiResModel.message ?? "")),
                                    );
                                    _future = getCollection();
                                    setState(() {});
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('${addCollectionApiResModel.message}')),
                                    );
                                  }
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.black)),
                              child: Icon(Icons.close_rounded, size: 14),
                            ),
                          ),

                          Spacer(),

                          /// Edit Collection
                          InkWell(
                            onTap: () async {
                              final res = await openScreenAndReturnValue(
                                context,
                                AddNewCollectionScreen(
                                  title: manageCollectionApiResModel.collections![index].title ?? "",
                                  tag: manageCollectionApiResModel.collections![index].tag ?? "",
                                  sid: manageCollectionApiResModel.collections![index].products != null
                                      ? manageCollectionApiResModel.collections![index].products!
                                          .map((product) => product.productId ?? "")
                                          .toList()
                                      : [],
                                  isEdit: true,
                                  collectionId: manageCollectionApiResModel.collections![index].id ?? "",
                                ),
                              );
                              
                              if (res) {
                                _future = getCollection();
                                setState(() {});
                              }
                            },
                            child: Icon(Icons.arrow_forward_ios_rounded, size: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),

          /// Always show the "Add New Collection" button
          InkWell(
            onTap: () async {
              final res = await openScreenAndReturnValue(
                context,
                AddNewCollectionScreen(isEdit: false),
              );
              if (res) {
                _future = getCollection();
                setState(() {});
              }
            },
            child: Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(left: 24, top: hasCollections ? 16 : 0), // Add margin when list is present
              decoration: BoxDecoration(color: Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/newIcons/add_out.png', height: 20, width: 20),
                  SizedBox(width: 10),
                  Text(
                    'Add New Collection',
                    style: TextStyle(color: AppCol.primary, fontWeight: FontWeight.w400),
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


    );
  }

  /// get collection
  Future<bool> getCollection() async {
    manageCollectionApiResModel =
        await _manageCollectionController.getAllCollection();
    if (manageCollectionApiResModel.success == true) {
      isApiDataAvailable = true;
    } else {
      isApiDataAvailable = true;
    }
    return isApiDataAvailable;
  }
}


/// ------------ Collections ------------
class ManageCollection {
  String collectionView;
  String collectionName;

  ManageCollection(
      {required this.collectionView, required this.collectionName});
}
