import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/data/card/models/connected_users.dart'
    as contact;
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/profileWebview/image_viewer.dart';
import 'package:taptohello/presentation/profileWebview/pdf_viewer.dart';
import 'package:taptohello/presentation/scan/scan_qr_view.dart';

class SwiperView extends StatefulWidget {
  final List<contact.Contact>? contacts;
  final int index2;

  const SwiperView({super.key, this.contacts, required this.index2});

  @override
  State<SwiperView> createState() => _SwiperViewState();
}

class _SwiperViewState extends State<SwiperView> {
  CardSwiperController? controller = CardSwiperController();
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  String ownid = "";
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.index2;
    ownid = _userDetailService.userDetailResponse?.user?.id ?? "";
    setState(() {});
  }

  String _getLogoUrl(int index, int index4) {
  final logo = widget.contacts?[index].customServices != null &&
          widget.contacts![index].customServices!.length > index4
      ? widget.contacts![index].customServices![index4].logo
      : null;

  if (logo == null || logo.isEmpty) {
    return "https://via.placeholder.com/150";
  }

  return logo.contains(AppConstants.imageBaseUrl)
      ? logo
      : AppConstants.imageBaseUrl + logo;
}

String _getServiceLogoUrl(int index, int index3) {
  final logo = widget.contacts?[index].services != null &&
          widget.contacts![index].services!.length > index3
      ? widget.contacts![index].services![index3].logo
      : null;

  if (logo == null || logo.isEmpty) {
    return "https://via.placeholder.com/100";
  }

  return logo.contains(AppConstants.imageBaseUrl)
      ? logo
      : AppConstants.imageBaseUrl + logo;
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor:
          //     widget.contacts?[currentIndex].color?.color1?.toColor(),
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.close)),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Network Updates",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  )),
              Text("Swipe up to view more",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ))
            ],
          ),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppCol.primary, // <-- SEE HERE
            statusBarIconBrightness:
                Brightness.light, //<-- For Android SEE HERE (dark icons)
            statusBarBrightness: Brightness.light,
            //<-- For iOS SEE HERE (dark icons)
          )),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              AppCol.primary,
              AppCol.primary,
              Color(0xFFF27F3E),
            ])),
        child: CardSwiper(
          controller: controller,
          initialIndex: widget.index2,
          onSwipe: (previousIndex, currentIndex, direction) {
            currentIndex = currentIndex;
            setState(() {});
            return true;
          },
         // direction: CardSwiperDirection.top,
         // isHorizontalSwipingEnabled: false,
          numberOfCardsDisplayed: widget.contacts?.length ?? 0,
          // allowedSwipeDirection: AllowedSwipeDirection.only(
          //     down: false, left: false, right: false, up: true),
          cardsCount: widget.contacts?.length ?? 0,
          // viewportFraction: 0.8,
          // containerHeight: MediaQuery.of(context).size.height / 1.2,
          // // axisDirection: AxisDirection.up,
          // itemHeight: MediaQuery.of(context).size.height / 1.2,
          // itemWidth: MediaQuery.of(context).size.width,
          // layout: SwiperLayout.TINDER,
          cardBuilder: (
                  context,
                  index,
                  horizontalThresholdPercentage,
                  verticalThresholdPercentage,
                ) {
            return Card(
              color: Colors.white,
              elevation: 4,
              // elevation: 0,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        image: 
                        DecorationImage(
  fit: BoxFit.cover,
  image: CachedNetworkImageProvider(
    (widget.contacts?[index].profileImg != null &&
            widget.contacts![index].profileImg!.isNotEmpty)
        ? (widget.contacts![index].profileImg!.contains(AppConstants.imageBaseUrl)
            ? widget.contacts![index].profileImg!
            : AppConstants.imageBaseUrl + widget.contacts![index].profileImg!)
        : "https://www.qwikcilver.com/wp-content/uploads/2019/01/dummy-post-square-1-thegem-blog-masonry.jpg", // Fallback image URL
  ),
)

                        // DecorationImage(
                        //     fit: BoxFit.cover,
                        //     image: Image.network(
                        //       widget.contacts?[index].profileImg == ""
                        //           ? "https://www.qwikcilver.com/wp-content/uploads/2019/01/dummy-post-square-1-thegem-blog-masonry.jpg"
                        //           : widget.contacts?[index].profileImg ??
                        //               "https://www.qwikcilver.com/wp-content/uploads/2019/01/dummy-post-square-1-thegem-blog-masonry.jpg",
                        //     ).image)
                            ),
                    height: MediaQuery.of(context).size.height / 2.1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      color: Color(0xFFF05323),
                                      shape: BoxShape.circle),
                                  child: Center(
                                      child: Text(
                                          widget.contacts?[index].contacts ==
                                                  null
                                              ? "0"
                                              : widget.contacts?[index].contacts
                                                      .toString() ??
                                                  "0",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12))),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                    text: (_userDetailService
                                        .userDetailResponse
                                        ?.user
                                        ?.username !=
                                        "" &&
                                        _userDetailService
                                            .userDetailResponse
                                            ?.user
                                            ?.username !=
                                            null)
                                        ? "${AppConstants.websiteUrl}profile/${_userDetailService.userDetailResponse?.user?.username}"
                                        : "${AppConstants.websiteUrl}profile/${_userDetailService.userDetailResponse?.user?.id}"));
                                Share.share(
                                    "${AppConstants.websiteUrl}profile/${_userDetailService.userDetailResponse?.user?.username}");
                              },
                              child: Image.asset(
                                "assets/newIcons/share_prof.png",
                                height: 36,
                              ),
                            )
                          ]),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 16),
                        Text(widget.contacts?[index].name ?? "",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(height: 4),
                        Text(
                            "${widget.contacts?[index].designation ?? ""} at ${widget.contacts?[index].companyName ?? ""}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF858585),
                              fontWeight: FontWeight.w400,
                            )),
                        SizedBox(height: 13),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                                widget.contacts?[index].services?.length ?? 0,
                                (index3) => InkWell(
                                      onTap: () {
                                        _launchURL(widget.contacts?[index]
                                                .services?[index3].content ??
                                            "");
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: 
                                          CachedNetworkImage(
  imageUrl: _getServiceLogoUrl(index, index3),
  height: 32,
  fit: BoxFit.contain,
  placeholder: (context, url) => const CircularProgressIndicator(strokeWidth: 2),
  errorWidget: (context, url, error) => const Icon(Icons.error, size: 24),
),

                                          // Image.network(
                                          //   widget.contacts?[index]
                                          //           .services?[index3].logo ??
                                          //       "",
                                          //   // color: AppCol.primary,
                                          //   height: 32,
                                          // ),
                                          // Image.network(
                                          //   "https://cdn.pixabay.com/photo/2021/08/16/08/55/facebook-6549798_1280.jpg",
                                          // ),
                                        ),
                                      ),
                                    ))
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 3),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index4) => Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppCol.primary.withOpacity(0.1)),
                        child: InkWell(
                          onTap: () {
                            _launchURL(widget.contacts?[index]
                                    .customServices?[index4].link ??
                                "");
                          },
                          child: Row(
                            children: [
                              (widget.contacts?[index].customServices?[index4]
                                              .logo ==
                                          null ||
                                      widget.contacts?[index]
                                              .customServices?[index4].logo ==
                                          "")
                                  ? Container()
                                  : 
                                  CachedNetworkImage(
  imageUrl: _getLogoUrl(index, index4),
  height: 44,
  width: 43,
  fit: BoxFit.cover,
  placeholder: (context, url) => const CircularProgressIndicator(),
  errorWidget: (context, url, error) => const Icon(Icons.error),
),

                                  // Image.network(
                                  //     widget.contacts?[index]
                                  //             .customServices?[index4].logo ??
                                  //         "",
                                  //     height: 44,
                                  //     width: 43,
                                  //   ),
                              Text(
                                  widget.contacts?[index].customServices?[index4]
                                          .title ??
                                      "",
                                  style: TextStyle(
                                    color: AppCol.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      itemCount:
                          widget.contacts?[index].customServices?.length ?? 0,
                    ),
                  ),
                  SizedBox(height: 13),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => QrProfileScreenWebview(
                          url:
                              "${AppConstants.websiteUrl}profile/${widget.contacts?[index].id ?? ""}" "?connectUserId=$ownid?profile=yes",
                        ),
                      ));
                      print(
                          "${AppConstants.websiteUrl}profile/${widget.contacts?[index].id ?? ""}");
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                      width: 139,
                      padding: EdgeInsets.only(
                        bottom: 12,
                        top: 12,
                      ),
                      decoration: BoxDecoration(
                          color: AppCol.primary,
                          borderRadius: BorderRadius.circular(23)),
                      child: Center(
                        child: Text(
                          "View Profile",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          // itemCount: 3,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
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

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
