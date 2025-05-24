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
  bool _isDisposed = false;

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
    _isDisposed = true;
    if (!_isDisposed) {
      _webViewController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_webViewController != null) {
          if (await _webViewController.canGoBack()) {
            await _webViewController.goBack();
            return false;
          }
        }
        return true;
      },
      child: Scaffold(
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
              ),
            ),
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
            initialUrlRequest: URLRequest(
              url: WebUri("${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}"),
            ),
            initialOptions: options,
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            onReceivedServerTrustAuthRequest: (controller, challenge) async {
              if (challenge.protectionSpace.host == "${AppConstants.domainName}") {
                return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
              }
              return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
            },
          ),
        ),
      ),
    );
  }
}



