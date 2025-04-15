import 'package:collection/collection.dart';
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

  //  List storePolicyFeatures = [
  //   'Shipping Policy',
  //   'Return & Exchange Policy',
  //   'Cancellation Policy'
  // ];

 List<String> storePolicyFeatures = [
  'Shipping Policy',
  'Return & Replacement Policy',
  'Cancellation Policy',
];


List<Policies> apiPolicies = [];
List<Policies> staticPolicies = [];


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

// Future<void> getAddPolicy() async {
//   DialogBuilder(context).showLoadingIndicator("Loading...");
  
//   try {
//     final UserDetailService _userDetailService = getIt<UserDetailService>();
//     final userId = _userDetailService.userDetailResponse?.user?.id;

//     if (userId == null) {
//       print("Error: User ID is null");
//       return;
//     }

//     final response = await _shipmentAndDeliveryPolicyController.getListPolicy(userId);
//     DialogBuilder(context).hideOpenDialog();

//     setState(() {
//       // Ensure static policies always stay at the top
//       List<Policies> staticPolicies = storePolicyFeatures.map((feature) {
//         return Policies(
//           sId: feature.replaceAll(' ', '_'), // Unique ID for static policies
//           policyHeader: feature, 
//           policyDescription: "$feature details will be added here...",
//           policyType: "Default",
//         );
//       }).toList();

//       // Assign the fetched policies below static policies
//       policies = [...staticPolicies, if (response.policies != null) ...response.policies!];
//     });
//   } catch (e) {
//     print("Error fetching policies: $e");
//   }
// }

// Future<void> getAddPolicy() async {
//   DialogBuilder(context).showLoadingIndicator("Loading...");

//   try {
//     final UserDetailService _userDetailService = getIt<UserDetailService>();
//     final userId = _userDetailService.userDetailResponse?.user?.id;

//     if (userId == null) {
//       print("Error: User ID is null");
//       return;
//     }

//     final response = await _shipmentAndDeliveryPolicyController.getListPolicy(userId);
//     DialogBuilder(context).hideOpenDialog();

//     setState(() {
//       final apiPolicies = response.policies ?? [];

//       // Get headers of API policies
//       final apiPolicyHeaders = apiPolicies.map((p) => p.policyHeader).toSet();

//       // Only add static policies if they are not present in API policies
//       List<Policies> staticPolicies = storePolicyFeatures
//           .where((feature) => !apiPolicyHeaders.contains(feature))
//           .map((feature) => Policies(
//                 sId: feature.replaceAll(' ', '_'),
//                 policyHeader: feature,
//                 policyDescription: "$feature details will be added here...",
//                 policyType: "Default",
//               ))
//           .toList();

//       // Combine static + api policies (no duplicates)
//       policies = [...staticPolicies, ...apiPolicies];
//     });
//   } catch (e) {
//     print("Error fetching policies: $e");
//     DialogBuilder(context).hideOpenDialog();
//   }
// }

// Future<void> getAddPolicy() async {
//   DialogBuilder(context).showLoadingIndicator("Loading...");

//   try {
//     final UserDetailService _userDetailService = getIt<UserDetailService>();
//     final userId = _userDetailService.userDetailResponse?.user?.id;

//     if (userId == null) {
//       print("Error: User ID is null");
//       return;
//     }

//     final response = await _shipmentAndDeliveryPolicyController.getListPolicy(userId);
//     DialogBuilder(context).hideOpenDialog();

//     setState(() {
//       final apiPolicies = response.policies ?? [];

//       // Normalize static headers for comparison
//       final lowerCaseStaticHeaders = storePolicyFeatures.map((e) => e.toLowerCase()).toSet();

//       // Separate static and non-static policies from API
//       List<Policies> apiStaticPolicies = apiPolicies.where((p) =>
//         lowerCaseStaticHeaders.contains(p.policyHeader?.toLowerCase() ?? '')).toList();

//       List<Policies> apiCustomPolicies = apiPolicies.where((p) =>
//         !lowerCaseStaticHeaders.contains(p.policyHeader?.toLowerCase() ?? '')).toList();

//       // Filter static policies to add only if not in API
//       List<Policies> missingStaticPolicies = storePolicyFeatures
//           .where((feature) =>
//             !apiStaticPolicies.any((p) => p.policyHeader?.toLowerCase() == feature.toLowerCase()))
//           .map((feature) => Policies(
//                 sId: feature.replaceAll(' ', '_'),
//                 policyHeader: feature,
//                 policyDescription: "$feature details will be added here...",
//                 policyType: "Default",
//               ))
//           .toList();

//       // Final ordered list: API static policies first, then missing static ones, then API custom
//       policies = [...apiStaticPolicies, ...missingStaticPolicies, ...apiCustomPolicies];
//     });
//   } catch (e) {
//     print("Error fetching policies: $e");
//     DialogBuilder(context).hideOpenDialog();
//   }
// }

// Future<void> getAddPolicy() async {
//   DialogBuilder(context).showLoadingIndicator("Loading...");

