import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/productCategoryModel/editVariantApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/manageVariantsApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/manageVariantsCollectionApiResModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageVariants/ManageVariantController.dart';

class EditVariantsPopDialog extends StatefulWidget {
  const EditVariantsPopDialog(
      {super.key,
      required this.selectedVariantType,
      required this.selectedVariantValue,
      required this.productID,
      required this.objectId});

  final String productID;
  final String objectId;
  final String selectedVariantType;
  final List selectedVariantValue;

  @override
  State<EditVariantsPopDialog> createState() => _EditVariantsPopDialogState();
}

class _EditVariantsPopDialogState extends State<EditVariantsPopDialog> {
  final List selectedValue = [];

  TextEditingController variantTypeController = TextEditingController();
  TextEditingController variantValueController = TextEditingController();

  ManageVariantsApiResModel manageVariantsApiResModel =
      ManageVariantsApiResModel();
  ManageVariantsCollectionApiResModel manageVariantsCollectionApiResModel =
      ManageVariantsCollectionApiResModel();
  final ManageVariantController _manageVariantController = ManageVariantController();

  EditVariantApiResModel editVariantApiResModel = EditVariantApiResModel();

  bool isApiDataAvailable = false;
  late Future _future;

  List adminVariantType = [];
  List customVariantValue = [];
  List<Map<String, dynamic>> adminVariantValue = [];

  String variantTypeId = "";
  List variantValueIds = [];

  List<String> selectedVariantTypes = [];


  @override
  void initState() {
    super.initState();
    _future = loadVariantData();
    variantTypeController.text = widget.selectedVariantType;
    debugPrint('My object Id is: ${widget.objectId}');
    addValue();
  }

  void addValue() {
    selectedValue.clear();
    debugPrint('My list is: ${widget.selectedVariantValue}');
    for (var element in widget.selectedVariantValue) {
      debugPrint('My list is: ${element.title}');
      selectedValue.add(element.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.25,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Heading Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Edit Variant',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        variantTypeController.clear();
                        variantValueController.clear();
                      },
                      child: Icon(
                        Icons.close_rounded,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                /// Variant Type
                TextFormField(
                  controller: variantTypeController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Variant Type',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Enter variant value',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                  ),


                onTap: () async {
  if (selectedValue.isNotEmpty) {
    bool? shouldProceed = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Change Variant Type?"),
        content: Text("You have already selected variant values. Remove them before changing the type."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              selectedValue.clear();
              selectedVariantTypes.clear();
              setState(() {});
              Navigator.pop(context, true);
            },
            child: Text("Remove & Change"),
          ),
        ],
      ),
    );

    if (shouldProceed == null || !shouldProceed) return;
  }
   selectedVariantTypes.add(variantTypeController.text);
  // Show filtered variant type selection modal
  final res = await showAddedVariantTypesModalSheet(context, selectedVariantTypes);
  if (res == null || res.isEmpty) return;

  debugPrint('Selected Variant Type: $res');

