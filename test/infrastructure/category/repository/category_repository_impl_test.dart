import 'package:coco_explorer/di/injection.dart';
import 'package:coco_explorer/domain/category/entities/category.dart';
import 'package:coco_explorer/domain/category/repository/category_repository.dart';
import 'package:coco_explorer/domain/core/models/resource.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../config.dart';

void main() {
  init();

  late final CategoryRepository categoryRepository;

  setUpAll(() => categoryRepository = getIt<CategoryRepository>());

  test(
    'should return resource of list of category',
        () async {
      final resourceOfCategories = categoryRepository.getCategories();

      expect(resourceOfCategories, isA<ResourceData<List<Category>>>());
      expect((resourceOfCategories as ResourceData<List<Category>>).data.length, greaterThan(0));
    },
  );

  test(
    'should return resource of list of category based on search term',
        () async {
      final resourceOfCategories = categoryRepository.getCategoriesSuggestions('ca');

      expect(resourceOfCategories, isA<ResourceData<List<Category>>>());
      expect((resourceOfCategories as ResourceData<List<Category>>).data.length, greaterThan(0));
    },
  );

  test(
    'should return resource of empty list of category based on search term not exist',
        () async {
      final resourceOfCategories = categoryRepository.getCategoriesSuggestions('zzzzasfgqkwerwegdsgksdf');

      expect(resourceOfCategories, isA<ResourceData<List<Category>>>());
      expect((resourceOfCategories as ResourceData<List<Category>>).data.length, 0);
    },
  );
}