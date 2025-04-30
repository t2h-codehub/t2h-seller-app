import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/data/auth/model/add_hello_direct.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';

class HelloDirectBottomSheet extends ConsumerStatefulWidget {
  final AuthViewModel viewModel;

  const HelloDirectBottomSheet(this.viewModel, {super.key});

  @override
  ConsumerState<HelloDirectBottomSheet> createState() =>
      _HelloDirectBottomSheetState();
}

class _HelloDirectBottomSheetState extends ConsumerState<HelloDirectBottomSheet>
    with BaseScreenView {
  int selectedindex = -1;
  String serviceId = "";

  List<CustomLink> customLinksItems = [
    CustomLink(
        linkImage: 'assets/profile_images/mobile.png', linkText: 'Mobile'),
    CustomLink(
        linkImage: 'assets/profile_images/linkedin.png', linkText: 'LinkedIn'),
    CustomLink(linkImage: 'assets/profile_images/sms.png', linkText: 'SMS'),
    CustomLink(
        linkImage: 'assets/profile_images/youtubeCustom.png',
        linkText: 'YouTube'),
    CustomLink(
        linkImage: 'assets/profile_images/emailCustom.png', linkText: 'Email'),
    CustomLink(linkImage: 'assets/profile_images/twitter.png', linkText: 'X'),
    CustomLink(
        linkImage: 'assets/profile_images/whatsappCustom.png',
        linkText: 'WhatsApp'),
    CustomLink(
        linkImage: 'assets/profile_images/vcardCustom.png', linkText: 'V Card'),
    CustomLink(
        linkImage: 'assets/profile_images/instagram.png',
        linkText: 'Instagram'),
    CustomLink(
        linkImage: 'assets/profile_images/website.png', linkText: 'Website'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(
            'Choose Your HelloDirect™ Link',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF1E1E1E),
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'When someone taps or scans your SocioCode™ they will be directed to the selected link',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 13,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16),

          /// Select Custom Link Dropdown
          Container(
            padding: EdgeInsets.all(14),
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select custom text link',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  widget.viewModel.userServicesResponse?.services?.length == 0
                      ? Center(child: Text("No links available for Hello Direct"))
                      : Column(
                    children: [
                      Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          ...List.generate(
                              widget.viewModel.userServicesResponse?.services
                                  ?.length ??
                                  0,
                                  (index) => InkWell(
                                onTap: () {
                                  selectedindex = index;
                                  serviceId = widget
                                      .viewModel
                                      .userServicesResponse!
                                      .services![index]
                                      .id ??
                                      "";
                                  setState(() {});
                                },
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Stack(
                                    children: [
                                      Column(children: [
                                        CachedNetworkImage(
  imageUrl: (widget.viewModel.userServicesResponse?.services?[index].logo != null && 
             widget.viewModel.userServicesResponse!.services![index].logo!.isNotEmpty)
      ? (widget.viewModel.userServicesResponse!.services![index].logo!
          .contains(AppConstants.imageBaseUrl)
          ? widget.viewModel.userServicesResponse!.services![index].logo!
          : AppConstants.imageBaseUrl + widget.viewModel.userServicesResponse!.services![index].logo!)
      : '', // Provide a fallback image URL if needed
  height: 50,
  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
  errorWidget: (context, url, error) => const Icon(Icons.error),
),

                                        // Image.network(
                                        //   widget
                                        //       .viewModel
                                        //       .userServicesResponse!
                                        //       .services![index]
                                        //       .logo ??
                                        //       "",
                                        //   height: 50,
                                        // ),
                                        SizedBox(height: 8),
                                        Text(
                                          widget
                                              .viewModel
                                              .userServicesResponse!
                                              .services![index]
                                              .title ??
                                              "",
                                          maxLines: 1,
                                        )
                                      ]),
                                      selectedindex == index
                                          ? Positioned(
                                        top: 1,
                                        child: Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        ),
                                      )
                                          : SizedBox.shrink()
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  /// Select Link
                  InkWell(
                    onTap: () {
                      if (selectedindex == -1) {
                        // showSnackbar("Please select a link");
                      } else {
                        widget.viewModel.addhelloDirectRequest =
                            AddhelloDirectRequest(serviceId: serviceId);
                        widget.viewModel.addHelloDirect(
                            widget.viewModel.addhelloDirectRequest, context);
                      }
                    },
                    child: Container(
                      // width: 181,
                      // height: 43,
                      child: Container(
                        // height: 43,
                        padding:
                        const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        decoration: ShapeDecoration(
                          color: AppCol.primary,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.50, color: AppCol.primary),
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                        child: Text(
                          selectedindex != -1 ? "Use Selected Link" : 'Select Link',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            // height: 1.38,
                            letterSpacing: 0.16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
          // Spacer(),
        ],
      ),
    );
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message.toString()),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // TODO: implement showSnackbar
  }
}

/// ------------ Class Custom Link -----------
class CustomLink {
  String linkImage;
  String linkText;

  CustomLink({required this.linkImage, required this.linkText});
}
