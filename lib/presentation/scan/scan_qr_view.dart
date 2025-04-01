import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/presentation/profileWebview/image_viewer.dart';
import 'package:taptohello/presentation/profileWebview/pdf_viewer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ScanQrView extends StatefulWidget {
  const ScanQrView({super.key});

  @override
  State<ScanQrView> createState() => _ScanQrViewState();
}

class _ScanQrViewState extends State<ScanQrView> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  String? _result;
  Uri? url;
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      _buildQrView(context),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          // XFile? res = await ImagePicker()
                          //     .pickImage(source: ImageSource.gallery);
                    final picker = ImagePicker();
                               final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
   
   
  }
                          // String? str = await Scan.parse(res!.path);
                         
                                                                          },
                        child: Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(top: 10, right: 10),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              Icons.photo,
                              color: AppCol.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (url != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => QrProfileScreenWebview(
                                  url: url.toString(),
                                )));
                        // Navigator.pop(context, url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please scan Qr code properly")));
                      }
                    },
                    child: Container(
                      height: 80,
                      width: 100,
                      margin: EdgeInsets.only(bottom: 80),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Color(0xFFF05323), shape: BoxShape.circle),
                      child: Icon(
                        Icons.camera,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 450 ||
            MediaQuery.of(context).size.height < 450)
        ? 200.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      print(scanData.code.toString());
      Uri uri = Uri.parse(result?.code ?? "");
      url = uri;
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    print('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class QrProfileScreenWebview extends StatefulWidget {
  final String? url;
  const QrProfileScreenWebview({super.key, this.url});

  @override
  State<QrProfileScreenWebview> createState() => _QrProfileScreenWebviewState();
}

class _QrProfileScreenWebviewState extends State<QrProfileScreenWebview> {
  late WebViewController controller;
  // final UserDetailService _userDetailService = getIt<UserDetailService>();
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
            if (!request.url.startsWith('${AppConstants.storeUrl}')) {
              _launchURL((request.url));
              return NavigationDecision.prevent;
            } else {
              return _launchURL(request.url);
            }
          }))
      ..loadRequest(Uri.parse(widget.url ?? ""));
    AppConstants.deeplink = null;
    setState(() {});
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
            "Preview Profile",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  "assets/images/share.png",
                  height: 24,
                )),
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
}
