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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:coco_explorer/application/pages/home_page.dart' as _i1;
import 'package:coco_explorer/application/pages/result_details_page.dart'
    as _i3;
import 'package:coco_explorer/application/pages/results_page.dart' as _i2;
import 'package:coco_explorer/domain/coco_dataset/entities/coco_result.dart'
    as _i6;
import 'package:flutter/material.dart' as _i5;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    ResultsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ResultsPageRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.ResultsPage(
              key: args.key,
              selectedCategoriesIds: args.selectedCategoriesIds));
    },
    ResultDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ResultDetailsPageRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.ResultDetailsPage(key: args.key, result: args.result));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomePageRoute.name, path: '/'),
        _i4.RouteConfig(ResultsPageRoute.name, path: '/results-page'),
        _i4.RouteConfig(ResultDetailsPageRoute.name,
            path: '/result-details-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i4.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i2.ResultsPage]
class ResultsPageRoute extends _i4.PageRouteInfo<ResultsPageRouteArgs> {
  ResultsPageRoute({_i5.Key? key, required List<int> selectedCategoriesIds})
      : super(ResultsPageRoute.name,
            path: '/results-page',
            args: ResultsPageRouteArgs(
                key: key, selectedCategoriesIds: selectedCategoriesIds));

  static const String name = 'ResultsPageRoute';
}

class ResultsPageRouteArgs {
  const ResultsPageRouteArgs({this.key, required this.selectedCategoriesIds});

  final _i5.Key? key;

  final List<int> selectedCategoriesIds;

  @override
  String toString() {
    return 'ResultsPageRouteArgs{key: $key, selectedCategoriesIds: $selectedCategoriesIds}';
  }
}

/// generated route for
/// [_i3.ResultDetailsPage]
class ResultDetailsPageRoute
    extends _i4.PageRouteInfo<ResultDetailsPageRouteArgs> {
  ResultDetailsPageRoute({_i5.Key? key, required _i6.CocoResult result})
      : super(ResultDetailsPageRoute.name,
            path: '/result-details-page',
            args: ResultDetailsPageRouteArgs(key: key, result: result));

  static const String name = 'ResultDetailsPageRoute';
}

class ResultDetailsPageRouteArgs {
  const ResultDetailsPageRouteArgs({this.key, required this.result});

  final _i5.Key? key;

  final _i6.CocoResult result;

  @override
  String toString() {
    return 'ResultDetailsPageRouteArgs{key: $key, result: $result}';
  }
}
