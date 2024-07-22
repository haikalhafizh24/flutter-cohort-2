import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/badges.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class TopStoriesPage extends StatelessWidget {
  const TopStoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              children: [
                Badges(
                  state: false,
                  title: 'Arts',
                  ontap: () {},
                ),
                Badges(
                  state: true,
                  title: 'automobiles',
                  ontap: () {},
                ),
                Badges(
                  state: false,
                  title: 'food',
                  ontap: () {},
                ),
                Badges(
                  state: false,
                  title: 'movies',
                  ontap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
