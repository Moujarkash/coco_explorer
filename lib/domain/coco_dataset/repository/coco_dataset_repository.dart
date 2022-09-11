import 'package:coco_explorer/domain/coco_dataset/entities/coco_caption.dart';
import 'package:coco_explorer/domain/coco_dataset/entities/coco_image.dart';
import 'package:coco_explorer/domain/coco_dataset/entities/coco_instance.dart';
import 'package:coco_explorer/domain/core/models/resource.dart';

abstract class CocoDatasetRepository {
  Future<Resource<List<int>>> getImagesIdsByCategories(List<int> categoriesIds);
  Future<Resource<List<CocoImage>>> getCocoImages(List<int> imagesIds);
  Future<Resource<List<CocoInstance>>> getCocoInstances(List<int> imagesIds);
  Future<Resource<List<CocoCaption>>> getCocoCaption(List<int> imagesIds);
}