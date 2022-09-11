import 'package:coco_explorer/domain/coco_dataset/repository/coco_dataset_repository.dart';
import 'package:coco_explorer/domain/core/models/resource.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetImagesIdsByCategoriesUseCase {
  final CocoDatasetRepository cocoDatasetRepository;

  GetImagesIdsByCategoriesUseCase(this.cocoDatasetRepository);

  Future<Resource<List<int>>> call(List<int> categoriesIds) {
    return cocoDatasetRepository.getImagesIdsByCategories(categoriesIds);
  }
}