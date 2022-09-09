import 'package:coco_explorer/application/core/utils/app_scroll_behavior.dart';
import 'package:coco_explorer/application/routes/router.gr.dart';
import 'package:coco_explorer/application/theme/colors.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
          onSecondary: Colors.white
        )
      ),
      builder: (context, widget) {
        if (widget != null) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: ScrollConfiguration(
              behavior: const AppScrollBehavior(),
              child: widget,
            ),
          );
        }

        return Container();
      },
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
