

import 'package:flutter/material.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'package:taptohello/data/productCategoryModel/addRibbonInfoResponceModel.dart';
import 'package:taptohello/presentation/link_store_screen/addData/addLinkController.dart';


/// ---------- Add Group Dialog ----------
class AddGroupDialog extends StatefulWidget {
  final int? length;
  AddGroupDialog(this.length);

   
  

  @override
  _AddGroupDialogState createState() => _AddGroupDialogState();
}

class _AddGroupDialogState extends State<AddGroupDialog> {
  TextEditingController _controller = TextEditingController();

   
     AddCustomRibbonInfo addRibbonInfo = AddCustomRibbonInfo();

   final Addlinkcontroller _AddlinkController = Addlinkcontroller();
 bool _isRequestInProgress = false;
  

  @override
  void initState() {
    super.initState();
    print(widget.length);
   // Future.microtask(() => getFeatureBanner());
    
  }

 



Future<void> addRibbon() async {
  if (_isRequestInProgress) return; // Prevent multiple calls
  _isRequestInProgress = true;

  try {
    DialogBuilder(context).showLoadingIndicator("Loading...");

    int itemCount = (widget.length ?? 0).toInt();
    int nextOrder = itemCount + 1; // Calculate order dynamically

    Map<String, dynamic> payload = {
      "customRibbonInfo": [
        {
          "title": _controller.text.trim(),
          "order": nextOrder.toString(), // Send only one object
        }
      ]
    };

    print("Payload: $payload"); // Debugging

    final response = await _AddlinkController.addCustomRibbonInfo(payload);
    DialogBuilder(context).hideOpenDialog();

    if (response.customRibbonInfo != null && response.customRibbonInfo!.isNotEmpty) {
      setState(() {
        addRibbonInfo = response;
      });
      Navigator.pop(context, _controller.text);
    }
  } catch (e, stackTrace) {
    print("Error fetching banner: $e\n$stackTrace");
  } finally {
    _isRequestInProgress = false; // Reset flag after completion
  }
}



//   Future<void> addFeatureBanner() async {
//   try {
//     DialogBuilder(context).showLoadingIndicator("Loading...");


//   List<Map<String, dynamic>> customRibbonInfo = List.generate(widget.length?.toInt() ?? 0, (index) => {
//       "title": _controller.text.trim(),
//       "order": (index + 1).toString(), // Converts to "1", "2", "3", "4"
//     });

// Map<String, dynamic> payload = {
//   "customRibbonInfo": customRibbonInfo
// };

// print(payload); // Debugging
 
//     final response = await _AddlinkController.addCustomRibbonInfo(payload);
//     DialogBuilder(context).hideOpenDialog();
//       if (response.customRibbonInfo != null && response.customRibbonInfo!.isNotEmpty) {
//       setState(() {
//         addRibbonInfo = response;
//         Navigator.pop(context, _controller.text);
        
//       });
//     }
//   } catch (e, stackTrace) {
//     print("Error fetching banner: $e\n$stackTrace");
//   } 
  
// }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Ribbon'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Enter ribbon name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: addRibbon,
          // () {
          //   Navigator.pop(context, _controller.text);
          // },
          child: Text('Add'),
        ),
      ],
    );
  }
}
