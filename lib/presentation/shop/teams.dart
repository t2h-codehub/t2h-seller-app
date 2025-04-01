import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/presentation/profileWebview/image_viewer.dart';
import 'package:taptohello/presentation/profileWebview/pdf_viewer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TeamsWebview extends StatefulWidget {
  const TeamsWebview({super.key});

  @override
  State<TeamsWebview> createState() => _TeamsWebviewState();
}

class _TeamsWebviewState extends State<TeamsWebview> {
  late final WebViewController controller;
  String url = "";
  @override
  void initState() {
    super.initState();
    
    
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
      ..loadRequest(Uri.parse("${AppConstants.websiteUrl}teams"));
  }

//  ${AppConstants.websiteUrl}profile/6474c5069dae4d98a71b2a32

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
          title: Text(
            "Teams",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          actions: [
            InkWell(
              onTap: () {
                Share.shareUri(Uri.parse("${AppConstants.websiteUrl}teams"));
              },
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    "assets/images/share.png",
                    height: 24,
                  )),
            ),
          ],
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
