import 'package:dartz/dartz.dart';
import 'package:swapnil_s_application4/core/api_client.dart';
import 'package:swapnil_s_application4/core/exceptions.dart';
import 'package:swapnil_s_application4/data/newsList/models/news_list_model.dart';
import 'package:swapnil_s_application4/data/newsList/news_list_repo.dart';

class NewsListRepoImpl implements BaseNewsListRepo {
  final ApiClient _apiClient;

  NewsListRepoImpl(this._apiClient);
  @override
  Future<Either<ApiException, NewsListResponse>> getNewsList(
    String categoryName,
  ) async {
    try {
      final response = await _apiClient.get(
        "",
      );
      return Right(NewsListResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
