// import 'package:flutter/material.dart';
// import 'package:taptohello/data/Orders/newOrderDetailsApiResModel.dart';

// class ShipmentTrackingDetailsScreen extends StatelessWidget {
//   final Order? orderDetails;

//   const ShipmentTrackingDetailsScreen({Key? key, this.orderDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shipment Tracking Details"),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView( // Allow scrolling if content overflows
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display Tracking Number and Expected Delivery Date
//             Text(
//               "Tracking Number: ${"SDSDDSM8797845875" ?? "N/A"}",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Expected Delivery: ${"25-03-2025" ?? "N/A"}",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
            
//             // Shipment Tracking Progress
//             _buildTrackingProgress(),
//             SizedBox(height: 20),

//             // Display Additional Information (optional)
//             Text("Detailed Shipment Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//             SizedBox(height: 10),
//             _buildDetailedProgress(),
//           ],
//         ),
//       ),
//     );
//   }

//   // Progress Stepper to Show the Shipment's Progress
//   Widget _buildTrackingProgress() {
//     return Stepper(
//       currentStep: 2, // Example: Current step is "In Transit"
//       onStepTapped: (int step) {},
//       steps: [
//         Step(
//           title: Text('Order Received'),
//           content: Text('Your order has been received and is being processed.'),
//           isActive: true,
//           state: StepState.complete,
//         ),
//         Step(
//           title: Text('Shipped'),
//           content: Text('Your order has been shipped and is on its way.'),
//           isActive: true,
//           state: StepState.complete,
//         ),
//         Step(
//           title: Text('In Transit'),
//           content: Text('Your order is currently in transit.'),
//           isActive: true,
//           state: StepState.indexed,
//         ),
//         Step(
//           title: Text('Out for Delivery'),
//           content: Text('Your order is out for delivery and will arrive soon.'),
//           isActive: false,
//           state: StepState.disabled,
//         ),
//         Step(
//           title: Text('Delivered'),
//           content: Text('Your order has been delivered successfully.'),
//           isActive: false,
//           state: StepState.disabled,
//         ),
//       ],
//     );
//   }

//   // Detailed Shipment Progress List (optional)
//   Widget _buildDetailedProgress() {
//     return ListView(
//       shrinkWrap: true, // Ensures it only takes as much space as needed
//       physics: NeverScrollableScrollPhysics(), // Prevents nested scrolling
//       children: [
//         ListTile(
//           leading: Icon(Icons.check_circle, color: Colors.green),
//           title: Text("Shipped"),
//           subtitle: Text("Your order was shipped from the warehouse."),
//         ),
//         ListTile(
//           leading: Icon(Icons.access_time, color: Colors.orange),
//           title: Text("In Transit"),
//           subtitle: Text("Your order is currently being transported."),
//         ),
//         ListTile(
//           leading: Icon(Icons.local_shipping, color: Colors.blue),
//           title: Text("Out for Delivery"),
//           subtitle: Text("Your order is out for delivery."),
//         ),
//         ListTile(
//           leading: Icon(Icons.done, color: Colors.green),
//           title: Text("Delivered"),
//           subtitle: Text("Your order has been successfully delivered."),
//         ),
//       ],
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:taptohello/data/Orders/newOrderDetailsApiResModel.dart';

// class ShipmentTrackingDetailsScreen extends StatelessWidget {
//   final Order? orderDetails;

//   const ShipmentTrackingDetailsScreen({Key? key, this.orderDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shipment Tracking Details"),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView( // Allow scrolling if content overflows
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display Tracking Number and Expected Delivery Date
//             Text(
//               "Tracking Number: ${"SDSDDSM8797845875" ?? "N/A"}",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Expected Delivery: ${"25-03-2025" ?? "N/A"}",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
            
//             // Shipment Tracking Progress
//             _buildTrackingProgress(),
//             SizedBox(height: 20),

           
          
//           ],
//         ),
//       ),
//     );
//   }

//   // Progress Stepper to Show the Shipment's Progress
//   Widget _buildTrackingProgress() {
//     return Stepper(
//       currentStep: 2, // Example: Current step is "In Transit"
//       onStepTapped: (int step) {},
//       steps: [
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.access_alarm, color: Colors.blue), // Shipped Icon
//               SizedBox(width: 10),
//               Text('Order Received'),
//             ],
//           ),
//           content: Text('Your order has been received and is being processed.'),
//           isActive: true,
//           state: StepState.complete,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.local_shipping, color: Colors.green), // Shipped Icon
//               SizedBox(width: 10),
//               Text('Shipped'),
//             ],
//           ),
//           content: Text('Your order has been shipped and is on its way.'),
//           isActive: true,
//           state: StepState.complete,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.directions_car, color: Colors.orange), // In Transit Icon
//               SizedBox(width: 10),
//               Text('In Transit'),
//             ],
//           ),
//           content: Text('Your order is currently in transit.'),
//           isActive: true,
//           state: StepState.indexed,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.delivery_dining, color: Colors.blue), // Out for Delivery Icon
//               SizedBox(width: 10),
//               Text('Out for Delivery'),
//             ],
//           ),
//           content: Text('Your order is out for delivery and will arrive soon.'),
//           isActive: false,
//           state: StepState.disabled,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.check_circle, color: Colors.green), // Delivered Icon
//               SizedBox(width: 10),
//               Text('Delivered'),
//             ],
//           ),
//           content: Text('Your order has been delivered successfully.'),
//           isActive: false,
//           state: StepState.disabled,
//         ),
//       ],
//     );
//   }

//   // Detailed Shipment Progress List (optional)
 
// }

// import 'package:flutter/material.dart';
// import 'package:taptohello/data/Orders/newOrderDetailsApiResModel.dart';

// class ShipmentTrackingDetailsScreen extends StatelessWidget {
//   final Order? orderDetails;

//   const ShipmentTrackingDetailsScreen({Key? key, this.orderDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shipment Tracking Details"),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView( // Allow scrolling if content overflows
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display Tracking Number and Expected Delivery Date
//             Text(
//               "Tracking Number: ${"SDSDDSM8797845875" ?? "N/A"}",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Expected Delivery: ${"25-03-2025" ?? "N/A"}",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
            
//             // Shipment Tracking Progress
//             _buildTrackingProgress(context),
//             SizedBox(height: 20),

           
//           ],
//         ),
//       ),
//     );
//   }

