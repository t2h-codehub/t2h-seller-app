import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/data/card/models/connected_users.dart'
    as contact;
import 'package:taptohello/data/card/models/remove_contact.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/contact/contact_view_model.dart';
import 'package:taptohello/presentation/contact/export_contact.dart';
import 'package:taptohello/services/shared_preference_service.dart';

class ExportBottomSheet extends ConsumerStatefulWidget {
  final contact.Contact contacts;
  const ExportBottomSheet({super.key, required this.contacts});

  @override
  ConsumerState<ExportBottomSheet> createState() => _ExportBottomSheetState();
}

class _ExportBottomSheetState extends ConsumerState<ExportBottomSheet>
    with BaseScreenView {
  late ContactViewModel _viewModel;
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  String token = '';
  String userId = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel = ref.read(contactViewModel);
    getUserParentToken ();
    _viewModel.attachView(this);
  }

  getUserParentToken () {
    token = SharedPreferenceService.getString('parentIdToken') ?? '';
    userId = SharedPreferenceService.getString('userId') ?? '';
    setState(() {
    });
    _viewModel.getConnectedUsers(token, userId);
    print('My parent token: $token');
    print('My user id: $userId');
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(contactViewModel);
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Column(children: [
                Text(
                  "${widget.contacts.name} - ${widget.contacts.companyName}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                InkWell(
                  onTap: () {
                    Share.share(
                        '${AppConstants.websiteUrl}profile/${widget.contacts.id}');
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFDBDBDB)),
                        color: Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(9)),
                    child: Center(
                        child: Text(
                      "Share Contact",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppCol.primary),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ExportContactView(),
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color: Color(0xFFF6F6F6),
                        border: Border.all(color: Color(0xFFDBDBDB)),
                        borderRadius: BorderRadius.circular(9)),
                    child: Center(
                        child: Text(
                      "Export to CRM",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppCol.primary),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _viewModel.toogleFav(widget.contacts.id ?? "", context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFDBDBDB)),
                        color: Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(9)),
                    child: Center(
                        child: Text(
                      widget.contacts.favorite == true
                          ? "Remove from Favourite"
                          : "Mark as Favourite",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppCol.primary),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              title: Text(
                                'Are you sure that you want to remove\nthis contact?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 1.47,
                                ),
                              ),
                              actions: <Widget>[
                                Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 48, vertical: 10),
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 0.50,
                                                  color: AppCol.primary),
                                              borderRadius:
                                                  BorderRadius.circular(23),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'No',
                                                style: TextStyle(
                                                  color: AppCol.primary,
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 24),
                                      InkWell(
                                          onTap: () {
                                            _viewModel.removeConnectRequest =
                                                RemoveConnectRequest(
                                                    connectUserId:
                                                        widget.contacts.id,
                                                    userId: _userDetailService
                                                            .userDetailResponse
                                                            ?.user
                                                            ?.id ??
                                                        "");
                                            _viewModel.removeContact(
                                                _viewModel.removeConnectRequest,
                                                context);
                                          },
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 48,
                                                      vertical: 10),
                                              decoration: ShapeDecoration(
                                                color: AppCol.primary,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 0.50,
                                                      color: AppCol.primary),
                                                  borderRadius:
                                                      BorderRadius.circular(23),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 0.16,
                                                    ),
                                                  ),
                                                ],
                                              )))
                                    ])
                              ]);
                        });
                    
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFDBDBDB)),
                        color: Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(9)),
                    child: Center(
                        child: Text(
                      "Remove Contact",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFFF05323)),
                    )),
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ]),
            ),
          ],
        ));
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    // TODO: implement showSnackbar
  }
}
