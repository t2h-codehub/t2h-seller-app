import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
//
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';

class ExportContactView extends StatefulWidget {
  const ExportContactView({super.key});

  @override
  State<ExportContactView> createState() => _ExportContactViewState();
}

class _ExportContactViewState extends State<ExportContactView> {
  final UserDetailService _userDetailService = getIt<UserDetailService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCol.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        title: Column(
          children: [
            Text(
              "Integrations",
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            Text(
              "Export Contacts",
              style: TextStyle(color: Color(0xFF606D93), fontSize: 13),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Export to Zapier",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                      SizedBox(height: 5),
                      Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width / 1.6),
                          child: Text(
                            "Convert your leads into Zapier leads or contacts",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF666666)),
                          ))
                    ],
                  ),
                  Image.asset(
                    "assets/newIcons/zapier.png",
                    height: 56,
                  )
                ]),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              _launchURL(
                  "${AppConstants.websiteUrl}leads/${_userDetailService.userDetailResponse?.user?.id}");
              print(
                  "${AppConstants.websiteUrl}leads/${_userDetailService.userDetailResponse?.user?.id}");
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Export to CSV",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black)),
                        SizedBox(height: 5),
                        Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width / 1.6),
                            child: Text(
                              "Export your contacts as a CSV file. Import to any CRM",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF666666)),
                            ))
                      ],
                    ),
                    Image.asset(
                      "assets/newIcons/csv.png",
                      height: 56,
                    )
                  ]),
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Export to Salesforce",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                      SizedBox(height: 5),
                      Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width / 1.6),
                          child: Text(
                            "Convert your contacts into Salesforce leads or contacts",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF666666)),
                          ))
                    ],
                  ),
                  Image.asset(
                    "assets/newIcons/sales.png",
                    height: 56,
                  )
                ]),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Export to Outlook",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                      SizedBox(height: 5),
                      Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width / 1.6),
                          child: Text(
                            "Convert your contacts into Outlook Contacts",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF666666)),
                          ))
                    ],
                  ),
                  Image.asset(
                    "assets/newIcons/outlook.png",
                    height: 56,
                  )
                ]),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Export to HubSpot",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                      SizedBox(height: 5),
                      Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width / 1.6),
                          child: Text(
                            "Convert your contacts into HubSpot Contacts",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF666666)),
                          ))
                    ],
                  ),
                  Image.asset(
                    "assets/newIcons/hubspot.png",
                    height: 56,
                  )
                ]),
          )
        ]),
      ),
    );
  }

  _launchURL(String urlLink) async {
    final Uri url = Uri.parse(urlLink);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch ${url}l');
    }
  }
}
