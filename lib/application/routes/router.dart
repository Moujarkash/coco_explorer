import 'package:auto_route/auto_route.dart';
import 'package:coco_explorer/application/pages/home_page.dart';
import 'package:coco_explorer/application/pages/result_details_page.dart';
import 'package:coco_explorer/application/pages/results_page.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: ResultsPage),
    AutoRoute(page: ResultDetailsPage)
  ],
)

class $AppRouter {}
