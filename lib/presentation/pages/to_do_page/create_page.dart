import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/to_do/to_do_cubit.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';
import 'package:student_lecture_app/domain/todo/to_do_history_entitiy.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';

import '../../widgets/organisms/ui_helper.dart';

@RoutePage()
class CreatePage extends StatelessWidget {
  final ToDoHistoryEntity? history;

  const CreatePage({
    this.history,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = ToDoCubit();
        if (history != null) {
          cubit.editToDo(history!);
        }
        return cubit;
      },
      child: BlocBuilder<ToDoCubit, ToDoState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const PlatformAppBar(
              title: Text(
                'Create New Task',
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
                  if (state.showDescriptionErrorMsg != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.showDescriptionErrorMsg!),
                        duration: const Duration(seconds: 2),
                        backgroundColor: ColorConstant.red,
                      ),
                    );
                  } else if (state.showDescriptionErrorMsg == null) {
                    context.read<ToDoCubit>().save();
                    AutoRouter.of(context).push(const ToDoRoute());
                    // AutoRouter.of(context).push;
                  }
                },
                child: Text(state.ctaText),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: UIHelper.padding(
                  all: 16,
                ),
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 80,
                    //   child: TextFormField(
                    //     style: const TextStyle(
                    //       fontWeight: FontWeight.w700,
                    //       fontSize: 20,
                    //     ),
                    //     decoration: const InputDecoration(
                    //       hintText: 'Title',
                    //       hintStyle: TextStyle(
                    //         fontWeight: FontWeight.w700,
                    //         fontSize: 20,
                    //       ),
                    //       border: InputBorder.none,
                    //     ),
                    //     minLines: null,
                    //     maxLines: null,
                    //     expands: true,
                    //   ),
                    // ),
                    SizedBox(
                      height: 200,
                      child: TextFormField(
                        // initialValue: state.entity.description,
                        controller:
                            context.read<ToDoCubit>().descriptionController,
                        // onChanged: (newText) {
                        //   state.entity.description;
                        // },
                        decoration: const InputDecoration(
                          hintText: 'Description',
                          hintStyle: TextStyle(
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                        ),
                        // validator: (_) => state.showDescriptionErrorMsg,
                        minLines: null,
                        maxLines: null,
                        expands: true,
                      ),
                    ),
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
