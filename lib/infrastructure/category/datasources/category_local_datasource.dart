import 'dart:convert';

import 'package:coco_explorer/infrastructure/category/models/category/category_model.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

abstract class CategoryLocalDatasource {
  Future<List<CategoryModel>> getCategories();
  List<CategoryModel> getCategoriesSuggestions(String searchTerm);
  List<CategoryModel> getCategoriesByIds(List<int> categoriesIds);
}

@preResolve
@LazySingleton(as: CategoryLocalDatasource)
class CategoryLocalDatasourceImpl implements CategoryLocalDatasource {
  final List<CategoryModel> allCategories = List.empty(growable: true);

  @factoryMethod
  static Future<CategoryLocalDatasourceImpl> create() async {
    final instance = CategoryLocalDatasourceImpl();
    await instance.initData();
    return instance;
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    return allCategories;
  }

  @override
  List<CategoryModel> getCategoriesSuggestions(String searchTerm) {
    return allCategories
        .where((element) =>
            element.title.toLowerCase().startsWith(searchTerm.trim().toLowerCase()))
        .toList();
  }

  Future<void> initData() async {
    final String jsonData =
        await rootBundle.loadString('assets/data/categories.json');
    final data = json.decode(jsonData);

    if (data is List) {
      for (var element in data) {
        allCategories.add(CategoryModel.fromJson(element));
      }
    }
  }

  @override
  List<CategoryModel> getCategoriesByIds(List<int> categoriesIds) {
    return allCategories.where((element) => categoriesIds.contains(element.id)).toList();
  }
}
