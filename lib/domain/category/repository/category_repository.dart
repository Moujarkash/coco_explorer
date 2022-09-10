import 'package:coco_explorer/domain/category/entities/category.dart';
import 'package:coco_explorer/domain/core/models/resource.dart';

abstract class CategoryRepository {
  Resource<List<Category>> getCategories();
  Resource<List<Category>> getCategoriesSuggestions(String searchTerm);
}