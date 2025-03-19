import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:taptohello/data/upload/models/upload_model.dart';

import '../../../core/exceptions.dart';

abstract class UploadRepo {
  Future<Either<ApiException, UploadResponse>> uploadSingleFile(File file);
  Future<Either<ApiException, UploadResponse>> addCustomBranding(
      File? file, String? color);
}
