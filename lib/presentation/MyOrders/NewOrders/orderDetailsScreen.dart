

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/data/Orders/newOrderDetailsApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/awbshipmentApiResModel.dart';
import 'package:taptohello/main.dart';
import 'package:taptohello/presentation/MyOrders/NewOrders/deliveryPartenerScreen.dart';
import 'package:taptohello/presentation/MyOrders/NewOrders/shipmentTrackingDetailsScreen.dart';
import 'package:taptohello/presentation/MyOrders/controllers/ordersControllers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class OrderDetailsScreen extends ConsumerStatefulWidget {
  const OrderDetailsScreen({super.key, this.orderDetails});

  final Order? orderDetails;

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();


}

class _OrderDetailsScreenState extends ConsumerState<OrderDetailsScreen> {

    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();
    TextEditingController breadthController = TextEditingController();
    TextEditingController lengthController = TextEditingController();

      TextEditingController dateController = TextEditingController();
  TextEditingController courierController = TextEditingController();
  TextEditingController awbController = TextEditingController();
  bool isShipped = false;
  bool isShippedComplete = false;
  String? selectedLocation;
   String? tempSelectedLocation;
  final OrderControllers _orderController = OrderControllers();
  late OrderControllers _orderController1;


  @override
  void initState() {
    super.initState();
    tempSelectedLocation = selectedLocation;
    debugPrint('OrderDetailsScreen: ${widget.orderDetails?.address?.city}');
    // cancelOrder();
    
  //   if ((widget.orderDetails?.awbCode?.isEmpty ?? true)) {
  //   fetchPickupLocation();
   
    
  // }
    
  }

  @override
void didChangeDependencies() {
  super.didChangeDependencies();
  _orderController1 = ref.read(orderControllerProvider); // 
}

  void fetchPickupLocation() {
    Map<String, dynamic> body = { };
    _orderController.deliveryPickUpLogistic(body).then((_) {
      if (_orderController.deliverypickuplocationApiResModel.success == true) {
        // Fluttertoast.showToast(msg: "Pickup Location Fetched Successfully!");
      } else {
        Fluttertoast.showToast(msg: "Failed to Fetch Pickup Location!");
      }
    });
  }

 

//    Future<void> trackOrder() async {
//   DialogBuilder(context).showLoadingIndicator("Loading...");

//   await _orderController.trackOrder({
//     "awb_code": widget.orderDetails?.awbCode,
//     "webhook": false,
//   });

//   DialogBuilder(context).hideOpenDialog();
// }

Future<void> trackOrder() async {
  DialogBuilder(context).showLoadingIndicator("Loading...");

  final Map<String, dynamic> requestData = {
   // "awb_code": widget.orderDetails?.awbCode,
  };

  if (widget.orderDetails?.shipmentId == 1) {
    requestData["webhook"] = true;
  }
  

  await _orderController.trackOrder(requestData);

  DialogBuilder(context).hideOpenDialog();
}


