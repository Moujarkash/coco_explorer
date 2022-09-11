import 'package:coco_explorer/domain/category/entities/category.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "category_model.g.dart";

@JsonSerializable()
class CategoryModel extends Equatable {
  final int id;
  final String title;
  final String imageUrl;

  const CategoryModel(this.id, this.title, this.imageUrl);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
        _$CategoryModelFromJson(json);

  @override
  List<Object?> get props => [id, title, imageUrl];

}

extension MapToDomain on CategoryModel {
  Category toEntity(String baseUrl) => Category(id, title, baseUrl + imageUrl);
}