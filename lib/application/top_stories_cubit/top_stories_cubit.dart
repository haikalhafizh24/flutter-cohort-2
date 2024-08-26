import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:student_lecture_app/domain/core/app_failure.dart';
import 'package:student_lecture_app/domain/news/i_news_repository.dart';
import 'package:student_lecture_app/infrastructure/common/dtos/article_model.dart';

part 'top_stories_cubit.freezed.dart';
part 'top_stories_state.dart';

@injectable
class TopStoriesCubit extends Cubit<TopStoriesState> {
  final INewsRepository _newsRepository;
  TopStoriesCubit(this._newsRepository) : super(TopStoriesState.initial());

  void selectedSection(String section) {
    emit(state.copyWith(
      selectedSection: section,
      isLoading: true,
    ));
    getTopStories(section);
  }

  void getTopStories(String section) async {
    final response = await _newsRepository.getTopStories(section);
    emit(state.copyWith(
      failureOrSucceesArticles: Option.of(response),
      isLoading: false,
      // selectedSection: section ?? state.selectedSection,
    ));
  }
}
