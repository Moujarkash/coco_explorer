import 'dart:convert';

import 'package:coco_explorer/infrastructure/category/models/category/category_model.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

abstract class CategoryLocalDatasource {
  List<CategoryModel> getCategories();

  List<CategoryModel> getCategoriesSuggestions(String searchTerm);
}

@LazySingleton(as: CategoryLocalDatasource)
class CategoryLocalDatasourceImpl implements CategoryLocalDatasource {
  final List<CategoryModel> allCategories = List.empty(growable: true);

  CategoryLocalDatasourceImpl() {
    initData();
  }

  @override
  List<CategoryModel> getCategories() {
    return allCategories;
  }

  @override
  List<CategoryModel> getCategoriesSuggestions(String searchTerm) {
    return allCategories
        .where((element) =>
            element.title.toLowerCase().contains(searchTerm.toLowerCase()))
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
}
