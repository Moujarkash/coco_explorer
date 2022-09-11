import 'package:coco_explorer/domain/category/entities/category.dart';
import 'package:coco_explorer/domain/category/repository/category_repository.dart';
import 'package:coco_explorer/domain/core/models/resource.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  final CategoryRepository categoryRepository;

  GetCategoriesUseCase(this.categoryRepository);

  Future<Resource<List<Category>>> call() {
    return categoryRepository.getCategories();
  }
}