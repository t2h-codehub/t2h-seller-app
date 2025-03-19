import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/data/auth/auth_repo.dart';
import 'package:taptohello/data/auth/model/user_detail.dart';

import 'package:taptohello/helper/base_view_model.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';

import 'package:taptohello/provider/repository_provider.dart';

import '../../helper/base_screen_view.dart';

final splashViewModel = ChangeNotifierProvider.autoDispose(
  (ref) => SplashViewModel(
    ref.read(authRepoProvider),
  ),
);

class SplashViewModel extends BaseViewModel<BaseScreenView> {
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  UserDetailResponse? _userDetailResponse;
  UserDetailResponse? get userDetailResponse => _userDetailResponse;

  final AuthRepo _authRepo;

  SplashViewModel(this._authRepo);

  Future<void> getUserDetail() async {
    if (AppConstants.token.isEmpty ||
        AppConstants.token == "" ||
        AppConstants.userId.isEmpty ||
        AppConstants.userId == '') {
      return;
    } else {
      await _authRepo.getUserDetail().then(
            (value) => value.fold((l) {
              view?.showSnackbar(l.message, color: Colors.red);
            }, (r) async {
              _userDetailResponse = r;
              _userDetailService.setuserDetail(_userDetailResponse);
            }),
          );
    }
  }
}
