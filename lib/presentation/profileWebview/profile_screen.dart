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
  // Stop any loading in the WebView
  _webViewController.stopLoading();

  // Clear the cache (use the static method correctly)
  InAppWebViewController.clearAllCache(includeDiskFiles: true);

  // Delete all cookies
  CookieManager().deleteAllCookies();

  // Dispose the WebView controller
  _webViewController.dispose();

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
          "Preview SocioShop",
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



