import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/constants.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/instagramOAuthApiResModel.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/AddProduct/AddProductController/addProductController.dart';
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/InstagramAuth/instagramAuthWebViewPage.dart';
import 'package:swapnil_s_application4/services/shared_preference_service.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class InstagramLoginScreen extends StatefulWidget {
  final Function(dynamic) authResponse;
  const InstagramLoginScreen({super.key, required this.authResponse});

  @override
  State<InstagramLoginScreen> createState() => _InstagramLoginScreenState();
}

class _InstagramLoginScreenState extends State<InstagramLoginScreen> {
  InstagramAuthResModel instagramAuthResModel = InstagramAuthResModel();

  final String appId = '1035382131630572';
  final String appSecret = 'be57d4973b9ac427079b32e2cbaee6ef';
  final String redirectUri =
      '${AppConstants.baseUrl}user/auth/instagram/callback'; // Must be the same as registered with Instagram
  WebViewController? _controller;

  @override
  void initState() {
    final String authUrl = 'https://api.instagram.com/oauth/authorize'
        '?client_id=$appId'
        '&redirect_uri=$redirectUri'
        '&scope=user_profile,user_media'
        '&response_type=code';
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith(redirectUri)) {
            final Uri uri = Uri.parse(request.url);
            final String? code = uri.queryParameters['code'];

            if (code != null) {
              // Close the WebView and exchange the authorization code for an access token
              _exchangeCodeForToken(code);
            }

            return NavigationDecision.prevent; // Stop navigation after login
          }
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse(authUrl)); // Load the Instagram login URL
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('My instagram auth api res model length is: ${instagramAuthResModel.products?.length}');
    // if(instagramAuthResModel.products?.length != 0) {
    //
    // }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Instagram Auth',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: WebViewWidget(
        controller: _controller!,
      ),
    );
  }

  Future<void> _exchangeCodeForToken(String code) async {
    debugPrint('This is my code: $code');
    final tokenUrl = 'https://api.instagram.com/oauth/access_token';

    try {
      final response = await http.post(
        Uri.parse(tokenUrl),
        body: {
          'client_id': appId,
          'client_secret': appSecret,
          'grant_type': 'authorization_code',
          'redirect_uri': redirectUri,
          'code': code,
        },
      );

      if (response.statusCode == 200) {
        final tokenResponse = json.decode(response.body);

        if (tokenResponse['access_token'] != null) {
          final accessToken = tokenResponse['access_token'];
          print(
              "Access Token: $accessToken"); // Debug: Check if access token is received
          await _fetchInstagramPosts(accessToken);
        } else {
          print(
              "Access Token not found in response: ${tokenResponse['error']}"); // Debug: No access token
        }
      } else {
        print(
            "Error response from Instagram: ${response.body}"); // Debug: Failed response
      }
    } catch (e) {
      print(
          "Error during token exchange: $e"); // Debug: Handle any exception that occurs
    }
  }

  // Function to fetch user posts using the access token
  Future<void> _fetchInstagramPosts(String accessToken) async {
    final postsUrl = 'https://graph.instagram.com/me/media?fields=id,caption,media_url,thumbnail_url&access_token=$accessToken';

    try {
      final response = await http.get(Uri.parse(postsUrl));
      if (response.statusCode == 200) {
        final posts = json.decode(response.body);
        widget.authResponse(posts);
        Navigator.pop(context, posts);
      } else {
        print("Error fetching posts: ${response.body}");
      }
    } catch (e) {
      print("Error fetching Instagram posts: $e");
    }
  }

  /*void _navigateToInstagramAuthPage(body) {
      instagramAuthResModel = InstagramAuthResModel.fromJson(body);

    // Ensure the data is valid before navigating
    if (instagramAuthResModel.products?.length == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InstagramAuthWebViewPage(
            instagramAuthResModel: instagramAuthResModel,
          ),
        ),
      );
    } else {
      print("Data not available, cannot navigate.");
    }
  }*/

}