//   try {
//     final UserDetailService _userDetailService = getIt<UserDetailService>();
//     final userId = _userDetailService.userDetailResponse?.user?.id;

//     if (userId == null) {
//       print("Error: User ID is null");
//       return;
//     }

//     final response = await _shipmentAndDeliveryPolicyController.getListPolicy(userId);
//     DialogBuilder(context).hideOpenDialog();

//     setState(() {
//       final apiPolicies = response.policies ?? [];

//       final apiHeadersLower = apiPolicies
//           .map((e) => e.policyHeader?.toLowerCase())
//           .whereType<String>()
//           .toSet();

//       final List<Policies> staticPolicies = storePolicyFeatures
//           .where((staticHeader) => !apiHeadersLower.contains(staticHeader.toLowerCase()))
//           .map((header) => Policies(
//                 sId: header.replaceAll(' ', '_'),
//                 policyHeader: header,
//                 policyDescription: "$header details will be added here...",
//                 policyType: "Default",
//               ))
//           .toList();

//       policies = [...apiPolicies, ...staticPolicies];
//     });
//   } catch (e) {
//     print("Error fetching policies: $e");
//     DialogBuilder(context).hideOpenDialog();
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
  apiPolicies = response.policies ?? [];

  // Map API headers to lowercase for easy matching
  final Map<String, Policies> apiHeaderMap = {
    for (var policy in apiPolicies)
      policy.policyHeader?.toLowerCase() ?? '': policy,
  };

  // Build the list prioritizing storePolicyFeatures order
  List<Policies> prioritizedPolicies = storePolicyFeatures.map((header) {
    final key = header.toLowerCase();
    if (apiHeaderMap.containsKey(key)) {
      return apiHeaderMap[key]!;
    } else {
      return Policies(
        sId: header.replaceAll(' ', '_'),
        policyHeader: header,
        policyDescription: "$header details will be added here...",
        policyType: header,
      );
    }
  }).toList();

  // Add the remaining API policies that are NOT in storePolicyFeatures
  final additionalApiPolicies = apiPolicies.where((p) =>
      !storePolicyFeatures.map((e) => e.toLowerCase()).contains(p.policyHeader?.toLowerCase()));

  // Final list
  policies = [...prioritizedPolicies, ...additionalApiPolicies];
});


  } catch (e) {
    print("Error fetching policies: $e");
    DialogBuilder(context).hideOpenDialog();
  }
}



// Future<void> getAddPolicy() async {
//   DialogBuilder(context).showLoadingIndicator("Loading...");

//   try {
//     final UserDetailService _userDetailService = getIt<UserDetailService>();
//     final userId = _userDetailService.userDetailResponse?.user?.id;

//     if (userId == null) {
//       print("Error: User ID is null");
//       return;
//     }

//     final response = await _shipmentAndDeliveryPolicyController.getListPolicy(userId);
//     DialogBuilder(context).hideOpenDialog();

//     setState(() {
//       final apiPolicies = response.policies ?? [];

//       // Normalize API policy headers to lowercase for easy comparison
//       final apiPolicyHeadersLower = apiPolicies
//           .map((p) => p.policyHeader?.toLowerCase() ?? '')
//           .toSet();

//       // Filter out static policies that already exist in API response
//       final staticPolicies = storePolicyFeatures
//           .where((feature) => !apiPolicyHeadersLower.contains(feature.toLowerCase()))
//           .map((feature) => Policies(
//                 sId: feature.replaceAll(' ', '_'),
//                 policyHeader: feature,
//                 policyDescription: "$feature details will be added here...",
//                 policyType: "Default",
//               ))
//           .toList();

//       // Put API versions of static policies first, in desired order
//       // final prioritizedApiPolicies = storePolicyFeatures
//       //     .map((feature) => apiPolicies.firstWhere(
//       //         (p) => p.policyHeader?.toLowerCase() == feature.toLowerCase(),
//       //         orElse: () => null))
//       //     .whereType<Policies>()
//       //     .toList();
//       final prioritizedApiPolicies = <Policies>[];

// for (final feature in storePolicyFeatures) {
//   final matchingPolicy = apiPolicies.where((p) =>
//     p.policyHeader?.toLowerCase() == feature.toLowerCase()).toList();

//   if (matchingPolicy.isNotEmpty) {
//     prioritizedApiPolicies.add(matchingPolicy.first);
//   }
// }


//       // Add remaining API policies that aren't part of static
//       final remainingApiPolicies = apiPolicies.where((p) =>
//           !storePolicyFeatures
//               .map((f) => f.toLowerCase())
//               .contains(p.policyHeader?.toLowerCase())).toList();

//       // Final policy list
//       policies = [
//         ...prioritizedApiPolicies,
//         ...remainingApiPolicies,
//         ...staticPolicies,
//       ];
//     });
//   } catch (e) {
//     print("Error fetching policies: $e");
//     DialogBuilder(context).hideOpenDialog();
//   }
// }






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

  // Ensure this is imported