  Future<void> updateOrder() async {
  DialogBuilder(context).showLoadingIndicator("Loading...");

  await _orderController.updateOrder(context,{
    "shipment_id": widget.orderDetails?.shipmentId,
   
  });

  DialogBuilder(context).hideOpenDialog();
 
}

Future<void> cancelOrder() async {
   _orderController1 = ref.read(orderControllerProvider);
    
  DialogBuilder(context).showLoadingIndicator("Loading...");

  await _orderController.cancelOrder(context,widget.orderDetails?.sId);

  DialogBuilder(context).hideOpenDialog();
 
   
}

Future<void> cancelshipmen() async {
   _orderController1 = ref.read(orderControllerProvider);
    
  DialogBuilder(context).showLoadingIndicator("Loading...");

  await _orderController.cancelShipment(context,{
    "shipment_id": widget.orderDetails?.shipmentId,
    
  });

  DialogBuilder(context).hideOpenDialog();
 
   
}
 
void _showDimensionPopup(BuildContext context) {
  

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Enter Package Dimensions"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Weight (g) *"),
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Height (cm) *"),
              ),
              TextField(
                controller: breadthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Breadth (cm) *"),
              ),
              TextField(
                controller: lengthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Length (cm) *"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close popup
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // Validate and submit data
                double? weight = double.tryParse(weightController.text);
                double? height = double.tryParse(heightController.text);
                double? breadth = double.tryParse(breadthController.text);
                double? length = double.tryParse(lengthController.text);

                if (weight != null &&
                    height != null &&
                    breadth != null &&
                    length != null) {
                  print("Package Dimensions: Weight=$weight, Height=$height, Breadth=$breadth, Length=$length");
                   Navigator.pop(context);
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryPartnerScreen(
                      selectedLocation: tempSelectedLocation!,
                      orderId: widget.orderDetails?.orderId!,
                      weight: weight,
                      height : height,
                      breadth : breadth,
                      length : length // ✅ Pass pin code internally
                    ),
                  ),
                );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter valid numbers!")),
                  );
                }
              },
              child: Text("Submit"),
            ),
          ],
        );
      },
    );
  }


void showPickupLocationDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String? tempSelectedPinCode;

      List<Map<String, String>> pickupLocations =
          (_orderController.deliverypickuplocationApiResModel?.pickupLocations ?? [])
              .map((e) => {
                    "location": e.pickupLocation ?? '',
                    "pinCode": e.pinCode ?? '',
                  })
              .where((e) => e["location"]!.isNotEmpty)
              .toList();

      return AlertDialog(
        title: Text("Select Pickup Location"),
        content: StatefulBuilder(
          builder: (context, setStateDialog) {
            return pickupLocations.isNotEmpty
                ? DropdownButton<String>(
                    isExpanded: true,
                    value: tempSelectedLocation,
                    hint: Text("Choose a location"),
                    items: pickupLocations.map((entry) {
                      return DropdownMenuItem<String>(
                        value: entry["location"],
                        child: Text(entry["location"]!),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      final selectedEntry = pickupLocations.firstWhere(
                          (entry) => entry["location"] == newValue,
                          orElse: () => {"location": "", "pinCode": ""});

                      setStateDialog(() {
                        tempSelectedLocation = selectedEntry["location"];
                        tempSelectedPinCode = selectedEntry["pinCode"];
                      });

                      print("Selected Location: $tempSelectedLocation");
                      print("Selected Pin Code: $tempSelectedPinCode");
                    },
                  )
                : Text("No Pickup Locations Available");
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              if (tempSelectedLocation != null && tempSelectedPinCode != null) {
                setState(() {
                  selectedLocation = tempSelectedLocation;
                });

              
                                Navigator.pop(context);

                                _showDimensionPopup(context);
              
              } else {
                Fluttertoast.showToast(msg: "Please select a pickup location!");
              }
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}

void _showTrackingPopup(BuildContext context) {
   //final _orderController = ref.watch(orderControllerProvider);
    _orderController1 = ref.read(orderControllerProvider);
    final pickupResponse = _orderController.pickupResponse.pickupResponse;
    print(_orderController1.pickupResponse.awbCode);

    Future.microtask(() => trackOrder());
  
    
      // String current_status = _orderController.pickupResponse.current_status ?? "out for pickup";
      // if(current_status.isEmpty){
      //   current_status = "out for pickup";
      // }
      // print(current_status);

      
  Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => 
    ShipmentTrackingScreen(
      orderDetails: {
        "awb": "19041424751540",
        "courier_name": "Delhivery Surface",
        "current_status": "IN TRANSIT",
        "etd": "2023-05-23 15:40:19",
        "scans": [
          {
            "date": "2023-05-19 11:59:16",
            "activity": "Manifested - Manifest uploaded",
            "location": "Chomu_SamodRd_D (Rajasthan)"
          },
          {
            "date": "2023-05-19 15:32:17",
            "activity": "In Transit - Shipment picked up",
            "location": "Chomu_SamodRd_D (Rajasthan)"
          },
          {
            "date": "2023-05-19 16:40:19",
            "activity": "In Transit - Shipment Recieved at Origin Center",
            "location": "Chomu_SamodRd_D (Rajasthan)"
          },
          {
            "date": "2023-05-20 12:23:44",
            "activity": "In Transit - Trip Arrived",
            "location": "Jaipur_Sez_GW (Rajasthan)"
          },
          {
            "date": "2023-05-22 22:01:12",
            "activity": "In Transit - Trip Arrived",
            "location": "Bhiwandi_Mega_GW (Maharashtra)"
          },
          {
            "date": "2023-05-23 11:43:46",
            "activity": "In Transit - Shipment Received at Facility",
            "location": "Mumbai_MiraRdIndEstate_I (Maharashtra)"
          }
        ]
      },
    ),
  )
   
  );

 
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F6),
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOrderDetailsCard(),
              SizedBox(height: 16),
              
              
              _buildProductList(),
              SizedBox(height: isShipped ? 20 : 20),
              if (widget.orderDetails?.shipmentId != 1 && (widget.orderDetails?.awbCode?.isNotEmpty ?? false)) ...[
              _buildTrackShipmentButton(),
               SizedBox(height: 20),
                ],
               
              // _buildOrderStatusButtons(),
               if (
                widget.orderDetails?.orderStatus == "NEW") ...[
              SizedBox(height: 20),
              _buildOrderStatusButtons(),
            ],
              
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildTrackShipmentButton() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Track Shipment Button
      Visibility(
        visible: widget.orderDetails?.awbCode?.isNotEmpty ?? false,

        child: 
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _showTrackingPopup(context),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              backgroundColor: AppCol.primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            child: Text(
              'Track Shipment',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      SizedBox(height: 20),
      // Manual Shipment Button
      Visibility(
         visible: (widget.orderDetails?.awbCode?.isEmpty ?? true) && (widget.orderDetails?.orderStatus == "NEW"),
             
        child: 
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              _showManualShipmentPopup(context);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              backgroundColor: Colors.orange,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            child: Text(
              'Manual Shipment',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    ],
  );
}

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      title: Text('Order Details',
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      actions: [
        Visibility(
           visible: (widget.orderDetails?.awbCode?.isEmpty ?? true) && (widget.orderDetails?.orderStatus == "NEW"),
         // visible: widget.orderDetails?.awbCode?.isNotEmpty ?? false,

         //  visible: widget.orderDetails!.awbCode!.isNotEmpty,
         //  visible: widget.orderDetails?.awbCode == null || widget.orderDetails!.awbCode!.isEmpty,
          child: InkWell(
            onTap: showPickupLocationDialog,
            child: Padding(
              padding: EdgeInsets.only(right: 16, top: 22),
              child: Text(
                'Export to Shiprocket',
                style: TextStyle(fontSize: 12, color: AppCol.primary, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
          Visibility(
           visible: (widget.orderDetails?.awbCode?.isNotEmpty ?? false) && (widget.orderDetails?.orderStatus == "SHIPPED" || widget.orderDetails?.orderStatus == "DELIVERED")  && (widget.orderDetails?.shipmentId != 1),

              //widget.orderDetails!.awbCode!.isNotEmpty,DELIVERED
            //  visible: (widget.orderDetails?.awbCode ?? "").isEmpty,
            //  visible: (widget.orderDetails?.awbCode ?? "").isNotEmpty,

            child: InkWell(
              onTap: () {
                _showCancelUpdateDialog(context);
              },
              child: Padding(
                padding: EdgeInsets.only(right: 16, top: 22),
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 12, color: AppCol.primary, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
      ],
    );
  }

  void _showCancelUpdateDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Order Options"),
        content: Text("Would you like to cancel your order?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              _cancelOrder(context); // Perform cancel action
            },
            child: Text("Cancel Shipment", style: TextStyle(color: Colors.red)),
          ),
         
        ],
      );
    },
  );
}

void _cancelOrder(BuildContext context) {
  // Handle order cancellation logic here
  cancelshipmen();
  
}

void _showManualShipmentPopup(BuildContext context) {
  bool isDelivered = false; // Default value for the switch

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text("Enter Manual Shipment Details"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(labelText: "Date of Shipment *"),
                  keyboardType: TextInputType.datetime,
                  onTap: () async {
                    // Hide keyboard when date field is tapped
                    FocusScope.of(context).requestFocus(FocusNode());
                    // Show date picker
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (pickedDate != null) {
                      // Format the selected date
                      String formattedDate = "${pickedDate.toLocal()}".split(' ')[0];
                      dateController.text = formattedDate; // Display selected date in the text field
                    }
                  },
                ),
                TextField(
                  controller: courierController,
                  decoration: InputDecoration(labelText: "Courier Name *"),
                ),
                TextField(
                  controller: awbController,
                  decoration: InputDecoration(labelText: "AWB Number *"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivered"),
                    Switch(
                      value: isDelivered,
                      onChanged: (value) {
                        setState(() {
                          isDelivered = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate the input fields
                  String date = dateController.text;
                  String courier = courierController.text;
                  String awb = awbController.text;

                  if (date.isNotEmpty && courier.isNotEmpty && awb.isNotEmpty) {
                    // Handle submission
                    Navigator.pop(context);
                    manualShipmentApi(date, courier, awb, isDelivered);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please fill all fields!")),
                    );
                  }
                },
                child: Text("Submit"),
              ),
            ],
          );
        },
      );
    },
  );
}

 
  void manualShipmentApi(String date, String courier, String awb, bool isDelivered) {
   DialogBuilder(context).showLoadingIndicator("Loading...");

  
    Map<String, dynamic> body = {
      "orderId" :  widget.orderDetails?.orderId,
      "shipment_id" : widget.orderDetails?.shipmentId,
      "deliveryDate" : date,
      "isDelivered": isDelivered,
      "courier_name": courier,
      "awb_code": awb

     };
    _orderController.manualShipmentApi(body).then((_) {
      DialogBuilder(context).hideOpenDialog();
      if (_orderController.manualShipmentResModel.success == true) {
        Navigator.pop(context);
         Fluttertoast.showToast(msg: _orderController.manualShipmentResModel.message.toString());
      } else {
        Fluttertoast.showToast(msg: "Failed");
      }
    });
  }


  Widget _buildOrderStatusButtons() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Update Order Status',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 20),
      if (isShipped) ...[
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () async {
              final res = await showDialog(
                context: context,
                builder: (context) {
                  return ShipmentTrackingDetailsDialog(trackingStatus: '', expectedDeliveryDate: '', trackingNumber: '',);
                },
              );

              if (res == true) {
                setState(() {
                  isShippedComplete = true;
                });
              }
            },
            style: OutlinedButton.styleFrom(
              side: isShippedComplete
                  ? BorderSide.none
                  : const BorderSide(color: Colors.green, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: isShippedComplete
                  ? Color(0xFF1EA357)
                  : Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              isShippedComplete ? 'Delivered' : 'Shipped',
              style: TextStyle(
                color: isShippedComplete ? Colors.white : Colors.green,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
      if (!isShipped) ...[
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                isShipped = true;
              });
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 15),
              backgroundColor: AppCol.primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            child: Text(
              'Accepted',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              showCancelOrderDialog(context);
              
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.red, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Cancelled',
                style: TextStyle(color: Colors.red)),
          ),
        ),
      ]
    ],
  );
}

