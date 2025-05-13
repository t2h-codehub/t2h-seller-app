import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reorderable_grid/reorderable_grid.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/data/productCategoryModel/addCollectionApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/getProductListApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/manageCollectionApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/filterDataModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/CatalogueScreen/catalogueDialogScreen.dart';
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
  List<String> collectionTags = ['HOT', 'SALE', 'NEW'];
  List<String> catalogueItemsId = [];

  final TextEditingController _collectionNameController = TextEditingController();
  final TextEditingController _collectionTagController = TextEditingController();

  GetProductApiResModel getProductApiResModel = GetProductApiResModel();
  final AddProductController _addProductController = AddProductController();
  AddCollectionApiResModel addCollectionApiResModel = AddCollectionApiResModel();
  final ManageCollectionController _manageCollectionController = ManageCollectionController();

  List<NewCollection> catalogueItems = [];

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      _collectionNameController.text = widget.title ?? '';
      _collectionTagController.text = widget.tag ?? '';
    }
    getProductList();
  }

  @override
  void dispose() {
    _collectionNameController.dispose();
    _collectionTagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Add/Edit Collection', style: TextStyle(color: Colors.black, fontSize: 18)),
        actions: [
          InkWell(
            onTap: widget.isEdit ? editCollection : addCollection,
            child: Padding(
              padding: const EdgeInsets.only(top: 24, right: 14),
              child: Text('Submit', style: TextStyle(color: AppCol.primary, fontSize: 12)),
            ),
          ),
        ],
      ),
      body: isApiDataAvailable
          ? CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: const SizedBox(height: 24)),
                SliverToBoxAdapter(child: buildCollectionNameField()),
                SliverToBoxAdapter(child: const SizedBox(height: 16)),
                SliverToBoxAdapter(child: buildCollectionTagField()),
                SliverToBoxAdapter(child: const SizedBox(height: 16)),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text('Select the products to be added in the collection:',
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                if (catalogueItems.isEmpty)
                  const SliverFillRemaining(child: Center(child: Text('No Product Found')))
                else
                  SliverReorderableGrid(
                    itemCount: catalogueItems.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 4 / 5,
                    ),
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (oldIndex < newIndex) newIndex -= 1;
                        final item = catalogueItems.removeAt(oldIndex);
                        catalogueItems.insert(newIndex, item);
                      });
                    },
                    itemBuilder: (context, index) => buildProductItem(index),
                  ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget buildCollectionNameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _collectionNameController,
              decoration: InputDecoration(
                labelText: 'Collection Name',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.filter_alt_outlined, color: AppCol.primary),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
    );
  }

  Future<void> _showFilterDialog() async {
    final FilteredData? result = await showDialog<FilteredData>(
      context: context,
      builder: (context) => CatalogueDialogScreen(),
    );

    if (result != null) {
      Map<String, dynamic> filters = {
        'categories': result.categories,
        'subcategories': result.subcategories,
        'minPrice': result.minPrice,
        'maxPrice': result.maxPrice,
        'dateFrom': result.dateFrom,
        'dateTo': result.dateTo,
        'showOutOfStock': result.showOutOfStock,
      };
      getProductList(filters: filters);
    }
  }

  Widget buildCollectionTagField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        controller: _collectionTagController,
        readOnly: true,
        onTap: selectCollectionTag,
        decoration: InputDecoration(
          labelText: 'Collection Tag (optional)',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  void selectCollectionTag() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14))),
      builder: (builder) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 14),
            const Text('Select Collection Value', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Divider(color: Colors.grey),
            Expanded(
              child: ListView.builder(
                itemCount: collectionTags.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      _collectionTagController.text = collectionTags[index];
                    });
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Center(child: Text(collectionTags[index])),
                      ),
                      const Divider(color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductItem(int index) {
    String imageUrl = catalogueItems[index].newCollection;

    if (imageUrl.isEmpty) {
      imageUrl = 'https://via.placeholder.com/150';
    } else if (!imageUrl.contains(AppConstants.imageBaseUrl)) {
      imageUrl = AppConstants.imageBaseUrl + imageUrl;
    }

    return Container(
      key: ValueKey(catalogueItems[index].id),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Image.asset('assets/newIcons/groupCopyIcon.png', height: 20, width: 20),
                  const Spacer(),
                  Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        shape: const CircleBorder(),
                        side: const BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                    child: Checkbox(
                      value: catalogueItems[index].isChecked,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          catalogueItems[index].isChecked = value!;
                          if (value) {
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
  }

  Future<void> getProductList({Map<String, dynamic>? filters}) async {
    setState(() {
      isApiDataAvailable = false;
      catalogueItems.clear();
      catalogueItemsId.clear();
    });

    getProductApiResModel = await _addProductController.getProductList(filters: filters);

    if (getProductApiResModel.success == true) {
      for (var element in getProductApiResModel.products!) {
        String image = (element.images != null && element.images!.isNotEmpty) ? element.images![0] : '';
        catalogueItems.add(NewCollection(newCollection: image, isChecked: false, id: '${element.id}'));
      }

      if (widget.isEdit && widget.sid != null) {
        for (var id in widget.sid!) {
          int index = catalogueItems.indexWhere((item) => item.id == id);
          if (index != -1) {
            catalogueItems[index].isChecked = true;
          }
        }
      }
    }

    setState(() {
      isApiDataAvailable = true;
    });
  }

  Future<void> addCollection() async {
    List<Map<String, dynamic>> orderedProducts = [];
    for (int i = 0; i < catalogueItems.length; i++) {
      if (catalogueItems[i].isChecked) {
        orderedProducts.add({
          "product": catalogueItems[i].id,
          "order": i,
        });
      }
    }
    Map<String, dynamic> body = {
      "title": _collectionNameController.text,
      "tag": _collectionTagController.text,
      "productIds": orderedProducts,
    };
    addCollectionApiResModel = await _manageCollectionController.addCollection(body);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${addCollectionApiResModel.message}')));
    if (addCollectionApiResModel.success == true) {
      Navigator.pop(context, true);
    }
  }

  Future<void> editCollection() async {
    List<Map<String, dynamic>> orderedProducts = [];
    for (int i = 0; i < catalogueItems.length; i++) {
      if (catalogueItems[i].isChecked) {
        orderedProducts.add({
          "product": catalogueItems[i].id,
          "order": i,
        });
      }
    }
    Map<String, dynamic> body = {
      "title": _collectionNameController.text,
      "tag": _collectionTagController.text,
      "productIds": orderedProducts,
    };
    addCollectionApiResModel = await _manageCollectionController.editCollection(body, widget.collectionId);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${addCollectionApiResModel.message}')));
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











