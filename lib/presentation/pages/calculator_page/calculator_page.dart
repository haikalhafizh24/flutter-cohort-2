import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/calculator/calculator_cubit.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/domain/calculator/calculator_entity.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

import '../../widgets/molecules/badges.dart';

@RoutePage()
class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorCubit(),
      child: BlocBuilder<CalculatorCubit, CalculatorState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const PlatformAppBar(
              title: Text('Simple Calculator'),
            ),
            bottomNavigationBar: Container(
              padding: UIHelper.padding(
                vertical: 12,
                horizontal: 16,
              ),
              child: ElevatedButton(
                onPressed: () {
                  context.read<CalculatorCubit>().submit();
                },
                child: const Text("Calculate"),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: UIHelper.padding(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose Type',
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    UIHelper.verticalSpace(8),
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: [
                        Badges(
                          ontap: () {
                            context
                                .read<CalculatorCubit>()
                                .chooseType(const CalculatorType.add());
                          },
                          state: state.choosenType(const CalculatorType.add()),
                          title: 'Add',
                        ),
                        Badges(
                          ontap: () {
                            context
                                .read<CalculatorCubit>()
                                .chooseType(const CalculatorType.substract());
                          },
                          state: state
                              .choosenType(const CalculatorType.substract()),
                          title: 'Substract',
                        ),
                        Badges(
                          ontap: () {
                            context
                                .read<CalculatorCubit>()
                                .chooseType(const CalculatorType.multiply());
                          },
                          state: state
                              .choosenType(const CalculatorType.multiply()),
                          title: 'Multiply',
                        ),
                        Badges(
                          ontap: () {
                            context
                                .read<CalculatorCubit>()
                                .chooseType(const CalculatorType.divide());
                          },
                          state:
                              state.choosenType(const CalculatorType.divide()),
                          title: 'Divide',
                        ),
                        Badges(
                          ontap: () {
                            context
                                .read<CalculatorCubit>()
                                .chooseType(const CalculatorType.pow());
                          },
                          state: state.choosenType(const CalculatorType.pow()),
                          title: 'Pow',
                        ),
                      ],
                    ),
                    if (!state.typenNotChoosen)
                      Column(
                        children: [
                          UIHelper.verticalSpace(16),
                          Row(
                            children: [
                              Flexible(
                                child: TextFormFieldCustom(
                                  controller: context
                                      .read<CalculatorCubit>()
                                      .leftController,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.headlineLarge,
                                ),
                              ),
                              UIHelper.horizontalSpace(
                                8,
                              ),
                              Container(
                                width: UIHelper.setWidth(
                                  24,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  state.equationText(state.ent.type),
                                  style: TextStyle(
                                    fontSize: UIHelper.setSp(32),
                                  ),
                                ),
                              ),
                              UIHelper.horizontalSpace(
                                8,
                              ),
                              Flexible(
                                child: TextFormFieldCustom(
                                  controller: context
                                      .read<CalculatorCubit>()
                                      .rightController,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.headlineLarge,
                                ),
                              ),
                            ],
                          ),
                          UIHelper.verticalSpace(
                            16,
                          ),
                          Container(
                            height: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ColorConstant.lightBlue,
                              borderRadius:
                                  UIHelper.borderRadiusCircular(all: 8),
                            ),
                            child: Text(
                              // 'calculation result',
                              state.displayValue,
                              style: context.textTheme.bodySmall?.copyWith(
                                color: ColorConstant.darkGrey,
                              ),
                            ),
                          ),
                          UIHelper.verticalSpace(
                            8,
                          ),
                          Container(
                            padding: UIHelper.padding(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: state.isError
                                  ? ColorConstant.lightGreen
                                  : Colors.red[100],
                              borderRadius:
                                  UIHelper.borderRadiusCircular(all: 8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.error_outline_rounded,
                                  color: state.isError
                                      ? ColorConstant.green
                                      : ColorConstant.red,
                                  size: 24,
                                ),
                                UIHelper.horizontalSpace(8),
                                Text(
                                  state.showErrorMsg ??
                                      'Press calculate button to get the result',
                                  style: context.textTheme.bodySmall
                                      ?.copyWith(fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    UIHelper.divider(),
                    Text(
                      'History',
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    UIHelper.verticalSpace(
                      8,
                    ),
                    state.ent.histories.isEmpty // checking if the history empty
                        ? Container(
                            alignment: Alignment.center,
                            padding: UIHelper.padding(all: 16),
                            child: Text(
                              'No history found',
                              style: context.textTheme.bodySmall?.copyWith(
                                color: ColorConstant.darkGrey,
                              ),
                            ),
                          )
                        : Wrap(
                            runSpacing: UIHelper.setSp(12),
                            children: state.ent.histories
                                .map((history) => CalculationHistory(
                                      equation: state.historyText(history),
                                      onTap: () => context
                                          .read<CalculatorCubit>()
                                          .restoreHistory(history),
                                    ))
                                .toList(),
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

class CalculationHistory extends StatelessWidget {
  final String equation;
  final VoidCallback onTap;
  const CalculationHistory(
      {super.key, required this.equation, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIHelper.padding(
        vertical: 8,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
          color: const Color.fromARGB(31, 163, 163, 163),
          borderRadius: UIHelper.borderRadiusCircular(all: 8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            equation,
            style: context.textTheme.displayMedium,
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              'Re-Apply',
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: ColorConstant.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
