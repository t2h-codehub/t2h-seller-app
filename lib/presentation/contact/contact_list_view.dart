import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:share_plus/share_plus.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/data/card/models/connected_users.dart'
    as contacts;
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/services/shared_preference_service.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/contact/contact_view_model.dart';
import 'package:taptohello/presentation/contact/export_bottomSheet.dart';
import 'package:taptohello/presentation/contact/export_contact.dart';
import 'package:taptohello/presentation/scan/scan_qr_view.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';

class ContactListView extends ConsumerStatefulWidget {
  const ContactListView({super.key});

  @override
  ConsumerState<ContactListView> createState() => _ContactListViewState();
}

class _ContactListViewState extends ConsumerState<ContactListView>
    with BaseScreenView {
  final UserDetailService _userDetailService = getIt<UserDetailService>();

  final TextEditingController _controller = TextEditingController();
  late ContactViewModel _viewModel;
  String token = '';
  String userId = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel = ref.read(contactViewModel);
    getUserParentToken();
    _viewModel.attachView(this);
  }

  getUserParentToken() {
    print('My parent token: $token');
    token = SharedPreferenceService.getString('parentIdToken') ?? '';
    userId = SharedPreferenceService.getString('userId') ?? '';
    setState(() {});
    print('My parent token: $token');
    print('My user id: $userId');
    _viewModel.getConnectedUsers(token, userId);
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(contactViewModel);

    print('Contact length is: ${_viewModel.connectedUserResponse?.contacts?.length}');
    return Scaffold(
      backgroundColor: AppCol.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: Image.asset("assets/newIcons/loc.png"),
        // ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ExportContactView(),
              ));
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("assets/newIcons/exp.png"),
            ),
          ),
        ],
        title: Text(
          "Contacts (${_viewModel.connectedUserResponse?.contacts?.length ?? 0})",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: CustomTextFormField(
                      controller: _controller,
                      onChange: (value) {
                        _viewModel.searchConnects(_controller.text);
                      },
                      variant: TextFormFieldVariant.None,
                      prefix: Icon(Icons.search, size: 22),
                      hintText: "Search Names, Companies & more...",
                      shape: TextFormFieldShape.circular,
                    ),
                  ),
                ),
                SizedBox(width: 17),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                Share.share(
                    'Get your FREE HelloCode and Digital Business card NOW, upgrade to Phygital Networking revolution. Click ${AppConstants.websiteUrl}profile/${_userDetailService.userDetailResponse?.user?.id}');
              },
              child: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 19),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/newIcons/invite.png",
                          color: AppCol.primary,
                          height: 18,
                          width: 23,
                        ),
                        SizedBox(width: 7),
                        Text(
                          "Invite your friends",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppCol.primary),
                        ),
                      ]),
                ),
              ),
            ),
            _viewModel.connectedUserResponse?.contacts?.length == 0
                ? Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Center(
                      child: Text(
                        "No Contacts Available",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                : _controller.text.isEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return contactList(
                              contacts: _viewModel
                                  .connectedUserResponse!.contacts![index]);
                        },
                        itemCount: _viewModel
                                .connectedUserResponse?.contacts?.length ??
                            0,
                      )
                    : _viewModel.searchConnect?.contacts?.length == 0
                        ? Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Center(
                                child: Text(
                              "No Contacts Available",
                              style: TextStyle(color: Colors.black),
                            )),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => contactList(
                                contacts:
                                    _viewModel.searchConnect!.contacts![0]),
                            itemCount:
                                _viewModel.searchConnect?.contacts?.length ?? 0,
                          )
          ]),
        ),
      ),
    );
  }

  Widget contactList({required contacts.Contact contacts}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => QrProfileScreenWebview(
            url:
                "${AppConstants.websiteUrl}profile/${contacts.id ?? ""}?profile=yes",
          ),
        ));
        print("${AppConstants.websiteUrl}profile/${contacts.id ?? ""}");
      },
      child: Card(
        margin: getMargin(
          top: 14,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  padding: getPadding(
                    left: 15,
                    top: 5,
                    right: 15,
                  ),
                  decoration: AppDecoration.gradientGray6007fGray6007f
                      .copyWith(borderRadius: BorderRadius.circular(16)),
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 95,
                            width: 95,
                            margin: getMargin(top: 16, left: 16),
                            decoration: BoxDecoration(
                                color: AppCol.gray700,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(contacts.profileImg ??
                                        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fvectors%2Favatar-icon-placeholder-facebook-1577909%2F&psig=AOvVaw1PUZsmBlZm8UuYk7zHgq6H&ust=1692977019433000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCMje2IDN9YADFQAAAAAdAAAAABAE")),
                                shape: BoxShape.circle)),
                        Padding(
                            padding: getPadding(left: 20, top: 20, bottom: 16),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(contacts.name ?? "N/A",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsSemiBold12
                                              .copyWith(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  contacts.designation == null
                                      ? SizedBox.shrink()
                                      : SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          child: Text(
                                              contacts.designation ?? "N/A",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtPoppinsMedium12
                                                  .copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              )),
                                        ),
                                  contacts.companyName == null
                                      ? SizedBox.shrink()
                                      : SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          child: Text(
                                              contacts.companyName ?? "N/A",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtPoppinsMedium12
                                                  .copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              )),
                                        ),
                                  Padding(
                                      padding: getPadding(top: 8),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.phone_outlined,
                                            size: 20,
                                            color: AppCol.primary,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                              " +91 ${contacts.phone ?? "N/A"}",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsMedium10Gray900
                                                  .copyWith(
                                                fontSize: 14,
                                              )),
                                        ],
                                      )),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.email_outlined,
                                        size: 20,
                                        color: AppCol.primary,
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.4),
                                        child: Text(contacts.email ?? "N/A",
                                            overflow: TextOverflow.ellipsis,
                                            // maxLines: 2,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtPoppinsMedium10Gray900
                                                .copyWith(
                                              fontSize: 14,
                                            )),
                                      ),
                                    ],
                                  )
                                ])),
                      ])),
              SizedBox(
                height: 20,
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                contacts.favorite == false
                    ? SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(top: 20, right: 10),
                        child: Icon(
                          Icons.star,
                          size: 30,
                          // height: 24,
                          color: Color(0xFFF7A629),
                        ),
                      ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24))),
                      context: context,
                      builder: (context) =>
                          ExportBottomSheet(contacts: contacts),
                    ).then((value) {
                      _viewModel.getConnectedUsers(token, userId);
                      setState(() {});
                    });
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         type: PageTransitionType.bottomToTop,
                    //         child: ExportBottomSheet()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: Image.asset(
                      "assets/newIcons/info.png",
                      // size: 30,
                      height: 24,
                      color: Color(0xFF999999),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String urlLink) async {
    final Uri url = Uri.parse(urlLink);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch ${url}l');
    }
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    // TODO: implement showSnackbar
  }
}
