import 'package:cached_network_image/cached_network_image.dart';
import 'package:coco_explorer/application/core/extensions/string_extensions.dart';
import 'package:coco_explorer/domain/category/entities/category.dart';
import 'package:flutter/material.dart';

class CategorySuggestionItem extends StatelessWidget {
  final Category category;
  final Function() onClick;

  const CategorySuggestionItem({Key? key, required this.category, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(imageUrl: category.imageUrl, width: 24, height: 24,),
      title: Text(category.title.capitalize()),
      onTap: onClick,
    );
  }
}
