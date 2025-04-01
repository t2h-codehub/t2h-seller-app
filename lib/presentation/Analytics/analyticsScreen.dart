import 'package:flutter/material.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/presentation/profileWebview/image_viewer.dart';
import 'package:taptohello/presentation/profileWebview/pdf_viewer.dart';
import 'package:taptohello/services/shared_preference_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {

  late final WebViewController controller;
  String url = "";
  String userId = "";
  @override
  void initState() {
    super.initState();
    print('My user id is==: $userId');
    getUserId();
    // id = _userDetailService.userDetailResponse?.user?.id ?? "";

    // controller = WebViewController()..loadRequest(
    //     // Uri.parse(
    //     //     "${AppConstants.websiteUrl}profile/${_userDetailService.userDetailResponse?.user?.id}"),

    //     Uri.parse("${AppConstants.websiteUrl}profile/$id"));
    // print(Uri.parse(
    //     "${AppConstants.websiteUrl}profile/" + "6474c5069dae4d98a71b2a32"));

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (!request.url.startsWith('')) {
              _launchURL(request.url);
              return NavigationDecision.prevent;
            } else {
              return _launchURL(request.url);
            }
          }))
      ..loadRequest(Uri.parse("${AppConstants.websiteUrl}analytics/$userId"));
  }

  getUserId() {
    userId = SharedPreferenceService.getString('userId') ?? '';
    setState(() {});
    print('My user ID is: $userId');
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppCol.bgColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          /*leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Image.asset(
                  "assets/images/back.png",
                  height: 24,
                )),
          ),*/
          title: Text(
            "Lifetime Analytics",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          /*actions: [
            InkWell(
              onTap: () {
                Share.shareUri(Uri.parse("${AppConstants.websiteUrl}$userId"));
              },
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    "assets/images/share.png",
                    height: 24,
                  )),
            ),
          ],*/
          centerTitle: true,
        ),
        body: WebViewWidget(
          controller: controller,
        ));
  }

  onTapArrowleft5(BuildContext context) {
    Navigator.pop(context);
  }

  _launchURL(String url) async {
    if (!url.contains("s3")) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else if (url.contains(".pdf")) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PdfViewer(pdfUrl: url),
      ));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ImageViewer(imageUrl: url),
      ));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.clearLocalStorage();
  }

}
