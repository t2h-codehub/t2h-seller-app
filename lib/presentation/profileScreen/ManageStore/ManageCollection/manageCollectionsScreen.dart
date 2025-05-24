


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
  final ManageCollectionController _manageCollectionController =
      ManageCollectionController();

  ManageCollectionApiResModel manageCollectionApiResModel =
      ManageCollectionApiResModel();
  bool isApiDataAvailable = false;
  bool _isAscending = true; // Track sorting order
  late Future _future;
    AddCollectionApiResModel addCollectionApiResModel =
      AddCollectionApiResModel();
      final UserDetailService _userDetailService = getIt<UserDetailService>();

  @override
  void initState() {
    super.initState();
    _future = getCollection();
    print(_userDetailService.userDetailResponse?.user?.domain);
  }

 
 
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


  /// Function to sort collections alphabetically
  void _sortCollections() {
    setState(() {
      _isAscending = !_isAscending;
      manageCollectionApiResModel.collections?.sort((a, b) {
        return _isAscending
            ? (a.title ?? "").compareTo(b.title ?? "")
            : (b.title ?? "").compareTo(a.title ?? "");
      });
    });
  }

  /// Function to show delete confirmation dialog
  void showDeleteConfirmationDialog(
      String title, BuildContext context, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title.isNotEmpty ? title : "Delete Collection"),
          content: Text(
              "Are you sure you want to delete this collection? This action cannot be undone."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
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
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Manage Collections',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: _sortCollections,
            tooltip: "Sort Collections",
          ),
        ],
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
                if (hasCollections)
                  ReorderableListView(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) newIndex -= 1;
                        final item = manageCollectionApiResModel.collections!.removeAt(oldIndex);
                        manageCollectionApiResModel.collections!.insert(newIndex, item);
                        _manageCollectionController.saveCollectionOrder();
                      });
                    },
                    children: [
                      for (int index = 0;
                          index < manageCollectionApiResModel.collections!.length;
                          index++)
                        Card(
                          key: ValueKey(manageCollectionApiResModel.collections![index].id),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                            title: Text(
                              manageCollectionApiResModel.collections![index].title ?? "",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Wrap(
  spacing: 12,
  children: [
    // InkWell(
    //   onTap: () {
    //     Clipboard.setData(ClipboardData(
    //       text: "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}/collectiondetails/${manageCollectionApiResModel.collections![index].title?.trim().replaceAll(RegExp(r'\s+'), "")}",
    //     ));
    //   },
    //   child: Image.asset(
    //     'assets/newIcons/pro_link.png',
    //     height: 20,
    //     width: 20,
    //     color: Colors.black,
    //   ),
    // ),
    InkWell(
  // onTap: () {
  //   Clipboard.setData(ClipboardData(
  //     text: "${_userDetailService.userDetailResponse?.user?.domain}/collectiondetails/${manageCollectionApiResModel.collections![index].title?.trim().replaceAll(RegExp(r'\s+'), "")}",
  //   ));
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('Link copied to clipboard!'),
  //       duration: Duration(seconds: 2),
  //     ),
  //   );
  // },
  onTap: () {
  final user = _userDetailService.userDetailResponse?.user;
  final domain = user?.domain?.trim();
  final username = user?.username ?? '';
  final title = manageCollectionApiResModel.collections![index].title
      ?.trim()
      .replaceAll(RegExp(r'\s+'), "") ?? '';

  final baseUrl = (domain != null && domain.isNotEmpty)
      ? domain
      : "${AppConstants.storeUrl}$username";

  final link = "$baseUrl/collectiondetails/$title";

  Clipboard.setData(ClipboardData(text: link));

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Link copied to clipboard!'),
      duration: Duration(seconds: 2),
    ),
  );
},

  child: Image.asset(
    'assets/newIcons/pro_link.png',
    height: 20,
    width: 20,
    color: Colors.black,
  ),
),

    SizedBox(width: 10), // Instead of Spacer()
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

if (res == true) {  // Ensures res is explicitly true
  _future = getCollection();
  setState(() {});
}
      },
      child: Icon(Icons.edit, color: AppCol.primary),
    ),
    SizedBox(width: 10), // Instead of Spacer()
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
            }
          },
        );
      },
      child: Icon(Icons.delete, color: Colors.red),
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
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text("Add Collection feature coming soon!")),
                    // );
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
                    margin: EdgeInsets.only(left: 24, top: hasCollections ? 16 : 0),
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.add_circle_outline, color: Colors.black),
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
}





/// ------------ Collections ------------
class ManageCollection {
  String collectionView;
  String collectionName;

  ManageCollection(
      {required this.collectionView, required this.collectionName});
}
