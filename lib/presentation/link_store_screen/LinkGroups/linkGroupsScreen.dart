import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/presentation/link_store_screen/LinkGroups/addLinkToGroupScreen.dart';

class LinkGroupsScreen extends StatefulWidget {
  const LinkGroupsScreen({super.key});

  @override
  State<LinkGroupsScreen> createState() => _LinkGroupsScreenState();
}

class _LinkGroupsScreenState extends State<LinkGroupsScreen> {
  List<LinkGroups> linkGroupsItems = [
    LinkGroups(linkGroupsText: 'Title Link Group 1'),
    LinkGroups(linkGroupsText: 'Title Link Group 2'),
    LinkGroups(linkGroupsText: 'Title Link Group 3'),
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
          'Link Groups',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          /// Add New Group Button
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddLinkToGroupScreen(),
                ),
              );
            },
            child: Row(
              children: [
                /// plus icon
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppCol.primary,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                SizedBox(width: 8),

                Text(
                  'Add New Group',
                  style: TextStyle(
                    color: AppCol.primary,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: linkGroupsItems.length,
        padding: EdgeInsets.only(top: 16),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 24, right: 24, bottom: 16),
            padding: EdgeInsets.only(top: 18, bottom: 18, left: 14, right: 14),
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
                SizedBox(width: 10),
                Text(
                  '${linkGroupsItems[index].linkGroupsText}',
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.cancel_outlined,
                    size: 28,
                    color: Color(0xFF858585),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// ---------- Class Link Groups -----------
class LinkGroups {
  String? linkGroupsText;

  LinkGroups({required this.linkGroupsText});
}
