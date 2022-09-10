import 'package:coco_explorer/domain/category/entities/category.dart';
import 'package:coco_explorer/domain/category/repository/category_repository.dart';
import 'package:coco_explorer/domain/core/models/resource.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesSuggestionsUseCase {
  final CategoryRepository categoryRepository;

  GetCategoriesSuggestionsUseCase(this.categoryRepository);

  Resource<List<Category>> call(String searchTerm) {
    return categoryRepository.getCategoriesSuggestions(searchTerm);
  }
}