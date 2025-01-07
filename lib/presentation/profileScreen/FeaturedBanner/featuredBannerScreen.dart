import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/app_export.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/FeaturedBanner/featuredBannerDialog.dart';

class FeaturedBannerScreen extends StatefulWidget {
  const FeaturedBannerScreen({super.key});

  @override
  State<FeaturedBannerScreen> createState() => _FeaturedBannerScreenState();
}

class _FeaturedBannerScreenState extends State<FeaturedBannerScreen> {
  TextEditingController _linkController = TextEditingController();
  TextEditingController _titleTextForBannerController = TextEditingController();

  bool isUploadImage = false;

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
        title: Text(
          "Featured Banner",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
        actions: [
          /// Add New Group Button
          InkWell(
            onTap: ()
            => showDialog(
                context: context,
                builder: (context) {
                  return FeaturedBannerDialog();
                }),
            child: Row(
              children: [
                Text(
                  'Submit',
                  style: TextStyle(
                    color: AppCol.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Upload files text
            Text(
              'Upload files',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),

            /// Browse Files Container
            isUploadImage
                ? Column(
                    children: [
                      Image.asset(
                        'assets/newIcons/featuredBannerImage.png',
                        width: double.infinity,
                      ),
                      SizedBox(height: 16),

                      /// Upload button
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.only(top: 14, bottom: 14),
                        decoration: BoxDecoration(
                          color: AppCol.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Edit cover',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              color: Colors.white,
                              Icons.mode_edit_outline_outlined,
                              size: 22,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : InkWell(
                    onTap: () {
                      isUploadImage = true;
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                          strokeAlign: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          /// Image
                          Image.asset(
                            'assets/newIcons/uploadFiles.png',
                            height: 40,
                            width: 40,
                          ),

                          /// Browse files text
                          Text(
                            'Browse files',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),

                          /// Supported format text
                          Text(
                            'Supported format: PNG, JPG (Max file size : 5mb)',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(height: 16),

                          /// Upload button
                          Container(
                            padding: EdgeInsets.only(top: 14, bottom: 14),
                            decoration: BoxDecoration(
                              color: AppCol.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Upload',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            SizedBox(height: 16),

            /// Link Field
            Container(
              child: TextFormField(
                controller: _linkController,
                decoration: InputDecoration(
                  labelText: 'Link',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Enter the Link',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),

            /// Title text for the banner Field
            Container(
              child: TextFormField(
                controller: _titleTextForBannerController,
                decoration: InputDecoration(
                  labelText: 'Title text for the banner',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Enter the Title Text for the banner',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
