import 'package:coco_explorer/di/injection.dart';
import 'package:coco_explorer/infrastructure/category/datasources/category_local_datasource.dart';
import 'package:coco_explorer/infrastructure/category/models/category/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;

void main() {
  late final CategoryLocalDatasource categoryLocalDatasource;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await configureInjection(injectable.Environment.test);

    categoryLocalDatasource = getIt<CategoryLocalDatasource>();
  });

  test(
    'should return list of category models',
    () async {
      final categories = categoryLocalDatasource.getCategories();

      expect(categories, isA<List<CategoryModel>>());
      expect(categories.length, greaterThan(0));
    },
  );

  test(
    'should return list of category models based on search term',
    () async {
      final categories = categoryLocalDatasource.getCategoriesSuggestions("ca");

      expect(categories, isA<List<CategoryModel>>());
      expect(categories.length, greaterThan(0));
    },
  );

  test(
    'should return empty list of category models when passing search term not exist',
        () async {
      final categories = categoryLocalDatasource.getCategoriesSuggestions("zzzzasfgqkwerwegdsgksdf");

      expect(categories, isA<List<CategoryModel>>());
      expect(categories.length, 0);
    },
  );
}
