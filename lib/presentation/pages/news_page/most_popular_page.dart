import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';

@RoutePage()
class MostPopularPage extends StatelessWidget {
  const MostPopularPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PlatformAppBar(title: Text('Most Popular Articles')),
    );
  }
}
