import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/core/commons/constants.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';
import 'package:student_lecture_app/presentation/pages/dummy_ui_page/widgets/row_cards.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

import '../../widgets/organisms/news_card.dart';

@RoutePage()
class DummyUIStep1Page extends StatelessWidget {
  const DummyUIStep1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlatformAppBar(
        title: Text('Dummy UI'),
      ),
      body: SingleChildScrollView(
        padding: UIHelper.padding(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                AutoRouter.of(context).push(const DummyUIStep2Route());
              },
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Next',
                        style: context.textTheme.headlineLarge?.copyWith(
                          color: ColorConstant.primary,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Tab Bar, GridView, ListView',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: ColorConstant.grey,
                          // fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            UIHelper.verticalSpace(16),
            Text(
              'CONTAINER AND TEXT',
              style: context.textTheme.headlineLarge?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(12),
            NewsCard(
              title: 'How can i be Flutter Developer Expert?',
              description: 'jill lepore \u2022  23 may 2024',
              imageSource: Constants.dummyImg,
            ),
            UIHelper.verticalSpace(16),
            Text(
              'COLUMN',
              style: context.textTheme.headlineLarge?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(12),
            ...List.generate(
              2,
              (index) => NewsCard(
                title: 'How can i be Flutter Developer Expert?',
                description: 'jill lepore \u2022  23 may 2024',
                imageSource: Constants.dummyImg,
              ),
            ),
            UIHelper.verticalSpace(16),
            Text(
              'ROW',
              style: context.textTheme.headlineLarge?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(
              12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                (index) => RowCards(
                  index: index,
                  imageSource: Constants.dummyImg,
                ),
              ),
            ),
            UIHelper.verticalSpace(
              16,
            ),
            Text(
              'BUTTON',
              style: context.textTheme.headlineLarge?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(
              12,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Press Me'),
              ),
            ),
            UIHelper.verticalSpace(
              16,
            ),
            Text(
              'INPUT',
              style: context.textTheme.headlineLarge?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(
              12,
            ),
            const TextFormFieldCustom(
              title: 'Email',
              preffixIcon: Icon(Icons.email_outlined),
              hintText: 'Enter your email',
            ),
            UIHelper.verticalSpace(
              16,
            ),
            Text(
              'Image asset, Sized Box & Expanded ',
              style: context.textTheme.headlineLarge?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(
              12,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: RowCards(
                    index: 0,
                    imageSource: Constants.dummyImg,
                  ),
                ),
                UIHelper.horizontalSpace(12),
                RowCards(index: 0, imageSource: Constants.dummyImg),
              ],
            )
          ],
        ),
      ),
    );
  }
}
