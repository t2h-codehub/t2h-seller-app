import 'package:flutter/material.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/data/PolicyModel/getAllActivePoliciesResponceModel.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/StorePolicy/add_policy_screen.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/StorePolicy/policy_detail_screen.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/StorePolicy/shipmentAndDeliveryPolicyController/shipmentAndDeliveryPolicyController.dart';

import 'CancellationPolicy/cancellationPolicyScreen.dart';
import 'ReturnReplacementPolicy/returnReplacementPolicyScreen.dart';
import 'ShipmentAndDeliveryPolicy/shipmentAndDeliveryPolicyScreen.dart';





class StorePolicyScreen extends StatefulWidget {
  const StorePolicyScreen({super.key});

  @override
  State<StorePolicyScreen> createState() => _StorePolicyScreenState();
}

class _StorePolicyScreenState extends State<StorePolicyScreen> {
  // List<Map<String, String>> policies = [];
  List<Policies> policies = [];

  ShipmentAndDeliveryPolicyController _shipmentAndDeliveryPolicyController = ShipmentAndDeliveryPolicyController();
  GetAllActivePoliciesResponceModel getAllActivePoliciesResponceModel = GetAllActivePoliciesResponceModel();

   List storePolicyFeatures = [
    'Shipping Policy',
    'Return/Replacement Policy',
    'Cancellation Policy'
  ];

 Future<void> deletePlolicy(id) async {
     DialogBuilder(context).showLoadingIndicator("Uploading...");
   // DialogBuilder(context).hideOpenDialog();
  try {
   

    final response = await _shipmentAndDeliveryPolicyController.deletePlolicy(id);
   DialogBuilder(context).hideOpenDialog();
    if (response.message == "Policy deleted successfully") {
      print("Policy deleted successfully");

    await  getAddPolicy();
      setState(() {
        
        // Map the list of policies from the response to your local policies list
        policies = response.policies!;
      });
    }
  } catch (e) {
    print("Error fetching policies: $e");
  }
}

//   Future<void> getAddPolicy() async {
//      DialogBuilder(context).showLoadingIndicator("Uploading...");
//    // DialogBuilder(context).hideOpenDialog();
//   try {
//     final UserDetailService _userDetailService = getIt<UserDetailService>();
//     final userId = _userDetailService.userDetailResponse?.user?.id;

//     if (userId == null) {
//       print("Error: User ID is null");
//       return;
//     }

//     final response = await _shipmentAndDeliveryPolicyController.getListPolicy(userId);
//    DialogBuilder(context).hideOpenDialog();
//     if (response.policies?.isNotEmpty ?? false) {
//       setState(() {
//         // Map the list of policies from the response to your local policies list
//         policies = response.policies!;
//       });
//     }
//   } catch (e) {
//     print("Error fetching policies: $e");
//   }
// }

Future<void> getAddPolicy() async {
  DialogBuilder(context).showLoadingIndicator("Loading...");
  
  try {
    final UserDetailService _userDetailService = getIt<UserDetailService>();
    final userId = _userDetailService.userDetailResponse?.user?.id;

    if (userId == null) {
      print("Error: User ID is null");
      return;
    }

    final response = await _shipmentAndDeliveryPolicyController.getListPolicy(userId);
    DialogBuilder(context).hideOpenDialog();

    setState(() {
      // Ensure static policies always stay at the top
      List<Policies> staticPolicies = storePolicyFeatures.map((feature) {
        return Policies(
          sId: feature.replaceAll(' ', '_'), // Unique ID for static policies
          policyHeader: feature, 
          policyDescription: "$feature details will be added here...",
          policyType: "Default",
        );
      }).toList();

      // Assign the fetched policies below static policies
      policies = [...staticPolicies, if (response.policies != null) ...response.policies!];
    });
  } catch (e) {
    print("Error fetching policies: $e");
  }
}



