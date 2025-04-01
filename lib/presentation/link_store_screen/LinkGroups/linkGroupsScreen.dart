import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'package:taptohello/data/productCategoryModel/customRibbonInfoResponceModel';
import 'package:taptohello/presentation/link_store_screen/LinkGroups/addLinkToGroupScreen.dart';

import 'package:taptohello/presentation/link_store_screen/addData/addLinkController.dart';

import 'editLinkToGroupScreen.dart';

class LinkGroupsScreen extends StatefulWidget {
  const LinkGroupsScreen({super.key});

  @override
  State<LinkGroupsScreen> createState() => _LinkGroupsScreenState();
}

class _LinkGroupsScreenState extends State<LinkGroupsScreen> {
  List<LinkGroups> linkGroupsItems = [
  ];

   CustomRibbonInfoResponceModel getCustomRibbonInfo = CustomRibbonInfoResponceModel();

   final Addlinkcontroller _AddlinkController = Addlinkcontroller();

  void addNewGroup(String groupName) {
    setState(() {
      linkGroupsItems.add(LinkGroups(linkGroupsText: groupName));
    });
  }

  void editGroup(int index, String newGroupName) {
    setState(() {
      linkGroupsItems[index].linkGroupsText = newGroupName;
    });
  }

  void _deleteGroupPopUp(sid) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Delete ribbon"),
      content: const Text("Are you sure you want to delete this ribbon?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            setState(() {
             // policies.removeWhere((policy) => policy.sId == id); // Use policy.sId
              deleteGroup(sid);
            });
            Navigator.pop(context);
          },
          child: const Text("Delete", style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
}

  Future<void> deleteGroup(sid) async {
     DialogBuilder(context).showLoadingIndicator("Uploading...");
   // DialogBuilder(context).hideOpenDialog();
  try {
   

    final response = await _AddlinkController.deleteCustomRibbonInfo(sid);
   DialogBuilder(context).hideOpenDialog();
    if (response.success == true) {
      print(response.message);
     
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('${response.message}')),
      );

    await  getFeatureBanner();
      setState(() {
        
        // Map the list of policies from the response to your local policies list
        // policies = response.policies!;
      });
    }
  } catch (e) {
    print("Error fetching policies: $e");
  }
}

  @override
  void initState() {
    super.initState();
    Future.microtask(() => getFeatureBanner());
  }



  Future<void> getFeatureBanner() async {
  try {
    DialogBuilder(context).showLoadingIndicator("Loading...");
    
    final response = await _AddlinkController.getCustomRibbonInfo();
    if (response != null && mounted) {
      setState(() {
        getCustomRibbonInfo = response;
        // Add the data to the list
        linkGroupsItems = response.customRibbonInfo?.map((item) => LinkGroups(linkGroupsText: item.title ?? ''))?.toList() ?? [];
      });
    }
  } catch (e, stackTrace) {
    print("Error fetching banner: $e\n$stackTrace");
  } finally {
    if (mounted) {
      DialogBuilder(context).hideOpenDialog();
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
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
          'Ribbon',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
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
                  onTap: () async {
                    // Edit group logic (could show a dialog or screen for input)
                    String? editedGroupName = await showDialog(
                      context: context,
                      builder: (context) => EditGroupDialog(
                        currentName: linkGroupsItems[index].linkGroupsText!,
                      ),
                    );
                    if (editedGroupName != null) {
                      editGroup(index, editedGroupName);
                    }
                  },
                   
                  child: Icon(
                    Icons.edit, color: AppCol.primary
                  ),
                ),
                
                SizedBox(width: 20),
               InkWell(
                  onTap: () {
                    _deleteGroupPopUp(getCustomRibbonInfo.customRibbonInfo?[index].sId.toString());
                  },
                  
                  child: Icon(
                   Icons.delete, color: Colors.red
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Show dialog to add new group
          String? newGroupName = await showDialog(
            context: context,
            builder: (context) => AddGroupDialog(getCustomRibbonInfo.customRibbonInfo?.length),
          );
          if (newGroupName != null && newGroupName.isNotEmpty) {
            addNewGroup(newGroupName);
          }
        },
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: AppCol.primary,
      ),
    );
  }
}

/// ---------- Class Link Groups -----------
class LinkGroups {
  String? linkGroupsText;

  LinkGroups({required this.linkGroupsText});
}


