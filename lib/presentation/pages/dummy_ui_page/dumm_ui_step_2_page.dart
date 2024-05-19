import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/constants.dart';
import 'package:student_lecture_app/presentation/pages/dummy_ui_page/widgets/row_cards.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class DummyUIStep2Page extends StatelessWidget {
  const DummyUIStep2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dummy UI'),
          elevation: 1,
          leading: IconButton(
            onPressed: () => AutoRouter.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          bottom: const TabBar(tabs: [
            Tab(
              text: 'List View',
            ),
            Tab(
              text: 'Grid View',
            ),
          ]),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Padding(
                padding: UIHelper.padding(all: 16),
                child: Column(
                  children: [
                    ...List.generate(
                      12,
                      (index) => NewsCard(
                        title: 'How can i be Flutter Developer Expert?',
                        description: 'jill lepore \u2022  23 may 2024',
                        imageSource: Constants.dummyImg,
                      ),
                    ),
                  ],
                )),
          ),
          GridView.count(
            padding: UIHelper.padding(
              all: 16,
            ),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            crossAxisCount: 2,
            children: [
              ...List.generate(
                12,
                (index) => RowCards(
                  index: index,
                  // title: 'How can i be Flutter Developer Expert?',
                  // description: 'jill lepore \u2022  23 may 2024',
                  imageSource: Constants.dummyImg,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
