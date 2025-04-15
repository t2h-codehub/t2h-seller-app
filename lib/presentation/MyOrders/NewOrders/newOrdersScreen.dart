


import 'package:flutter/material.dart';
import 'package:taptohello/data/Orders/getOrderListApiResModel.dart';
import 'package:taptohello/data/Orders/orderDetailsReviewModelAndStatusCode.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/MyOrders/NewOrders/orderDetailsScreen.dart';
import 'package:taptohello/presentation/MyOrders/controllers/ordersControllers.dart';

class NewOrderScreen extends StatefulWidget {
  final String? orderFeatures;

  const NewOrderScreen({super.key, this.orderFeatures});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  final OrderControllers _orderControllers = OrderControllers();

  late Future<List<NewOrdersItems>> _future;

  @override
  void initState() {
    super.initState();
    _future = loadAllNewOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          '${widget.orderFeatures}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<NewOrdersItems>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No orders found."));
          }

          // ✅ Filter orders based on selected feature
          String mappedStatus = mapFeatureToStatus(widget.orderFeatures);
          List<NewOrdersItems> filteredOrders = snapshot.data!
              .where((order) => order.orderStatus == mappedStatus)
              .toList();

          if (filteredOrders.isEmpty) {
            return Center(child: Text("No matching orders found."));
          }

          return ListView.builder(
            itemCount: filteredOrders.length,
            padding: EdgeInsets.all(16),
            itemBuilder: (context, index) {
              NewOrdersItems order = filteredOrders[index];
              return _buildOrderCard(order);
            },
          );
        },
      ),
    );
  }

 

Widget _buildOrderCard(NewOrdersItems order) {
  return InkWell(
    onTap: () => getOrderDetails(order.orderID),
    child: AnimatedContainer(
      duration: Duration(milliseconds: 300), // Smooth animation duration
      curve: Curves.easeInOut, // Smooth animation curve
      margin: EdgeInsets.only(bottom: 18),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(255, 255, 255, 0.8), // Light white with 80% opacity
            Color.fromRGBO(255, 255, 255, 1.0), // Pure white
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderRow(order),
          Divider(color: Colors.grey.withOpacity(0.5), thickness: 1),
          SizedBox(height: 12),
          _buildTextRow("Order Number:", order.orderNumber),
          _buildTextRow("Order Status:", order.orderStatus, color: getStatusColor(order.orderStatus)),
          _buildTextRow("Order Date:", order.orderDate),
          _buildTextRow("Customer Name:", order.customerName),
          _buildTextRow("Order Amount:", order.orderAmount),
        ],
      ),
    ),
  );
}

Widget _buildHeaderRow(NewOrdersItems order) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Icon(
        getStatusIcon(order.orderStatus),
        color: getStatusColor(order.orderStatus),
        size: 30,
      ),
      Text(
        'Order #${order.orderNumber}',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget _buildTextRow(String label, String value, {Color? color}) {
  return Row(
    children: [
      Text(
        label,
        style: TextStyle(
          color: Colors.black.withOpacity(0.8),
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(width: 6),
      Expanded(
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: 1.0, // Control opacity for smooth fade-in/fade-out effects
          child: Text(
            value,
            style: TextStyle(
              color: color ?? Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    ],
  );
}

Color getStatusColor(String status) {
  switch (status) {
    case "SUCCESS":
      return Colors.green; // Success color
    case "SHIPPED":
      return Colors.blueAccent; // Shipped color
    case "DELIVERED":
      return Colors.teal; // Delivered color
    case "CANCELLED":
      return Colors.red; // Cancelled color
    case "FAILED":
      return Colors.grey; // Failed color
    case "RETURN_INITIATED":
      return Colors.orange; // Return Initiated color
    case "RETURNED":
      return Colors.purple; // Returned color
    default:
      return Colors.black; // Default color
  }
}



IconData getStatusIcon(String status) {
  switch (status) {
    case "SUCCESS":
      return Icons.check_circle; // Success icon
    case "SHIPPED":
      return Icons.local_shipping; // Shipped icon
    case "DELIVERED":
      return Icons.done_all; // Delivered icon
    case "CANCELLED":
      return Icons.cancel; // Cancelled icon
    case "FAILED":
      return Icons.error; // Failed icon
    case "RETURN_INITIATED":
      return Icons.replay_circle_filled; // Return Initiated icon
    case "RETURNED":
      return Icons.assignment_return; // Returned icon
    default:
      return Icons.info_outline; // Default info icon
  }
}









String mapFeatureToStatus(String? feature) {
  switch (feature) {
    case "New Orders":
      return "SUCCESS";
    case "Shipped Orders":
      return "SHIPPED";
    case "Delivered Orders":
      return "DELIVERED";
    case "Return Initiated":
      return "RETURN_INITIATED";
    case "Returned":
      return "RETURNED";
    case "Cancelled Orders":
      return "CANCELLED";
    case "Failed Orders":
      return "FAILED";
    default:
      return ""; // Handle unknown cases
  }
}

 

 


  Future<List<NewOrdersItems>> loadAllNewOrders() async {
  String mappedStatus = mapFeatureToStatus(widget.orderFeatures);

  Map<String, dynamic> body = {
    "sellerId": "${_userDetailService.userDetailResponse?.user?.id}",
    "orderStatus": mappedStatus,
  };

  GetOrderListApiResModel getOrderListApiResModel = await _orderControllers.getNewOrderList(body);

  if (getOrderListApiResModel.message == "Orders fetched successfully") {
    return getOrderListApiResModel.orders?.reversed.map((element) {
      return NewOrdersItems(
        orderID: "${element.sId}",
        orderNumber: "${element.orderNumber}",
        orderStatus: "${element.orderStatus}",
        orderDate: "${element.orderDate}",
        customerName: "${element.customerName}",
        orderAmount: "${element.orderAmount}",
      );
    }).toList() ?? [];
  }
  return [];
}


  void getOrderDetails(String id) async {
    Map<String, String> body = {"orderId": id};

    OrderDetailsReviewModelAndStatusCode orderDetailsReviewModelAndStatusCode =
        await _orderControllers.getOrderDetails(body);

    if (orderDetailsReviewModelAndStatusCode.statusCode == 201 || 
    orderDetailsReviewModelAndStatusCode.statusCode == 200){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderDetailsScreen(orderDetails: orderDetailsReviewModelAndStatusCode.newOrderDetailsApiResModel),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Something went wrong!")),
      );
    }
  }
}

class NewOrdersItems {
  String orderID;
  String orderNumber;
  String orderStatus;
  String orderDate;
  String customerName;
  String orderAmount;

  NewOrdersItems({
    required this.orderID,
    required this.orderNumber,
    required this.orderStatus,
    required this.orderDate,
    required this.customerName,
    required this.orderAmount,
  });
}

