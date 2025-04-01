import 'package:flutter/material.dart';
import 'package:taptohello/core/utils/color_constant.dart';

class OlderReportsScreen extends StatefulWidget {
  const OlderReportsScreen({super.key});

  @override
  State<OlderReportsScreen> createState() => _OlderReportsScreenState();
}

class _OlderReportsScreenState extends State<OlderReportsScreen> {
  String? selectedCategory;
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: false,
        title: Text(
          'Older Reports',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          /// Export to Shiprocket Button
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 22),
              child: Text(
                'Export to Excel',
                style: TextStyle(
                  fontSize: 12,
                  color: AppCol.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Report Duration
            Text(
              'Report Duration',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            /// From - To older report
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: TextFormField(
                      controller: _fromController,
                      onChanged: (value) {
                        _fromController.text = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        labelText: 'From*',
                        hintText: '15/07/24',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    child: TextFormField(
                      controller: _fromController,
                      onChanged: (value) {
                        _fromController.text = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        labelText: 'To*',
                        hintText: '31/08/24',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            /// Order Status
            DropdownButtonFormField<String>(
              value: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
              icon: Icon(Icons.keyboard_arrow_down_rounded),
              items: ['Category 1', 'Category 2', 'Category 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Order Status*',
                hintText: 'Order Status',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
