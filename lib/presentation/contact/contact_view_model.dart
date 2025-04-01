import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/data/card/card_repo.dart';
import 'package:taptohello/data/card/models/connected_users.dart';
import 'package:taptohello/data/card/models/remove_contact.dart';

import 'package:taptohello/helper/base_view_model.dart';

import 'package:taptohello/provider/repository_provider.dart';

import '../../core/constants.dart';
import '../../helper/base_screen_view.dart';
import 'package:http/http.dart' as http;

final contactViewModel = ChangeNotifierProvider.autoDispose(
  (ref) => ContactViewModel(
    ref.read(cardProvider),
  ),
);

class ContactViewModel extends BaseViewModel<BaseScreenView> {
  ConnectedUserResponse? _connectedUserResponse;
  ConnectedUserResponse? get connectedUserResponse => _connectedUserResponse;
  ConnectedUserResponse? _searchConnect;
  ConnectedUserResponse? get searchConnect => _searchConnect;
  RemoveConnectRequest removeConnectRequest = RemoveConnectRequest();

  final CardRepo _cardRepo;

  ContactViewModel(
    this._cardRepo,
  );
  Future<void> getConnectedUsers(String token, String userId) async {
    try {
      final uri = Uri.parse('${AppConstants.baseUrl}user/get-user-connects/$userId');
      final headers = {
        'token': token,
        // 'userId': '66234f8b28534b8cfbb9a3cc'
      };
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('My contacts : ${response.body}');
        _connectedUserResponse =  ConnectedUserResponse.fromJson(data);
        notifyListeners();
      } else {
        print('My api error is: ${response.body}');
        // return Left(ApiException(response.body));
      }
    } catch (e) {
      print('My api error is: ${e.toString()}');
      // throw ApiException(e.response!.data["message"].toString());
      // return Left(ApiException(e.toString()));
    }
    notifyListeners();
    /*await _cardRepo.getConnectedUsers().then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message);
          }, (r) async {
            // _newsListResponse = r;
            _connectedUserResponse = r;
            notifyListeners();
          }),
        );*/
    // toggleLoading();
  }

  

  Future<void> searchConnects(String keyword) async {
    await _cardRepo.searchConnects(keyword).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message);
          }, (r) async {
            // _newsListResponse = r;
            _searchConnect = r;
            notifyListeners();
          }),
        );
    // toggleLoading();
  }

  Future<void> toogleFav(String uid, BuildContext context) async {
    await _cardRepo.toggleFav(uid).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message);
          }, (r) async {
            // _newsListResponse = r;
            // _connectedUserResponse = r;
            Navigator.of(context).pop();
            notifyListeners();
          }),
        );
    // toggleLoading();
  }

  Future<void> removeContact(
      RemoveConnectRequest removeConnectRequest, BuildContext context) async {
    await _cardRepo.removeContact(removeConnectRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message);
          }, (r) async {
            // _newsListResponse = r;
            // _connectedUserResponse = r;
            Navigator.of(context).pop();
            Navigator.of(context).pop();

            notifyListeners();
          }),
        );
    // toggleLoading();
  }
}
