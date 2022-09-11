import 'package:cached_network_image/cached_network_image.dart';
import 'package:coco_explorer/domain/category/entities/category.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final Function onClick;

  const CategoryGridItem(
      {Key? key,
      required this.isSelected,
      required this.category,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: GridTile(
        child: Container(
            decoration: BoxDecoration(
                border: isSelected
                    ? Border.all(
                        color: Theme.of(context).primaryColor, width: 3)
                    : null),
            child: CachedNetworkImage(
              imageUrl: category.imageUrl,
              width: 40,
              height: 40,
            )),
      ),
    );
  }
}
