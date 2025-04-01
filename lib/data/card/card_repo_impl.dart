import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:taptohello/core/api_client.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/core/exceptions.dart';
import 'package:taptohello/data/auth/model/success_response.dart';
import 'package:taptohello/data/card/card_repo.dart';
import 'package:taptohello/data/card/models/activate_card_model.dart';
import 'package:taptohello/data/card/models/connected_users.dart';
import 'package:taptohello/data/card/models/remove_contact.dart';
import 'package:http/http.dart' as http;

class CardRepoImpl implements CardRepo {
  final ApiClient _apiClient;

  final Dio dio = Dio();

  CardRepoImpl(this._apiClient);

  @override
  Future<Either<ApiException, ActivateCardResponse>> addCard(
      ActivateCardRequest activateCardRequest) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/add-card",
          activateCardRequestToJson(activateCardRequest));
      return Right(ActivateCardResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, ConnectedUserResponse>>
      getConnectedUsers() async {
    try {

      final uri = Uri.parse('https://aapi.mysocio.shop/user/get-user-connects');
      final headers = {
        'token': AppConstants.token,
        // 'userId': '66234f8b28534b8cfbb9a3cc'
      };

      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('My contacts : ${response.body}');
        return Right(ConnectedUserResponse.fromJson(data));
      } else {
        print('My api error is: ${response.body}');
        return Left(ApiException(response.body));
      }

      // final response = await dio.get("${AppConstants.baseUrl}user/get-user-connects",
      //     options: Options(headers: {
      //       "token": "${AppConstants.token}",
      //       "userId": "66234f8b28534b8cfbb9a3cc"
      //     }));
      //
      // // _apiClient.get(
      // //   "${AppConstants.baseUrl}user/get-user-connects",
      // // );
      // print('My contacts : ${response}');
      // return Right(ConnectedUserResponse.fromJson(response.data!));
    } catch (e) {
      print('My api error is: ${e.toString()}');
      // throw ApiException(e.response!.data["message"].toString());
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, SuccessResponse>> toggleFav(String uid) async {
    try {
      var body = {};
      final response = await _apiClient.put(
          "${AppConstants.baseUrl}user/toggle-favourite/$uid", body);
      return Right(SuccessResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, SuccessResponse>> removeContact(
      RemoveConnectRequest removeConnectRequest) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/remove-connect",
          removeConnectRequestToJson(removeConnectRequest));
      return Right(SuccessResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, ConnectedUserResponse>> searchConnects(
      String keyword) async {
    try {
      final response = await _apiClient.get(
        "${AppConstants.baseUrl}user/search-contacts?keyword=$keyword",
      );
      return Right(ConnectedUserResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
