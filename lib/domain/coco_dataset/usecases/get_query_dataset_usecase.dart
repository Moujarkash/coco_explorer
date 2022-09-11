import 'package:coco_explorer/domain/category/repository/category_repository.dart';
import 'package:coco_explorer/domain/coco_dataset/entities/coco_caption.dart';
import 'package:coco_explorer/domain/coco_dataset/entities/coco_image.dart';
import 'package:coco_explorer/domain/coco_dataset/entities/coco_instance.dart';
import 'package:coco_explorer/domain/coco_dataset/entities/coco_result.dart';
import 'package:coco_explorer/domain/coco_dataset/repository/coco_dataset_repository.dart';
import 'package:coco_explorer/domain/core/models/resource.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetQueryDatasetUseCase {
  final CocoDatasetRepository cocoDatasetRepository;
  final CategoryRepository categoryRepository;

  GetQueryDatasetUseCase(this.cocoDatasetRepository, this.categoryRepository);

  Future<Resource<List<CocoResult>>> call(List<int> imagesIds) async {
    late final Resource<List<CocoResult>> resultsResource;

    final cocoImagesResource =
        await cocoDatasetRepository.getCocoImages(imagesIds);
    if (cocoImagesResource is ResourceFailure) {
      resultsResource =
          ResourceFailure((cocoImagesResource as ResourceFailure).failure);
      return resultsResource;
    }

    final cocoInstancesResource =
        await cocoDatasetRepository.getCocoInstances(imagesIds);
    if (cocoInstancesResource is ResourceFailure) {
      resultsResource =
          ResourceFailure((cocoInstancesResource as ResourceFailure).failure);
      return resultsResource;
    }

    final cocoCaptionsResource =
        await cocoDatasetRepository.getCocoCaption(imagesIds);
    if (cocoCaptionsResource is ResourceFailure) {
      resultsResource =
          ResourceFailure((cocoCaptionsResource as ResourceFailure).failure);
      return resultsResource;
    }

    final cocoImages =
        (cocoImagesResource as ResourceData<List<CocoImage>>).data;
    final cocoInstances =
        (cocoInstancesResource as ResourceData<List<CocoInstance>>).data;
    final cocoCaptions =
        (cocoCaptionsResource as ResourceData<List<CocoCaption>>).data;

    final List<CocoResult> results = List.empty(growable: true);
    for (var cocoImage in cocoImages) {
      final List<CocoInstance> cocoImageInstances = cocoInstances.where((element) => element.imageId == cocoImage.id).toList();
      final List<CocoCaption> cocoImageCaptions = cocoCaptions.where((element) => element.imageId == cocoImage.id).toList();

      final categoriesIds = cocoImageInstances.map((e) => e.categoryId).toSet().toList();
      final categoriesResource = categoryRepository.getCategoriesByIds(categoriesIds);
      final categories = categoriesResource is ResourceData ? (categoriesResource as ResourceData).data : List.empty();

      results.add(CocoResult(cocoImage, cocoImageInstances, cocoImageCaptions, categories));
    }

    resultsResource = ResourceData(results);
    return resultsResource;
  }
}
