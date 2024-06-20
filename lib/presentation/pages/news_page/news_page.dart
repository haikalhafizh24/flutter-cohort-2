import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Row(
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
            )
          ],
        ),
      ),
    );
  }
}
