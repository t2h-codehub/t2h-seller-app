import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/app_export.dart';
import 'package:swapnil_s_application4/services/shared_preference_service.dart';

class ManageInventoryPriceAndSKUIdDialog extends StatefulWidget {
  const ManageInventoryPriceAndSKUIdDialog(
      {super.key,
      required this.size,
      this.color,
      required this.stock,
      required this.firstVariantName,
      required this.secondVariantName,
      required this.body,
      required this.skuid,
      required this.mrp,
      required this.discountPrice, required this.productId});

  final String productId;
  final String firstVariantName;
  final String secondVariantName;
  final String size;
  final String? color;
  final String stock;
  final String skuid;
  final String mrp;
  final String discountPrice;
  final Function(Map<String, dynamic>) body;

  @override
  State<ManageInventoryPriceAndSKUIdDialog> createState() => _ManageInventoryPriceAndSKUIdDialogState();
}

class _ManageInventoryPriceAndSKUIdDialogState extends State<ManageInventoryPriceAndSKUIdDialog> {
  TextEditingController stockController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController skuIdController = TextEditingController();

  bool isUnlimitedStock = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isUnlimitedStock = SharedPreferenceService.getString("productUnlimitedStockbyId${widget.productId}") == "true" ? true : false;
    stockController.text=widget.stock;
    priceController.text=widget.mrp;
    discountController.text=widget.discountPrice;
    skuIdController.text=widget.skuid;
    debugPrint('My main mrp price is: ${widget.mrp}');
    debugPrint('My discount price is: ${widget.discountPrice}');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stockController.dispose();
    priceController.dispose();
    discountController.dispose();
    skuIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 8),

                    /// Manage Inventory, Price & SKU ID and Close Icon
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Manage Inventory, Price & SKU ID',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close_rounded,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),

                    /// Divider
                    Divider(
                      color: Colors.black,
                      thickness: 0.2,
                    ),
                    SizedBox(height: 10),

                    /// Size and color text
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              '${widget.firstVariantName}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              '${widget.size}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 30),
                        widget.secondVariantName != ""
                            ? Column(
                                children: [
                                  Text(
                                    '${widget.secondVariantName}',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    widget.color ?? '',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(),
                      ],
                    ),
                    SizedBox(height: 16),

                    /// Stock Textfield
                    Visibility(
                      visible: !isUnlimitedStock,
                        child: Container(
                          child: TextFormField(
                            controller: stockController,
                            // initialValue: '${widget.stock}',
                            decoration: InputDecoration(
                              labelText: 'Stock',
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                    ),
                    SizedBox(height: 16),

                    /// Price (inc. Tax) Textfield
                    Container(
                      child: TextFormField(
                        controller: priceController,
                        // initialValue: '₹ ${widget.mrp}',
                        decoration: InputDecoration(
                          labelText: 'Price (inc. Tax)',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    /// Discounted Price Textfield
                    Container(
                      child: TextFormField(
                        controller: discountController,
                        // initialValue: '₹ ${widget.discountPrice}',
                        decoration: InputDecoration(
                          labelText: 'Discounted Price',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    /// SKU ID Textfield
                    Container(
                      child: TextFormField(
                        controller: skuIdController,
                        // initialValue: '${widget.skuid}',
                        decoration: InputDecoration(
                          labelText: 'SKU ID',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    /// Submit Button
                    InkWell(
                      onTap: () {
                        widget.body({
                          'price': priceController.text,
                          'sku_id': skuIdController.text,
                          'discount': discountController.text,
                          'stock': stockController.text,
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 14, bottom: 14),
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
            ),
          ),
        ),
      ),
    );
  }
}
