import 'dart:async';

import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/app_export.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/editVariantApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/manageVariantsApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/manageVariantsCollectionApiResModel.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageVariants/ManageVariantController.dart';

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
  ManageVariantController _manageVariantController = ManageVariantController();

  EditVariantApiResModel editVariantApiResModel = EditVariantApiResModel();

  bool isApiDataAvailable = false;
  late Future _future;

  List adminVariantType = [];
  List customVariantValue = [];
  List<Map<String, dynamic>> adminVariantValue = [];

  String variantTypeId = "";
  List variantValueIds = [];

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
    widget.selectedVariantValue.forEach((element) {
      debugPrint('My list is: ${element.title}');
      selectedValue.add(element.title);
    });
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
                    final res = await showAddedVariantTypesModalSheet(context);
                    debugPrint('My value is: $res');
                    if (res.isNotEmpty) {
                      variantTypeController.text = res;
                      setState(() {});
                      loadVariantValue(variantTypeController.text);
                    }
                  },
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
                    final res = await showAddedVariantValueModalSheet(context);
                    debugPrint('My value is: $res');
                    if (res.isNotEmpty) {
                      selectedValue.add(res);
                      debugPrint('My variant value list is: $selectedValue');
                      setState(() {});
                    }
                  },
                ),
                SizedBox(height: 16),
                // for(var i =0; i < selectedValue.value.length; i++) ,
                /*selectedValue.forEach((element) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 16, right: 10),
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
                            selectedValue[subIndex].removeAt(subIndex);
                            setState(() {});
                            debugPrint(
                                'My updated list is: ${_categories[index]['subcategoryIds']}');
                          },
                          child: Icon(
                            Icons.close_rounded,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                }),*/
                selectedValue.isNotEmpty
                    ? Container(
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
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      variantValueIds.clear();
                      manageVariantsApiResModel.variants?.forEach((element) {
                        if (element.title == variantTypeController.text) {
                          variantTypeId = element.sId!;
                        }
                      });

                      selectedValue.forEach((element) {
                        adminVariantValue.forEach((subElement) {
                          if (subElement['valueTitle'] == element) {
                            variantValueIds.add(subElement['valueId']);
                          }
                          setState(() {});
                        });
                      });
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

  /// load variant type values
  Future<String> showAddedVariantTypesModalSheet(BuildContext context) async {
    final selectedString = Completer<String>();
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
                'Select Variant Value',
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
                  itemCount: adminVariantType.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // selectedString = adminCategories[index];
                          selectedString.complete(adminVariantType[index]);

                          debugPrint(
                              'My selected string: ${selectedString.future}');
                          setState(() {});
                          Navigator.pop(context, selectedString);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10, top: 10),
                          child:
                              Center(child: Text('${adminVariantType[index]}')),
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
    return selectedString.future;
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

  /// load variants title
  void loadVariantsTitle() {
    manageVariantsApiResModel.variants?.forEach((element) {
      adminVariantType.add(element.title);
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

  /// load variant type values
  Future<String> showAddedVariantValueModalSheet(BuildContext context) async {
    final selectedString = Completer<String>();
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
                'Select Variant Value',
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
                  itemCount: adminVariantValue.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // selectedString = adminCategories[index];
                          selectedString
                              .complete(adminVariantValue[index]['valueTitle']);
                          debugPrint(
                              'My selected string: ${selectedString.future}');
                          setState(() {});
                          Navigator.pop(context, selectedString);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10, top: 10),
                          child: Center(
                              child: Text(
                                  '${adminVariantValue[index]['valueTitle']}')),
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
    return selectedString.future;
  }

  /// Add Variant Value
  addVariantValue() async {
    debugPrint('my variant values: $variantValueIds');
    debugPrint('My object id is: ${widget.objectId}');
    Map<String, dynamic> body = {
      "variantType": "$variantTypeId",
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
