// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:coco_explorer/application/pages/home_page.dart' as _i1;
import 'package:coco_explorer/application/pages/results_page.dart' as _i2;
import 'package:flutter/material.dart' as _i4;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    ResultsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ResultsPageRouteArgs>();
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.ResultsPage(
              key: args.key,
              selectedCategoriesIds: args.selectedCategoriesIds));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(HomePageRoute.name, path: '/'),
        _i3.RouteConfig(ResultsPageRoute.name, path: '/results-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i3.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i2.ResultsPage]
class ResultsPageRoute extends _i3.PageRouteInfo<ResultsPageRouteArgs> {
  ResultsPageRoute({_i4.Key? key, required List<int> selectedCategoriesIds})
      : super(ResultsPageRoute.name,
            path: '/results-page',
            args: ResultsPageRouteArgs(
                key: key, selectedCategoriesIds: selectedCategoriesIds));

  static const String name = 'ResultsPageRoute';
}

class ResultsPageRouteArgs {
  const ResultsPageRouteArgs({this.key, required this.selectedCategoriesIds});

  final _i4.Key? key;

  final List<int> selectedCategoriesIds;

  @override
  String toString() {
    return 'ResultsPageRouteArgs{key: $key, selectedCategoriesIds: $selectedCategoriesIds}';
  }
}
