import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_clean_architecture/features/daily_news/data/repositories/article_repository_impl.dart';
import 'package:sample_clean_architecture/features/daily_news/domain/repositories/article_repository.dart';
import 'package:sample_clean_architecture/features/daily_news/domain/usecases/get_article.dart';

import 'features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'features/daily_news/presentation/bloc/articel/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
