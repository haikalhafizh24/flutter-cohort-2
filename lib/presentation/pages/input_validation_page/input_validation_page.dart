import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/input_validation_cubit/input_validation_cubit.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class InputValidationPage extends StatelessWidget {
  const InputValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InputValidationCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: const PlatformAppBar(
            title: Text('Input Validation'),
          ),
          bottomNavigationBar: Container(
            padding: UIHelper.padding(
              vertical: 12,
              horizontal: 16,
            ),
            child: ElevatedButton(
              onPressed: () => context.read<InputValidationCubit>().submit(),
              child: const Text("Login"),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 16,
            ),
            child: BlocBuilder<InputValidationCubit, InputValidationState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.title,
                      style: context.textTheme.displayLarge?.copyWith(),
                    ),
                    UIHelper.verticalSpace(8),
                    Text(
                      state.subTitle,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: ColorConstant.grey,
                        fontSize: 16,
                      ),
                    ),
                    UIHelper.verticalSpace(16),
                    TextFormFieldCustom(
                      controller:
                          context.read<InputValidationCubit>().nameController,
                      title: 'Name',
                      hintText: "Input your full name",
                      preffixIcon: const Icon(Icons.person),
                      validator: (_) => state.showNameErrorMsg,
                    ),
                    UIHelper.verticalSpace(8),
                    TextFormFieldCustom(
                      controller:
                          context.read<InputValidationCubit>().emailController,
                      title: 'Email',
                      hintText: "Input your email address",
                      preffixIcon: const Icon(Icons.email_rounded),
                      validator: (_) => state.showEmailErrorMsg,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
