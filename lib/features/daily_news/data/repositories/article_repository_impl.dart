import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/constants/constants.dart';

import '../../../../core/resources/data_state.dart';
import '../data_sources/remote/news_api_service.dart';
import '../models/article.dart';
import '../../domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    // in order to be safe from unknown another error we use try catch
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
          apiKey: newsApiKey, country: countryQuery, category: categuryQuery);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
