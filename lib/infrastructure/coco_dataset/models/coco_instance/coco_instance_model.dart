import 'dart:convert';

import 'package:coco_explorer/domain/coco_dataset/entities/coco_instance.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "coco_instance_model.g.dart";

@JsonSerializable()
class CocoInstanceModel extends Equatable {
  final int imageId;
  @JsonKey(fromJson: segmentationFromJson)
  final List<num> segmentation;
  final int categoryId;

  const CocoInstanceModel(this.imageId, this.segmentation, this.categoryId);

  factory CocoInstanceModel.fromJson(Map<String, dynamic> json) =>
        _$CocoInstanceModelFromJson(json);

  @override
  List<Object?> get props => [imageId, segmentation, categoryId];

  static List<num> segmentationFromJson(String jsonData) {
    List<num> segmentation = List.empty();

    final outerSegmentation = json.decode(jsonData);
    if (outerSegmentation is List) {
      segmentation = outerSegmentation.first as List<num>;
    }

    return segmentation;
  }
}

extension MapToDomain on CocoInstanceModel {
  CocoInstance toEntity() => CocoInstance(imageId, segmentation, categoryId);
}