import 'dart:async';
import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/productCategoryModel/addAttributesApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/deleteAttributesApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/deleteProductApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/manageAttributesApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/savedAttributesApiResModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/InstagramAuth/instagramEditProducts.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/ManageAttributes/ManageAttributesController/manageAttributesController.dart';

class ManageAttributesScreen extends StatefulWidget {
  const ManageAttributesScreen({super.key, required this.productId, this.inFromInstagram});

  final String productId;
  final bool? inFromInstagram;

  @override
  State<ManageAttributesScreen> createState() => _ManageAttributesScreenState();
}

class _ManageAttributesScreenState extends State<ManageAttributesScreen> {
  final TextEditingController _attributesOptionsController = TextEditingController();
  final TextEditingController _attributesValueController = TextEditingController();
  final TextEditingController _customAttributesValuesController =
      TextEditingController();

  ManageAttributesApiResModel manageAttributesApiResModel =
      ManageAttributesApiResModel();
  AddManageAttributesApiResModel addManageAttributesApiResModel =
      AddManageAttributesApiResModel();
  final ManageAttributesController _manageAttributesController =
      ManageAttributesController();
  SavedAttributesApiResModel savedAttributesApiResModel =
      SavedAttributesApiResModel();
  DeleteAttributesApiResModel deleteAttributesApiResModel =
      DeleteAttributesApiResModel();
  DeleteProductApiResModel deleteProductApiResModel =
      DeleteProductApiResModel();
  final AddProductController _addProductController = AddProductController();

  bool isApiDataAvailable = false;
  late Future _future;

  List<String> adminAttributes = [];
  List adminSubAttributes = [];
  List selectAdminSubAttributes = [];

  /// Another Attributes List
  final List<Map<String, dynamic>> _attributes = [];

  /// attributes value
  void _addAnotherCategory() {
    setState(() {
      _attributes.add({
        'attributeId': TextEditingController(),
        'valueIds': <String>[],
      });
    });
  }
  bool _isChanged = false;

  bool isShowProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = getAttributes();
  }

   Future<bool> _handleBackPress(BuildContext context) async {
    if (_isChanged) {
      return await _showExitConfirmation(context);
    }
    return true;
  }

  /// Function to show exit confirmation dialog
