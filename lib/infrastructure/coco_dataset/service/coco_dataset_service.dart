import 'package:coco_explorer/infrastructure/coco_dataset/models/coco_caption/coco_caption_model.dart';
import 'package:coco_explorer/infrastructure/coco_dataset/models/coco_image/coco_image_model.dart';
import 'package:coco_explorer/infrastructure/coco_dataset/models/coco_instance/coco_instance_model.dart';
import 'package:coco_explorer/infrastructure/core/config/app_endpoints.dart';
import 'package:coco_explorer/infrastructure/core/config/configuration.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part "coco_dataset_service.g.dart";

@lazySingleton
@RestApi(baseUrl: '')
abstract class CocoDatasetService {
  @factoryMethod
  factory CocoDatasetService(Dio dio, Configuration configuration) {
    return _CocoDatasetService(dio, baseUrl: configuration.endpointBaseUrl);
  }

  @FormUrlEncoded()
  @POST(cocoDataSetQuery)
  Future<List<int>> getImagesIdsByCategories(
      @Field('category_ids[]') List<int> categoriesIds,
      {@Field('querytype') String queryType = 'getImagesByCats'});

  @FormUrlEncoded()
  @POST(cocoDataSetQuery)
  Future<List<CocoImageModel>> getCocoImages(
      @Field('image_ids[]') List<int> imagesIds,
      {@Field('querytype') String queryType = 'getImages'});

  @FormUrlEncoded()
  @POST(cocoDataSetQuery)
  Future<List<CocoInstanceModel>> getCocoInstances(
      @Field('image_ids[]') List<int> imagesIds,
      {@Field('querytype') String queryType = 'getInstances'});

  @FormUrlEncoded()
  @POST(cocoDataSetQuery)
  Future<List<CocoCaptionModel>> getCocoCaption(
      @Field('image_ids[]') List<int> imagesIds,
      {@Field('querytype') String queryType = 'getCaptions'});
}
