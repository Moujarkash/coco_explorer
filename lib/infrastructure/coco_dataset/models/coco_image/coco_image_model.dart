import 'package:coco_explorer/domain/coco_dataset/entities/coco_image.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "coco_image_model.g.dart";

@JsonSerializable()
class CocoImageModel extends Equatable {
  final int id;
  @JsonKey(name: 'coco_url')
  final String imageUrl;

  const CocoImageModel(this.id, this.imageUrl);

  factory CocoImageModel.fromJson(Map<String, dynamic> json) =>
        _$CocoImageModelFromJson(json);

  @override
  List<Object?> get props => [id, imageUrl];
}

extension MapToDomain on CocoImageModel {
  CocoImage toEntity() => CocoImage(id, imageUrl);
}