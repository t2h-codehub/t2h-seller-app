import 'package:flutter/material.dart';
import 'package:taptohello/core/utils/color_constant.dart';

class ShipmentTrackingDetailsDialog extends StatefulWidget {
  const ShipmentTrackingDetailsDialog({super.key});

  @override
  State<ShipmentTrackingDetailsDialog> createState() => _ShipmentTrackingDetailsDialogState();
}

class _ShipmentTrackingDetailsDialogState extends State<ShipmentTrackingDetailsDialog> {

  final TextEditingController _logisticPartnerController = TextEditingController();
  final TextEditingController _awbNumberController = TextEditingController();

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
                SizedBox(height: 10),

                /// Heading Text
                Center(
                  child: Text(
                    'Shipment Tracking Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 24),

                /// Logistic Partner
                Container(
                  child: TextFormField(
                    controller: _logisticPartnerController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Logistic Partner',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Select Partner',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                      ),
                    ),
                    onTap: () async {},
                  ),
                ),
                SizedBox(height: 16),

                /// AWB Number
                Container(
                  child: TextFormField(
                    controller: _awbNumberController,
                    readOnly: false,
                    decoration: InputDecoration(
                      labelText: 'AWB Number',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Enter AWB Number',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: () async {},
                  ),
                ),
                SizedBox(height: 16),

                /// Submit Button
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        backgroundColor: AppCol.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
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
    );
  }
}
