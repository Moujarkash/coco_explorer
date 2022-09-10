import 'package:coco_explorer/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart';

void init() {
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await configureInjection(Environment.test);
  });
}