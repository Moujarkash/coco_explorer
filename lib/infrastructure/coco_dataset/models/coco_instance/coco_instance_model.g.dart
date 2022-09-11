// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coco_instance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CocoInstanceModel _$CocoInstanceModelFromJson(Map json) => CocoInstanceModel(
      json['image_id'] as int,
      CocoInstanceModel.segmentationFromJson(json['segmentation'] as String),
      json['category_id'] as int,
    );
