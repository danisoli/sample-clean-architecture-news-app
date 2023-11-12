import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/entities.dart';
import '../repositories/article_repository.dart';
// Use case is where busyness logic gets executed
// It gets data from repository and returns it
// It doesn't matter if use case get us an article or lunch a shuttle to the moon
// It have a call method so for clean code we first create a basic use case and then It gets implement

// since we don't need a parameter we just write void
class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticle();
  }
}
