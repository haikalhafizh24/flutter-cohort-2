import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';

import '../../../widgets/organisms/ui_helper.dart';

class RowCards extends StatelessWidget {
  final int index;
  final String imageSource;
  const RowCards({
    super.key,
    required this.index,
    required this.imageSource,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIHelper.padding(all: 8),
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstant.lightGrey),
        borderRadius: UIHelper.borderRadiusCircular(
          all: 12,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: UIHelper.borderRadiusCircular(all: 4),
            child: Image.network(
              imageSource,
              width: UIHelper.setSp(60),
              height: UIHelper.setSp(60),
              fit: BoxFit.cover,
            ),
          ),
          UIHelper.verticalSpace(8),
          Text('${index + 1} image'),
        ],
      ),
    );
  }
}