//   // Progress Stepper to Show the Shipment's Progress
//   Widget _buildTrackingProgress(BuildContext context) {
//     return Stepper(
//       currentStep: 2, // Example: Current step is "In Transit"
//       onStepTapped: (int step) {},
//       steps: [
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.access_alarm, color: Colors.blue), // Shipped Icon
//               SizedBox(width: 10),
//               Text('Order Received'),
//             ],
//           ),
//           content: Text('Your order has been received and is being processed.'),
//           isActive: true,
//           state: StepState.complete,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.local_shipping, color: Colors.green), // Shipped Icon
//               SizedBox(width: 10),
//               Text('Shipped'),
//             ],
//           ),
//           content: Text('Your order has been shipped and is on its way.'),
//           isActive: true,
//           state: StepState.complete,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.directions_car, color: Colors.orange), // In Transit Icon
//               SizedBox(width: 10),
//               Text('In Transit'),
//             ],
//           ),
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Your order is currently in transit.'),
//               SizedBox(height: 10),
//               // Continue and Cancel buttons for "In Transit"
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Continue action here
//                       print('Continue clicked');
//                     },
//                     child: Text('Continue'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Cancel action here
//                       print('Cancel clicked');
//                     },
//                     child: Text('Cancel'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           isActive: true,
//           state: StepState.indexed,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.delivery_dining, color: Colors.blue), // Out for Delivery Icon
//               SizedBox(width: 10),
//               Text('Out for Delivery'),
//             ],
//           ),
//           content: Text('Your order is out for delivery and will arrive soon.'),
//           isActive: false,
//           state: StepState.disabled,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.check_circle, color: Colors.green), // Delivered Icon
//               SizedBox(width: 10),
//               Text('Delivered'),
//             ],
//           ),
//           content: Text('Your order has been delivered successfully.'),
//           isActive: false,
//           state: StepState.disabled,
//         ),
//       ],
//     );
//   }

 
// }


// import 'package:flutter/material.dart';
// import 'package:taptohello/data/Orders/newOrderDetailsApiResModel.dart';

// class ShipmentTrackingDetailsScreen extends StatelessWidget {
//   final Order? orderDetails;

//   const ShipmentTrackingDetailsScreen({Key? key, this.orderDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shipment Tracking Details"),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView( // Allow scrolling if content overflows
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display Tracking Number and Expected Delivery Date
//             Text(
//               "Tracking Number: ${"SDSDDSM8797845875" ?? "N/A"}",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Expected Delivery: ${"25-03-2025" ?? "N/A"}",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
            
//             // Shipment Tracking Progress
//             _buildTrackingProgress(context),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   // Progress Stepper to Show the Shipment's Progress
//   Widget _buildTrackingProgress(BuildContext context) {
//     return Stepper(
//       currentStep: 2, // Example: Current step is "In Transit"
//       onStepTapped: (int step) {},
//       steps: [
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.access_alarm, color: Colors.blue), // Order Received Icon
//               SizedBox(width: 10),
//               Text('Order Received'),
//             ],
//           ),
//           content: Text('Your order has been received and is being processed.'),
//           isActive: true,
//           state: StepState.complete,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.local_shipping, color: Colors.green), // Shipped Icon
//               SizedBox(width: 10),
//               Text('Shipped'),
//             ],
//           ),
//           content: Text('Your order has been shipped and is on its way.'),
//           isActive: true,
//           state: StepState.complete,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.directions_car, color: Colors.orange), // In Transit Icon
//               SizedBox(width: 10),
//               Text('In Transit'),
//             ],
//           ),
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Your order is currently in transit.'),
//               SizedBox(height: 10),
//               // Continue and Cancel buttons for "In Transit"
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Continue action here
//                       print('Continue clicked');
//                     },
//                     child: Text('Continue'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Cancel action here
//                       print('Cancel clicked');
//                     },
//                     child: Text('Cancel'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           isActive: true,
//           state: StepState.indexed,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.delivery_dining, color: Colors.blue), // Out for Delivery Icon
//               SizedBox(width: 10),
//               Text('Out for Delivery'),
//             ],
//           ),
//           content: Text('Your order is out for delivery and will arrive soon.'),
//           isActive: false,
//           state: StepState.disabled,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.check_circle, color: Colors.green), // Delivered Icon
//               SizedBox(width: 10),
//               Text('Delivered'),
//             ],
//           ),
//           content: Text('Your order has been delivered successfully.'),
//           isActive: false,
//           state: StepState.disabled,
//         ),
//       ],
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:taptohello/data/Orders/newOrderDetailsApiResModel.dart';

// class ShipmentTrackingDetailsScreen extends StatelessWidget {
//   final Order? orderDetails;

//   const ShipmentTrackingDetailsScreen({Key? key, this.orderDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text("Shipment Tracking Details"),
//       //   backgroundColor: Colors.blue,
//       // ),
//       appBar: AppBar(
//         title: Text("Shipment Tracking Details"),
//         automaticallyImplyLeading: true, // Removes back button
//       ),
//       body: SingleChildScrollView( // Allow scrolling if content overflows
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display Tracking Number and Expected Delivery Date
//             Text(
//               "Tracking Number: ${"SDSDDSM8797845875" ?? "N/A"}",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 10),
//             // Text(
//             //   "Expected Delivery: ${"25-03-2025" ?? "N/A"}",
//             //   style: TextStyle(fontSize: 16),
//             // ),
//             // SizedBox(height: 20),
            
//             // Shipment Tracking Progress
//             _buildTrackingProgress(context),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   // Progress Stepper to Show the Shipment's Progress
//   Widget _buildTrackingProgress(BuildContext context) {
//     return Stepper(
//       currentStep: 2, // Example: Current step is "In Transit"
//       onStepTapped: (int step) {},
//       steps: [
//         // Step 1 - Order Received
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.first_page, color: Colors.blue), // Order Received Icon
//               SizedBox(width: 10),
//               Text('Order Received'),
//             ],
//           ),
//           content: Text('Your order has been received and is being processed.'),
//           isActive: true,
//           state: StepState.complete,
//         ),
        
//         // Step 2 - Shipped
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.local_shipping, color: Colors.green), // Shipped Icon
//               SizedBox(width: 10),
//               Text('Shipped'),
//             ],
//           ),
//           content: Text('Your order has been shipped and is on its way.'),
//           isActive: true,
//           state: StepState.complete,
//         ),
        
//         // Step 3 - In Transit
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.directions_car, color: Colors.orange), // In Transit Icon
//               SizedBox(width: 10),
//               Text('In Transit'),
//             ],
//           ),
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Your order is currently in transit.'),
//               SizedBox(height: 10),
//               // Continue and Cancel buttons for "In Transit"
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Continue action here
//                       print('Continue clicked');
//                     },
//                     child: Text('Continue'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Cancel action here
//                       print('Cancel clicked');
//                     },
//                     child: Text('Cancel'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           isActive: true,
//           state: StepState.indexed,
//         ),
        
//         // Step 4 - Out for Delivery
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.delivery_dining, color: Colors.blue), // Out for Delivery Icon
//               SizedBox(width: 10),
//               Text('Out for Delivery'),
//             ],
//           ),
//           content: Text('Your order is out for delivery and will arrive soon.'),
//           isActive: false,
//           state: StepState.disabled,
//         ),
        
