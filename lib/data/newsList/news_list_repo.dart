import 'package:dartz/dartz.dart';
import 'package:taptohello/data/newsList/models/news_list_model.dart';

import '../../core/exceptions.dart';

abstract class BaseNewsListRepo {
  Future<Either<ApiException, NewsListResponse>> getNewsList(
    String categoryName,
  );
}
