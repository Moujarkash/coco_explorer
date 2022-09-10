import 'package:coco_explorer/application/src/app.dart';
import 'package:coco_explorer/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection(Environment.prod);

  runApp(App());
}
