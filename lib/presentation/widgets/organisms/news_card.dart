import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageSource;
  const NewsCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageSource,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: UIHelper.padding(bottom: 8),
      padding: UIHelper.padding(all: 12),
      decoration: BoxDecoration(
          border: Border.all(
            color: ColorConstant.lightGrey,
          ),
          borderRadius: UIHelper.borderRadiusCircular(all: 12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: UIHelper.borderRadiusCircular(
              all: 8,
            ),
            child: Image.network(
              imageSource,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          UIHelper.horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                UIHelper.verticalSpace(8),
                Text(
                  description,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: ColorConstant.darkGrey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
