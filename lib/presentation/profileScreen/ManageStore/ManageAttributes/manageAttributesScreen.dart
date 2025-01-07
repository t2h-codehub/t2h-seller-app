import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/app_export.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/addAttributesApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/deleteAttributesApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/deleteProductApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/manageAttributesApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/savedAttributesApiResModel.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/InstagramAuth/instagramEditProducts.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/ManageAttributes/ManageAttributesController/manageAttributesController.dart';

class ManageAttributesScreen extends StatefulWidget {
  const ManageAttributesScreen({super.key, required this.productId, this.inFromInstagram});

  final String productId;
  final bool? inFromInstagram;

  @override
  State<ManageAttributesScreen> createState() => _ManageAttributesScreenState();
}

class _ManageAttributesScreenState extends State<ManageAttributesScreen> {
  TextEditingController _attributesOptionsController = TextEditingController();
  TextEditingController _attributesValueController = TextEditingController();
  TextEditingController _customAttributesValuesController =
      TextEditingController();

  ManageAttributesApiResModel manageAttributesApiResModel =
      ManageAttributesApiResModel();
  AddManageAttributesApiResModel addManageAttributesApiResModel =
      AddManageAttributesApiResModel();
  ManageAttributesController _manageAttributesController =
      ManageAttributesController();
  SavedAttributesApiResModel savedAttributesApiResModel =
      SavedAttributesApiResModel();
  DeleteAttributesApiResModel deleteAttributesApiResModel =
      DeleteAttributesApiResModel();
  DeleteProductApiResModel deleteProductApiResModel =
      DeleteProductApiResModel();
  AddProductController _addProductController = AddProductController();

  bool isApiDataAvailable = false;
  late Future _future;

  List<String> adminAttributes = [];
  List adminSubAttributes = [];
  List selectAdminSubAttributes = [];

  /// Another Attributes List
  List<Map<String, dynamic>> _attributes = [];

  /// attributes value
  void _addAnotherCategory() {
    setState(() {
      _attributes.add({
        'attributeId': TextEditingController(),
        'valueIds': <String>[],
      });
    });
  }

