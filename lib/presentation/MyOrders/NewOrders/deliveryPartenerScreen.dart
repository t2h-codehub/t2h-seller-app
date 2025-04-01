
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'package:taptohello/main.dart';
import 'package:taptohello/presentation/MyOrders/NewOrders/shipmentDetailsScreen.dart';
import 'package:taptohello/presentation/MyOrders/controllers/ordersControllers.dart';




class DeliveryPartnerScreen extends ConsumerStatefulWidget {
  final String? selectedLocation;
  final String? orderId;
  final double? weight;
  final double? height;
  final double? breadth;
  final double? length;


  DeliveryPartnerScreen({this.selectedLocation, this.orderId, this.weight, this.height, this.breadth, this.length});

  @override
  _DeliveryPartnerScreenState createState() => _DeliveryPartnerScreenState();
}

class _DeliveryPartnerScreenState extends ConsumerState<DeliveryPartnerScreen> {
  int? selectedCourierIndex; // Store selected index

   DateTime? selectedDate;
  TimeOfDay? selectedTime;
  

    final OrderControllers orderControllers =
      OrderControllers();
     // final shipmentControllerProvider = ChangeNotifierProvider((ref) => ShipmentController());


  Future<void> _showDateTimePicker(BuildContext context, courierId) async {
    
    print(courierId);
    print("courierId");
    print(orderControllers.shipmentId);
    print("orderControllers.shipmentId");
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)), // Next 30 days
    );

   

      // if (pickedTime != null) {
        setState(() {
          selectedDate = pickedDate;
        //  selectedTime = pickedTime;
        });

       
        String formattedDateTime =
            "${DateFormat('yyyy-MM-dd').format(pickedDate!)}";
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("Pickup Scheduled: $formattedDateTime")),
          
        // );
        nextControl(courierId, formattedDateTime);
       
     // }
    }

    Future<void> nextControl(courierId, String formattedDateTime) async {
    final _orderController = ref.read(orderControllerProvider);

      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShipmentDetailsScreen(courierCompanyId: courierId.toString(),shipmentId:  _orderController.shipmentId.toString(),pickupDate:formattedDateTime.toString() ),
                      ),
                    );

    }
  

  @override
  void initState() {
    super.initState();
    Future.microtask(() => createShipment());
  }

   

  Future<void> createShipment() async {
    final _orderController = ref.read(orderControllerProvider);

    DialogBuilder(context).showLoadingIndicator("Loading...");

    

    await _orderController.createShipment({
      "pickup_location": widget.selectedLocation,
      "orderId": widget.orderId,
      "weight": widget.weight,
      "height": widget.height,
      "breadth": widget.breadth,
      "length": widget.length
    });

    DialogBuilder(context).hideOpenDialog();
  }

  

  @override
  Widget build(BuildContext context) {
    final _orderController = ref.watch(orderControllerProvider);

  

    return Scaffold(
      appBar: AppBar(title: Text("Available Courier Services")),
      body: _orderController.availableCouriers.isEmpty
          ? Center(child: Text("No courier services available"))
          : ListView.builder(
              itemCount: _orderController.availableCouriers.length,
              itemBuilder: (context, index) {
                final courier = _orderController.availableCouriers[index];
                bool isSelected = selectedCourierIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCourierIndex = index; // Update selection
                    });

                      _showDateTimePicker(context,courier["courier_company_id"]);
                   
                  },
                  child: Card(
                    margin: EdgeInsets.all(8),
                    elevation: isSelected ? 6 : 2, // Highlight selected
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: isSelected ? BorderSide(color: Colors.blue, width: 2) : BorderSide.none,
                    ),
                    color: isSelected ? Colors.blue.shade50 : Colors.white, // Change background
                    child: ListTile(
  leading: Icon(
    Icons.local_shipping,
    color: isSelected ? Colors.blue : Colors.grey,
  ),
  title: Text(
    courier["courier_name"] ?? "Unknown Courier",
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
  subtitle: Text("Estimated Days: ${courier["estimated_delivery_days"] ?? '-'}"),
  trailing: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "₹${(courier["freight_charge"] is double
                ? courier["freight_charge"]
                : double.tryParse(courier["freight_charge"]?.toString() ?? '0.0') ?? 0.0)
            .toStringAsFixed(2)}",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
      ),
      Text(
        "${(courier["rating"] is double
                ? courier["rating"]
                : double.tryParse(courier["rating"]?.toString() ?? '0.0') ?? 0.0)
            .toStringAsFixed(1)} ⭐",
      ),
    ],
  ),
)



                  ),
                );
              },
            ),
    );
  }
}












