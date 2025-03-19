import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/profileWebview/image_viewer.dart';
import 'package:taptohello/presentation/profileWebview/pdf_viewer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// class ProfileScreenWebview extends StatefulWidget {
//   final String? url;
//   @override
//   _MyWebViewState createState() => _MyWebViewState();
// }

class ProfileScreenWebview extends StatefulWidget {
  final String? url;

  const ProfileScreenWebview({super.key, this.url});

  @override
  State<ProfileScreenWebview> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<ProfileScreenWebview> {
  late InAppWebViewController _webViewController;
  late InAppWebViewGroupOptions options;
  final UserDetailService _userDetailService = getIt<UserDetailService>();

  @override
  void initState() {
    super.initState();
    options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        javaScriptEnabled: true,
      ),
    );
  }

  @override
void dispose() {
  _webViewController.stopLoading();
  _webViewController.clearCache();
  CookieManager().deleteAllCookies();
  
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      ? "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}"
                      : "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.id}"));
              Share.share(
                  "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}");
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
      body: Container(
        color: Colors.grey,
        child: InAppWebView(
          
          initialUrlRequest: URLRequest(url: WebUri("${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}")),
          initialOptions: options,
          
          onWebViewCreated: (controller) {
            
            _webViewController = controller;
          },
          onReceivedServerTrustAuthRequest: (controller, challenge) async {
            // Here you can handle SSL errors.
            // If you need to accept self-signed or untrusted certificates, you can do so here.
            // Make sure not to use this in production for security reasons.
        
            if (challenge.protectionSpace.host == "${AppConstants.domainName}") {
              return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
            }
           return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
           // return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.CANCEL);
          },
        ),
      ),
    );
  }
}

// class ProfileScreenWebview extends StatefulWidget {
//   final String? url;

//   const ProfileScreenWebview({super.key, this.url});

//   @override
//   State<ProfileScreenWebview> createState() => _ProfileScreenWebviewState();
// }

// class _ProfileScreenWebviewState extends State<ProfileScreenWebview> {
//   late final WebViewController controller;
//   final UserDetailService _userDetailService = getIt<UserDetailService>();

//   // String url = "";
//   @override
//   void initState() {
//     super.initState();

    
    
//     // id = _userDetailService.userDetailResponse?.user?.id ?? "";

//     // controller = WebViewController()..loadRequest(
//     //     // Uri.parse(
//     //     //     "${AppConstants.websiteUrl}profile/${_userDetailService.userDetailResponse?.user?.id}"),

//     //     Uri.parse("${AppConstants.websiteUrl}profile/$id"));
//     // print(Uri.parse(
//     //     "${AppConstants.websiteUrl}profile/" + "6474c5069dae4d98a71b2a32"));
//     if (Platform.isIOS) {
//    controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..loadRequest(Uri.parse(widget.url == null
//           ? "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}"
//           : widget.url ?? ""));
//     print("this is profile "
//         "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}");


//     }
//     else{
//      controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             if (!request.url
//                 .startsWith('${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}')) {
//               _launchURL(request.url);
             
//               return NavigationDecision.prevent;
//             } else {
//               return _launchURL(request.url);
//             }
//           }))
//       ..loadRequest(Uri.parse(widget.url == null
//           ? "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}"
//           : widget.url ?? ""));
//     print("this is profile "
//         "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}");
//     }
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppCol.bgColor,
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: InkWell(
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//           child: Padding(
//               padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//               child: Image.asset(
//                 "assets/images/back.png",
//                 height: 24,
//               )),
//         ),
//         title: Text(
//           "Preview HelloStore",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 17,
//           ),
//         ),
//         actions: [
//           InkWell(
//             onTap: () {
//               debugPrint('My User ID: ${_userDetailService.userDetailResponse?.user?.id}');
//               Clipboard.setData(ClipboardData(
//                   text: (_userDetailService
//                                   .userDetailResponse?.user?.username !=
//                               "" &&
//                           _userDetailService
//                                   .userDetailResponse?.user?.username !=
//                               null)
//                       ? "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}"
//                       : "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.id}"));
//               Share.share(
//                   "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}");
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Image.asset(
//                 "assets/images/share.png",
//                 height: 24,
//               ),
//             ),
//           ),
//         ],
//         centerTitle: true,
//       ),
//       body: 
      
      
//       SizedBox(
//         height: MediaQuery.of(context).size.height,
//         child: WebViewWidget(
//           controller: controller,
//         ),
//       ),
//     );
//   }

//   onTapArrowleft5(BuildContext context) {
//     Navigator.pop(context);
//   }

//   _launchURL(String url) async {
//     if (!url.contains("s3")) {
//       await launchUrl(
//         Uri.parse(url),
//         mode: LaunchMode.externalApplication,
//       );
//     } else if (url.contains(".vcf")) {
//       await launchUrl(
//         Uri.parse(url),
//         mode: LaunchMode.externalNonBrowserApplication,
//       );
//     } else if (url.contains(".pdf")) {
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => PdfViewer(pdfUrl: url),
//       ));
//     } else {
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => ImageViewer(imageUrl: url),
//       ));
//     }
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     controller.clearLocalStorage();
//   }
// }
