import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentOnboardingWebView extends StatefulWidget {
  const PaymentOnboardingWebView({super.key, required this.redirectUrl});

  final String redirectUrl;

  @override
  State<PaymentOnboardingWebView> createState() =>
      _PaymentOnboardingWebViewState();
}

class _PaymentOnboardingWebViewState extends State<PaymentOnboardingWebView> {
  WebViewController _controller = WebViewController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('My redirect url is: ${widget.redirectUrl}');
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          debugPrint('Navigated to URL: ${request.url}');
          final Uri uri = Uri.parse(request.url);

          // Extract callback parameters
          // final String? action = uri.queryParameters['action'];

          debugPrint('Query Parameters: ${uri.queryParameters['sucess']}');

          if (uri.queryParameters['sucess'] == "true") {
            Navigator.pop(context, true);
          } else {
            debugPrint('Available Parameters: ${uri.queryParameters}');
          }

          /*final String? action = uri.queryParameters['action'];
          final String? code = uri.queryParameters['code'];

          debugPrint('My parameters are: $action');
          debugPrint('My parameters are: ${uri.data}');
          debugPrint('My parameters are: ${uri.queryParametersAll}');

          // final String? code = uri.queryParameters['code'];

          if (uri.queryParameters['sucess'] == true) {
            debugPrint('Authorization Code Found: $code');
            Navigator.pop(context, true);
          } else {
            debugPrint('No code parameter found in the callback URL.');
            debugPrint('Available Parameters: ${uri.queryParameters}');
            // Navigator.pop(context, {'error': 'No code found'});
          }*/

          // if (request.url.startsWith(widget.redirectUrl)) {
          //   return NavigationDecision.prevent; // Stop navigation after login
          // }
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse("${widget.redirectUrl}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Cashfree',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: WebViewWidget(
        controller: _controller!,
      ),
    );
  }
}