//         // Step 5 - Delivered
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.check_circle, color: Colors.green), // Delivered Icon
//               SizedBox(width: 10),
//               Text('Delivered'),
//             ],
//           ),
//           content: Text('Your order has been delivered successfully.'),
//           isActive: false,
//           state: StepState.disabled,
//         ),
//       ],
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class ShipmentTrackingDetailsScreen extends StatelessWidget {
//   final Map<String, dynamic> orderDetails;

//   const ShipmentTrackingDetailsScreen({Key? key, required this.orderDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String trackingNumber = orderDetails['awb_code'] ?? "N/A";
//     String courierName = orderDetails['courier_name'] ?? "N/A";
//     String currentStatus = orderDetails['current_status'] ?? "N/A";

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shipment Tracking Details"),
//         automaticallyImplyLeading: true, // Removes back button
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display Tracking Number and Courier Name
//             Text(
//               "Tracking Number: $trackingNumber",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Courier: $courierName",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Current Status: $currentStatus",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),

//             // Shipment Tracking Progress
//             _buildTrackingProgress(context),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   // Progress Stepper to Show the Shipment's Progress
//   Widget _buildTrackingProgress(BuildContext context) {
//     int currentStep = _getCurrentStep();

//     return Stepper(
//       currentStep: currentStep, // Dynamic step based on current status
//       onStepTapped: (int step) {},
//       steps: [
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.first_page, color: Colors.blue),
//               SizedBox(width: 10),
//               Text('Order Received'),
//             ],
//           ),
//           content: Text('Your order has been received and is being processed.'),
//           isActive: currentStep >= 0,
//           state: currentStep >= 0 ? StepState.complete : StepState.disabled,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.local_shipping, color: Colors.green),
//               SizedBox(width: 10),
//               Text('Shipped'),
//             ],
//           ),
//           content: Text('Your order has been shipped and is on its way.'),
//           isActive: currentStep >= 1,
//           state: currentStep >= 1 ? StepState.complete : StepState.disabled,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.directions_car, color: Colors.orange),
//               SizedBox(width: 10),
//               Text('In Transit'),
//             ],
//           ),
//           content: Text('Your order is currently in transit.'),
//           isActive: currentStep >= 2,
//           state: currentStep >= 2 ? StepState.indexed : StepState.disabled,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.delivery_dining, color: Colors.blue),
//               SizedBox(width: 10),
//               Text('Out for Delivery'),
//             ],
//           ),
//           content: Text('Your order is out for delivery and will arrive soon.'),
//           isActive: currentStep >= 3,
//           state: currentStep >= 3 ? StepState.indexed : StepState.disabled,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.check_circle, color: Colors.green),
//               SizedBox(width: 10),
//               Text('Delivered'),
//             ],
//           ),
//           content: Text('Your order has been delivered successfully.'),
//           isActive: currentStep >= 4,
//           state: currentStep >= 4 ? StepState.complete : StepState.disabled,
//         ),
//       ],
//     );
//   }

//   // Determine the current step based on the current status
//   int _getCurrentStep() {
//     String status = orderDetails['current_status'] ?? "";
//     switch (status.toLowerCase()) {
//       case 'order received':
//         return 0;
//       case 'shipped':
//         return 1;
//       case 'in transit':
//         return 2;
//       case 'out for delivery':
//         return 3;
//       case 'delivered':
//         return 4;
//       default:
//         return 0; // Default to "Order Received" if status is unknown
//     }
//   }
// }

// import 'package:flutter/material.dart';

// class ShipmentTrackingDetailsScreen extends StatelessWidget {
//   final Map<String, dynamic> orderDetails;

//   const ShipmentTrackingDetailsScreen({Key? key, required this.orderDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String trackingNumber = orderDetails['awb_code'] ?? "N/A";
//     String courierName = orderDetails['courier_name'] ?? "N/A";
//     String currentStatus = orderDetails['current_status'] ?? "N/A";

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shipment Tracking Details"),
//         automaticallyImplyLeading: true, // Removes back button
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display Tracking Number and Courier Name
//             Text(
//               "Tracking Number: $trackingNumber",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Courier: $courierName",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Current Status: $currentStatus",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),

//             // Shipment Tracking Progress
//             _buildTrackingProgress(context),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   // Progress Stepper to Show the Shipment's Progress
//   Widget _buildTrackingProgress(BuildContext context) {
//     int currentStep = _getCurrentStep();

//     return Stepper(
//       currentStep: currentStep, // Dynamic step based on current status
//       onStepTapped: (int step) {},
//       steps: [
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.first_page, color: Colors.blue),
//               SizedBox(width: 10),
//               Text('Order Received'),
//             ],
//           ),
//           content: Text('Your order has been received and is being processed.'),
//           isActive: currentStep >= 0,
//           state: currentStep >= 0 ? StepState.complete : StepState.disabled,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.local_shipping, color: Colors.green),
//               SizedBox(width: 10),
//               Text('Shipped'),
//             ],
//           ),
//           content: Text('Your order has been shipped and is on its way.'),
//           isActive: currentStep >= 1,
//           state: currentStep >= 1 ? StepState.complete : StepState.disabled,
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.directions_car, color: Colors.orange),
//               SizedBox(width: 10),
//               Text('In Transit'),
//             ],
//           ),
//           content: Text('Your order is currently in transit.'),
//           isActive: currentStep >= 2,
//           state: _getCurrentStepState(2),
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.delivery_dining, color: Colors.blue),
//               SizedBox(width: 10),
//               Text('Out for Delivery'),
//             ],
//           ),
//           content: Text('Your order is out for delivery and will arrive soon.'),
//           isActive: currentStep >= 3,
//           state: _getCurrentStepState(3),
//         ),
//         Step(
//           title: Row(
//             children: [
//               Icon(Icons.check_circle, color: Colors.green),
//               SizedBox(width: 10),
//               Text('Delivered'),
//             ],
//           ),
//           content: Text('Your order has been delivered successfully.'),
//           isActive: currentStep >= 4,
//           state: currentStep >= 4 ? StepState.complete : StepState.disabled,
//         ),
//       ],
//     );
//   }

//   // Determine the current step based on the current status
//   int _getCurrentStep() {
//     String status = orderDetails['current_status'] ?? "";
//     switch (status.toLowerCase()) {
//       case 'order received':
//         return 0;
//       case 'shipped':
//         return 1;
//       case 'in transit':
//         return 2;
//       case 'out for delivery':
//         return 3;
//       case 'delivered':
//         return 4;
//       default:
//         return 0; // Default to "Order Received" if status is unknown
//     }
//   }

//   // Determine the state of the step based on the order status
//   StepState _getCurrentStepState(int step) {
//     String status = orderDetails['current_status'] ?? "";
//     // If the order is delivered, treat "In Transit" and "Out for Delivery" as complete
//     if (status.toLowerCase() == 'delivered') {
//       if (step == 2 || step == 3) {
//         return StepState.complete; // Show as completed
//       }
//     }

//     switch (status.toLowerCase()) {
//       case 'order received':
//         return step == 0 ? StepState.complete : StepState.disabled;
//       case 'shipped':
//         return step == 1 ? StepState.complete : StepState.disabled;
//       case 'in transit':
//         return step == 2 ? StepState.indexed : StepState.disabled;
//       case 'out for delivery':
//         return step == 3 ? StepState.indexed : StepState.disabled;
//       case 'delivered':
//         return step == 4 ? StepState.complete : StepState.disabled;
//       default:
//         return StepState.disabled;
//     }
//   }
// }


// import 'package:flutter/material.dart';

// class ShipmentTrackingDetailsScreen extends StatelessWidget {
//   final Map<String, dynamic> orderDetails;

