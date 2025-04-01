import 'package:flutter/material.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/presentation/howToTap/android_smart.dart';
import 'package:taptohello/presentation/howToTap/hello_qr.dart';
import 'package:taptohello/presentation/howToTap/newer_iphone.dart';
import 'package:taptohello/presentation/howToTap/older_iphone.dart';

class Scene extends StatelessWidget {
  const Scene({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppCol.bgColor,
        resizeToAvoidBottomInset: false,
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
              Text("How to Tap a Smarter Hello",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  )),
              Text("Choose the device you are sharing to",
                  style: TextStyle(
                    color: Color(0xFF606D93),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 12, right: 12),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HelloQr(),
                  ));
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Network smarter using Hello QR code",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(height: 16),
                          Text("All phones",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff666666),
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(width: 80),
                    Image.asset(
                      "assets/how/qr.png",
                      height: 78,
                      width: 94,
                    )
                  ]),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewerIphone(),
                  ));
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tap a smarter Hello to newer iPhones",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(height: 16),
                          Text("iPhone XR, XS, 11, 12, 13",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff666666),
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(width: 80),
                    Image.asset(
                      "assets/how/newI.png",
                      height: 78,
                      width: 94,
                    )
                  ]),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AndroidSmart(),
                  ));
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tap a smarter Hello to Android smartphones",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(height: 16),
                          Text("All android with NFC",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff666666),
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(width: 80),
                    Image.asset(
                      "assets/how/and.png",
                      height: 78,
                      width: 94,
                    )
                  ]),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OlderIphone(),
                  ));
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tap a smarter Hello to older iPhones",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(height: 16),
                          Text("iPhone 6, 7, 8, X",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff666666),
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(width: 80),
                    Image.asset(
                      "assets/how/oldI.png",
                      height: 78,
                      width: 94,
                    )
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
