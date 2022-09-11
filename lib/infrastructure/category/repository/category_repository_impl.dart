import 'package:coco_explorer/domain/category/entities/category.dart';
import 'package:coco_explorer/domain/category/repository/category_repository.dart';
import 'package:coco_explorer/domain/core/error/failure.dart';
import 'package:coco_explorer/domain/core/models/resource.dart';
import 'package:coco_explorer/infrastructure/category/datasources/category_local_datasource.dart';
import 'package:coco_explorer/infrastructure/category/models/category/category_model.dart';
import 'package:coco_explorer/infrastructure/core/config/configuration.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  final Configuration configuration;
  final CategoryLocalDatasource categoryLocalDatasource;

  CategoryRepositoryImpl(this.categoryLocalDatasource, this.configuration);

  @override
  Resource<List<Category>> getCategories() {
    try {
      final categories = categoryLocalDatasource.getCategories();
      return Resource.data(categories.map((e) => e.toEntity(configuration.baseUrl)).toList());
    } catch (e) {
      return Resource.failure(Failure.fromException(e));
    }
  }

  @override
  Resource<List<Category>> getCategoriesSuggestions(String searchTerm) {
    try {
      final categories = categoryLocalDatasource.getCategoriesSuggestions(searchTerm);
      return Resource.data(categories.map((e) => e.toEntity(configuration.baseUrl)).toList());
    } catch (e) {
      return Resource.failure(Failure.fromException(e));
    }
  }
}