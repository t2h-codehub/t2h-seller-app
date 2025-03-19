// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:taptohello/core/constants.dart';
// import 'package:taptohello/data/productCategoryModel/instagramOAuthApiResModel.dart';
// import 'package:http/http.dart' as http;
// import 'package:webview_flutter/webview_flutter.dart';

// class InstagramLoginScreen extends StatefulWidget {
//   final Function(dynamic) authResponse;
//   const InstagramLoginScreen({super.key, required this.authResponse});

//   @override
//   State<InstagramLoginScreen> createState() => _InstagramLoginScreenState();
// }

// class _InstagramLoginScreenState extends State<InstagramLoginScreen> {
//   InstagramAuthResModel instagramAuthResModel = InstagramAuthResModel();

 
//   bool _isLoading = true;
//   final String redirectUri =
//       '${AppConstants.baseUrl}user/auth/instagram/callback'; // Must be the same as registered with Instagram
//   WebViewController? _controller;
//   late WebViewController _webViewController;


//     void _loadAuthUrl(String authUrl) {
//     _webViewController.loadRequest(Uri.parse(authUrl)); 
//     setState(() {
//       _isLoading = false; // Hide loading indicator when the URL is loaded
//     });

//     // Handle callback URL and get the authorization code
//     _webViewController.setNavigationDelegate(
//       NavigationDelegate(
//         onNavigationRequest: (NavigationRequest request) {
//           if (request.url.startsWith('${AppConstants.baseUrl}user/auth/instagram/callback')) {
//             final Uri uri = Uri.parse(request.url);
//             final String? code = uri.queryParameters['code'];

//             if (code != null) {
//              _exchangeCodeForToken(code); // Fetch Instagram posts using the authorization code
//               Navigator.pop(context); // Close the current screen after getting the code
//             }
//             return NavigationDecision.prevent; // Prevent the WebView from navigating to the callback URL
//           }
//           return NavigationDecision.navigate; // Allow navigation to other URLs
//         },
//       ),
//     );
//   }

//     @override
//   void initState() {
//     super.initState();
//     _webViewController = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted);
//     _getAuthUrl();
//   }

//   Future<void> _getAuthUrl() async {
//     final String url = 'https://api.mysocio.shop/user/auth/instagram'; // API URL

//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);

//         if (data['success'] == true) {
//           final String authUrl = data['authUrl'];
//           _loadAuthUrl(authUrl);
//         } else {
//           _showErrorSnackbar('Error: Unable to fetch authUrl');
//         }
//       } else {
//         _showErrorSnackbar('Error: Failed to call API. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       _showErrorSnackbar('Error: $e');
//     }
//   }

 

//     @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         iconTheme: IconThemeData(
//           color: Colors.black, // Change your color here
//         ),
//         backgroundColor: Colors.white,
//         title: Text(
//           'Instagram Auth',
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : WebViewWidget(controller: _webViewController),
//     );
//   }

//   Future<void> _exchangeCodeForToken(String code) async {
//     debugPrint('This is my code: $code');
   
//     final callbackUrl = "${AppConstants.baseUrl}user/auth/instagram/callback?code=$code";
    

//     try {
     
    
//       final response = await http.get(Uri.parse(callbackUrl));

  
//       if (response.statusCode == 200) {
//         final tokenResponse = json.decode(response.body);

//         if (tokenResponse['access_token'] != null) {
//           final accessToken = tokenResponse['access_token'];
//           print(
//               "Access Token: $accessToken"); // Debug: Check if access token is received
//           await _fetchInstagramPosts(accessToken);
//         } else {
//           print(
//               "Access Token not found in response: ${tokenResponse['error']}"); // Debug: No access token
//         }
//       } else {
//         print(
//             "Error response from Instagram: ${response.body}"); // Debug: Failed response
//       }
//     } catch (e) {
//       print(
//           "Error during token exchange: $e"); // Debug: Handle any exception that occurs
//     }
//   }

//   Future<void> _fetchInstagramPosts(String accessToken) async {
//     final postsUrl = 'https://graph.instagram.com/me/media?fields=id,caption,media_url,thumbnail_url&access_token=$accessToken';

//     try {
//       final response = await http.get(Uri.parse(postsUrl));
//       if (response.statusCode == 200) {
//         final posts = json.decode(response.body);
//         widget.authResponse(posts);
//         Navigator.pop(context, posts);
//       } else {
//         print("Error fetching posts: ${response.body}");
//       }
//     } catch (e) {
//       print("Error fetching Instagram posts: $e");
//     }
//   }
//  void _showErrorSnackbar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }
 

