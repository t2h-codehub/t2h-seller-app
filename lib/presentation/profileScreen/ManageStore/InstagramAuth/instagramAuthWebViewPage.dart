import 'package:flutter/material.dart';
import 'package:taptohello/data/productCategoryModel/instagramOAuthApiResModel.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/InstagramAuth/instagramAddProductScreen.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:video_player/video_player.dart';

class InstagramAuthWebViewPage extends StatefulWidget {
  const InstagramAuthWebViewPage({super.key, required this.instagramAuthResModel});

  final dynamic instagramAuthResModel;

  @override
  State<InstagramAuthWebViewPage> createState() =>
      _InstagramAuthWebViewPageState();
}

class _InstagramAuthWebViewPageState extends State<InstagramAuthWebViewPage> {
  InstagramAuthResModel instagramAuthResModel = InstagramAuthResModel();

  final Map<int, VideoPlayerController> _videoControllers = {};


  @override
  void initState() {
    super.initState();
    debugPrint('My srdtfgjhhg is: ${widget.instagramAuthResModel}');
    instagramAuthResModel = InstagramAuthResModel.fromJson(widget.instagramAuthResModel);
    debugPrint('My Product is: ${instagramAuthResModel.data?[0].thumbnailUrl}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCol.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset("assets/images/back.png", height: 24),
          ),
        ),
        title: const Text(
          "Instagram Auth",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: widget.instagramAuthResModel['data'].length,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 0,
          childAspectRatio: 4 / 5,
          // childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          bool isMp4 = widget.instagramAuthResModel['data'][index]['thumbnail_url'] == null ? false :
              true;
          if (isMp4) {
            if (!_videoControllers.containsKey(index)) {
              _videoControllers[index] =
                  VideoPlayerController.networkUrl(Uri.parse(
                      '${widget.instagramAuthResModel['data'][index]['media_url']}'));
              _videoControllers[index]!
                  .initialize()
                  .then((_) {
                setState(() {
                  // _isVideoControllerInitialized[index] =
                  // true;
                  _videoControllers[index]!.pause();
                  _videoControllers[index]!.setVolume(0);
                });
              });
            }
          }

          return Container(
            child: Stack(
              children: [
                /// Catalogue Image
               if(widget.instagramAuthResModel['data'][index]['thumbnail_url'] == null ) SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    '${widget.instagramAuthResModel['data'][index]['media_url']}',
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                          child: Image.asset(
                            'assets/newIcons/home_head.png',
                            fit: BoxFit.fill,
                          ));
                    },
                    fit: BoxFit.fill,
                  ),
                ),

                if(widget.instagramAuthResModel['data'][index]['thumbnail_url'] != null ) VideoPlayer(
                    _videoControllers[
                    index]!),

                /// Bottom Section
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.2),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  InstagramAddProductScreen(
                                      imageMedia:
                                      widget.instagramAuthResModel['data'][index]['media_url'] ??
                                          '',
                                      isVideo: isMp4,
                                      descriptionCaption:
                                      widget.instagramAuthResModel['data'][index]['caption'] ??
                                          ''),
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Add to Catalogue',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