  void _deletePolicy(String id) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Delete Policy"),
      content: const Text("Are you sure you want to delete this policy?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            setState(() {
             // policies.removeWhere((policy) => policy.sId == id); // Use policy.sId
              deletePlolicy(id);
            });
            Navigator.pop(context);
          },
          child: const Text("Delete", style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
}


  void _editPolicy(String id, String newHeader, String newDescription, String newtype) {
  setState(() {
    for (var policy in policies) {
      if (policy.sId == id) { // Use policy.sId
        policy.policyHeader = newHeader;
        policy.policyDescription = newDescription;
        policy.policyType = newtype;
        break;
      }
    }
  });
}


  void _addPolicy(Policies newPolicy) {
  setState(() {
    policies.add(newPolicy);
  });
}

  @override
  void initState() {
    super.initState();
    Future.microtask(() => getAddPolicy());
  //  _initializePolicy();
  }

  void navigateToAnotherScreen() async {
  // Push another screen and wait for result after returning
  await Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => AddPolicyScreen(onAdd: _addPolicy),
  ),
  );

  // After returning to this screen, call getAddPolicy() again
  Future.microtask(() => getAddPolicy());
}

 void navigateToAnotherScreenEdit(Policies policy) async {
 

  await Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => PolicyDetailScreen(
      policy: policy, // Pass the Policies object
       onDelete: _deletePolicy,
      onEdit: _editPolicy,
    ),
  ),
  );

  // After returning to this screen, call getAddPolicy() again
  Future.microtask(() => getAddPolicy());
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop Policies"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: policies.isEmpty
                ? const Center(child: Text("No policies available"))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: policies.length,
                    itemBuilder: (context, index) {
  final policy = policies[index];

  bool isStaticPolicy = storePolicyFeatures.contains(policy.policyHeader);

  void navigateToPolicyScreen(String policyName) {
    if (policyName == 'Return/Replacement Policy') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReturnReplacementPolicyScreen()),
      );
    } else if (policyName == 'Shipping Policy') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShipmentAndDeliveryPolicyScreen()),
      );
    } else if (policyName == 'Cancellation Policy') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CancellationPolicyScreen()),
      );
    } else {
      navigateToAnotherScreenEdit(policy); // Default to edit screen
    }
  }

  return Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 4,
          spreadRadius: 1,
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            policy.policyHeader!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.edit, color: AppCol.primary),
          onPressed: () {
            navigateToPolicyScreen(policy.policyHeader!);
          },
        ),
        if (!isStaticPolicy) // Remove delete button for static policies
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => _deletePolicy(policy.sId!),
          ),
      ],
    ),
  );
},

//                    itemBuilder: (context, index) {
//   final policy = policies[index];

//   bool isStaticPolicy = storePolicyFeatures.contains(policy.policyHeader);

//   return Container(
//     padding: const EdgeInsets.all(16),
//     margin: const EdgeInsets.only(bottom: 12),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(12),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.1),
//           blurRadius: 4,
//           spreadRadius: 1,
//         ),
//       ],
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child: Text(
//             policy.policyHeader!,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         IconButton(
//           icon: Icon(Icons.edit, color: AppCol.primary),
//           onPressed: () {
//             navigateToAnotherScreenEdit(policy);
//           },
//         ),
//         if (!isStaticPolicy) // ❌ Remove delete button for static policies
//           IconButton(
//             icon: const Icon(Icons.delete, color: Colors.red),
//             onPressed: () => _deletePolicy(policy.sId!),
//           ),
//       ],
//     ),
//   );
// },


//                   itemBuilder: (context, index) {
//   final policy = policies[index];
//   return Dismissible(
//     key: Key(policy.sId!), // Use policy.sId
//     direction: DismissDirection.endToStart,
//     background: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       alignment: Alignment.centerRight,
//       color: Colors.red,
//       child: const Icon(Icons.delete, color: Colors.white),
//     ),
//     onDismissed: (direction) {
//       _deletePolicy(policy.sId!); // Use policy.sId
//     },
//     child: Container(
//       padding: const EdgeInsets.all(16),
//       margin: const EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 4,
//             spreadRadius: 1,
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Text(
//               policy.policyHeader!, // Use policy.policyType
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.edit, color: AppCol.primary),
            
//             onPressed:() {
//               navigateToAnotherScreenEdit(policy);
//             },

//           ),
//           IconButton(
//             icon: const Icon(Icons.delete, color: Colors.red),
//             onPressed: () => _deletePolicy(policy.sId!), // Use policy.sId
//           ),
//         ],
//       ),
//     ),
//   );
// }

                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                onPressed: navigateToAnotherScreen,

                child: 
                Ink(
  decoration: BoxDecoration(
    color: AppCol.primary, // Set your desired background color here
    borderRadius: BorderRadius.circular(30),
    
  ),
  child: Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: const Text(
      "➕ Add New Policy",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 1.2,
      ),
    ),
  ),
)

             
             
              ),
            ),
          ),
        ],
      ),
    );
  }
}




