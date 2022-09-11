import 'package:coco_explorer/domain/coco_dataset/entities/coco_caption.dart';
import 'package:coco_explorer/domain/coco_dataset/entities/coco_image.dart';
import 'package:coco_explorer/domain/coco_dataset/entities/coco_instance.dart';
import 'package:coco_explorer/domain/coco_dataset/repository/coco_dataset_repository.dart';
import 'package:coco_explorer/domain/core/error/failure.dart';
import 'package:coco_explorer/domain/core/models/resource.dart';
import 'package:coco_explorer/infrastructure/coco_dataset/datasources/coco_dataset_remote_datasource.dart';
import 'package:coco_explorer/infrastructure/coco_dataset/models/coco_caption/coco_caption_model.dart';
import 'package:coco_explorer/infrastructure/coco_dataset/models/coco_image/coco_image_model.dart';
import 'package:coco_explorer/infrastructure/coco_dataset/models/coco_instance/coco_instance_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CocoDatasetRepository)
class CocoDatasetRepositoryImpl implements CocoDatasetRepository {
  final CocoDatasetRemoteDatasource cocoDatasetRemoteDatasource;

  CocoDatasetRepositoryImpl(this.cocoDatasetRemoteDatasource);

  @override
  Future<Resource<List<CocoCaption>>> getCocoCaption(List<int> imagesIds) async {
    try {
      final cocoCaptions = await cocoDatasetRemoteDatasource.getCocoCaption(imagesIds);
      return Resource.data(cocoCaptions.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Resource.failure(Failure.fromException(e));
    }
  }

  @override
  Future<Resource<List<CocoImage>>> getCocoImages(List<int> imagesIds) async {
    try {
      final cocoImages = await cocoDatasetRemoteDatasource.getCocoImages(imagesIds);
      return Resource.data(cocoImages.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Resource.failure(Failure.fromException(e));
    }
  }

  @override
  Future<Resource<List<CocoInstance>>> getCocoInstances(List<int> imagesIds) async {
    try {
      final cocoInstances = await cocoDatasetRemoteDatasource.getCocoInstances(imagesIds);
      return Resource.data(cocoInstances.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Resource.failure(Failure.fromException(e));
    }
  }

  @override
  Future<Resource<List<int>>> getImagesIdsByCategories(List<int> categoriesIds) async {
    try {
      final images = await cocoDatasetRemoteDatasource.getImagesIdsByCategories(categoriesIds);
      return Resource.data(images);
    } catch (e) {
      return Resource.failure(Failure.fromException(e));
    }
  }
}