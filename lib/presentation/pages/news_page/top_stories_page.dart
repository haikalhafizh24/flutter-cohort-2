import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/top_stories_cubit/top_stories_cubit.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/core/injection/injection.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/badges.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

import '../../../core/commons/constants.dart';

@RoutePage()
class TopStoriesPage extends StatelessWidget {
  const TopStoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TopStoriesCubit>(),
      child: BlocBuilder<TopStoriesCubit, TopStoriesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const PlatformAppBar(title: Text('Top Stories')),
            body: SingleChildScrollView(
              padding: UIHelper.padding(all: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose section',
                    style: context.textTheme.displayMedium,
                  ),
                  UIHelper.verticalSpace(12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                        Constants.chooseSectionForStories.length, (index) {
                      final data = Constants.chooseSectionForStories[index];
                      return Badges(
                        ontap: () {
                          context.read<TopStoriesCubit>().selectedSection(data);
                        },
                        title: data,
                        state: state.selectedSection == data,
                      );
                    }).toList(),
                  ),
                  UIHelper.verticalSpace(12),
                  state.selectedSection != null
                      ? Column(
                          children: [
                            if (state.isLoading)
                              Center(child: UIHelper.loading())
                            else
                              state.failureOrSucceesArticles.fold(
                                  () => const SizedBox.shrink(),
                                  (response) => response.fold(
                                      (failure) => failure.when(
                                          fromServerSide: (error) =>
                                              Text(error)),
                                      (articles) => Column(
                                            children: [
                                              UIHelper.verticalSpace(12),
                                              Column(
                                                children: List.generate(
                                                    articles.length
                                                        .clamp(0, 20), (index) {
                                                  final data = articles[index];
                                                  return NewsCard(
                                                      title: data.title,
                                                      description:
                                                          '${data.byline} \u2022 ${data.publishedDateConverted}',
                                                      imageSource: data
                                                          .multimediaConverted);
                                                }),
                                              )
                                            ],
                                          )))
                          ],
                        )
                      : Column(
                          children: [
                            UIHelper.verticalSpace(120),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Please select a section\nto view articles.',
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: ColorConstant.grey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
