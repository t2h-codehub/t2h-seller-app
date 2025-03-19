import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/data/productCategoryModel/instagramOAuthApiResModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/InstagramAuth/instagramAuthWebViewPage.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/InstagramAuth/instagramLogin.dart';
import 'addProductListScreen.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  InstagramAuthResModel instagramAuthResModel = InstagramAuthResModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        /*iconTheme: IconThemeData(
          color: Colors.grey,
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
        centerTitle: false,
        title: Text(
          'Add Product',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            SizedBox(height: 40),

            /// Third Text
            Text(
              'Add a Product',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),

            /// Import From Instagram
            InkWell(
              onTap: () async {
                final value = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InstagramLoginScreen(authResponse: (value) {
                      debugPrint('My vlaue is: $value');
                    },),
                  ),
                );

                if (value != null) {
                  debugPrint('My product length is: $value');
                  debugPrint('My product length is: ${value['data'].length}');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InstagramAuthWebViewPage(instagramAuthResModel: value),));
                } else {
                  print('Auth response is null');
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppCol.gray200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/newIcons/share_insta.png',
                        height: 20, width: 20),
                    SizedBox(width: 10),
                    Text(
                      'Import from Instagram',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            /// OR Text
            Text(
              'OR',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(height: 16),

            /// Add Product Manually Button
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddProductListScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppCol.gray200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/newIcons/add_out.png',
                        height: 20, width: 20),
                    SizedBox(width: 10),
                    Text(
                      'Add Product Manually',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