//   const ShipmentTrackingDetailsScreen({Key? key, required this.orderDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String trackingNumber = orderDetails['awb_code'] ?? "N/A";
//     String courierName = orderDetails['courier_name'] ?? "N/A";
//     String currentStatus = orderDetails['current_status']?.toString().toLowerCase() ?? "N/A";

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shipment Tracking Details"),
//         automaticallyImplyLeading: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display Tracking Number and Courier Name
//             Text(
//               "Tracking Number: $trackingNumber",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Courier: $courierName",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Current Status: ${capitalize(currentStatus)}",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),

//             // Shipment Tracking Progress
//             _buildTrackingProgress(context, currentStatus),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to capitalize the first letter
//   String capitalize(String text) {
//     if (text.isEmpty) return text;
//     return text[0].toUpperCase() + text.substring(1);
//   }

//   // Progress Stepper to Show the Shipment's Progress
//   Widget _buildTrackingProgress(BuildContext context, String currentStatus) {
//     int currentStep = _getCurrentStep(currentStatus);

//     return Stepper(
//       currentStep: currentStep,
//       onStepTapped: (int step) {},
//       steps: [
//         _buildStep("Order Received", "Your order has been received and is being processed.", Icons.first_page, currentStep, 0),
//         _buildStep("Out for Pickup", "Your order is ready for pickup by the courier.", Icons.store, currentStep, 1),
//         _buildStep("Shipped", "Your order has been shipped and is on its way.", Icons.local_shipping, currentStep, 2),
//         _buildStep("In Transit", "Your order is currently in transit.", Icons.directions_car, currentStep, 3),
//         _buildStep("Out for Delivery", "Your order is out for delivery and will arrive soon.", Icons.delivery_dining, currentStep, 4),
//         _buildStep("Delivered", "Your order has been delivered successfully.", Icons.check_circle, currentStep, 5),
//       ],
//     );
//   }

//   // Helper function to build steps dynamically
//   Step _buildStep(String title, String content, IconData icon, int currentStep, int stepIndex) {
//     return Step(
//       title: Row(
//         children: [
//           Icon(icon, color: currentStep >= stepIndex ? Colors.green : Colors.grey),
//           SizedBox(width: 10),
//           Text(title),
//         ],
//       ),
//       content: Text(content),
//       isActive: currentStep >= stepIndex,
//       state: currentStep > stepIndex ? StepState.complete : (currentStep == stepIndex ? StepState.indexed : StepState.disabled),
//     );
//   }

//   // Determine the current step based on the current status
//   int _getCurrentStep(String status) {
//     switch (status) {
//       case 'order received':
//         return 0;
//       case 'out for pickup':
//         return 1;
//       case 'shipped':
//         return 2;
//       case 'in transit':
//         return 3;
//       case 'out for delivery':
//         return 4;
//       case 'delivered':
//         return 5;
//       default:
//         return 0; // Default to "Order Received" if status is unknown
//     }
//   }
// }

// import 'package:flutter/material.dart';

// class ShipmentTrackingDetailsScreen extends StatelessWidget {
//   final Map<String, dynamic> orderDetails;

//   const ShipmentTrackingDetailsScreen({Key? key, required this.orderDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String trackingNumber = orderDetails['awb_code'] ?? "N/A";
//     String courierName = orderDetails['courier_name'] ?? "N/A";
//     String currentStatus = orderDetails['current_status']?.toString().toLowerCase() ?? "N/A";

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shipment Tracking Details"),
//         automaticallyImplyLeading: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display Tracking Number and Courier Name
//             Text(
//               "Tracking Number: $trackingNumber",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Courier: $courierName",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Current Status: ${capitalize(currentStatus)}",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),

//             // Shipment Tracking Progress
//             _buildTrackingProgress(context, currentStatus),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to capitalize the first letter
//   String capitalize(String text) {
//     if (text.isEmpty) return text;
//     return text[0].toUpperCase() + text.substring(1);
//   }

//   // Progress Stepper to Show the Shipment's Progress
//   Widget _buildTrackingProgress(BuildContext context, String currentStatus) {
//     int currentStep = _getCurrentStep(currentStatus);

//     return Stepper(
//       currentStep: currentStep,
//       onStepTapped: (int step) {},
//       steps: [
//         _buildStep("Order Received", "Your order has been received and is being processed.", Icons.first_page, currentStep, 0),
//         _buildStep("Out for Pickup", "Your order is ready for pickup by the courier.", Icons.store, currentStep, 1),
//         _buildStep("Shipped", "Your order has been shipped and is on its way.", Icons.local_shipping, currentStep, 2),
//         _buildStep("In Transit", "Your order is currently in transit.", Icons.directions_car, currentStep, 3),
//         _buildStep("Out for Delivery", "Your order is out for delivery and will arrive soon.", Icons.delivery_dining, currentStep, 4),
//         _buildStep("Delivered", "Your order has been delivered successfully.", Icons.check_circle, currentStep, 5),
//         _buildStep("Cancellation Requested", "A cancellation has been requested for your order.", Icons.cancel, currentStep, 6),
//       ],
//     );
//   }

//   // Helper function to build steps dynamically
//   Step _buildStep(String title, String content, IconData icon, int currentStep, int stepIndex) {
//     return Step(
//       title: Row(
//         children: [
//           Icon(icon, color: currentStep >= stepIndex ? Colors.green : Colors.grey),
//           SizedBox(width: 10),
//           Text(title),
//         ],
//       ),
//       content: Text(content),
//       isActive: currentStep >= stepIndex,
//       state: currentStep > stepIndex ? StepState.complete : (currentStep == stepIndex ? StepState.indexed : StepState.disabled),
//     );
//   }

//   // Determine the current step based on the current status
//   int _getCurrentStep(String status) {
//     switch (status) {
//       case 'order received':
//         return 0;
//       case 'out for pickup':
//         return 1;
//       case 'shipped':
//         return 2;
//       case 'in transit':
//         return 3;
//       case 'out for delivery':
//         return 4;
//       case 'delivered':
//         return 5;
//       case 'cancellation requested':
//         return 6; // New step for cancellation requested
//       default:
//         return 0; // Default to "Order Received" if status is unknown
//     }
//   }
// }


// import 'package:flutter/material.dart';

// class ShipmentTrackingDetailsScreen extends StatelessWidget {
//   final Map<String, dynamic> orderDetails;

//   const ShipmentTrackingDetailsScreen({Key? key, required this.orderDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String trackingNumber = orderDetails['awb_code'] ?? "N/A";
//     String courierName = orderDetails['courier_name'] ?? "N/A";
//     String currentStatus = orderDetails['current_status']?.toString().toLowerCase() ?? "N/A";

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shipment Tracking Details"),
//         automaticallyImplyLeading: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display Tracking Number and Courier Name
//             Text(
//               "Tracking Number: $trackingNumber",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Courier: $courierName",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Current Status: ${capitalize(currentStatus)}",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),

//             // Shipment Tracking Progress
//             _buildTrackingProgress(context, currentStatus),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to capitalize the first letter
//   String capitalize(String text) {
//     if (text.isEmpty) return text;
//     return text[0].toUpperCase() + text.substring(1);
//   }

//   // Progress List to Show the Shipment's Progress
//   Widget _buildTrackingProgress(BuildContext context, String currentStatus) {
//     int currentStep = _getCurrentStep(currentStatus);

