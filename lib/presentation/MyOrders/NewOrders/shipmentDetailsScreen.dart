

import 'package:flutter/material.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'package:taptohello/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod

// class ShipmentDetailsScreen extends ConsumerStatefulWidget {
//   final String? courierCompanyId;
//   final String? shipmentId;
//   final String? pickupDate;

//   ShipmentDetailsScreen({this.courierCompanyId, this.shipmentId, this.pickupDate});

//   @override
//   _ShipmentDetailsScreenState createState() => _ShipmentDetailsScreenState();
// }

// class _ShipmentDetailsScreenState extends ConsumerState<ShipmentDetailsScreen> {
  
 

//   late String formattedDate;

//   @override
//   void initState() {
//     super.initState();
   
   
   
//     Future.microtask(() => createPickupAndGenerateAwb());
//   }

//   Future<void> createPickupAndGenerateAwb() async {
//     final _orderController = ref.read(orderControllerProvider);
    
   
//     int courierCompanyIdInt = 0;


//   courierCompanyIdInt = int.parse(widget.courierCompanyId.toString());
//    int shipmentIdInt = 0;


//   shipmentIdInt = int.parse(widget.shipmentId.toString());

//     DialogBuilder(context).showLoadingIndicator("Loading...");

//     await _orderController.createPickupAndGenerateAwb({
//       "courier_id": courierCompanyIdInt,
//       "shipment_id": shipmentIdInt,
//       "pickup_date": widget.pickupDate
//     });

//     DialogBuilder(context).hideOpenDialog();
//   }

//  @override
// Widget build(BuildContext context) {
//   final _orderController = ref.watch(orderControllerProvider);
//   final pickupResponse = _orderController.pickupResponse.pickupDetails;

//   return Scaffold(
//     appBar: AppBar(title: Text("Pickup Details")),
//     body: Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: _orderController.pickupResponse.success == true
//           ? Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Pickup Status", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                         Icon(Icons.check_circle, color: Colors.green, size: 28)
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     Divider(),
//                     SizedBox(height: 10),
//                     InfoRow(label: "AWB Code", value: _orderController.pickupResponse.awbCode ?? "N/A"),
//                     InfoRow(
//                       label: "Booked Date",
//                       value: pickupResponse?.bookedDate ?? "N/A",
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       pickupResponse?.message ?? "No message available",
//                       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey[700]),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           : Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.error_outline, color: Colors.red, size: 40),
//                   SizedBox(height: 10),
//                   Text(
//                     _orderController.pickupResponse.message ?? "Pickup request failed. Please try again.",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.red),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//     ),
//   );
// }

// }

// class InfoRow extends StatelessWidget {
//   final String label;
//   final String value;

//   const InfoRow({required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//           Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blueAccent)),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'package:taptohello/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/presentation/MyOrders/NewOrders/newOrdersScreen.dart'; // Import Riverpod

class ShipmentDetailsScreen extends ConsumerStatefulWidget {
  final String? courierCompanyId;
  final String? shipmentId;
  final String? pickupDate;

  ShipmentDetailsScreen({this.courierCompanyId, this.shipmentId, this.pickupDate});

  @override
  _ShipmentDetailsScreenState createState() => _ShipmentDetailsScreenState();
}

class _ShipmentDetailsScreenState extends ConsumerState<ShipmentDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => createPickupAndGenerateAwb());
  }

  Future<void> createPickupAndGenerateAwb() async {
    final _orderController = ref.read(orderControllerProvider);
    
    int courierCompanyIdInt = int.parse(widget.courierCompanyId.toString());
    int shipmentIdInt = int.parse(widget.shipmentId.toString());

    DialogBuilder(context).showLoadingIndicator("Loading...");

    await _orderController.createPickupAndGenerateAwb({
      "courier_id": courierCompanyIdInt,
      "shipment_id": shipmentIdInt,
      "pickup_date": widget.pickupDate
    });

    DialogBuilder(context).hideOpenDialog();
  }

  @override
  Widget build(BuildContext context) {
    final _orderController = ref.watch(orderControllerProvider);
    final pickupResponse = _orderController.pickupResponse.pickupResponse;

    return Scaffold(
      appBar: AppBar(
        title: Text("Pickup Details"),
        automaticallyImplyLeading: false, // Removes back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: _orderController.pickupResponse.success == true
                  ? Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Pickup Status", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Icon(Icons.check_circle, color: Colors.green, size: 28)
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(),
                            SizedBox(height: 10),
                            InfoRow(label: "AWB Code", value: _orderController.pickupResponse.awbCode ?? "N/A"),
                            InfoRow(label: "Pickup Scheduled Date", value: pickupResponse!.response?.pickupGeneratedDate?.date ?? "N/A"),
                            SizedBox(height: 10),
                            Text(
                              pickupResponse.response!.data.toString(),
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error_outline, color: Colors.red, size: 40),
                          SizedBox(height: 10),
                          Text(
                            _orderController.pickupResponse.message ?? "Pickup request failed. Please try again.",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                    Navigator.pop(context);
                      Navigator.pop(context);
                        Navigator.pop(context);
  //                  Navigator.push(
  //   context,
  //   MaterialPageRoute(
  //     builder: (context) => NewOrderScreen(),
  //   ),
  // );
                 
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => NewOrderScreen(),
                  //     ),
                  //   );// Navigate to order list screen
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: Text("Back to Order List"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blueAccent)),
        ],
      ),
    );
  }
}












