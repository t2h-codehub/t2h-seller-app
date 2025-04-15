


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















