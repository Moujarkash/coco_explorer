import 'package:coco_explorer/domain/coco_dataset/entities/coco_caption.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "coco_caption_model.g.dart";

@JsonSerializable()
class CocoCaptionModel extends Equatable {
  final String caption;
  final int imageId;

  const CocoCaptionModel(this.caption, this.imageId);

  factory CocoCaptionModel.fromJson(Map<String, dynamic> json) =>
        _$CocoCaptionModelFromJson(json);

  @override
  List<Object?> get props => [caption, imageId];
}

extension MapToDomain on CocoCaptionModel {
  CocoCaption toEntity() => CocoCaption(caption, imageId);
}