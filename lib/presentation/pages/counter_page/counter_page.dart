import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/counter_cubit/counter_cubit.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';

@RoutePage()
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: const PlatformAppBar(
            title: Text('Counter App'),
          ),
          body: BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  state.ent.counterText.toString(),
                  style: context.textTheme.headlineLarge?.copyWith(
                    fontSize: 24,
                  ),
                ),
              );
            },
          ),
          floatingActionButton: Stack(
            // mainAxisAlignment: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  label: const Icon(
                    Icons.add_rounded,
                  ),
                  heroTag: 'fab1',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                    },
                    label: const Icon(
                      Icons.minimize_rounded,
                    ),
                    heroTag: 'fab2',
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
