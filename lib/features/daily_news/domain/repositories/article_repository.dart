import 'package:sample_clean_architecture/core/resources/data_state.dart';
import 'package:sample_clean_architecture/features/daily_news/domain/entities/entities.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticle();
}
