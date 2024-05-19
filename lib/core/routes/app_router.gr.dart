// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:student_lecture_app/presentation/pages/dummy_ui_page/dumm_ui_step_1_page.dart'
    as _i1;
import 'package:student_lecture_app/presentation/pages/dummy_ui_page/dumm_ui_step_2_page.dart'
    as _i2;
import 'package:student_lecture_app/presentation/pages/splash_page.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    DummyUIStep1Route.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DummyUIStep1Page(),
      );
    },
    DummyUIStep2Route.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DummyUIStep2Page(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DummyUIStep1Page]
class DummyUIStep1Route extends _i4.PageRouteInfo<void> {
  const DummyUIStep1Route({List<_i4.PageRouteInfo>? children})
      : super(
          DummyUIStep1Route.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIStep1Route';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DummyUIStep2Page]
class DummyUIStep2Route extends _i4.PageRouteInfo<void> {
  const DummyUIStep2Route({List<_i4.PageRouteInfo>? children})
      : super(
          DummyUIStep2Route.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIStep2Route';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashPage]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
