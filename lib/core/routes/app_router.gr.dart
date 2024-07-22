// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i14;
import 'package:student_lecture_app/domain/todo/to_do_history_entitiy.dart'
    as _i13;
import 'package:student_lecture_app/presentation/pages/calculator_page/calculator_page.dart'
    as _i1;
import 'package:student_lecture_app/presentation/pages/counter_page/counter_page.dart'
    as _i2;
import 'package:student_lecture_app/presentation/pages/dummy_ui_page/dumm_ui_step_1_page.dart'
    as _i4;
import 'package:student_lecture_app/presentation/pages/dummy_ui_page/dumm_ui_step_2_page.dart'
    as _i5;
import 'package:student_lecture_app/presentation/pages/input_validation_page/input_validation_page.dart'
    as _i6;
import 'package:student_lecture_app/presentation/pages/news_page/most_popular_page.dart'
    as _i7;
import 'package:student_lecture_app/presentation/pages/news_page/news_page.dart'
    as _i8;
import 'package:student_lecture_app/presentation/pages/news_page/top_stories_page.dart'
    as _i11;
import 'package:student_lecture_app/presentation/pages/splash_page.dart' as _i9;
import 'package:student_lecture_app/presentation/pages/to_do_page/create_page.dart'
    as _i3;
import 'package:student_lecture_app/presentation/pages/to_do_page/to_do_page.dart'
    as _i10;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    CalculatorRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CalculatorPage(),
      );
    },
    CounterRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CounterPage(),
      );
    },
    CreateRoute.name: (routeData) {
      final args = routeData.argsAs<CreateRouteArgs>(
          orElse: () => const CreateRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CreatePage(
          history: args.history,
          key: args.key,
        ),
      );
    },
    DummyUIStep1Route.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DummyUIStep1Page(),
      );
    },
    DummyUIStep2Route.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DummyUIStep2Page(),
      );
    },
    InputValidationRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.InputValidationPage(),
      );
    },
    MostPopularRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MostPopularPage(),
      );
    },
    NewsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.NewsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashPage(),
      );
    },
    ToDoRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ToDoPage(),
      );
    },
    TopStoriesRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.TopStoriesPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CalculatorPage]
class CalculatorRoute extends _i12.PageRouteInfo<void> {
  const CalculatorRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalculatorRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CounterPage]
class CounterRoute extends _i12.PageRouteInfo<void> {
  const CounterRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CreatePage]
class CreateRoute extends _i12.PageRouteInfo<CreateRouteArgs> {
  CreateRoute({
    _i13.ToDoHistoryEntity? history,
    _i14.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          CreateRoute.name,
          args: CreateRouteArgs(
            history: history,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateRoute';

  static const _i12.PageInfo<CreateRouteArgs> page =
      _i12.PageInfo<CreateRouteArgs>(name);
}

class CreateRouteArgs {
  const CreateRouteArgs({
    this.history,
    this.key,
  });

  final _i13.ToDoHistoryEntity? history;

  final _i14.Key? key;

  @override
  String toString() {
    return 'CreateRouteArgs{history: $history, key: $key}';
  }
}

/// generated route for
/// [_i4.DummyUIStep1Page]
class DummyUIStep1Route extends _i12.PageRouteInfo<void> {
  const DummyUIStep1Route({List<_i12.PageRouteInfo>? children})
      : super(
          DummyUIStep1Route.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIStep1Route';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DummyUIStep2Page]
class DummyUIStep2Route extends _i12.PageRouteInfo<void> {
  const DummyUIStep2Route({List<_i12.PageRouteInfo>? children})
      : super(
          DummyUIStep2Route.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIStep2Route';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.InputValidationPage]
class InputValidationRoute extends _i12.PageRouteInfo<void> {
  const InputValidationRoute({List<_i12.PageRouteInfo>? children})
      : super(
          InputValidationRoute.name,
          initialChildren: children,
        );

  static const String name = 'InputValidationRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MostPopularPage]
class MostPopularRoute extends _i12.PageRouteInfo<void> {
  const MostPopularRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MostPopularRoute.name,
          initialChildren: children,
        );

  static const String name = 'MostPopularRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.NewsPage]
class NewsRoute extends _i12.PageRouteInfo<void> {
  const NewsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashPage]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ToDoPage]
class ToDoRoute extends _i12.PageRouteInfo<void> {
  const ToDoRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ToDoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ToDoRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.TopStoriesPage]
class TopStoriesRoute extends _i12.PageRouteInfo<void> {
  const TopStoriesRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TopStoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'TopStoriesRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