// }



// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:taptohello/core/constants.dart';
// import 'package:taptohello/data/productCategoryModel/instagramOAuthApiResModel.dart';
// import 'package:http/http.dart' as http;
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class InstagramLoginScreen extends StatefulWidget {
//   final Function(dynamic) authResponse;
//   const InstagramLoginScreen({super.key, required this.authResponse});

//   @override
//   State<InstagramLoginScreen> createState() => _InstagramLoginScreenState();
// }

// class _InstagramLoginScreenState extends State<InstagramLoginScreen> {
//   InstagramAuthResModel instagramAuthResModel = InstagramAuthResModel();
//   bool _isLoading = true;
//   final String redirectUri = '${AppConstants.baseUrl}user/auth/instagram/callback';
//   final String exchangeTokenUrl = '${AppConstants.baseUrl}user/auth/instagram/exchange_long_live_token';
//   // /auth/instagram/exchange_long_live_token
//   late WebViewController _webViewController;

//   @override
//   void initState() {
//     super.initState();
//     _webViewController = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted);
//     _checkForStoredAccessToken();
//   }

  
//   Future<void> _checkForStoredAccessToken() async {
//     final token = await _getAccessToken();
//     if (token != null) {
//       print("Using stored access token.");
//       await _fetchInstagramPosts(token);
//     } else {
//       _getAuthUrl();
//    }
//   }

  
//   Future<void> _getAuthUrl() async {
//     final String url = 'https://api.mysocio.shop/user/auth/instagram';

//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);

//         if (data['success'] == true) {
//           final String authUrl = data['authUrl'];
//           _loadAuthUrl(authUrl);
//         } else {
//           _showErrorSnackbar('Error: Unable to fetch authUrl');
//         }
//       } else {
//         _showErrorSnackbar('Error: Failed to call API. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       _showErrorSnackbar('Error: $e');
//     }
//   }

 
//   void _loadAuthUrl(String authUrl) {
//     _webViewController.loadRequest(Uri.parse(authUrl));
//     setState(() {
//       _isLoading = false;
//     });

//     _webViewController.setNavigationDelegate(
//       NavigationDelegate(
//         onNavigationRequest: (NavigationRequest request) {
//           if (request.url.startsWith(redirectUri)) {
//             final Uri uri = Uri.parse(request.url);
//             final String? code = uri.queryParameters['code'];

//             if (code != null) {
//               _exchangeCodeForToken(code);
//              // Navigator.pop(context);
//             }
//             return NavigationDecision.prevent;
//           }
//           return NavigationDecision.navigate;
//         },
//       ),
//     );
//   }


//   Future<void> _exchangeCodeForToken(String code) async {
//     debugPrint('Authorization code received: $code');

//     final callbackUrl = "$exchangeTokenUrl?code=$code";

//     try {
//       final response = await http.get(Uri.parse(callbackUrl));

//       if (response.statusCode == 200) {
//         final tokenResponse = json.decode(response.body)['data'];

//         if (tokenResponse['access_token'] != null) {
//           final accessToken = tokenResponse['access_token'];
//           print("Access Token: $accessToken");

//           await _saveAccessToken(accessToken);
//           await _fetchInstagramPosts(accessToken);
//         } else {
//           print("Access Token not found in response: ${tokenResponse['error']}");
//         }
//       } else {
//         print("Error response from Instagram: ${response.body}");
//       }
//     } catch (e) {
//       print("Error during token exchange: $e");
//     }
//   }

//   /// Fetch Instagram posts using the access token
//   Future<void> _fetchInstagramPosts([String? token]) async {
//     final accessToken = token ?? await _getAccessToken();
//     if (accessToken == null) {
//       print("No access token found. User may need to log in again.");
//       return;
//     }

//     final postsUrl = 'https://graph.instagram.com/me/media?fields=id,caption,media_url,thumbnail_url&access_token=$accessToken';

//     try {
//       final response = await http.get(Uri.parse(postsUrl));
//       if (response.statusCode == 200) {
//         final posts = json.decode(response.body);
//         widget.authResponse(posts);
//         Navigator.pop(context, posts);
//       } else {
//         print("Error fetching posts: ${response.body}");
//       }
//     } catch (e) {
//       print("Error fetching Instagram posts: $e");
//     }
//   }

//   /// Save access token in SharedPreferences
//   Future<void> _saveAccessToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('instagram_access_token', token);
//   }

//   /// Retrieve access token from SharedPreferences
//   Future<String?> _getAccessToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('instagram_access_token');
//   }

//   /// Show error messages using Snackbar
//   void _showErrorSnackbar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//         backgroundColor: Colors.white,
//         title: const Text(
//           'Instagram Auth',
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : WebViewWidget(controller: _webViewController),
//     );
//   }
// }




import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/data/productCategoryModel/instagramOAuthApiResModel.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InstagramLoginScreen extends StatefulWidget {
  final Function(dynamic) authResponse;
  const InstagramLoginScreen({super.key, required this.authResponse});

  @override
  State<InstagramLoginScreen> createState() => _InstagramLoginScreenState();
}

class _InstagramLoginScreenState extends State<InstagramLoginScreen> {
  InstagramAuthResModel instagramAuthResModel = InstagramAuthResModel();
  bool _isLoading = true;
  bool _isDisposed = false; // Track widget disposal
  final String redirectUri = '${AppConstants.baseUrl}user/auth/instagram/callback';
  final String exchangeTokenUrl = '${AppConstants.baseUrl}user/auth/instagram/exchange_long_live_token';
  
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted);
    _checkForStoredAccessToken();
  }

  @override
  void dispose() {
    _isDisposed = true; // Set disposal flag
    super.dispose();
  }

  /// Check if we already have a valid access token
  Future<void> _checkForStoredAccessToken() async {
    final token = await _getAccessToken();
    if (token != null) {
      print("Using stored access token.");
      await _fetchInstagramPosts(token);
    } else {
      _getAuthUrl();
    }
  }

  /// Get authentication URL from the backend
  Future<void> _getAuthUrl() async {
    final String url = 'https://api.mysocio.shop/user/auth/instagram';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['success'] == true) {
          _loadAuthUrl(data['authUrl']);
        } else {
          _showErrorSnackbar('Error: Unable to fetch authUrl');
        }
      } else {
        _showErrorSnackbar('Error: Failed to call API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      _showErrorSnackbar('Error: $e');
    }
  }

  /// Load authentication URL in WebView
  void _loadAuthUrl(String authUrl) {
    _webViewController.loadRequest(Uri.parse(authUrl));
    setState(() => _isLoading = false);

    _webViewController.setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith(redirectUri)) {
            final Uri uri = Uri.parse(request.url);
            final String? code = uri.queryParameters['code'];
            if (code != null) {
              _exchangeCodeForToken(code);
            //  Navigator.pop(context);
            }
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }

  /// Exchange authorization code for an access token
  Future<void> _exchangeCodeForToken(String code) async {
    debugPrint('Authorization code received: $code');
    final callbackUrl = "$exchangeTokenUrl?code=$code";

    try {
      final response = await http.get(Uri.parse(callbackUrl));

      if (response.statusCode == 200) {
        final tokenResponse = json.decode(response.body)['data'];

        if (tokenResponse['access_token'] != null) {
          final accessToken = tokenResponse['access_token'];
          final int expiresIn = tokenResponse['expires_in']; // Expiration in seconds
          final int expiryTimestamp = DateTime.now().millisecondsSinceEpoch + (expiresIn * 1000);

          print("Access Token: $accessToken, Expiry: $expiryTimestamp");

          await _saveAccessToken(accessToken, expiryTimestamp);
          await _fetchInstagramPosts(accessToken);
        } else {
          print("Access Token not found in response: ${tokenResponse['error']}");
        }
      } else {
        print("Error response from Instagram: ${response.body}");
      }
    } catch (e) {
      print("Error during token exchange: $e");
    }
  }

  /// Fetch Instagram posts using the access token
  Future<void> _fetchInstagramPosts([String? token]) async {
    if (_isDisposed) return; // Prevent API call if widget is disposed

    final accessToken = token ?? await _getAccessToken();
    if (accessToken == null) {
      print("No valid access token found. User may need to log in again.");
      return;
    }

    final postsUrl = 'https://graph.instagram.com/me/media?fields=id,caption,media_url,thumbnail_url&access_token=$accessToken';

    try {
      final response = await http.get(Uri.parse(postsUrl));
      if (response.statusCode == 200) {
        final posts = json.decode(response.body);
        if (!_isDisposed && mounted) {
          widget.authResponse(posts);
          Navigator.pop(context, posts);
        }
      } else {
        print("Error fetching posts: ${response.body}");
      }
    } catch (e) {
      print("Error fetching Instagram posts: $e");
    }
  }

  /// Save access token and expiry timestamp in SharedPreferences
  Future<void> _saveAccessToken(String token, int expiryTimestamp) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('instagram_access_token', token);
    await prefs.setInt('instagram_token_expiry', expiryTimestamp);
  }

  /// Retrieve access token from SharedPreferences
  Future<String?> _getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('instagram_access_token');
    final int? expiryTimestamp = prefs.getInt('instagram_token_expiry');

    if (token == null || expiryTimestamp == null) return null;

    final int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    if (currentTimestamp >= expiryTimestamp) {
      print("Access token has expired.");
      return null; // Token expired
    }

    return token; // Token is valid
  }

  /// Show error messages using Snackbar
  void _showErrorSnackbar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Instagram Auth',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : WebViewWidget(controller: _webViewController),
    );
  }
}



 


// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:taptohello/core/constants.dart';
// import 'package:taptohello/data/productCategoryModel/instagramOAuthApiResModel.dart';
// import 'package:http/http.dart' as http;
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class InstagramLoginScreen extends StatefulWidget {
//   final Function(dynamic) authResponse;
//   const InstagramLoginScreen({super.key, required this.authResponse});

//   @override
//   State<InstagramLoginScreen> createState() => _InstagramLoginScreenState();
// }

// class _InstagramLoginScreenState extends State<InstagramLoginScreen> {
//   InstagramAuthResModel instagramAuthResModel = InstagramAuthResModel();
//   bool _isLoading = true; // To track loading state
//   late WebViewController _webViewController;

//   final String redirectUri =
//       '${AppConstants.baseUrl}user/auth/instagram/callback'; // Must be the same as registered with Instagram

//   final storage = FlutterSecureStorage(); // For securely storing access token

//   @override
//   void initState() {
//     super.initState();
//     _webViewController = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted);
//     _getAuthUrl();
//   }

//   Future<void> _getAuthUrl() async {
//     final String url = 'https://api.mysocio.shop/user/auth/instagram'; // API URL

//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);

//         if (data['success'] == true) {
//           final String authUrl = data['authUrl'];
//           _loadAuthUrl(authUrl);
//         } else {
//           _showErrorSnackbar('Error: Unable to fetch authUrl');
//         }
//       } else {
//         _showErrorSnackbar('Error: Failed to call API. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       _showErrorSnackbar('Error: $e');
//     }
//   }

//   void _loadAuthUrl(String authUrl) {
//     _webViewController.loadRequest(Uri.parse(authUrl)); 
//     setState(() {
//       _isLoading = false; // Hide loading indicator when the URL is loaded
//     });

//     // Handle callback URL and get the authorization code
//     _webViewController.setNavigationDelegate(
//       NavigationDelegate(
//         onNavigationRequest: (NavigationRequest request) {
//           if (request.url.startsWith('${AppConstants.baseUrl}user/auth/instagram/callback')) {
//             final Uri uri = Uri.parse(request.url);
//             final String? code = uri.queryParameters['code'];

//             if (code != null) {
//               _fetchInstagramPosts(code); // Fetch Instagram posts using the authorization code
//               Navigator.pop(context); // Close the current screen after getting the code
//             }
//             return NavigationDecision.prevent; // Prevent the WebView from navigating to the callback URL
//           }
//           return NavigationDecision.navigate; // Allow navigation to other URLs
//         },
//       ),
//     );
//   }

//   void _showErrorSnackbar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   Future<void> _fetchInstagramPosts(String code) async {
//     final callbackUrl = "${AppConstants.baseUrl}user/auth/instagram/callback?code=$code";
//     try {
//       final response = await http.get(Uri.parse(callbackUrl));

//       if (response.statusCode == 200) {
//         final posts = json.decode(response.body);
//         widget.authResponse(posts); // Pass posts to the parent widget
//        // _storeAccessToken(posts['access_token']); // Store the access token
//         Navigator.pop(context); // Close the login screen
//         Navigator.pushReplacementNamed(context, '/home'); // Redirect to home screen
//       } else {
//         _showErrorSnackbar("Error fetching posts: ${response.body}");
//       }
//     } catch (e) {
//       _showErrorSnackbar("Error fetching Instagram posts: $e");
//     }
//   }

//   Future<void> _storeAccessToken(String token) async {
//     await storage.write(key: 'access_token', value: token);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         iconTheme: IconThemeData(
//           color: Colors.black, // Change your color here
//         ),
//         backgroundColor: Colors.white,
//         title: Text(
//           'Instagram Auth',
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : WebViewWidget(controller: _webViewController),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     // Optionally, clear the cache and cookies when done
//     _webViewController.clearCache();
//     //_webViewController.clearCookies();
//   }
// }

