import 'package:coco_explorer/application/widgets/category_suggestion_item.dart';
import 'package:coco_explorer/domain/category/entities/category.dart';
import 'package:flutter/material.dart';

class CategoriesSuggestionsWidget extends StatelessWidget {
  final List<Category> categories;
  final Function(Category) onCategoryClicked;

  const CategoriesSuggestionsWidget(
      {Key? key, required this.categories, required this.onCategoryClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 300),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategorySuggestionItem(
                category: category,
                onClick: () => onCategoryClicked(category),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 0,
                ),
            itemCount: categories.length),
      ),
    );
  }
}
