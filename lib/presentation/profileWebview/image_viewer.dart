import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taptohello/core/constants.dart';
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
        body: CachedNetworkImage(
  imageUrl: (widget.imageUrl != null && widget.imageUrl.isNotEmpty)
      ? (widget.imageUrl.contains(AppConstants.imageBaseUrl)
          ? widget.imageUrl
          : AppConstants.imageBaseUrl + widget.imageUrl)
      : "https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651_640.png", // fallback
  fit: BoxFit.cover,
  placeholder: (context, url) =>
      const Center(child: CircularProgressIndicator(strokeWidth: 2)),
  errorWidget: (context, url, error) => const Icon(Icons.error),
)

        //Image.network(widget.imageUrl)
        );
  }
}
