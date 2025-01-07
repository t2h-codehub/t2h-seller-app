import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapnil_s_application4/data/auth/auth_repo.dart';
import 'package:swapnil_s_application4/data/auth/auth_repo_impl.dart';
import 'package:swapnil_s_application4/data/card/card_repo.dart';
import 'package:swapnil_s_application4/data/card/card_repo_impl.dart';
import 'package:swapnil_s_application4/data/newsList/news_list_repo.dart';
import 'package:swapnil_s_application4/data/newsList/news_list_repo_impl.dart';
import 'package:swapnil_s_application4/data/upload/upload_repo.dart';
import 'package:swapnil_s_application4/data/upload/upload_repo_impl.dart';

import 'api_client_provider.dart';

final newsRepositoryProvider = Provider<BaseNewsListRepo>(
  (ref) => NewsListRepoImpl(
    ref.read(apiClientProvider),
  ),
);
final authRepoProvider = Provider<AuthRepo>((ref) => AuthRepoImpl(
      ref.read(apiClientProvider),
    ));
final uploadProvider = Provider<UploadRepo>(
  (ref) => UploadRepoImpl(
      ref.read(apiClientProvider), ref.read(multiPartClientProvider)),
);
final cardProvider = Provider<CardRepo>(
  (ref) => CardRepoImpl(
    ref.read(apiClientProvider),
  ),
);
