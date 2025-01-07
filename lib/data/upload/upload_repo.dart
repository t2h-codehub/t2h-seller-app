import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:swapnil_s_application4/data/auth/model/success_response.dart';
import 'package:swapnil_s_application4/data/upload/models/add_theme_model.dart';
import 'package:swapnil_s_application4/data/upload/models/upload_model.dart';

import '../../../core/exceptions.dart';

abstract class UploadRepo {
  Future<Either<ApiException, UploadResponse>> uploadSingleFile(File file);
  Future<Either<ApiException, UploadResponse>> addCustomBranding(
      File? file, String? color);
}
