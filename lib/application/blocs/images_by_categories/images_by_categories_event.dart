part of 'images_by_categories_bloc.dart';

@immutable
abstract class ImagesByCategoriesEvent {}

class ImagesByCategoriesRequested extends ImagesByCategoriesEvent {
  final List<int> categoriesIds;

  ImagesByCategoriesRequested(this.categoriesIds);
}
