import 'package:coco_explorer/domain/category/entities/category.dart';
import 'package:json_annotation/json_annotation.dart';

part "category_model.g.dart";

@JsonSerializable()
class CategoryModel {
  final int id;
  final String title;
  final String imageUrl;

  CategoryModel(this.id, this.title, this.imageUrl);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
        _$CategoryModelFromJson(json);
}

extension MapToDomain on CategoryModel {
  Category toEntity() => Category(id, title, imageUrl);
}