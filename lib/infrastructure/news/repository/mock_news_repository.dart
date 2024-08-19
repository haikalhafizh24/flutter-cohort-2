// ignore: implementation_imports
import 'package:fpdart/src/either.dart';
import 'package:student_lecture_app/domain/core/app_failure.dart';
import 'package:student_lecture_app/domain/news/i_news_repository.dart';
import 'package:student_lecture_app/infrastructure/common/dtos/article_model.dart';

// @LazySingleton(as: INewsRepository)
class MockNewsRepository implements INewsRepository {
  @override
  Future<Either<AppFailure, List<ArticleModel>>> getMostPopular() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final articles = [
        ArticleModel(
            id: '1',
            title: 'Mock Article',
            byline: 'Haikal',
            multimedia: [],
            publishedDate: '2024-04-25')
      ];
      return right(articles);
    } catch (e) {
      return left(AppFailure.fromServerSide(e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, List<ArticleModel>>> getTopStories(String section) {
    throw UnimplementedError();
  }
}
