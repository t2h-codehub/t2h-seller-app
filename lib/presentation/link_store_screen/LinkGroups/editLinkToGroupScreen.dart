import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/presentation/link_store_screen/LinkGroups/addLinkToGroupScreen.dart';


class EditGroupDialog extends StatefulWidget {
  final String currentName;
  EditGroupDialog({required this.currentName});

  @override
  _EditGroupDialogState createState() => _EditGroupDialogState();
}

class _EditGroupDialogState extends State<EditGroupDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentName);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Ribbon'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Edit ribbon name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, _controller.text);
          },
          child: Text('Save'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller to free up resources.
    super.dispose();
  }
}