import 'package:flutter/material.dart';

import 'package:taptohello/core/utils/color_constant.dart';

class NewerIphone extends StatefulWidget {
  const NewerIphone({super.key});

  @override
  State<NewerIphone> createState() => _NewerIphoneState();
}

class _NewerIphoneState extends State<NewerIphone> {
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
          title: Text("Newer iPhones",
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              )),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 0, right: 0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tap a smarter Hello to Newer \niPhones",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          Text("iPhone XR, XS, 11, 12, 13, 14",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            height: 16,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(
                            "You can share your Hello profile with newer iPhones by tapping and hold your smart device horizontally near the very top of the iPhone until a push notification appears on the screen of the iPhone.",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                      SizedBox(height: 24),
                      Center(
                        child: Image.asset(
                          "assets/how/new_pho.png",
                          height: 223,
                          // width: 94,
                        ),
                      ),
                      SizedBox(height: 24),
                      Row(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 24.27,
                            height: 26,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/how/alert.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Note',
                            style: TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              // height: 22,
                              letterSpacing: 0.16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'If you are not able to tap and share your profile successfully, then lock their iPhone and unlock it to try again. This will help you in sharing the profile successfully.',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          // height: 20,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  // width: 375,
                  // height: 684,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x19999BA8),
                        blurRadius: 16,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // height: 142,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Perfect Technique',
                                style: TextStyle(
                                  color: Color(0xFF1E1E1E),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Here’s a demo to perform a successful tap',
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        // width: 343,
                        height: 192,
                        decoration: BoxDecoration(color: Color(0xFF1E1E1E)),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 24.27,
                                    height: 26,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/how/qr_orag.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Use your Hello QR Code as a Backup',
                                    style: TextStyle(
                                      color: Color(0xFF1E1E1E),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              'You can always use your Hello QR code as a back-up to share your Hello profile to network if in case you are facing trouble in sharing your profile through hello smart device (Hello Card, Hello Tag, Hello Ring, Hello Band etc) due to NFC not functioning on another device. Your Hello QR code can be shared using multiple sharing options in your application.',
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
