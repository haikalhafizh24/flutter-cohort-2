import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:student_lecture_app/application/top_stories_cubit/top_stories_cubit.dart';
import 'package:student_lecture_app/domain/core/app_failure.dart';
import 'package:student_lecture_app/infrastructure/common/dtos/article_model.dart';
import 'package:student_lecture_app/infrastructure/news/repository/mock_news_repository.dart';

void main() {
  late TopStoriesCubit topStoriesCubit;
  late MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    topStoriesCubit = TopStoriesCubit(mockNewsRepository);
  });

  tearDown(() {
    topStoriesCubit.close();
  });

  group('TopStoriesCubit', () {
    test('initial state should be correct', () {
      expect(topStoriesCubit.state, equals(TopStoriesState.initial()));
    });

    blocTest<TopStoriesCubit, TopStoriesState>(
      'emits [loading, loaded] states for successful article fetch',
      build: () => topStoriesCubit,
      act: (cubit) => cubit.selectedSection('technology'),
      wait: const Duration(seconds: 2),
      expect: () => [
        TopStoriesState.initial()
            .copyWith(selectedSection: 'technology', isLoading: true),
        isA<TopStoriesState>().having(
          (state) => state.failureOrSucceesArticles,
          'failureOrSucceesArticles',
          isA<Some<Either<AppFailure, List<ArticleModel>>>>(),
        ),
      ],
      verify: (cubit) {
        final state = cubit.state;
        expect(state.isLoading, isFalse);
        expect(state.selectedSection, equals('technology'));
        state.failureOrSucceesArticles.fold(
          () => fail('Expected Some, but got None'),
          (a) => a.fold(
            (l) => fail('Expected Right, but got Left'),
            (r) {
              expect(r, isA<List<ArticleModel>>());
              expect(r.length, equals(1));
              expect(r.first.title, equals('Mock Top Story'));
            },
          ),
        );
      },
    );
  });
}
