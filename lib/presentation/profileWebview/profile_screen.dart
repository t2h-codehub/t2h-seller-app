import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:share_plus/share_plus.dart';
import 'package:swapnil_s_application4/core/app_export.dart';
import 'package:swapnil_s_application4/core/utils/color_constant.dart';
import 'package:swapnil_s_application4/helper/locator.dart';
import 'package:swapnil_s_application4/helper/user_detail_service.dart';
import 'package:swapnil_s_application4/presentation/profileWebview/image_viewer.dart';
import 'package:swapnil_s_application4/presentation/profileWebview/pdf_viewer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProfileScreenWebview extends StatefulWidget {
  final String? url;

  const ProfileScreenWebview({Key? key, this.url}) : super(key: key);

  @override
  State<ProfileScreenWebview> createState() => _ProfileScreenWebviewState();
}

class _ProfileScreenWebviewState extends State<ProfileScreenWebview> {
  late final WebViewController controller;
  final UserDetailService _userDetailService = getIt<UserDetailService>();

  // String url = "";
  @override
  void initState() {
    super.initState();
    // id = _userDetailService.userDetailResponse?.user?.id ?? "";

    // controller = WebViewController()..loadRequest(
    //     // Uri.parse(
    //     //     "https://taptohello.com/profile/${_userDetailService.userDetailResponse?.user?.id}"),

    //     Uri.parse("https://taptohello.com/profile/$id"));
    // print(Uri.parse(
    //     "https://taptohello.com/profile/" + "6474c5069dae4d98a71b2a32"));
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
            if (!request.url
                .startsWith('https://myhello.store/${_userDetailService.userDetailResponse?.user?.username}')) {
              _launchURL(request.url);
              return NavigationDecision.prevent;
            } else {
              return _launchURL(request.url);
            }
          }))
      ..loadRequest(Uri.parse(widget.url == null
          ? "https://myhello.store/${_userDetailService.userDetailResponse?.user?.username}"
          : widget.url ?? ""));
    print("this is profile "
        "https://myhello.store/${_userDetailService.userDetailResponse?.user?.username}");
  }

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
          "Preview HelloStore",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              debugPrint('My User ID: ${_userDetailService.userDetailResponse?.user?.id}');
              Clipboard.setData(ClipboardData(
                  text: (_userDetailService
                                  .userDetailResponse?.user?.username !=
                              "" &&
                          _userDetailService
                                  .userDetailResponse?.user?.username !=
                              null)
                      ? "https://myhello.store/${_userDetailService.userDetailResponse?.user?.username}"
                      : "https://myhello.store/${_userDetailService.userDetailResponse?.user?.id}"));
              Share.share(
                  "https://myhello.store/${_userDetailService.userDetailResponse?.user?.username}");
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                "assets/images/share.png",
                height: 24,
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
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
    } else if (url.contains(".vcf")) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalNonBrowserApplication,
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