Future<void> showCancelOrderDialog(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // Prevent closing by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Cancel Order"),
        content: Text("Are you sure you want to cancel this order?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Close dialog
            child: Text("No"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Future.microtask(() => cancelOrder()); // Execute cancel action
            },
            child: Text("Yes"),
          ),
        ],
      );
    },
  );
}



  Widget _buildOrderDetailsCard() {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: _boxDecoration(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Order Number:', widget.orderDetails?.orderNumber),
        _buildDetailRow('Order Status:', widget.orderDetails?.orderStatus, isBold: true, color: Colors.green),
        _buildDetailRow('Order Date:', widget.orderDetails?.orderDate),
        _buildDetailRow('Customer Name:', widget.orderDetails?.address?.name),
        // _buildDetailRow('Customer Address:', widget.orderDetails?.address?.addressLine1 + widget.orderDetails?.address?.addressLine2, maxLines: 4),
        _buildDetailRow(
  'Customer Address:',
  (widget.orderDetails?.address?.addressLine1 ?? '') + '' + (widget.orderDetails?.address?.addressLine2 ?? '') + ',' + (widget.orderDetails?.address?.city ?? '') + ',' + (widget.orderDetails?.address?.state ?? '') + ',' + (widget.orderDetails?.address?.zip ?? ''),
  maxLines: 4,
),

        _buildDetailRow('Customer Email:', widget.orderDetails?.address?.email),
        _buildDetailRow('Customer Mobile:', widget.orderDetails?.address?.mobile),
        
        
        _buildDetailRow('Payment Type:', "Online"),
        Visibility(
          visible: widget.orderDetails?.awbCode?.isNotEmpty ?? false,

             // visible: widget.orderDetails!.awbCode!.isNotEmpty,
             // visible: (widget.orderDetails?.awbCode ?? "").isNotEmpty,

              child: _buildDetailRow('AWB Code:', widget.orderDetails?.awbCode)),
       
        _buildDetailRow('Order Total:', 'Rs. ${widget.orderDetails?.amount ?? '0'}',
            isBold: true, color: Colors.black),
            
      ],
    ),
  );
}


  Widget _buildDetailRow(String title, String? value, {bool isBold = false, Color? color, int maxLines = 1}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$title ', style: TextStyle(color: Colors.black.withOpacity(.6))),
        Expanded(
          child: Text(value ?? '-',
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.w600, color: color ?? Colors.black)),
        ),
      ],
    );
  }

  Widget _buildProductList() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: _boxDecoration(),
      child: ListView.builder(
        itemCount: widget.orderDetails?.products?.length ?? 0,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final product = widget.orderDetails?.products?[index];
          return ListTile(
            title: Text(product?.productName ?? '-'),
            subtitle: Text('Qty: ${product?.quantity ?? '-'} | Price: Rs. ${product?.mrp ?? '-'}'),
            // leading: Image.network(product?.productImage.first ?? '', width: 50, height: 50, fit: BoxFit.cover),
//             leading: Image.network(
//   (product?.productImage != null && product!.productImage!.isNotEmpty)
//       ? product.productImage!.first
//       : 'https://via.placeholder.com/50', // fallback placeholder image
//   width: 50,
//   height: 50,
//   fit: BoxFit.cover,
// ),
leading: Image.network(
  (product?.productImage != null && product!.productImage!.isNotEmpty)
      ? (product.productImage!.first.contains(AppConstants.imageBaseUrl)
          ? product.productImage!.first
          : AppConstants.imageBaseUrl + product.productImage!.first)
      : 'https://via.placeholder.com/50', // fallback placeholder image
  width: 50,
  height: 50,
  fit: BoxFit.cover,
),


          );
        },
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 5)],
    );
  }
}


class ShipmentTrackingDetailsDialog extends StatelessWidget {
  final String trackingStatus;
  final String expectedDeliveryDate;
  final String trackingNumber;

  const ShipmentTrackingDetailsDialog({
    Key? key,
    required this.trackingStatus,
    required this.expectedDeliveryDate,
    required this.trackingNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Tracking Number: $trackingNumber"),
        SizedBox(height: 10),
        Text("Status: $trackingStatus"),
        SizedBox(height: 10),
        Text("Expected Delivery: $expectedDeliveryDate"),
      ],
    );
  }
}



