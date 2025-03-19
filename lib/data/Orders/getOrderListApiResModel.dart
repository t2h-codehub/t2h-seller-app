class GetOrderListApiResModel {
  String? message;
  List<Orders>? orders;

  GetOrderListApiResModel({this.message, this.orders});

  GetOrderListApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  String? sId;
  String? orderNumber;
  String? orderStatus;
  String? orderDate;
  String? orderAmount;
  String? customerName;

  Orders(
      {this.sId,
        this.orderNumber,
        this.orderStatus,
        this.orderDate,
        this.orderAmount,
        this.customerName});

  Orders.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    orderNumber = json['orderNumber'];
    orderStatus = json['orderStatus'];
    orderDate = json['orderDate'];
    orderAmount = json['orderAmount'];
    customerName = json['customerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['orderNumber'] = orderNumber;
    data['orderStatus'] = orderStatus;
    data['orderDate'] = orderDate;
    data['orderAmount'] = orderAmount;
    data['customerName'] = customerName;
    return data;
  }
}
