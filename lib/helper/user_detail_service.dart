import 'package:taptohello/data/auth/model/user_detail.dart';
import 'package:taptohello/helper/base_view_model.dart';

class UserDetailService extends BaseViewModel {
  UserDetailResponse? _userDetailResponse;
  UserDetailResponse? get userDetailResponse => _userDetailResponse;

  void setuserDetail(UserDetailResponse? detailResponse) {
    _userDetailResponse = detailResponse;
    notifyListeners();
  }
}
