// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:offerte_lavoro_flutter_app/pages/annunci_dip_page.dart' as _i3;
import 'package:offerte_lavoro_flutter_app/pages/annunci_freelance_page.dart'
    as _i2;
import 'package:offerte_lavoro_flutter_app/pages/annunci_preferiti_page.dart'
    as _i4;
import 'package:offerte_lavoro_flutter_app/pages/content_page.dart' as _i1;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ContentRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ContentPage(),
      );
    },
    AnnunciFreelanceRoute.name: (routeData) {
      final args = routeData.argsAs<AnnunciFreelanceRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AnnunciFreelancePage(
          args.content,
          key: args.key,
        ),
      );
    },
    AnnunciDipRoute.name: (routeData) {
      final args = routeData.argsAs<AnnunciDipRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AnnunciDipPage(
          args.content,
          key: args.key,
        ),
      );
    },
    AnnunciPreferitiRoute.name: (routeData) {
      final args = routeData.argsAs<AnnunciPreferitiRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.AnnunciPreferitiPage(
          args.content,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ContentPage]
class ContentRoute extends _i5.PageRouteInfo<void> {
  const ContentRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContentRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AnnunciFreelancePage]
class AnnunciFreelanceRoute
    extends _i5.PageRouteInfo<AnnunciFreelanceRouteArgs> {
  AnnunciFreelanceRoute({
    required String content,
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          AnnunciFreelanceRoute.name,
          args: AnnunciFreelanceRouteArgs(
            content: content,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AnnunciFreelanceRoute';

  static const _i5.PageInfo<AnnunciFreelanceRouteArgs> page =
      _i5.PageInfo<AnnunciFreelanceRouteArgs>(name);
}

class AnnunciFreelanceRouteArgs {
  const AnnunciFreelanceRouteArgs({
    required this.content,
    this.key,
  });

  final String content;

  final _i6.Key? key;

  @override
  String toString() {
    return 'AnnunciFreelanceRouteArgs{content: $content, key: $key}';
  }
}

/// generated route for
/// [_i3.AnnunciDipPage]
class AnnunciDipRoute extends _i5.PageRouteInfo<AnnunciDipRouteArgs> {
  AnnunciDipRoute({
    required String content,
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          AnnunciDipRoute.name,
          args: AnnunciDipRouteArgs(
            content: content,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AnnunciDipRoute';

  static const _i5.PageInfo<AnnunciDipRouteArgs> page =
      _i5.PageInfo<AnnunciDipRouteArgs>(name);
}

class AnnunciDipRouteArgs {
  const AnnunciDipRouteArgs({
    required this.content,
    this.key,
  });

  final String content;

  final _i6.Key? key;

  @override
  String toString() {
    return 'AnnunciDipRouteArgs{content: $content, key: $key}';
  }
}

/// generated route for
/// [_i4.AnnunciPreferitiPage]
class AnnunciPreferitiRoute
    extends _i5.PageRouteInfo<AnnunciPreferitiRouteArgs> {
  AnnunciPreferitiRoute({
    required String content,
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          AnnunciPreferitiRoute.name,
          args: AnnunciPreferitiRouteArgs(
            content: content,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AnnunciPreferitiRoute';

  static const _i5.PageInfo<AnnunciPreferitiRouteArgs> page =
      _i5.PageInfo<AnnunciPreferitiRouteArgs>(name);
}

class AnnunciPreferitiRouteArgs {
  const AnnunciPreferitiRouteArgs({
    required this.content,
    this.key,
  });

  final String content;

  final _i6.Key? key;

  @override
  String toString() {
    return 'AnnunciPreferitiRouteArgs{content: $content, key: $key}';
  }
}