  bool isShowProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = getAttributes();
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
        title: Text(
          'Manage Attribute',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        leading: InkWell(
          onTap: () => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    title: Text(
                      'Attributes will get discarded if you go back without saving them.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 1.47,
                      ),
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// No Button
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 48, vertical: 10),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0.50, color: Color(0xFF3371A5)),
                                  borderRadius: BorderRadius.circular(23),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'No',
                                    style: TextStyle(
                                      color: Color(0xFF3371A5),
                                      fontSize: 16,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 24),
                          InkWell(
                              onTap: () async {
                                /*Navigator.of(
                                    context)
                                    .pop();
                                Navigator.of(
                                    context)
                                    .pop();*/

                                deleteAttributesApiResModel =
                                    await _manageAttributesController
                                        .deleteAttributes(widget.productId);
                                if (deleteAttributesApiResModel.success ==
                                    true) {
                                  Navigator.pop(context, true);
                                  Navigator.pop(context, true);
                                } else {
                                  Navigator.pop(context, true);
                                  /*ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(content: Text('${deleteAttributesApiResModel.message}')));*/
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('Something went wrong')));
                                }
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 48, vertical: 10),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF3371A5),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 0.50,
                                          color: Color(0xFF3371A5)),
                                      borderRadius: BorderRadius.circular(23),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                  )))
                        ],
                      ),
                      SizedBox(height: 10),
                    ]);
              }),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Image.asset(
                "assets/images/back.png",
                height: 24,
              )),
        ),
        actions: [
          /// View Hello Store Button
          InkWell(
            onTap: () {
              isShowProgress = true;
              setState(() {});
              var seletedAttributes = [];
              _attributes.forEach((attributes) {
                // debugPrint('My existing title iss: ${attributes['attributeId'].text}');
                // debugPrint(
                //     'My existing valuess iss: ${attributes['valueIds']}');

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

              });
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
                                                final res =
                                                    await showVariantModalSheet(
                                                        context, index);
                                                if (res.isNotEmpty) {
                                                  _attributes[index]['valueIds']
                                                      .clear();
                                                  _attributes[index]
                                                          ['attributeId']
                                                      .text = res;
                                                  loadSubValues(
                                                      _attributes[index]
                                                              ['attributeId']
                                                          .text);
                                                  _attributesValueController
                                                      .clear();
                                                  setState(() {});
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        InkWell(
                                            onTap: () {
                                              _attributes.removeAt(index);
                                              setState(() {});
                                            },
                                            child: Icon(Icons.delete_rounded)),
                                      ],
                                    ),
                                    SizedBox(height: 24),

                                    /// Attribute Value Field
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
                                        onTap: _attributes[index]['valueIds']
                                                .isNotEmpty
                                            ? () {}
                                            : () async {
                                                final res =
                                                    await showAdminSubAttributesModalSheet(
                                                        context, index);

                                                if (res.isNotEmpty) {
                                                  if (_attributes[index]
                                                          ['valueIds']
                                                      .contains(res)) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                          content: Text(
                                                              'Attributes value already selected')),
                                                    );
                                                  } else {
                                                    _attributes[index]
                                                            ['valueIds']
                                                        .add('$res');
                                                    selectAdminSubAttributes
                                                        .add(res);
                                                  }
                                                }
                                              },
                                      ),
                                    ),
                                    SizedBox(height: 18),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: List.generate(
                                            _attributes[index]['valueIds']
                                                .length, (subIndex) {
                                          return Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(
                                                bottom: 16, right: 10),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(.1),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border: Border.all(
                                                color: Colors.grey,
                                                strokeAlign: 0.8,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                    '${_attributes[index]['valueIds'][subIndex]}'),
                                                SizedBox(width: 6),
                                                InkWell(
                                                  onTap: () {
                                                    _attributes[index]
                                                            ['valueIds']
                                                        .removeAt(subIndex);
                                                    setState(() {});
                                                    debugPrint(
                                                        'My updated list is: ${_attributes[index]['valueIds']}');
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
                                    /*if (!_attributes[index]['custom']) ...[

                                        ],*/

                                    /*/// Custom Attribute Type and toggle button
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            /// Custom variant? Text
                                            Text(
                                              'Custom variant?',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),

                                            /// Toggle Button
                                            Container(
                                              height: 24,
                                              width: 45,
                                              child:
                                                  AnimatedToggleSwitch<bool>.dual(
                                                current: _attributes[index]
                                                    ['custom'],
                                                first: false,
                                                second: true,
                                                innerColor: _attributes[index]
                                                        ['custom']
                                                    ? AppCol.primary
                                                    : Color(0xFFD0D5DD),
                                                dif: 1.0,
                                                borderColor: Colors.transparent,
                                                // borderWidth: 2.0,
                                                // height: 20,
                                                indicatorSize: Size(17, 18),
                                                indicatorColor: Colors.white,
                                                onChanged: (b) {
                                                  _attributes[index]['custom'] = b;
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16),

                                        if (_attributes[index]['custom']) ...[
                                          /// Custom Attribute Type
                                          TextFormField(
                                            controller: _attributes[index]['title'],
                                            decoration: InputDecoration(
                                              labelText: 'Attribute Type',
                                              border: OutlineInputBorder(),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                            ),
                                            onTap: () async {},
                                          ),
                                          SizedBox(height: 16),

                                          /// Custom Attribute Value
                                          TextFormField(
                                            controller:
                                                _customAttributesValuesController,
                                            decoration: InputDecoration(
                                              labelText: 'Attributes Value',
                                              border: OutlineInputBorder(),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              suffixIcon: InkWell(
                                                onTap: () {
                                                  _attributes[index]['values'].add(
                                                      '${_customAttributesValuesController.text.trim()}');
                                                  setState(() {});
                                                  _customAttributesValuesController
                                                      .clear();
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 16),
                                                  child: Text(
                                                    'Add',
                                                    style: TextStyle(
                                                        color: AppCol.primary),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              _customAttributesValuesController
                                                  .text = value;
                                            },
                                            onTap: () {},
                                          ),
                                          SizedBox(height: 16),
                                          Row(
                                            children: List.generate(
                                                _attributes[index]['values'].length,
                                                (subIndex) {
                                              return Container(
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.only(
                                                    bottom: 16, right: 10),
                                                decoration: BoxDecoration(
                                                  color:
                                                      Colors.grey.withOpacity(.1),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    strokeAlign: 0.8,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                        '${_attributes[index]['values'][subIndex]}'),
                                                    SizedBox(width: 6),
                                                    InkWell(
                                                      onTap: () {
                                                        _attributes[index]['values']
                                                            .removeAt(subIndex);
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
                                        ],*/

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

  /// show attributes type modal sheet
  Future<String> showVariantModalSheet(BuildContext context, index) async {
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
                'Select Attributes',
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
                  itemCount: adminAttributes.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // selectedString = adminCategories[index];
                          selectedString.complete(adminAttributes[index]);
                          debugPrint(
                              'My selected string: ${selectedString.future}');
                          setState(() {});
                          Navigator.pop(context, selectedString);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10, top: 10),
                          child:
                              Center(child: Text('${adminAttributes[index]}')),
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

  /// show admin sub attributes section modal
  Future<String> showAdminSubAttributesModalSheet(
      BuildContext context, index) async {
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
                'Select Attributes Value',
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
                  itemCount: adminSubAttributes.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // selectedString = adminCategories[index];
                          selectedString
                              .complete(adminSubAttributes[index]['title']);
                          debugPrint(
                              'My selected string: ${selectedString.future}');
                          setState(() {});
                          Navigator.pop(context, selectedString);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10, top: 10),
                          child: Center(
                              child: Text(
                                  '${adminSubAttributes[index]['title']}')),
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

  /// attributes list
  void attributesList() async {
    List<Map<String, dynamic>> finaList = [];
    _attributes.forEach((element) {
      finaList.add({
        "attributeId": "${element['attributeId'].text}",
        "valueIds": element['valueIds'],
      });
    });
    debugPrint('My final list is: $finaList');
    Map<String, dynamic> body = {
      "productId": "${widget.productId}",
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
