import 'dart:convert';

import 'package:coco_explorer/di/injection.dart';
import 'package:coco_explorer/domain/category/entities/category.dart';
import 'package:coco_explorer/infrastructure/core/config/configuration.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coco_explorer/infrastructure/category/models/category/category_model.dart';

import '../../../config.dart';

void main() {
  init();
  const tCategoryModel = CategoryModel(1, "test category", "image url");
  final Configuration configuration = getIt<Configuration>();

  const categoryJson = ''' {
            "id": 1,
            "title": "test category",
            "image_url": "image url"
            }
            ''';

  test(
    'should be converted to entity instance',
    () async {
      final categoryEntity = tCategoryModel.toEntity(configuration.baseUrl);

      expect(categoryEntity, isA<Category>());
    },
  );

  group("from json", () {
    test(
      'should return a category model instance when the JSON is matching',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(categoryJson);

        final result = CategoryModel.fromJson(jsonMap);

        expect(result, tCategoryModel);
      },
    );
  });
}
