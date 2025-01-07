import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/utils/color_constant.dart';
import 'package:swapnil_s_application4/data/Orders/newOrderDetailsApiResModel.dart';
import 'package:swapnil_s_application4/presentation/MyOrders/itemDetailsScreen.dart';
import 'package:swapnil_s_application4/presentation/MyOrders/shipmentTrackingDetails.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key, this.orderDetails});

  final Order? orderDetails;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool isShipped = false;

  bool isShippedComplete = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('OrderDetailsScreen: ${widget.orderDetails?.address?.city}');
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
          'Order Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          /// Export to Shiprocket Button
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 22),
              child: Text(
                'Export to Shiprocket',
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
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Details Card
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          '${widget.orderDetails?.orderNumber}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),

                    /// Order Status
                    Row(
                      children: [
                        Text(
                          'Order Status: ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                        Text('${widget.orderDetails?.orderStatus}',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.bold)),
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
                            '${widget.orderDetails?.orderDate}',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
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
                          '${widget.orderDetails?.address?.name}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),

                    /// Customer Address
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Customer Address : ',
                          style: TextStyle(
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${widget.orderDetails?.address?.address}, ${widget.orderDetails?.address?.city}, ${widget.orderDetails?.address?.state}, ${widget.orderDetails?.address?.zip}',
                            maxLines: 4,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),

                    /// Customer Email
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Customer Email : ',
                          style: TextStyle(
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                        Text(
                          '${widget.orderDetails?.address?.email}',
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),

                    /// Customer Mobile
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Customer Mobile : ',
                          style: TextStyle(
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                        Text(
                          '${widget.orderDetails?.address?.mobile}',
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              /// Product Cards
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /*InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemDetailsScreen(
                                productTitle: "Imaaya Ajrakh Sari"),
                          ),
                        );
                      },
                      child: orderItem(
                        imageUrl: 'assets/images/catalogueimageone.png',
                        name: 'Imaaya Ajrakh Sari',
                        variantName: '(Variant Name: Value)',
                        price: 'Rs. 7,500',
                        qty: 4,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1,
                    ),
                    const SizedBox(height: 4),
                    orderItem(
                      imageUrl: 'assets/images/catalogueimageone.png',
                      name: 'Imaaya Ajrakh Sari',
                      variantName: '(Variant Name: Value)',
                      price: 'Rs. 7,500',
                      qty: 4,
                    ),*/
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ListView.builder(
                        itemCount: widget.orderDetails?.products?.length,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ItemDetailsScreen(
                                      productTitle: "${widget.orderDetails?.products?[index].productName}"),
                                ),
                              );
                            },
                            child: orderItem(
                              imageUrl:
                                  '${widget.orderDetails?.products?[index].productImages?[0]}',
                              name: '${widget.orderDetails?.products?[index].productName}',
                              variantName:
                                  '(Variant Name: ${widget.orderDetails?.products?[index].variants?[0].title})',
                              price:
                                  'Rs. ${widget.orderDetails?.products?[index].mrp}',
                              qty: int.parse(
                                '${widget.orderDetails?.products?[index].quantity}',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: const [
                          Text('Payment Type: ',
                              style: TextStyle(fontSize: 16)),
                          Text('Online',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text('Order Total: ', style: TextStyle(fontSize: 16)),
                          Text('${widget.orderDetails?.totalAmount}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: isShipped ? height * 0.04 : 20),

              /// Update order status buttons and heading
              Text(
                'Update Order Status',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              if (isShipped) ...[
                SizedBox(height: height * 0.02),
                Container(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () async {
                      final res = await showDialog(
                        context: context,
                        builder: (context) {
                          return ShipmentTrackingDetailsDialog();
                        },
                      );

                      if (res) {
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
                    child: Text(isShippedComplete ? 'Delivered' : 'Shipped',
                        style: TextStyle(
                            color:
                                isShippedComplete ? Colors.white : Colors.green)),
                  ),
                ),
                SizedBox(height: height * 0.02),
              ],

              if (!isShipped) ...[
                SizedBox(
                  width: width,
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
                          borderRadius: BorderRadius.circular(10)),
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: Text(
                      'Accepted',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
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
          ),
        ),
      ),
    );
  }

  Widget orderItem(
      {required String imageUrl,
      required String name,
      required String variantName,
      required String price,
      required int qty}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 90,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(
                  variantName,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(price, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Qty. $qty', style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
