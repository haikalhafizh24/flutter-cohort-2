import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:student_lecture_app/application/most_popular_article_cubit/most_popular_article_cubit.dart';
import 'package:student_lecture_app/domain/core/app_failure.dart';
import 'package:student_lecture_app/infrastructure/common/dtos/article_model.dart';
import 'package:student_lecture_app/infrastructure/news/repository/mock_news_repository.dart';

void main() {
  late MostPopularArticleCubit mostPopularArticleCubit;
  late MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    mostPopularArticleCubit = MostPopularArticleCubit(mockNewsRepository);
  });

  tearDown(() {
    mostPopularArticleCubit.close();
  });

  // test('initial state is correct', () {
  //   expect(mostPopularArticleCubit.state, MostPopularArticlesState.initial());
  // });

  group('MostPopulaArticles', () {
    blocTest<MostPopularArticleCubit, MostPopularArticlesState>(
      'emits [loading, loaded] states for successful article fetch',
      build: () => mostPopularArticleCubit,
      wait: const Duration(seconds: 2),
      expect: () => [
        isA<MostPopularArticlesState>().having(
          (state) => state.failureOrSucceedArticles,
          'failureOrSucceesArticles',
          isA<Some<Either<AppFailure, List<ArticleModel>>>>(),
        ),
      ],
      verify: (cubit) {
        final state = cubit.state;
        expect(state.isLoading, isFalse);
        state.failureOrSucceedArticles?.fold(
          () => fail('Expected Some, but got None'),
          (a) => a.fold(
            (l) => fail('Expected Right, but got Left'),
            (r) {
              expect(r, isA<List<ArticleModel>>());
              expect(r.length, equals(1));
              expect(r.first.title, equals('Mock Article'));
            },
          ),
        );
      },
    );
  });
}