//     return Column(
//       children: [
//         _buildStatusStep("Order Received", "Your order has been received and is being processed.", Icons.first_page, currentStep, 0),
//         _buildStatusStep("Out for Pickup", "Your order is ready for pickup by the courier.", Icons.store, currentStep, 1),
//         _buildStatusStep("Shipped", "Your order has been shipped and is on its way.", Icons.local_shipping, currentStep, 2),
//         _buildStatusStep("In Transit", "Your order is currently in transit.", Icons.directions_car, currentStep, 3),
//         _buildStatusStep("Out for Delivery", "Your order is out for delivery and will arrive soon.", Icons.delivery_dining, currentStep, 4),
//         _buildStatusStep("Delivered", "Your order has been delivered successfully.", Icons.check_circle, currentStep, 5),
//         _buildStatusStep("Cancellation Requested", "A cancellation has been requested for your order.", Icons.cancel, currentStep, 6, isCancellation: true),
//       ],
//     );
//   }

//   // Helper function to build status steps dynamically with Card design
//   Widget _buildStatusStep(String title, String content, IconData icon, int currentStep, int stepIndex, {bool isCancellation = false}) {
//     bool isActive = currentStep >= stepIndex;
//     Color stepColor = isCancellation
//         ? Colors.red // Red color for cancellation
//         : isActive
//             ? Colors.green // Green for active steps
//             : Colors.grey; // Grey for inactive steps

