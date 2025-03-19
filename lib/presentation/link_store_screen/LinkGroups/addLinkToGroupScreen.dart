import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/presentation/link_store_screen/LinkGroups/addLinkToGroupDialog.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';

class AddLinkToGroupScreen extends StatefulWidget {
  const AddLinkToGroupScreen({super.key});

  @override
  State<AddLinkToGroupScreen> createState() => _AddLinkToGroupScreenState();
}

class _AddLinkToGroupScreenState extends State<AddLinkToGroupScreen> {
  final TextEditingController _enterLinkGroupTitle = TextEditingController();

  List<AddLinkToGroup> addLinkToGroupItems = [
    AddLinkToGroup(
        isChecked: true, addLinkToGroup: 'Check latest offers on Hello'),
    AddLinkToGroup(
        isChecked: false, addLinkToGroup: 'Watch amazing Hello stories'),
    AddLinkToGroup(isChecked: true, addLinkToGroup: 'Sign up for Hello Buddy'),
    AddLinkToGroup(
        isChecked: true, addLinkToGroup: 'Check latest offers on Hello'),
    AddLinkToGroup(
        isChecked: false, addLinkToGroup: 'Watch amazing Hello stories'),
    AddLinkToGroup(isChecked: false, addLinkToGroup: 'Sign up for Hello Buddy'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        /*iconTheme: IconThemeData(
          color: AppCol.primary,
        ),*/
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Image.asset(
                "assets/images/back.png",
                height: 24,
              )),
        ),
        title: Text(
          'Add Link to Group',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          /// Add New Group Button
          InkWell(
            onTap: () => showDialog(
                context: context,
                builder: (context) {
                  return AddLinkToGroupDialog();
                }),
            child: Row(
              children: [
                Text(
                  'Submit',
                  style: TextStyle(
                    color: AppCol.primary,
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),

            /// Email textfield
            CustomTextFormField(
              controller: _enterLinkGroupTitle,
              maxLines: 100,
              hintText: "Enter Link Group Title",
              margin: getMargin(
                top: 9,
              ),
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 24),

            /// Select and add links to the group
            Text(
              'Select and add links to the group',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            /// Add Link To Group List
            ListView.builder(
              padding: EdgeInsets.only(top: 16),
              shrinkWrap: true,
              itemCount: addLinkToGroupItems.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding:
                      EdgeInsets.only(top: 18, bottom: 18, left: 14, right: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        color: Color(0xff677b8a80),
                      ),
                      SizedBox(width: 6),
                      Checkbox(
                        value: addLinkToGroupItems[index].isChecked,
                        activeColor: AppCol.primary,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        onChanged: (value) {
                          addLinkToGroupItems[index].isChecked = value!;
                          setState(() {});
                        },
                      ),
                      SizedBox(width: 6),
                      Text(
                        addLinkToGroupItems[index].addLinkToGroup,
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20,
                          color: Color(0xFF858585),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// ----------- Add Link To Group -----------
class AddLinkToGroup {
  bool isChecked;
  String addLinkToGroup;

  AddLinkToGroup({required this.isChecked, required this.addLinkToGroup});
}
