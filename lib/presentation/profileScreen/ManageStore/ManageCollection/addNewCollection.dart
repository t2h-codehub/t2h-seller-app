import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/app_export.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/addCollectionApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/getProductListApiResModel.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageCollection/ManageCollectionController/manageCollectionController.dart';

class AddNewCollectionScreen extends StatefulWidget {
  const AddNewCollectionScreen({super.key,});

  @override
  State<AddNewCollectionScreen> createState() => _AddNewCollectionScreenState();
}

class _AddNewCollectionScreenState extends State<AddNewCollectionScreen> {
  TextEditingController _collectionNameController = TextEditingController();
  TextEditingController _collectionTagController = TextEditingController();

  GetProductApiResModel getProductApiResModel = GetProductApiResModel();
  AddProductController _addProductController = AddProductController();
  AddCollectionApiResModel addCollectionApiResModel =
      AddCollectionApiResModel();
  ManageCollectionController _manageCollectionController =
      ManageCollectionController();

  bool isApiDataAvailable = false;
  late Future _future;

  String selectedTag = '';
  List<String> collectionTags = ['HOT', 'SALE', 'NEW'];

  List<NewCollection> catalogueItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = getProductList();
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
          'Add/Edit Collection',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          /// View Hello Store Button
          InkWell(
            onTap: () {
              addCollection();
            },
            child: Padding(
              padding: EdgeInsets.only(top: 24, right: 14),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: AppCol.primary,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),

            /// Collection Name Field
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        controller: _collectionNameController,
                        onChanged: (value) {
                          _collectionNameController.text = value;
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          labelText: 'Collection Name',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 18),
                  Icon(
                    Icons.filter_alt_outlined,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            /// Collection Tag (optional)
            Container(
              margin: EdgeInsets.only(
                  left: 24, right: MediaQuery.of(context).size.width / 6),
              child: TextFormField(
                controller: _collectionTagController,
                readOnly: true,
                onChanged: (value) {
                  _collectionTagController.text = value;
                  setState(() {});
                },
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14), topRight: Radius.circular(14))),
                    builder: (builder) => Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        padding: EdgeInsets.only(left: 24, right: 24),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(14), topRight: Radius.circular(14))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 14),
                            Text(
                              'Select Collection Value',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 14),
                            Divider(
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: collectionTags.length,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        debugPrint(
                                            'My selected string: ${collectionTags[index]}');
                                        setState(() {
                                          Navigator.pop(context, collectionTags[index]);
                                          _collectionTagController.text = collectionTags[index];
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 10, top: 10),
                                        child:
                                        Center(child: Text('${collectionTags[index]}')),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  );
                },
                decoration: InputDecoration(
                  labelText: 'Collection Tag (optional)',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            /// Select the product text
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Select the products to be added in the collection:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 16),

            /// Gridview List
            FutureBuilder(
                future: _future,
                builder: (context, snapshot) {
                  if (isApiDataAvailable) {
                    return catalogueItems.isNotEmpty
                        ? GridView.builder(
                            itemCount: catalogueItems.length,
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
                              return Container(
                                child: Stack(
                                  children: [
                                    /// Catalogue Image
                                    Container(
                                      width: double.infinity,
                                      child: AspectRatio(
                                        aspectRatio: 4 / 5,
                                        child: Image.network(
                                          '${catalogueItems[index].newCollection}',
                                        ),
                                      ),
                                    ),

                                    /// Bottom Section
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            bottom: 2,
                                            top: 2),
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
                                            Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: CircleBorder(),
                                                  side: BorderSide(
                                                    color: Colors.white,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              child: Checkbox(
                                                value: catalogueItems[index]
                                                    .isChecked,
                                                activeColor: Colors.green,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                visualDensity: VisualDensity(
                                                    horizontal: -4,
                                                    vertical: -4),
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      catalogueItems[index]
                                                          .isChecked = value!;
                                                    },
                                                  );
                                                },
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
                        : Column(
                            children: [
                              Text('No Product Found'),
                            ],
                          );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            SizedBox(height: 16),
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
      addProduct();
    } else {
      isApiDataAvailable = true;
    }
    return isApiDataAvailable;
  }

  /// Add Product
  void addProduct() {
    getProductApiResModel.products?.forEach((element) {
      catalogueItems.add(NewCollection(
          newCollection: "${element.images?[0]}", isChecked: false));
    });
    setState(() {});
  }

  /// Add Collection
  void addCollection() async {
    Map<String, dynamic> body = {
      "title": "${_collectionNameController.text}",
      "tag": "${_collectionTagController.text}",
      "productIds": []
    };
    addCollectionApiResModel =
        await _manageCollectionController.addCollection(body);
    if (addCollectionApiResModel.success == true) {
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${addCollectionApiResModel.message}')));
    }
  }
}

/// ---------- class New Collection ----------
class NewCollection {
  String newCollection;
  bool isChecked;

  NewCollection({required this.newCollection, required this.isChecked});
}
