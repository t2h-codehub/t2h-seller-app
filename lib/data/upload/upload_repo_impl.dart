import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'package:taptohello/core/core.dart';
import 'package:taptohello/data/upload/models/upload_model.dart';
import 'package:taptohello/data/upload/upload_repo.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';


class UploadRepoImpl implements UploadRepo {
  final ApiClient _apiClient;
  final MultiPartClient _apiClient2;
   final UserDetailService _userDetailService = getIt<UserDetailService>();

  UploadRepoImpl(this._apiClient, this._apiClient2);

  @override
  Future<Either<ApiException, UploadResponse>> uploadSingleFile(
    File file,
  ) async {
    // ignore: prefer_final_locals
    http.MultipartRequest request = http.MultipartRequest(
        'POST', Uri.parse('${AppConstants.baseUrl}upload/${_userDetailService.userDetailResponse?.user?.username}'));

    request.files.add(await http.MultipartFile.fromPath("file", file.path));
    try {
      final http.StreamedResponse streamedResponse =
          await _apiClient2.send(request);
      final http.Response response =
          await http.Response.fromStream(streamedResponse);
      return Right(
        uploadResponseFromJson(response.body),
      );
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, UploadResponse>> addCustomBranding(
      File? file, String? color) async {
    // ignore: prefer_final_locals
    http.MultipartRequest request = http.MultipartRequest('POST',
        Uri.parse('${AppConstants.baseUrl}user/add-custom-branding'));
    if (color != null) {
      request.fields["color"] = color;
    }
    if (file != null) {
      request.files.add(await http.MultipartFile.fromPath("file", file.path));
    }
    request.headers["token"] = AppConstants.token;

    try {
      final http.StreamedResponse streamedResponse =
          await _apiClient2.send(request);
      final http.Response response =
          await http.Response.fromStream(streamedResponse);
      return Right(
        uploadResponseFromJson(response.body),
      );
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
