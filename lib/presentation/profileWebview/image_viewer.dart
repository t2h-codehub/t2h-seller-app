import 'package:flutter/material.dart';
import 'package:taptohello/core/utils/color_constant.dart';

class ImageViewer extends StatefulWidget {
  final String imageUrl;

  const ImageViewer({super.key, required this.imageUrl});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
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
            "Preview Image",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Image.network(widget.imageUrl));
  }
}
