import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/most_popular_article_cubit/most_popular_article_cubit.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/core/commons/constants.dart';
import 'package:student_lecture_app/core/injection/injection.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MostPopularArticleCubit>(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: const PlatformAppBar(
            title: Text('News Page'),
          ),
          body: SingleChildScrollView(
            padding: UIHelper.padding(all: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Top Stories', style: context.textTheme.displayMedium),
                UIHelper.verticalSpace(4),
                Text(
                  'Top stories from all time',
                  style: context.textTheme.bodySmall
                      ?.copyWith(color: ColorConstant.grey),
                ),
                UIHelper.verticalSpace(12),
                Container(
                  padding: UIHelper.padding(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorConstant.primary),
                    borderRadius: UIHelper.borderRadiusCircular(all: 8),
                  ),
                  child: InkWell(
                    onTap: () {
                      AutoRouter.of(context).push(const TopStoriesRoute());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Got to categories section',
                          style: context.textTheme.bodySmall
                              ?.copyWith(color: ColorConstant.primary),
                        ),
                        const Icon(
                          Icons.double_arrow_rounded,
                          color: ColorConstant.primary,
                        )
                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpace(12),
                BlocBuilder<MostPopularArticleCubit, MostPopularArticlesState>(
                  builder: (context, state) {
                    return state.failureOrSucceedArticles!.fold(
                        () => state.isLoading
                            ? Center(
                                child: UIHelper.loading(),
                              )
                            : const SizedBox.shrink(),
                        (response) => response.fold(
                            (failure) => failure.when(
                                fromServerSide: (error) => Text(error)),
                            (articles) => Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text('Most Popular Articles',
                                                style: context
                                                    .textTheme.displaySmall),
                                            UIHelper.verticalSpace(4),
                                            Text(
                                              'Top articles from last week',
                                              style: context.textTheme.bodySmall
                                                  ?.copyWith(
                                                      color:
                                                          ColorConstant.grey),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            AutoRouter.of(context)
                                                .push(const MostPopularRoute());
                                          },
                                          child: Text(
                                            'See all',
                                            style: context.textTheme.bodyMedium
                                                ?.copyWith(
                                                    color:
                                                        ColorConstant.primary,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                    UIHelper.verticalSpace(12),
                                    Column(
                                      children: List.generate(
                                          3,
                                          (index) => NewsCard(
                                                title:
                                                    'How to become software engineer',
                                                description:
                                                    'jill lepore \u2022  23 may 2024',
                                                imageSource: Constants.dummyImg,
                                              )),
                                    )
                                  ],
                                )));
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
