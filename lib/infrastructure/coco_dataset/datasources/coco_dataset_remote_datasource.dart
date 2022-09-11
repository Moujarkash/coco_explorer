import 'package:coco_explorer/infrastructure/coco_dataset/models/coco_caption/coco_caption_model.dart';
import 'package:coco_explorer/infrastructure/coco_dataset/models/coco_image/coco_image_model.dart';
import 'package:coco_explorer/infrastructure/coco_dataset/models/coco_instance/coco_instance_model.dart';
import 'package:coco_explorer/infrastructure/coco_dataset/service/coco_dataset_service.dart';
import 'package:injectable/injectable.dart';

abstract class CocoDatasetRemoteDatasource {
  Future<List<int>> getImagesIdsByCategories(List<int> categoriesIds);
  Future<List<CocoImageModel>> getCocoImages(List<int> imagesIds);
  Future<List<CocoInstanceModel>> getCocoInstances(List<int> imagesIds);
  Future<List<CocoCaptionModel>> getCocoCaption(List<int> imagesIds);
}

@LazySingleton(as: CocoDatasetRemoteDatasource)
class CocoDatasetRemoteDatasourceImp implements CocoDatasetRemoteDatasource {
  final CocoDatasetService cocoDatasetService;

  CocoDatasetRemoteDatasourceImp(this.cocoDatasetService);

  @override
  Future<List<CocoCaptionModel>> getCocoCaption(List<int> imagesIds) {
    return cocoDatasetService.getCocoCaption(imagesIds);
  }

  @override
  Future<List<CocoImageModel>> getCocoImages(List<int> imagesIds) {
    return cocoDatasetService.getCocoImages(imagesIds);
  }

  @override
  Future<List<CocoInstanceModel>> getCocoInstances(List<int> imagesIds) {
    return cocoDatasetService.getCocoInstances(imagesIds);
  }

  @override
  Future<List<int>> getImagesIdsByCategories(List<int> categoriesIds) {
    return cocoDatasetService.getImagesIdsByCategories(categoriesIds);
  }
}