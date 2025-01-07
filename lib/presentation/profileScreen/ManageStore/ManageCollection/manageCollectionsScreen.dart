import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swapnil_s_application4/core/app_export.dart';
import 'package:swapnil_s_application4/core/utils/commonFun.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/manageCollectionApiResModel.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageCollection/ManageCollectionController/manageCollectionController.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageCollection/addNewCollection.dart';

class ManageCollectionScreen extends StatefulWidget {
  const ManageCollectionScreen({super.key});

  @override
  State<ManageCollectionScreen> createState() => _ManageCollectionScreenState();
}

class _ManageCollectionScreenState extends State<ManageCollectionScreen> {
  ManageCollectionApiResModel manageCollectionApiResModel =
      ManageCollectionApiResModel();
  ManageCollectionController _manageCollectionController =
      ManageCollectionController();

  bool isApiDataAvailable = false;
  late Future _future;

  List<ManageCollection> manegeCollectionList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = getCollection();
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
            if (isApiDataAvailable) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Manage Collection List
                    ListView.builder(
                      padding: EdgeInsets.only(left: 24, right: 24, top: 16),
                      itemCount:
                          manageCollectionApiResModel.sellerCollections?.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 16),
                          padding: EdgeInsets.only(
                              left: 14, right: 14, top: 16, bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 6,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.remove_red_eye_outlined,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '1K',
                              ),
                              Spacer(),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  '${manageCollectionApiResModel.sellerCollections?[index].title}',
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(text: ""))
                                      .then((_) {
                                    // print(
                                    //     "https://taptohello.com/profile/${_userDetailService.userDetailResponse?.user?.id}");
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Collection copied to clipboard")));
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
                              InkWell(
                                onTap: () {
                                  manegeCollectionList.removeAt(index);
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.close_rounded,
                                    size: 14,
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () async {
                                  final res = await openScreenAndReturnValue(
                                      context, AddNewCollectionScreen());
                                  if (res) {
                                    _future = getCollection();
                                    setState(() {});
                                  }
                                },
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    /// Add product manually
                    InkWell(
                      onTap: () async {
                        final res = await openScreenAndReturnValue(
                            context, AddNewCollectionScreen());
                        if (res) {
                          _future = getCollection();
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 24),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/newIcons/add_out.png',
                                height: 20, width: 20),
                            SizedBox(width: 10),
                            Text(
                              'Add New Collection',
                              style: TextStyle(
                                color: AppCol.primary,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
