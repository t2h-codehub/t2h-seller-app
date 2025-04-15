


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'dart:math';

import 'package:taptohello/data/PolicyModel/getAllActivePoliciesResponceModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/StorePolicy/shipmentAndDeliveryPolicyController/shipmentAndDeliveryPolicyController.dart';

class AddPolicyScreen extends StatefulWidget {
  final Function(Policies) onAdd;
  final Policies? policy;
  final String? policyHeader;

  const AddPolicyScreen({super.key, required this.onAdd, this.policyHeader, this.policy});

  @override
  State<AddPolicyScreen> createState() => _AddPolicyScreenState();
}

class _AddPolicyScreenState extends State<AddPolicyScreen> {
  final TextEditingController _policyTypeController = TextEditingController();
  final TextEditingController _policyHeaderController = TextEditingController();
  
  final TextEditingController _policyDescriptionController = TextEditingController();

ShipmentAndDeliveryPolicyController _shipmentAndDeliveryPolicyController = ShipmentAndDeliveryPolicyController();
   GetAllActivePoliciesResponceModel getAllActivePoliciesResponceModel = GetAllActivePoliciesResponceModel();



addListPolicy() async {
  // Validate input fields
  if (_policyTypeController.text.trim().isEmpty ||
      _policyHeaderController.text.trim().isEmpty ||
      _policyDescriptionController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please fill all fields")),
    );
    return;
  }

  Map<String, dynamic> body = {
    "policies": [
      {
        "policy_type": _policyTypeController.text.trim(),
        "policy_header": _policyHeaderController.text.trim(),
        "policy_description": _policyDescriptionController.text.trim()
      }
    ]
  };

  try {
      DialogBuilder(context).showLoadingIndicator("Uploading...");
    getAllActivePoliciesResponceModel =
        await _shipmentAndDeliveryPolicyController.addListPolicy(body);

    // Check if the response contains policies
     DialogBuilder(context).hideOpenDialog();
    if ((getAllActivePoliciesResponceModel.policies ?? []).isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("New policy added successfully!")),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to add policy. Please try again.")),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error: ${e.toString()}")),
    );
  }
}

void initState() {
    super.initState();
  _policyHeaderController.text = widget.policy?.policyHeader ?? '';
_policyTypeController.text = widget.policy?.policyType ?? '';
_policyDescriptionController.text = widget.policy?.policyDescription ?? '';

     
    
    // _headerController = TextEditingController(text: widget.policy.policyHeader);
    // _descriptionController = TextEditingController(text: widget.policy.policyDescription);
    // _policyTypeController = TextEditingController(text: widget.policy.policyType);
    // _isPolicyEnabled = widget.policy.status == "active"; // Assuming "active" is the enabled status
  }



  @override
  void dispose() {
    _policyTypeController.dispose();
    _policyHeaderController.dispose();
    _policyDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Policy"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Policy Type", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            TextField(
              controller: _policyTypeController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const Text("Policy Header", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            TextField(
              controller: _policyHeaderController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const Text("Policy Description", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            TextField(
              controller: _policyDescriptionController,
              maxLines: 4,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addListPolicy,
                child: const Text("Save Policy"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
