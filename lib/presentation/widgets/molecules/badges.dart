import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

class Badges extends StatelessWidget {
  final bool state;
  final String title;
  final VoidCallback ontap;
  const Badges(
      {super.key,
      required this.state,
      required this.title,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: state ? ColorConstant.primary : ColorConstant.whiteColor,
          border: Border.all(
            color: state ? ColorConstant.lightBlue : ColorConstant.lightGrey,
          ),
          borderRadius: UIHelper.borderRadiusCircular(
            all: 8,
          ),
        ),
        child: Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            color: state ? ColorConstant.whiteColor : ColorConstant.darkGrey,
          ),
        ),
      ),
    );
  }
}
