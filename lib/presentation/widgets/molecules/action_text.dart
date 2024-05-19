import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

class ActionText extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String desc;
  final int? flex;
  final bool needDivider;
  const ActionText({
    super.key,
    required this.onTap,
    required this.title,
    required this.desc,
    this.flex,
    this.needDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                flex: flex ?? 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.headlineMedium?.copyWith(
                        color: ColorConstant.primary,
                      ),
                    ),
                    Text(
                      desc,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: ColorConstant.grey,
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ),
        if (needDivider) UIHelper.divider(),
      ],
    );
  }
}