void navigateToPolicyScreen(String policyName) {
  final policyNameLower = policyName.toLowerCase();

  Policies? apiPolicy;

  try {
    apiPolicy = apiPolicies.firstWhere(
      (p) => p.policyHeader?.toLowerCase() == policyNameLower,
    );
  } catch (e) {
    apiPolicy = null;
  }

  if (apiPolicy != null) {
    print('✅ Opening edit screen for: ${apiPolicy.policyHeader}');
    navigateToAnotherScreenEdit(apiPolicy);
  } else {
    print('➕ Not found in API, opening AddPolicyScreen for: $policyName');
    final newPolicy = Policies(
      sId: policyName.replaceAll(' ', '_'),
      policyHeader: policyName,
      policyDescription: "$policyName details will be added here...",
      policyType: policyName,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddPolicyScreen(
          onAdd: _addPolicy,
          policyHeader: policyName,
          policy: newPolicy,
        ),
      ),
    );
  }
}






//   void navigateToPolicyScreen(String policyName) {
//   final policyNameLower = policyName.toLowerCase();

//   Policies? apiPolicy;
//   try {
//     apiPolicy = policies.firstWhere(
//       (p) => (p.policyHeader?.toLowerCase() == policyNameLower),
//     );
//   } catch (e) {
//     apiPolicy = null;
//   }

//   if (apiPolicy != null) {
//     // ✅ Found in API — open Edit screen
//     navigateToAnotherScreenEdit(apiPolicy);
//   } else {
//     // ➕ Not found in API — open Add screen
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => AddPolicyScreen(
//           onAdd: _addPolicy,
//           policyHeader: policyName,
//           policy: Policies(
//             sId: policyName.replaceAll(' ', '_'),
//             policyHeader: policyName,
//             policyDescription: "$policyName details will be added here...",
//             policyType: "Default",
//           ),
//         ),
//       ),
//     );
//   }
// }


//   void navigateToPolicyScreen(String policyName, Policies policy) {
//   final policyNameLower = policyName.toLowerCase();

//   bool isFromApi = policies.any((p) =>
//       p.policyHeader?.toLowerCase() == policyNameLower &&
//       (p.policyType?.toLowerCase() ?? '') != 'default');

//   if (policyNameLower == 'return & exchange policy') {
//     if (isFromApi) {
//       navigateToAnotherScreenEdit(policy);
//     } else {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => AddPolicyScreen(
//             onAdd: _addPolicy,
//             policyHeader: "Return & Exchange Policy",
//             policy: policy,
//           ),
//         ),
//       );
//     }
//   } 
//   else if (policyNameLower == 'shipping policy') {
//     if (isFromApi) {
//       navigateToAnotherScreenEdit(policy);
//     } else {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => AddPolicyScreen(
//             onAdd: _addPolicy,
//             policyHeader: "Shipping Policy",
//             policy: policy,
//           ),
//         ),
//       );
//     }
//   } else if (policyNameLower == 'cancellation policy') {
//     if (isFromApi) {
//       navigateToAnotherScreenEdit(policy);
//     } else {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => AddPolicyScreen(
//             onAdd: _addPolicy,
//             policyHeader: "Cancellation Policy",
//             policy: policy,
//           ),
//         ),
//       );
//     }
//   } else {
//     navigateToAnotherScreenEdit(policy); // For custom policies
//   }
// }


//   void navigateToPolicyScreen(String policyName) {
//     if (policyName == 'Return & Exchange Policy') {
    
//      if (policy.policyHeader?.toLowerCase() == 'return & exchange policy'.toLowerCase()) {
//        navigateToAnotherScreenEdit(policy);
  
// }
//      else{
//     Navigator.push(
//     context,
//     MaterialPageRoute(
//     builder: (context) => AddPolicyScreen(onAdd: _addPolicy,policyHeader: "Return & Exchange Policy",policy: policy ),
//   ),
//   );
//      }

  
  
//     } 
//     else if (policyName == 'Shipping Policy') {
//         if (policy.policyHeader?.toLowerCase() == 'Shipping Policy'.toLowerCase()) {
//        navigateToAnotherScreenEdit(policy);
  
// }
//      else{
//     Navigator.push(
//     context,
//     MaterialPageRoute(
//     builder: (context) => AddPolicyScreen(onAdd: _addPolicy,policyHeader: "Shipping Policy",policy: policy ),
//   ),
//   );
//      }

  
     
//     } 
//     else if (policyName == 'Cancellation Policy') {    
//        if (policy.policyHeader?.toLowerCase() == 'Cancellation Policy'.toLowerCase()) {
//        navigateToAnotherScreenEdit(policy);
  
// }
//      else{
//     Navigator.push(
//     context,
//     MaterialPageRoute(
//     builder: (context) => AddPolicyScreen(onAdd: _addPolicy,policyHeader: "Cancellation Policy",policy: policy ),
//   ),
//   );
//      }

  
//     } else {
//       navigateToAnotherScreenEdit(policy); // Default to edit screen
//     }   
//   }

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
          //  navigateToPolicyScreen(policy.policyHeader!);
          navigateToPolicyScreen(policy.policyHeader ?? '');
            
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




