import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/to_do/to_do_cubit.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';
import 'package:student_lecture_app/domain/todo/to_do_history_entitiy.dart';
import 'package:student_lecture_app/presentation/pages/to_do_page/widgets/to_do_list_item.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/badges.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoCubit(),
      child: BlocBuilder<ToDoCubit, ToDoState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const PlatformAppBar(
              elevation: 4,
              title: Text(
                'To Do App',
              ),
            ),
            bottomNavigationBar: Container(
              padding: UIHelper.padding(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(CreateRoute());
                },
                child: const Text('Create New Task'),
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 242, 242, 242),
            body: SingleChildScrollView(
              child: Padding(
                padding: UIHelper.padding(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: [
                        Badges(
                          state: state.choosenType(const ToDoHistoryType.all()),
                          title: 'All',
                          ontap: () {
                            context
                                .read<ToDoCubit>()
                                .changeType(const ToDoHistoryType.all());
                          },
                        ),
                        Badges(
                          state:
                              state.choosenType(const ToDoHistoryType.done()),
                          title: 'Done',
                          ontap: () {
                            context
                                .read<ToDoCubit>()
                                .changeType(const ToDoHistoryType.done());
                          },
                        ),
                        Badges(
                          state: state
                              .choosenType(const ToDoHistoryType.notDone()),
                          title: 'Not Done',
                          ontap: () {
                            context
                                .read<ToDoCubit>()
                                .changeType(const ToDoHistoryType.notDone());
                          },
                        )
                      ],
                    ),
                    UIHelper.verticalSpace(12),
                    const ToDoListItem(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
