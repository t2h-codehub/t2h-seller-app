import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/utils/color_constant.dart';
import 'package:swapnil_s_application4/data/Orders/getOrderListApiResModel.dart';
import 'package:swapnil_s_application4/data/Orders/orderDetailsReviewModelAndStatusCode.dart';
import 'package:swapnil_s_application4/helper/locator.dart';
import 'package:swapnil_s_application4/helper/user_detail_service.dart';
import 'package:swapnil_s_application4/presentation/MyOrders/NewOrders/orderDetailsScreen.dart';
import 'package:swapnil_s_application4/presentation/MyOrders/controllers/ordersControllers.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({super.key});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  List<NewOrdersItems> newOrdersItem = [];

  final UserDetailService _userDetailService = getIt<UserDetailService>();

  GetOrderListApiResModel getOrderListApiResModel = GetOrderListApiResModel();
  OrderDetailsReviewModelAndStatusCode orderDetailsReviewModelAndStatusCode =
      OrderDetailsReviewModelAndStatusCode();
  OrderControllers _orderControllers = OrderControllers();

  bool isApiDataAvailable = false;
  late Future _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = loadAllNewOrders();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'New Orders',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          /// Filter Icon
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.filter_alt_outlined, color: AppCol.primary),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (isApiDataAvailable) {
              return ListView.builder(
                itemCount: newOrdersItem.length,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      getOrderDetails(newOrdersItem[index].orderID);
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDetailsScreen(),
                        ),
                      );*/
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          /// Order Number
                          Row(
                            children: [
                              Text(
                                'Order Number : ',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(.6),
                                ),
                              ),
                              Text(
                                '${newOrdersItem[index].orderNumber}',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.01),

                          /// Order Status
                          Row(
                            children: [
                              Text(
                                'Order Status : ',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(.6),
                                ),
                              ),
                              Text(
                                '${newOrdersItem[index].orderStatus}',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.01),

                          /// Order Date
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order Date : ',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(.6),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${newOrdersItem[index].orderDate}',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.01),

                          /// Customer Name
                          Row(
                            children: [
                              Text(
                                'Customer Name : ',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(.6),
                                ),
                              ),
                              Text(
                                '${newOrdersItem[index].customerName}',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.01),

                          /// Order Amount
                          Row(
                            children: [
                              Text(
                                'Order Amount : ',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(.6),
                                ),
                              ),
                              Text(
                                '${newOrdersItem[index].orderAmount}',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  /// get all the new orders
  Future<bool> loadAllNewOrders() async {
    Map<String, dynamic> body = {
      "sellerId": "${_userDetailService.userDetailResponse?.user?.id}"
    };
    getOrderListApiResModel = await _orderControllers.getNewOrderList(body);
    if (getOrderListApiResModel.message == "Orders fetched successfully") {
      getOrderListApiResModel.orders?.reversed.forEach((element) {
        newOrdersItem.add(NewOrdersItems(
            orderID: "${element.sId}",
            orderNumber: "${element.orderNumber}",
            orderStatus: "${element.orderStatus}",
            orderDate: "${element.orderDate}",
            customerName: "${element.customerName}",
            orderAmount: "${element.orderAmount}"));
      });
      isApiDataAvailable = true;
    }
    return isApiDataAvailable;
  }

  /// Order details
  void getOrderDetails(id) async {
    debugPrint('My order id is: $id');
    Map<String, dynamic> body = {"orderId": "$id"};
    orderDetailsReviewModelAndStatusCode =
        await _orderControllers.getOrderDetails(body);
    if (orderDetailsReviewModelAndStatusCode.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Success')));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderDetailsScreen(orderDetails: orderDetailsReviewModelAndStatusCode.newOrderDetailsApiResModel),
        ),
      );
    } else if (orderDetailsReviewModelAndStatusCode.statusCode == 500) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              '${orderDetailsReviewModelAndStatusCode.errorOrderDetailsApiResModel?.error}')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Something went wrong!')));
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

  NewOrdersItems(
      {required this.orderID,
      required this.orderNumber,
      required this.orderStatus,
      required this.orderDate,
      required this.customerName,
      required this.orderAmount});
}
