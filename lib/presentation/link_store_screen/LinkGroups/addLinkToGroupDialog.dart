import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';

class AddLinkToGroupDialog extends StatefulWidget {
  const AddLinkToGroupDialog({super.key});

  @override
  State<AddLinkToGroupDialog> createState() => _AddLinkToGroupDialogState();
}

class _AddLinkToGroupDialogState extends State<AddLinkToGroupDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.25,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 8),
                Image.asset(
                  'assets/newIcons/succ.png',
                  height: 50,
                  width: 50,
                ),
                SizedBox(height: 16),
                Text(
                  'Success',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Your Custom Text Links are  successfully added to the Group!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 30,right: 30, top: 10,bottom: 10),
                    decoration: BoxDecoration(
                      color: AppCol.primary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
