part of 'top_stories_cubit.dart';

@freezed
class TopStoriesState with _$TopStoriesState {
  const TopStoriesState._();
  const factory TopStoriesState({
    required Option<Either<AppFailure, List<ArticleModel>>>
        failureOrSucceesArticles,
    required bool isLoading,
    required String? selectedSection,
  }) = _TopStoriesState;

  factory TopStoriesState.initial() => TopStoriesState(
        failureOrSucceesArticles: none(),
        isLoading: false,
        selectedSection: null,
      );

  // TopStoriesState get unmodified => copyWith(
  //       isLoading: false,
  //       failureOrSucceesArticles: none(),
  //       selectedSection: null,
  //     );
}