  if (!selectedVariantTypes.contains(res)) {
    selectedVariantTypes.add(res);
    variantTypeController.text = res;
    setState(() {});
    loadVariantValue(res);
    selectedVariantTypes.clear();
  }
}


                  // onTap: () async {
                  //   final res = await showAddedVariantTypesModalSheet(context, selectedVariantTypes);
                  //   debugPrint('My value is: $res');
                  //   if (res!.isNotEmpty) {
                  //     variantTypeController.text = res;
                  //     setState(() {});
                  //     loadVariantValue(variantTypeController.text);
                  //   }
                  // },



                ),
                SizedBox(height: 16),

                /// Variant Value
                TextFormField(
                  controller: variantValueController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Variant Value',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Enter variant value',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                 
                 
                  onTap: () async {
  // final res = await showAddedVariantValueModalSheet(context, selectedValue);
  final res = await showAddedVariantValueModalSheet(
    context, selectedValue.cast<String>());

  debugPrint('Selected Variant Value: $res');

  if (res.isNotEmpty && !selectedValue.contains(res)) {
    setState(() {
      selectedValue.add(res);
    });
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Variant value is already selected")),
    );
  }
}

                ),
                SizedBox(height: 16),
               
               
                selectedValue.isNotEmpty
                    ? SizedBox(
                        height: 80,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(selectedValue.length,
                                  (subIndex) {
                                debugPrint(
                                    'My variant list is value: ${selectedValue[subIndex]}');
                                return Container(
                                  padding: EdgeInsets.all(10),
                                  margin:
                                      EdgeInsets.only(bottom: 16, right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: Colors.grey,
                                      strokeAlign: 0.8,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text('${selectedValue[subIndex]}'),
                                      SizedBox(width: 6),
                                      InkWell(
                                        onTap: () {
                                          selectedValue.removeAt(subIndex);
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.close_rounded,
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),

                /// Add Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      variantValueIds.clear();
                      manageVariantsApiResModel.variants?.forEach((element) {
                        if (element.title == variantTypeController.text) {
                          variantTypeId = element.sId!;
                        }
                      });

                      for (var element in selectedValue) {
                        for (var subElement in adminVariantValue) {
                          if (subElement['valueTitle'] == element) {
                            variantValueIds.add(subElement['valueId']);
                          }
                          setState(() {});
                        }
                      }
                      addVariantValue();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      backgroundColor: AppCol.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 
 

Future<String?> showAddedVariantTypesModalSheet(
    BuildContext context, List<String> selectedVariantTypes) async {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
    ),
    builder: (context) {
      TextEditingController searchController = TextEditingController();
      List<String> availableVariantTypes = adminVariantType
          .where((type) => !selectedVariantTypes.contains(type))
          .map((type) => type.toString())
          .toList();
      ValueNotifier<List<String>> filteredList =
          ValueNotifier<List<String>>(availableVariantTypes);

      void filterVariants(String query) {
        filteredList.value = availableVariantTypes
            .where((type) => type.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }

      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Select Variant Type',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 14),
                TextField(
                  controller: searchController,
                  onChanged: filterVariants,
                  decoration: InputDecoration(
                    hintText: "Search variant type",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Divider(color: Colors.grey),
                Expanded(
                  child: ValueListenableBuilder<List<String>>(
                    valueListenable: filteredList,
                    builder: (context, variants, _) {
                      return variants.isNotEmpty
                          ? ListView.builder(
                              itemCount: variants.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) => Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context, variants[index]);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 12),
                                      child: Center(
                                        child: Text(
                                          variants[index],
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider(color: Colors.grey),
                                ],
                              ),
                            )
                          : Center(
                              child: Text(
                                "No matching variant types",
                                style: TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}




  /// load variant data
  Future<bool> loadVariantData() async {
    manageVariantsApiResModel = await _manageVariantController.getVariantData();
    if (manageVariantsApiResModel.success == true) {
      isApiDataAvailable = true;
      loadVariantsTitle();
      loadVariantValue(variantTypeController.text);
    }
    return isApiDataAvailable;
  }

 
 
  void loadVariantsTitle() {
  adminVariantType.clear();
  List<String> addedVariantTypes = selectedValue.map((e) => e.toString()).toList();

  manageVariantsApiResModel.variants?.forEach((element) {
    if (!addedVariantTypes.contains(element.title)) {
      adminVariantType.add(element.title);
    }
  });

  setState(() {});
}


  /// load variant value
  void loadVariantValue(variantTitle) {
    adminVariantValue.clear();
    manageVariantsApiResModel.variants?.forEach((element) {
      if (element.title == variantTitle) {
        element.values?.forEach((elementValue) {
          adminVariantValue.add(
              {"valueId": elementValue.sId, "valueTitle": elementValue.title});
        });
      }
    });
    setState(() {});
  }




Future<String> showAddedVariantValueModalSheet(
    BuildContext context, List<String> selectedValues) async {
  final selectedString = Completer<String>();
  TextEditingController searchController = TextEditingController();
  List<String> allVariantValues = adminVariantValue
      .map((variant) => variant['valueTitle'].toString())
      .toList();
  ValueNotifier<List<String>> filteredList =
      ValueNotifier<List<String>>(
          allVariantValues.where((value) => !selectedValues.contains(value)).toList());

  void filterVariants(String query) {
    filteredList.value = allVariantValues
        .where((value) =>
            value.toLowerCase().contains(query.toLowerCase()) &&
            !selectedValues.contains(value))
        .toList();
  }

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
    ),
    builder: (builder) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Select Variant Value',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 14),
                TextField(
                  controller: searchController,
                  onChanged: filterVariants,
                  decoration: InputDecoration(
                    hintText: "Search variant value",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Divider(color: Colors.grey),
                Expanded(
                  child: ValueListenableBuilder<List<String>>(
                    valueListenable: filteredList,
                    builder: (context, values, _) {
                      return values.isNotEmpty
                          ? ListView.builder(
                              itemCount: values.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        selectedString.complete(values[index]);
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                        child: Center(
                                          child: Text(
                                            values[index],
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(color: Colors.grey),
                                  ],
                                );
                              },
                            )
                          : Center(
                              child: Text(
                                "No matching variant values",
                                style: TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );

  return selectedString.future;
}


 
 

  /// Add Variant Value
  addVariantValue() async {
    debugPrint('my variant values: $variantValueIds');
    debugPrint('My object id is: ${widget.objectId}');
    Map<String, dynamic> body = {
      "variantType": variantTypeId,
      "valueIds": variantValueIds
    };
    debugPrint('My body is: $body');
    editVariantApiResModel =
        await _manageVariantController.editVariant(widget.objectId, body);
    if (editVariantApiResModel.success == true) {
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(editVariantApiResModel.message.toString())));
    }
  }
}
