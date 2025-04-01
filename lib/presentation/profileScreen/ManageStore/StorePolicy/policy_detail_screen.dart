import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'package:taptohello/data/PolicyModel/getAllActivePoliciesResponceModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/StorePolicy/shipmentAndDeliveryPolicyController/shipmentAndDeliveryPolicyController.dart';




class PolicyDetailScreen extends StatefulWidget {
  final Policies policy;

  const PolicyDetailScreen({
    super.key,
    required this.policy,
    required void Function(String id) onDelete,
    required void Function(String id, String newHeader, String newDescription, String newType) onEdit,
  });

  @override
  State<PolicyDetailScreen> createState() => _PolicyDetailScreenState();
}

class _PolicyDetailScreenState extends State<PolicyDetailScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _headerController;
  late TextEditingController _descriptionController;
  late TextEditingController _policyTypeController;
  late bool _isPolicyEnabled;

  ShipmentAndDeliveryPolicyController _shipmentAndDeliveryPolicyController = ShipmentAndDeliveryPolicyController();
  GetAllActivePoliciesResponceModel getAllActivePoliciesResponceModel = GetAllActivePoliciesResponceModel();

  @override
  void initState() {
    super.initState();
    _headerController = TextEditingController(text: widget.policy.policyHeader);
    _descriptionController = TextEditingController(text: widget.policy.policyDescription);
    _policyTypeController = TextEditingController(text: widget.policy.policyType);
    _isPolicyEnabled = widget.policy.status == "active"; // Assuming "active" is the enabled status
  }

  @override
  void dispose() {
    _headerController.dispose();
    _descriptionController.dispose();
    _policyTypeController.dispose();
    super.dispose();
  }

  void updateListPolicy() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Map<String, dynamic> body = {
      
          "policy_type": _policyTypeController.text.trim(),
          "policy_header": _headerController.text.trim(),
          "policy_description": _descriptionController.text.trim(),
          "status": _isPolicyEnabled ? "active" : "inactive", // Update status
        
      
    };

    try {
      DialogBuilder(context).showLoadingIndicator("Uploading...");
      getAllActivePoliciesResponceModel = await _shipmentAndDeliveryPolicyController.addListUpdatePolicy(body,widget.policy.sId,);
      DialogBuilder(context).hideOpenDialog();

      if (getAllActivePoliciesResponceModel.success == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Policy updated successfully!")),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to update policy. Please try again.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Policy"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Policy Type", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _policyTypeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Policy Type is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text("Policy Header", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _headerController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Policy Header is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text("Policy Description", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Policy Description is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Policy Status", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Switch(
                    value: _isPolicyEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isPolicyEnabled = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: updateListPolicy,
                  child: const Text("Save Changes"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