Future<bool> _showExitConfirmation(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Exit from Manage Attributes?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF666666),
            fontSize: 15,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        ),
        content: Text(
          'Unsaved changes will be lost if you leave this screen without saving Attributes.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// No Button
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  'No',
                  style: TextStyle(color: AppCol.primary, fontSize: 16),
                ),
              ),
              SizedBox(width: 20),
              /// Yes Button
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      );
    },
  ) ?? false;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
         leading: InkWell(
          onTap: () async {
             bool shouldExit = await _handleBackPress(context);
            if (shouldExit) {
              // Navigator.pop(context);
               if(widget.inFromInstagram ?? false) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InstagramEditProductListScreen(
                  productId: widget.productId,
                  isFrom: 'Attributes',
                  isFromCatalogue: false,
                )));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditProductListScreen(
                  productId: widget.productId,
                  isFrom: 'Attributes',
                  isFromCatalogue: false,
                )));
      }
            }
          
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Image.asset("assets/images/back.png", height: 24),
          ),
        ),
        title: Text(
          'Manage Attribute',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
       
       
        actions: [
          /// View Hello Store Button
          InkWell(
            onTap: () {
              isShowProgress = true;
              setState(() {});
              var seletedAttributes = [];
              for (var attributes in _attributes) {
              
              

                manageAttributesApiResModel.attributes?.forEach((element) {
                  if(element.title == attributes['attributeId'].text) {
                    attributes['attributeId'].text = element.sId ?? '';
                  }
                  for (var selectedAttributes in attributes['valueIds']) {
                    element.values?.forEach((subElement) {
                      if(subElement.title == selectedAttributes) {
                        seletedAttributes.add(subElement.sId);
                      }
                    });
                  }
                });
                debugPrint('My selected attributes valuess iss: $seletedAttributes');
                debugPrint('My previous attributes valuess iss: ${attributes['valueIds']}');
                attributes['valueIds'].clear();
                debugPrint('when i clean attributes valuess iss: ${attributes['valueIds']}');
                attributes['valueIds'] = seletedAttributes;

                debugPrint('My new attributes valuess iss: ${attributes['valueIds']}');

                seletedAttributes = [];
                debugPrint('Loop 1');
                debugPrint('when i clean selected attributes valuess iss: $seletedAttributes');

              }
              attributesList();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 14, top: 20),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: AppCol.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (isApiDataAvailable) {
              return isShowProgress
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 40),

                          /// Admin Attributes List
                          ListView.builder(
                            itemCount: _attributes.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 24, right: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// Attributes Type Field
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: TextFormField(
                                              controller: _attributes[index]
                                                  ['attributeId'],
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                labelText: 'Attribute Type',
                                                hintText:
                                                    'Select Attribute Type',
                                                labelStyle: TextStyle(
                                                  color: AppCol.primary,
                                                ),
                                                suffixIcon: Icon(Icons
                                                    .keyboard_arrow_down_rounded),
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior
                                                        .always,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: AppCol.primary,
                                                      width: 2.0),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              onTap: () async {
  // final res = await showVariantModalSheet(context, index);
  final res = await showVariantModalSheet(context, index, adminAttributes);

  
  if (res != null && res.isNotEmpty) {
    _attributes[index]['valueIds'].clear();
    _attributes[index]['attributeId'].text = res;
    loadSubValues(_attributes[index]['attributeId'].text);
    _attributesValueController.clear();
    setState(() {});
  }
},

                                           
                                           
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                       
                                       
                                        InkWell(
  onTap: () async {
    bool? confirmDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Attribute"),
          content: Text("Are you sure you want to delete this attribute?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false); // Cancel
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true); // Confirm
              },
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );

    // If user confirmed, proceed with delete
    if (confirmDelete == true) {
      deleteAttributesApiResModel =
          await _manageAttributesController.deleteAttributes(widget.productId);

      if (deleteAttributesApiResModel.success == true) {
        Navigator.pop(context, true);
       // Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Something went wrong')),
        );
      }
    }
  },
  child: Icon(Icons.delete_rounded),
),

                                      ],
                                    ),
                                    SizedBox(height: 24),

 
 
                                    
                                    Container(
                                      child: TextFormField(
                                        controller: _attributesValueController,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          labelText: 'Attribute Value',
                                          hintText: 'Select Attribute value',
                                          labelStyle: TextStyle(
                                            color: AppCol.primary,
                                          ),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          suffixIcon: Icon(Icons
                                              .keyboard_arrow_down_rounded),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppCol.primary,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),

                                onTap: _attributes[index]['valueIds']?.isNotEmpty ?? false
    ? () {}
    : () async {
        final res = await showAdminSubAttributesModalSheet(
          context, 
          index, 
          adminSubAttributes.cast<Map<String, String>>()
        );

        if (res.isNotEmpty) {
          if (_attributes[index]['valueIds']?.contains(res) ?? false) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Attributes value already selected'),
                duration: Duration(seconds: 2),
              ),
            );
          } else {
            _attributes[index]['valueIds']?.add(res);
            selectAdminSubAttributes.add(res);

            // Update the text field
            _attributesValueController.text = res;

            // Trigger UI update
            setState(() {});
          }
        }
      },



                                      ),
                                    ),
                                    SizedBox(height: 18),
                                    SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: List.generate(
      _attributes[index]['valueIds'].length, (subIndex) {
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 16, right: 10),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.1),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Colors.grey,
              width: 0.8,
            ),
          ),
          child: Row(
            children: [
              Text('${_attributes[index]['valueIds'][subIndex]}'),
              SizedBox(width: 6),
              InkWell(
                onTap: () {
                  setState(() {
                    _attributes[index]['valueIds'].removeAt(subIndex);
                    debugPrint('My updated list is: ${_attributes[index]['valueIds']}');
                  });
                },
                child: Icon(
                  Icons.close_rounded,
                  size: 16,
                ),
              ),
            ],
          ),
        );
      },
    ),
  ),
),



                                    /// Divider
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 16),
                                  ],
                                ),
                              );
                            },
                          ),

                          /// Add Variant value text row button
                          Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24),
                            child: InkWell(
                              onTap: _addAnotherCategory,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset('assets/newIcons/add_out.png',
                                      height: 20, width: 20),
                                  SizedBox(width: 10),
                                  Text(
                                    'Add New Attribute Type',
                                    style: TextStyle(
                                      color: AppCol.primary,
                                      fontWeight: FontWeight.w400,
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

  /// Load Attributes Value
  Future<bool> getAttributes() async {
    debugPrint('My product id is: ${widget.productId}');
    manageAttributesApiResModel =
        await _manageAttributesController.getAllAttributes();
    savedAttributesApiResModel = await _manageAttributesController
        .getAllSavedAttributes(widget.productId);
    if (manageAttributesApiResModel.success == true &&
        savedAttributesApiResModel.success == true) {
      loadAttributesData();
      if ((savedAttributesApiResModel.attributes ?? []).isNotEmpty) {
        savedAttributesApiResModel.attributes?.forEach((element) {
          List<String> valueTitles = [];
          element.values?.forEach((val) {
            String? valueTitle = val.title;
            valueTitles.add(valueTitle ?? '');
          });
          _attributes.add({
            'attributeId': TextEditingController(text: element.title),
            'valueIds': valueTitles,
          });
        });
      }
      debugPrint('My response okay');
    }
    setState(() {});
    return isApiDataAvailable;
  }




Future<String> showVariantModalSheet(BuildContext context, int index, List<String> adminAttributes) async {
  final selectedString = Completer<String>();
  TextEditingController searchController = TextEditingController();
  List<String> sortedAttributes = List.from(adminAttributes)..sort(); // Sort alphabetically
  ValueNotifier<List<String>> filteredAttributes = ValueNotifier<List<String>>(sortedAttributes);

  void filterAttributes(String query) {
    filteredAttributes.value = sortedAttributes
        .where((attr) => attr.toLowerCase().contains(query.toLowerCase()))
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
                  'Select Attributes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 14),
                TextField(
                  controller: searchController,
                  onChanged: filterAttributes,
                  decoration: InputDecoration(
                    hintText: "Search Attribute Type",
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
                    valueListenable: filteredAttributes,
                    builder: (context, attributes, _) {
                      return attributes.isNotEmpty
                          ? ListView.builder(
                              itemCount: attributes.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        selectedString.complete(attributes[index]);
                                        Navigator.pop(context);
                                      },
                                      
                                      child: Container(
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                        child: Center(
                                          child: Text(
                                            attributes[index],
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
                                "No matching attributes",
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




  /// Load Attributes data
  loadAttributesData() {
    manageAttributesApiResModel.attributes?.forEach((element) {
      adminAttributes.add(element.title ?? '');
    });
    debugPrint('My attributes list: $adminAttributes');
    isApiDataAvailable = true;
    setState(() {});
  }

  /// load attributes value according to attributes type
  loadSubValues(selectedAttributes) {
    adminSubAttributes.clear();
    manageAttributesApiResModel.attributes?.forEach((element) {
      if (element.title == selectedAttributes) {
        element.values?.forEach((subValues) {
          adminSubAttributes
              .add({"_id": "${subValues.sId}", "title": "${subValues.title}"});
        });
      }
    });
  }


Future<String> showAdminSubAttributesModalSheet(
  BuildContext context, int index,  adminSubAttributes) async {
  
  final selectedString = Completer<String>();
  TextEditingController searchController = TextEditingController();
  
  // Sort the attributes alphabetically
  List<Map<String, String>> sortedSubAttributes = List.from(adminSubAttributes)
    ..sort((a, b) => a['title']!.compareTo(b['title']!));

  ValueNotifier<List<Map<String, String>>> filteredSubAttributes =
      ValueNotifier<List<Map<String, String>>>(sortedSubAttributes);

  // Filter function
  void filterSubAttributes(String query) {
    filteredSubAttributes.value = sortedSubAttributes
        .where((attr) => attr['title']!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // Show the modal sheet
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
                  'Select Attribute Value',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 14),
                TextField(
                  controller: searchController,
                  onChanged: filterSubAttributes,
                  decoration: InputDecoration(
                    hintText: "Search Attribute Value",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Divider(color: Colors.grey),
                Expanded(
                  child: ValueListenableBuilder<List<Map<String, String>>>(
                    valueListenable: filteredSubAttributes,
                    builder: (context, attributes, _) {
                      return attributes.isNotEmpty
                          ? ListView.builder(
                              itemCount: attributes.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // Set the selected value and close the modal
                                        selectedString.complete(attributes[index]['title']);
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                        child: Center(
                                          child: Text(
                                            attributes[index]['title']!,
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
                                "No matching attribute values",
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

  



  /// attributes list
  void attributesList() async {
    List<Map<String, dynamic>> finaList = [];
    for (var element in _attributes) {
      finaList.add({
        "attributeId": "${element['attributeId'].text}",
        "valueIds": element['valueIds'],
      });
    }
    debugPrint('My final list is: $finaList');
    Map<String, dynamic> body = {
      "productId": widget.productId,
      "attributes": finaList
    };
    debugPrint('My final body is: $body');

    addManageAttributesApiResModel =
        await _manageAttributesController.addManageAttributes(body);

    if (addManageAttributesApiResModel.success == true) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${addManageAttributesApiResModel.message}")));
      if(widget.inFromInstagram ?? false) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InstagramEditProductListScreen(
                  productId: widget.productId,
                  isFrom: 'Attributes',
                  isFromCatalogue: false,
                )));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditProductListScreen(
                  productId: widget.productId,
                  isFrom: 'Attributes',
                  isFromCatalogue: false,
                )));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${addManageAttributesApiResModel.message}")));
    }
  }
}

/// -------- Attribute value ----------
class AttributesValue {
  String attributeValue;

  AttributesValue({required this.attributeValue});
}
