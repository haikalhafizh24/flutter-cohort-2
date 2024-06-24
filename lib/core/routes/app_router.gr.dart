// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:student_lecture_app/presentation/pages/counter_page/counter_page.dart'
    as _i1;
import 'package:student_lecture_app/presentation/pages/dummy_ui_page/dumm_ui_step_1_page.dart'
    as _i2;
import 'package:student_lecture_app/presentation/pages/dummy_ui_page/dumm_ui_step_2_page.dart'
    as _i3;
import 'package:student_lecture_app/presentation/pages/input_validation_page/input_validation_page.dart'
    as _i4;
import 'package:student_lecture_app/presentation/pages/news_page/news_page.dart'
    as _i5;
import 'package:student_lecture_app/presentation/pages/splash_page.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    CounterRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CounterPage(),
      );
    },
    DummyUIStep1Route.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DummyUIStep1Page(),
      );
    },
    DummyUIStep2Route.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DummyUIStep2Page(),
      );
    },
    InputValidationRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.InputValidationPage(),
      );
    },
    NewsRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.NewsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CounterPage]
class CounterRoute extends _i7.PageRouteInfo<void> {
  const CounterRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DummyUIStep1Page]
class DummyUIStep1Route extends _i7.PageRouteInfo<void> {
  const DummyUIStep1Route({List<_i7.PageRouteInfo>? children})
      : super(
          DummyUIStep1Route.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIStep1Route';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DummyUIStep2Page]
class DummyUIStep2Route extends _i7.PageRouteInfo<void> {
  const DummyUIStep2Route({List<_i7.PageRouteInfo>? children})
      : super(
          DummyUIStep2Route.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIStep2Route';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.InputValidationPage]
class InputValidationRoute extends _i7.PageRouteInfo<void> {
  const InputValidationRoute({List<_i7.PageRouteInfo>? children})
      : super(
          InputValidationRoute.name,
          initialChildren: children,
        );

  static const String name = 'InputValidationRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NewsPage]
class NewsRoute extends _i7.PageRouteInfo<void> {
  const NewsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
