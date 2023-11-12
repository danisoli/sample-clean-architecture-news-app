import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_clean_architecture/features/daily_news/domain/entities/entities.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticlesState({this.articles, this.error});

  // we determine these two perameter are considered
  // when comparing the state
  @override
  List<Object> get props => [articles!, error!];
}

class RemoteArticleLoading extends RemoteArticlesState {
  const RemoteArticleLoading();
}

class RemoteArticleDone extends RemoteArticlesState {
  const RemoteArticleDone(List<ArticleEntity> articles)
      : super(articles: articles);
}

class RemoteArticleError extends RemoteArticlesState {
  const RemoteArticleError(DioException error) : super(error: error);
}