//     return Card(
//       elevation: 4.0,
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: ListTile(
//         leading: Icon(icon, color: stepColor),
//         title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         subtitle: Text(content, style: TextStyle(fontSize: 14)),
//         trailing: isActive
//             ? Icon(Icons.check_circle, color: Colors.green)
//             : (stepIndex < currentStep
//                 ? Icon(Icons.check_circle, color: Colors.green)
//                 : Icon(Icons.radio_button_off, color: Colors.grey)),
//       ),
//     );
//   }

//   // Determine the current step based on the current status
//   int _getCurrentStep(String status) {
//     switch (status) {
//       case 'order received':
//         return 0;
//       case 'out for pickup':
//         return 1;
//       case 'shipped':
//         return 2;
//       case 'in transit':
//         return 3;
//       case 'out for delivery':
//         return 4;
//       case 'delivered':
//         return 5;
//       case 'cancellation requested':
//         return 6; // New step for cancellation requested
//       default:
//         return 0; // Default to "Order Received" if status is unknown
//     }
//   }
// }


// import 'package:flutter/material.dart';

// class ShipmentTrackingDetailsScreen extends StatelessWidget {
//   final Map<String, dynamic> orderDetails;

//   const ShipmentTrackingDetailsScreen({Key? key, required this.orderDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String trackingNumber = orderDetails['awb_code'] ?? "N/A";
//     String courierName = orderDetails['courier_name'] ?? "N/A";
//     String currentStatus = orderDetails['current_status']?.toString().toLowerCase() ?? "N/A";

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shipment Tracking Details"),
//         automaticallyImplyLeading: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display Tracking Number and Courier Name
//             Text(
//               "Tracking Number: $trackingNumber",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Courier: $courierName",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Current Status: ${capitalize(currentStatus)}",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),

//             // Shipment Tracking Progress
//             _buildTrackingProgress(currentStatus),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to capitalize the first letter
//   String capitalize(String text) {
//     if (text.isEmpty) return text;
//     return text[0].toUpperCase() + text.substring(1);
//   }

//   // New Custom Progress Timeline UI
//   Widget _buildTrackingProgress(String currentStatus) {
//     List<Map<String, dynamic>> steps = [
//       {"title": "Order Received", "subtitle": "Order is being processed", "icon": Icons.receipt, "status": "order received"},
//       {"title": "Out for Pickup", "subtitle": "Ready for pickup by courier", "icon": Icons.local_shipping, "status": "out for pickup"},
//       {"title": "Shipped", "subtitle": "Your order is on the way", "icon": Icons.flight_takeoff, "status": "shipped"},
//       {"title": "In Transit", "subtitle": "Your order is moving to the next destination", "icon": Icons.directions_car, "status": "in transit"},
//       {"title": "Out for Delivery", "subtitle": "The courier is delivering your order", "icon": Icons.delivery_dining, "status": "out for delivery"},
//       {"title": "Delivered", "subtitle": "Your order has been delivered", "icon": Icons.check_circle, "status": "delivered"},
//       {"title": "Cancellation Requested", "subtitle": "Cancellation is requested", "icon": Icons.cancel, "status": "cancellation requested"},
//     ];

//     int currentStep = _getCurrentStep(currentStatus);

//     return Column(
//       children: steps.asMap().entries.map((entry) {
//         int index = entry.key;
//         Map<String, dynamic> step = entry.value;
//         bool isCompleted = index <= currentStep;
//         bool isCancelled = step["status"] == "cancellation requested";

//         return _buildTimelineStep(
//           title: step["title"],
//           subtitle: step["subtitle"],
//           icon: step["icon"],
//           isActive: isCompleted,
//           isCancelled: isCancelled,
//           isLast: index == steps.length - 1,
//         );
//       }).toList(),
//     );
//   }

//   // Helper function to build timeline step
//   Widget _buildTimelineStep({
//     required String title,
//     required String subtitle,
//     required IconData icon,
//     required bool isActive,
//     required bool isCancelled,
//     bool isLast = false,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           children: [
//             Icon(icon, color: isCancelled ? Colors.red : (isActive ? Colors.green : Colors.grey)),
//             if (!isLast)
//               Container(
//                 width: 2,
//                 height: 40,
//                 color: isCancelled ? Colors.red : (isActive ? Colors.green : Colors.grey),
//               ),
//           ],
//         ),
//         SizedBox(width: 12),
//         Expanded(
//           child: Card(
//             elevation: 4,
//             margin: EdgeInsets.only(bottom: 12),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                   SizedBox(height: 4),
//                   Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey)),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // Determine the current step based on the current status
//   int _getCurrentStep(String status) {
//     switch (status) {
//       case 'order received':
//         return 0;
//       case 'out for pickup':
//         return 1;
//       case 'shipped':
//         return 2;
//       case 'in transit':
//         return 3;
//       case 'out for delivery':
//         return 4;
//       case 'delivered':
//         return 5;
//       case 'cancellation requested':
//         return 6;
//       default:
//         return 0; // Default to "Order Received" if status is unknown
//     }
//   }
// }


// import 'package:flutter/material.dart';

// class ShipmentTrackingDetailsScreen extends StatelessWidget {
//   final Map<String, dynamic> orderDetails;

//   const ShipmentTrackingDetailsScreen({Key? key, required this.orderDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String trackingNumber = orderDetails['awb_code'] ?? "N/A";
//     String courierName = orderDetails['courier_name'] ?? "N/A";
//     String currentStatus = orderDetails['current_status']?.toString().toLowerCase() ?? "N/A";

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shipment Tracking Details"),
//         automaticallyImplyLeading: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display Tracking Number and Courier Name
//             Text(
//               "Tracking Number: $trackingNumber",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Courier: $courierName",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Current Status: ${capitalize(currentStatus)}",
//               style: TextStyle(fontSize: 16, color: getStatusColor(currentStatus), fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),

//             // New Color-coded Progress UI
//             _buildTrackingProgress(currentStatus),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to capitalize the first letter
//   String capitalize(String text) {
//     if (text.isEmpty) return text;
//     return text[0].toUpperCase() + text.substring(1);
//   }

//   // New Custom Progress Timeline with Colors
//   Widget _buildTrackingProgress(String currentStatus) {
//     List<Map<String, dynamic>> steps = [
//       {"title": "Order Received", "subtitle": "Order is being processed", "icon": Icons.receipt, "status": "order received"},
//       {"title": "Out for Pickup", "subtitle": "Ready for pickup by courier", "icon": Icons.local_shipping, "status": "out for pickup"},
//       {"title": "Shipped", "subtitle": "Your order is on the way", "icon": Icons.flight_takeoff, "status": "shipped"},
//       {"title": "In Transit", "subtitle": "Your order is moving to the next destination", "icon": Icons.directions_car, "status": "in transit"},
//       {"title": "Out for Delivery", "subtitle": "The courier is delivering your order", "icon": Icons.delivery_dining, "status": "out for delivery"},
//       {"title": "Delivered", "subtitle": "Your order has been delivered", "icon": Icons.check_circle, "status": "delivered"},
//       {"title": "Cancellation Requested", "subtitle": "Order cancellation requested", "icon": Icons.cancel, "status": "cancellation requested"},
//     ];

//     int currentStep = _getCurrentStep(currentStatus);

//     return Column(
//       children: steps.asMap().entries.map((entry) {
//         int index = entry.key;
//         Map<String, dynamic> step = entry.value;
//         bool isCompleted = index <= currentStep;
//         bool isCancelled = step["status"] == "cancellation requested";

//         return _buildTimelineStep(
//           title: step["title"],
//           subtitle: step["subtitle"],
//           icon: step["icon"],
//           isActive: isCompleted,
//           isCancelled: isCancelled,
//           isLast: index == steps.length - 1,
//           color: getStatusColor(step["status"]),
//         );
//       }).toList(),
//     );
//   }

//   // Helper function to build timeline step with color-coded status
//   Widget _buildTimelineStep({
//     required String title,
//     required String subtitle,
//     required IconData icon,
//     required bool isActive,
//     required bool isCancelled,
//     required Color color,
//     bool isLast = false,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: isCancelled ? Colors.red : (isActive ? color : Colors.grey),
//               radius: 12,
//               child: Icon(icon, size: 16, color: Colors.white),
//             ),
//             if (!isLast)
//               Container(
//                 width: 2,
//                 height: 40,
//                 color: isCancelled ? Colors.red : (isActive ? color : Colors.grey),
//               ),
//           ],
//         ),
//         SizedBox(width: 12),
//         Expanded(
//           child: Card(
//             elevation: 4,
//             margin: EdgeInsets.only(bottom: 12),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
//                   SizedBox(height: 4),
//                   Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey)),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // Function to get color for each status
//   Color getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'order received':
//         return Colors.blue;
//       case 'out for pickup':
//         return Colors.orange;
//       case 'shipped':
//         return Colors.purple;
//       case 'in transit':
//         return Colors.teal;
//       case 'out for delivery':
//         return Colors.green;
//       case 'delivered':
//         return Colors.green.shade900;
//       case 'cancellation requested':
//         return Colors.red;
//       default:
//         return Colors.grey;
//     }
//   }

//   // Determine the current step based on the status
//   int _getCurrentStep(String status) {
//     switch (status) {
//       case 'order received':
//         return 0;
//       case 'out for pickup':
//         return 1;
//       case 'shipped':
//         return 2;
//       case 'in transit':
//         return 3;
//       case 'out for delivery':
//         return 4;
//       case 'delivered':
//         return 5;
//       case 'cancellation requested':
//         return 6;
//       default:
//         return 0;
//     }
//   }
// }

// import 'package:flutter/material.dart';

// class ShipmentTrackingDetailsScreen extends StatelessWidget {
//   final Map<String, dynamic> orderDetails;

//   const ShipmentTrackingDetailsScreen({Key? key, required this.orderDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String trackingNumber = orderDetails['awb_code'] ?? "N/A";
//     String courierName = orderDetails['courier_name'] ?? "N/A";
//     String currentStatus = orderDetails['current_status']?.toString().toLowerCase() ?? "N/A";

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shipment Tracking Details"),
//         automaticallyImplyLeading: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display Tracking Number and Courier Name
//             Text(
//               "Tracking Number: $trackingNumber",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Courier: $courierName",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Current Status: ${capitalize(currentStatus)}",
//               style: TextStyle(fontSize: 16, color: getStatusColor(currentStatus), fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),

//             // New Color-coded Progress UI
//             _buildTrackingProgress(currentStatus),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to capitalize the first letter
//   String capitalize(String text) {
//     if (text.isEmpty) return text;
//     return text[0].toUpperCase() + text.substring(1);
//   }

//   // New Custom Progress Timeline with Colors
//   Widget _buildTrackingProgress(String currentStatus) {
//     List<Map<String, dynamic>> steps = [
//       {"title": "Order Received", "subtitle": "Order is being processed", "icon": Icons.receipt, "status": "order received"},
//       {"title": "Out for Pickup", "subtitle": "Ready for pickup by courier", "icon": Icons.local_shipping, "status": "out for pickup"},
//       {"title": "Shipped", "subtitle": "Your order is on the way", "icon": Icons.flight_takeoff, "status": "shipped"},
//       {"title": "In Transit", "subtitle": "Your order is moving to the next destination", "icon": Icons.directions_car, "status": "in transit"},
//       {"title": "Out for Delivery", "subtitle": "The courier is delivering your order", "icon": Icons.delivery_dining, "status": "out for delivery"},
//       {"title": "Delivered", "subtitle": "Your order has been delivered", "icon": Icons.check_circle, "status": "delivered"},
//       {"title": "Cancellation Requested", "subtitle": "Your order cancellation has been requested", "icon": Icons.cancel, "status": "cancellation requested"},
//       {"title": "Cancelled", "subtitle": "Your order has been cancelled", "icon": Icons.close, "status": "cancelled"},
//     ];

//     int currentStep = _getCurrentStep(currentStatus);

//     return Column(
//       children: steps.asMap().entries.map((entry) {
//         int index = entry.key;
//         Map<String, dynamic> step = entry.value;
//         bool isCompleted = index <= currentStep;
//         bool isCancelled = step["status"] == "cancellation requested" || step["status"] == "cancelled";

//         return _buildTimelineStep(
//           title: step["title"],
//           subtitle: step["subtitle"],
//           icon: step["icon"],
//           isActive: isCompleted,
//           isCancelled: isCancelled,
//           isLast: index == steps.length - 1,
//           color: getStatusColor(step["status"]),
//         );
//       }).toList(),
//     );
//   }

//   // Helper function to build timeline step with color-coded status
//   Widget _buildTimelineStep({
//     required String title,
//     required String subtitle,
//     required IconData icon,
//     required bool isActive,
//     required bool isCancelled,
//     required Color color,
//     bool isLast = false,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: isCancelled ? Colors.red : (isActive ? color : Colors.grey.shade400),
//               radius: 14,
//               child: Icon(icon, size: 18, color: Colors.white),
//             ),
//             if (!isLast)
//               Container(
//                 width: 2,
//                 height: 40,
//                 color: isCancelled ? Colors.red : (isActive ? color : Colors.grey.shade300),
//               ),
//           ],
//         ),
//         SizedBox(width: 12),
//         Expanded(
//           child: Card(
//             elevation: 3,
//             margin: EdgeInsets.only(bottom: 12),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
//                   SizedBox(height: 4),
//                   Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey)),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // Function to get color for each status
//   Color getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'order received':
//         return Colors.blue;
//       case 'out for pickup':
//         return Colors.orange;
//       case 'shipped':
//         return Colors.purple;
//       case 'in transit':
//         return Colors.teal;
//       case 'out for delivery':
//         return Colors.green;
//       case 'delivered':
//         return Colors.green.shade900;
//       case 'cancellation requested':
//         return Colors.amber;
//       case 'cancelled':
//         return Colors.red;
//       default:
//         return Colors.grey;
//     }
//   }

//   // Determine the current step based on the status
//   int _getCurrentStep(String status) {
//     switch (status) {
//       case 'order received':
//         return 0;
//       case 'out for pickup':
//         return 1;
//       case 'shipped':
//         return 2;
//       case 'in transit':
//         return 3;
//       case 'out for delivery':
//         return 4;
//       case 'delivered':
//         return 5;
//       case 'cancellation requested':
//         return 6;
//       case 'cancelled':
//         return 7;
//       default:
//         return 0;
//     }
//   }
// }


// import 'package:flutter/material.dart';

// class ShipmentTrackingDetailsScreen extends StatelessWidget {
//   final Map<String, dynamic> orderDetails;

//   const ShipmentTrackingDetailsScreen({Key? key, required this.orderDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String trackingNumber = orderDetails['awb_code'] ?? "N/A";
//     String courierName = orderDetails['courier_name'] ?? "N/A";
//     String currentStatus = orderDetails['current_status']?.toString().toLowerCase() ?? "N/A";

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shipment Tracking Details"),
//         automaticallyImplyLeading: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display Tracking Number and Courier Name
//             Text(
//               "Tracking Number: $trackingNumber",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Courier: $courierName",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Current Status: ${capitalize(currentStatus)}",
//               style: TextStyle(fontSize: 16, color: getStatusColor(currentStatus), fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),

//             // New Color-coded Progress UI
//             _buildTrackingProgress(currentStatus),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to capitalize the first letter
//   String capitalize(String text) {
//     if (text.isEmpty) return text;
//     return text[0].toUpperCase() + text.substring(1);
//   }

//   // New Custom Progress Timeline with Colors
//   Widget _buildTrackingProgress(String currentStatus) {
//     List<Map<String, dynamic>> steps = [
//       {"title": "Order Received", "subtitle": "Order is being processed", "icon": Icons.receipt, "status": "order received"},
//       {"title": "Out for Pickup", "subtitle": "Ready for pickup by courier", "icon": Icons.local_shipping, "status": "out for pickup"},
//       {"title": "Shipped", "subtitle": "Your order is on the way", "icon": Icons.flight_takeoff, "status": "shipped"},
//       {"title": "In Transit", "subtitle": "Your order is moving to the next destination", "icon": Icons.directions_car, "status": "in transit"},
//       {"title": "Out for Delivery", "subtitle": "The courier is delivering your order", "icon": Icons.delivery_dining, "status": "out for delivery"},
//       {"title": "Delivered", "subtitle": "Your order has been delivered", "icon": Icons.check_circle, "status": "delivered"},
//       {"title": "Cancellation Requested", "subtitle": "Your order cancellation has been requested", "icon": Icons.hourglass_top, "status": "cancellation requested"},
//       {"title": "Cancelled", "subtitle": "Your order has been cancelled", "icon": Icons.cancel, "status": "cancelled"},
//     ];

//     int currentStep = _getCurrentStep(currentStatus);

//     return Column(
//       children: steps.asMap().entries.map((entry) {
//         int index = entry.key;
//         Map<String, dynamic> step = entry.value;
//         bool isCompleted = index <= currentStep;
//         bool isCancellationRequested = step["status"] == "cancellation requested";
//         bool isCancelled = step["status"] == "cancelled";

//         return _buildTimelineStep(
//           title: step["title"],
//           subtitle: step["subtitle"],
//           icon: step["icon"],
//           isActive: isCompleted,
//           isCancellationRequested: isCancellationRequested,
//           isCancelled: isCancelled,
//           isLast: index == steps.length - 1,
//           color: getStatusColor(step["status"]),
//         );
//       }).toList(),
//     );
//   }

//   // Helper function to build timeline step with color-coded status
//   Widget _buildTimelineStep({
//     required String title,
//     required String subtitle,
//     required IconData icon,
//     required bool isActive,
//     required bool isCancellationRequested,
//     required bool isCancelled,
//     required Color color,
//     bool isLast = false,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: isCancelled
//                   ? Colors.red
//                   : (isCancellationRequested ? Colors.amber.shade600 : (isActive ? color : Colors.grey.shade400)),
//               radius: 14,
//               child: Icon(icon, size: 18, color: Colors.white),
//             ),
//             if (!isLast)
//               Container(
//                 width: 2,
//                 height: 40,
//                 color: isCancelled ? Colors.red : (isCancellationRequested ? Colors.amber.shade600 : (isActive ? color : Colors.grey.shade300)),
//               ),
//           ],
//         ),
//         SizedBox(width: 12),
//         Expanded(
//           child: Card(
//             elevation: 3,
//             margin: EdgeInsets.only(bottom: 12),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
//                   SizedBox(height: 4),
//                   Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey)),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // Function to get color for each status
//   Color getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'order received':
//         return Colors.blue;
//       case 'out for pickup':
//         return Colors.orange;
//       case 'shipped':
//         return Colors.purple;
//       case 'in transit':
//         return Colors.teal;
//       case 'out for delivery':
//         return Colors.green;
//       case 'delivered':
//         return Colors.green.shade900;
//       case 'cancellation requested':
//         return Colors.amber.shade600;
//       case 'cancelled':
//         return Colors.red;
//       default:
//         return Colors.grey;
//     }
//   }

//   // Determine the current step based on the status
//   int _getCurrentStep(String status) {
//     switch (status) {
//       case 'order received':
//         return 0;
//       case 'out for pickup':
//         return 1;
//       case 'shipped':
//         return 2;
//       case 'in transit':
//         return 3;
//       case 'out for delivery':
//         return 4;
//       case 'delivered':
//         return 5;
//       case 'cancellation requested':
//         return 6;
//       case 'cancelled':
//         return 7;
//       default:
//         return 0;
//     }
//   }
// }

// import 'package:flutter/material.dart';

// class ShipmentTrackingDetailsScreen extends StatelessWidget {
//   final Map<String, dynamic> orderDetails;

//   const ShipmentTrackingDetailsScreen({Key? key, required this.orderDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String trackingNumber = orderDetails['awb_code'] ?? "N/A";
//     String courierName = orderDetails['courier_name'] ?? "N/A";
//     String currentStatus = orderDetails['current_status']?.toString().toLowerCase() ?? "N/A";

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shipment Tracking Details"),
//         automaticallyImplyLeading: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Tracking Number: $trackingNumber",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Courier: $courierName",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Current Status: ${capitalize(currentStatus)}",
//               style: TextStyle(fontSize: 16, color: getStatusColor(currentStatus), fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             _buildTrackingProgress(currentStatus),
//           ],
//         ),
//       ),
//     );
//   }

//   String capitalize(String text) {
//     if (text.isEmpty) return text;
//     return text[0].toUpperCase() + text.substring(1);
//   }

//   Widget _buildTrackingProgress(String currentStatus) {
//     List<Map<String, dynamic>> steps = [
//       {"title": "Order Received", "subtitle": "Order is being processed", "icon": Icons.receipt, "status": "order received"},
//       {"title": "Out for Pickup", "subtitle": "Ready for pickup by courier", "icon": Icons.local_shipping, "status": "out for pickup"},
//       {"title": "Shipped", "subtitle": "Your order is on the way", "icon": Icons.flight_takeoff, "status": "shipped"},
//       {"title": "In Transit", "subtitle": "Your order is moving to the next destination", "icon": Icons.directions_car, "status": "in transit"},
//       {"title": "Out for Delivery", "subtitle": "The courier is delivering your order", "icon": Icons.delivery_dining, "status": "out for delivery"},
//       {"title": "Delivered", "subtitle": "Your order has been delivered", "icon": Icons.check_circle, "status": "delivered"},
//     ];

//     // Only add "Cancellation Requested" if applicable
//     if (currentStatus == "cancellation requested" || currentStatus == "cancelled") {
//       steps.add({
//         "title": "Cancellation Requested",
//         "subtitle": "Your order cancellation has been requested",
//         "icon": Icons.hourglass_top,
//         "status": "cancellation requested"
//       });
//     }

//     // Only add "Cancelled" if the order is actually cancelled
//     if (currentStatus == "cancelled") {
//       steps.add({
//         "title": "Cancelled",
//         "subtitle": "Your order has been cancelled",
//         "icon": Icons.cancel,
//         "status": "cancelled"
//       });
//     }

//     int currentStep = _getCurrentStep(currentStatus, steps);

//     return Column(
//       children: steps.asMap().entries.map((entry) {
//         int index = entry.key;
//         Map<String, dynamic> step = entry.value;
//         bool isCompleted = index <= currentStep;
//         bool isCancellationRequested = step["status"] == "cancellation requested";
//         bool isCancelled = step["status"] == "cancelled";

//         return _buildTimelineStep(
//           title: step["title"],
//           subtitle: step["subtitle"],
//           icon: step["icon"],
//           isActive: isCompleted,
//           isCancellationRequested: isCancellationRequested,
//           isCancelled: isCancelled,
//           isLast: index == steps.length - 1,
//           color: getStatusColor(step["status"]),
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildTimelineStep({
//     required String title,
//     required String subtitle,
//     required IconData icon,
//     required bool isActive,
//     required bool isCancellationRequested,
//     required bool isCancelled,
//     required Color color,
//     bool isLast = false,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: isCancelled
//                   ? Colors.red
//                   : (isCancellationRequested ? Colors.amber.shade600 : (isActive ? color : Colors.grey.shade400)),
//               radius: 14,
//               child: Icon(icon, size: 18, color: Colors.white),
//             ),
//             if (!isLast)
//               Container(
//                 width: 2,
//                 height: 40,
//                 color: isCancelled ? Colors.red : (isCancellationRequested ? Colors.amber.shade600 : (isActive ? color : Colors.grey.shade300)),
//               ),
//           ],
//         ),
//         SizedBox(width: 12),
//         Expanded(
//           child: Card(
//             elevation: 3,
//             margin: EdgeInsets.only(bottom: 12),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
//                   SizedBox(height: 4),
//                   Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey)),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Color getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'order received':
//         return Colors.blue;
//       case 'out for pickup':
//         return Colors.orange;
//       case 'shipped':
//         return Colors.purple;
//       case 'in transit':
//         return Colors.teal;
//       case 'out for delivery':
//         return Colors.green;
//       case 'delivered':
//         return Colors.green.shade900;
//       case 'cancellation requested':
//         return Colors.amber.shade600;
//       case 'cancelled':
//         return Colors.red;
//       default:
//         return Colors.grey;
//     }
//   }

//   int _getCurrentStep(String status, List<Map<String, dynamic>> steps) {
//     for (int i = 0; i < steps.length; i++) {
//       if (steps[i]["status"] == status) {
//         return i;
//       }
//     }
//     return 0;
//   }
// }

import 'package:flutter/material.dart';
import 'package:taptohello/core/utils/color_constant.dart';

class ShipmentTrackingScreen extends StatelessWidget {
   final Map<String, dynamic> orderDetails;
 // final Map<String, dynamic> trackingData;

  const ShipmentTrackingScreen({Key? key, required this.orderDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String trackingNumber = orderDetails['awb'] ?? "N/A";
    String courierName = orderDetails['courier_name'] ?? "N/A";
    String currentStatus = orderDetails['current_status']?.toString().toUpperCase() ?? "N/A";
    String estimatedDelivery = orderDetails['etd'] ?? "N/A";
    List<dynamic> scans = orderDetails['scans'] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text("Tracking Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tracking Number: $trackingNumber", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Courier: $courierName", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Status: $currentStatus", style: TextStyle(fontSize: 16, color: _getStatusColor(currentStatus), fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Estimated Delivery: $estimatedDelivery", style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
            SizedBox(height: 20),
            Expanded(child: _buildTrackingTimeline(scans)),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackingTimeline(List<dynamic> scans) {
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) {
        var scan = scans[index];
        return _buildTimelineStep(
          date: scan['date'] ?? "N/A",
          activity: scan['activity'] ?? "N/A",
          location: scan['location'] ?? "N/A",
          isLast: index == scans.length - 1,
        );
      },
    );
  }

  Widget _buildTimelineStep({required String date, required String activity, required String location, required bool isLast}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              backgroundColor: AppCol.primary,
              radius: 14,
              child: Icon(Icons.location_on, size: 18, color: Colors.white),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: AppCol.primary,
              ),
          ],
        ),
        SizedBox(width: 12),
        Expanded(
          child: Card(
            elevation: 3,
            margin: EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(date, style: TextStyle(fontSize: 14, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(activity, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(location, style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

Color _getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'order received':
      return AppCol.primary;
    case 'shipped':
      return Colors.orange;
    case 'in transit':
      return Colors.purple;
    case 'out for delivery':
      return Colors.green;
    case 'delivered':
      return Colors.teal;
    case 'cancelled':
      return Colors.red;
    case 'return initiated':
      return Colors.deepOrange; // Color for return initiated
    case 'returned':
      return Colors.pink; // Color for returned
    default:
      return Colors.grey;
  }
}

}















