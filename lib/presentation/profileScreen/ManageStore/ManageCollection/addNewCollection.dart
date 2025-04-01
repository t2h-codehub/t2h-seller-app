

import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:reorderable_grid/reorderable_grid.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/data/productCategoryModel/addCollectionApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/getProductListApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/manageCollectionApiResModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageCollection/ManageCollectionController/manageCollectionController.dart';

class AddNewCollectionScreen extends StatefulWidget {
  const AddNewCollectionScreen({super.key, this.title, this.tag, this.sid, required this.isEdit, this.collectionId});
  final String? title;
  final String? tag;
  final String? collectionId;
  final List<String>? sid;
  final bool isEdit;

  @override
  State<AddNewCollectionScreen> createState() => _AddNewCollectionScreenState();
}

class _AddNewCollectionScreenState extends State<AddNewCollectionScreen> {


  bool isApiDataAvailable = false;
  String selectedTag = '';
  List<String> collectionTags = ['HOT', 'SALE', 'NEW'];
  List<String> catalogueItemsId = [];
  late Future _future;

    final TextEditingController _collectionNameController = TextEditingController();
  final TextEditingController _collectionTagController = TextEditingController();

  GetProductApiResModel getProductApiResModel = GetProductApiResModel();
  final AddProductController _addProductController = AddProductController();
  AddCollectionApiResModel addCollectionApiResModel =
      AddCollectionApiResModel();
  final ManageCollectionController _manageCollectionController =
      ManageCollectionController();

 

 

  List<NewCollection> catalogueItems = [];
 
  List<int> selectedIndices = [];
  bool isChecked = false;
   // List to track checkbox selections
  late List<bool> selectedItems = [];

  @override
  void initState() {
    super.initState();
   
    editData();
    _future = getProductList();
  }

