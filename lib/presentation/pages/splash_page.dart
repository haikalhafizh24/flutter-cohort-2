import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlatformAppBar(
        title: Text(
          'Starting Page',
        ),
      ),
      body: Padding(
          padding: UIHelper.padding(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MainMenu(
                  title: 'Dummy UI',
                  description:
                      'Practice flutter UI and get familiar with UI Widgets',
                  ontap: () {
                    AutoRouter.of(context).push(const DummyUIStep1Route());
                  },
                ),
                const Divider(
                  height: 1,
                  color: ColorConstant.lightGrey,
                ),
                MainMenu(
                  title: 'Counter Example (State Management)',
                  description:
                      'Introducing of state management using flutter_bloc. Level: 1',
                  ontap: () {
                    AutoRouter.of(context).push(const DummyUIStep1Route());
                  },
                ),
                const Divider(
                  height: 1,
                  color: ColorConstant.lightGrey,
                ),
                MainMenu(
                  title: 'Input Validation Example (State Management)',
                  description:
                      'Flutter state management using flutter_bloc to handle validation in text field. Level: 2',
                  ontap: () {
                    AutoRouter.of(context).push(const DummyUIStep1Route());
                  },
                ),
                const Divider(
                  height: 1,
                  color: ColorConstant.lightGrey,
                ),
                MainMenu(
                  title: 'Calculator Example (State Management)',
                  description:
                      'Flutter state management using flutter_bloc to calculate simple syntax. Level: 3',
                  ontap: () {
                    AutoRouter.of(context).push(const DummyUIStep1Route());
                  },
                ),
                const Divider(
                  height: 1,
                  color: ColorConstant.lightGrey,
                ),
                MainMenu(
                  title: 'News App',
                  description: 'API calling using free source from NYTimes',
                  ontap: () {
                    AutoRouter.of(context).push(const DummyUIStep1Route());
                  },
                ),
                const Divider(
                  height: 1,
                  color: ColorConstant.lightGrey,
                ),
                MainMenu(
                  title: 'To Do App Example (State Management)',
                  description:
                      'Create a to do list that saved in local storage using hydrated_bloc. Level: 4',
                  ontap: () {
                    AutoRouter.of(context).push(const DummyUIStep1Route());
                  },
                ),
              ],
            ),
          )),
    );
  }
}

class MainMenu extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback ontap;

  const MainMenu({
    super.key,
    required this.title,
    required this.description,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: UIHelper.padding(vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.displaySmall
                        ?.copyWith(color: ColorConstant.primary),
                  ),
                  UIHelper.verticalSpace(4),
                  Text(
                    description,
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: ColorConstant.grey),
                  ),
                ],
              ),
            ),
            UIHelper.horizontalSpace(12),
            const Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
