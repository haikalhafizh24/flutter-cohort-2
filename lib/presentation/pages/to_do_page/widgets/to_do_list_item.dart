import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/to_do/to_do_cubit.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

import '../../../../core/commons/colors_const.dart';

class ToDoListItem extends StatelessWidget {
  const ToDoListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoCubit, ToDoState>(
      builder: (context, state) {
        if (state.histories.isEmpty) {
          return const Text(
            'no history found',
          );
        }
        return Wrap(
          runSpacing: 12,
          children: state.histories
              .map((history) => Container(
                    padding: UIHelper.padding(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: UIHelper.borderRadiusCircular(
                        all: 12,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Olahraga Lari Pagi',
                                    style: context.textTheme.headlineLarge
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                  UIHelper.verticalSpace(4),
                                  Text(
                                    history.description,
                                    style: context.textTheme.bodyMedium
                                        ?.copyWith(
                                            fontSize: 16,
                                            color: ColorConstant.darkGrey),
                                    // maxLines: 3,
                                    // overflow: TextOverflow.ellipsis,
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Checkbox(
                                value: history.isDone,
                                side: const BorderSide(
                                  color: ColorConstant.lightGrey,
                                ),
                                activeColor: ColorConstant.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: UIHelper.borderRadiusCircular(
                                    all: 24,
                                  ),
                                ),
                                onChanged: (val) {
                                  if (val != null) {
                                    context.read<ToDoCubit>().updateToDoStatus(
                                          isDone: val,
                                          id: history.id,
                                        );
                                  }
                                }),
                          ],
                        ),
                        const Divider(
                          thickness: 0.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: UIHelper.padding(all: 8),
                                  fixedSize: const Size(80, 30),
                                  backgroundColor:
                                      const Color.fromARGB(255, 245, 245, 245)),
                              onPressed: () {
                                AutoRouter.of(context)
                                    .push(CreateRoute(history: history));
                                context.read<ToDoCubit>().editToDo(history);
                                // AutoRouter.of(context)
                                //     .push(const CreateRoute());
                              },
                              child: Text(
                                'Edit',
                                style: context.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: ColorConstant.darkGrey),
                              ),
                            ),
                            UIHelper.horizontalSpace(12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: UIHelper.padding(all: 8),
                                  fixedSize: const Size(80, 30),
                                  backgroundColor:
                                      const Color.fromARGB(255, 252, 228, 228)),
                              onPressed: () {
                                context.read<ToDoCubit>().removeToDo(history);
                              },
                              child: Text(
                                'Delete',
                                style: context.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: ColorConstant.red),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
              .toList(),
        );
      },
    );
  }
}
