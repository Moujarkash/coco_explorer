import 'package:auto_route/auto_route.dart';
import 'package:coco_explorer/application/pages/home_page.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true)
  ],
)

class $AppRouter {}