  void editData() {
    if (widget.isEdit == true) {
      _collectionNameController.text = widget.title.toString();
      _collectionTagController.text = widget.tag.toString();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
          InkWell(
            onTap: widget.isEdit ? editCollection : addCollection,
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
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        controller: _collectionNameController,
                        onChanged: (value) {
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
                                        setState(() {
                                          Navigator.pop(context, collectionTags[index]);
                                          _collectionTagController.text = collectionTags[index];
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 10, top: 10),
                                        child:
                                        Center(child: Text(collectionTags[index])),
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

            // FutureBuilder or another widget for displaying the product list
            // Example:
            FutureBuilder(
                future: _future,
                builder: (context, snapshot) {
                 if (isApiDataAvailable) {
                    return catalogueItems.isNotEmpty
                        ? ReorderableGridView.builder(
                            itemCount: catalogueItems.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 0,
                              childAspectRatio: 4 / 5,
                            ),
                            onReorder: (oldIndex, newIndex) {
                              setState(() {
                                if (oldIndex < newIndex) {
                                  newIndex -= 1;
                                }
                                final item = catalogueItems.removeAt(oldIndex);
                                catalogueItems.insert(newIndex, item);
                              });
                            },
                            itemBuilder: (context, index) {
                              return Container(
                                key: ValueKey(catalogueItems[index].id),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: AspectRatio(
                                        aspectRatio: 4 / 5,
                                        child: Image.network(catalogueItems[index].newCollection),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 2, top: 2),
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
                                                checkboxTheme: CheckboxThemeData(
                                                  shape: CircleBorder(),
                                                  side: BorderSide(
                                                    color: Colors.white,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              child: Checkbox(
                                                value: catalogueItems[index].isChecked,
                                                activeColor: Colors.green,
                                                onChanged: (value) {
                                                  setState(() {
                                                    catalogueItems[index].isChecked = value!;
                                                    if (value == true) {
                                                      catalogueItemsId.add(catalogueItems[index].id);
                                                    } else {
                                                      catalogueItemsId.remove(catalogueItems[index].id);
                                                    }
                                                  });
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
                    return Center(child: CircularProgressIndicator());
                  }
                }),

            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

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

    void addProduct() {
    getProductApiResModel.products?.forEach((element) {
      catalogueItems.add(NewCollection(newCollection: "${element.images?[0]}", isChecked: false, id: '${element.id}'));
    });
    if(widget.isEdit == true){
      findIndexById();
    }
    selectedItems = List.generate(catalogueItems.length, (index) {
      return selectedIndices.contains(index);
    });
    updateCatalogueItems();
    setState(() {});
  }

    void updateCatalogueItems() {
  for (int i = 0; i < catalogueItems.length; i++) {
    catalogueItems[i].isChecked = selectedItems[i];
  }
    }

    void findIndexById() {
  if (widget.sid == null || widget.sid!.isEmpty) return;

  // Clear previous selections
  catalogueItemsId.clear();
  selectedIndices.clear();

  List<String> extractedIds = widget.sid!;

  for (var id in extractedIds) {
    String trimmedId = id.trim(); // Trim spaces

    catalogueItemsId.add(trimmedId); // Store ID

    // Debugging print statements
    debugPrint("Checking ID: $trimmedId in catalogueItems");

    for (var item in catalogueItems) {
      debugPrint("Comparing with: ${item.id}");
    }

    // Find index in `catalogueItems` based on `id`
    int index = catalogueItems.indexWhere((item) => item.id.trim() == trimmedId);

    if (index != -1) {
      debugPrint("Found at index: $index");
      selectedIndices.add(index);
    } else {
      debugPrint("Not found: $trimmedId");
    }
  }
}


void addCollection() async {
  ManageCollectionApiResModel manageCollectionApiResModel =
      ManageCollectionApiResModel();
  int orderCounter = 1; // Default order starting value

  // Find the highest existing order
  if (manageCollectionApiResModel.collections != null) {
    for (var collection in manageCollectionApiResModel.collections!) {
      if (collection.products != null) {
        for (var product in collection.products!) {
          if (product.order != null && product.order! >= orderCounter) {
            orderCounter = product.order! + 1;
          }
        }
      }
    }
  }

  // Ensure order matches the index of the selected items in `catalogueItems`
  List<Map<String, dynamic>> orderedProducts = [];

  for (int i = 0; i < catalogueItems.length; i++) {
    if (catalogueItems[i].isChecked) {
      orderedProducts.add({
        "product": catalogueItems[i].id, // Pass product ID
        "order": i, // Assign the actual index as order
      });
    }
  }

  // Prepare request body
  Map<String, dynamic> body = {
    "title": _collectionNameController.text,
    "tag": _collectionTagController.text,
    "productIds": orderedProducts, // Use the ordered list
  };
  

  addCollectionApiResModel =
      await _manageCollectionController.addCollection(body);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('${addCollectionApiResModel.message}')),
  );

  if (addCollectionApiResModel.success == true) {
    Navigator.pop(context, true);
  }
}

void editCollection() async {
  // Ensure order matches the index of the selected items in `catalogueItems`
  List<Map<String, dynamic>> orderedProducts = [];

  for (int i = 0; i < catalogueItems.length; i++) {
    if (catalogueItems[i].isChecked) {
      orderedProducts.add({
        "product": catalogueItems[i].id, // Pass product ID
        "order": i, // Assign the actual index as order
      });
    }
  }

  // Prepare request body with ordered product list
  Map<String, dynamic> body = {
    "title": _collectionNameController.text,
    "tag": _collectionTagController.text,
    "productIds": orderedProducts, // Use the ordered list
  };

  addCollectionApiResModel =
      await _manageCollectionController.editCollection(body, widget.collectionId);

  // Show success/failure message
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('${addCollectionApiResModel.message}')),
  );

  if (addCollectionApiResModel.success == true) {
    Navigator.pop(context, true);
  }
}




}


class NewCollection {
  String newCollection;
  String id;
  bool isChecked;

  NewCollection({required this.newCollection, required this.isChecked, required this.id});
}


