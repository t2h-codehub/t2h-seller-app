import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';

class DefaultVariantScreen extends StatefulWidget {
  const DefaultVariantScreen({super.key, required this.variantList});
  final List<Map<String, dynamic>> variantList;

  @override
  State<DefaultVariantScreen> createState() => _DefaultVariantScreenState();
}

class _DefaultVariantScreenState extends State<DefaultVariantScreen> {
  int? _selectedVariantIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < widget.variantList.length; i++) {
      if (widget.variantList[i]['isDefault']) {
        _selectedVariantIndex = i;
        break;
      }
    }
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
          'Default Variant',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            SizedBox(height: 16),

            /// Default Variant Heading
            Text('Default Variant to be displayed to the customer',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),

            /// The price Heading
            Text('The Price (MRP, Discounted Price) that will appear against a product when buyer visits the product detail screen will be based on the below selection:',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black.withOpacity(.6),
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 16),

            /// Variant list
            ListView.builder(
              itemCount: widget.variantList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
              return Row(
                children: [
                  Radio(
                    value: index,
                    groupValue: _selectedVariantIndex,
                    activeColor: AppCol.primary,
                    onChanged: (value) {
                      setState(() {
                        _selectedVariantIndex = value;
                        // Set the selected variant as default
                        for (int i = 0; i < widget.variantList.length; i++) {
                          widget.variantList[i]['isDefault'] = i == index;
                        }
                      });
                    },
                  ),
                  Text("Size: ${widget.variantList[index]['size']}"),
                  SizedBox(width: 20),
                  Text("Color: ${widget.variantList[index]['color']}"),
                ],
              );
            },),
            SizedBox(height: 16),

            /// Submit Button
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 14,bottom: 14),
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: AppCol.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
