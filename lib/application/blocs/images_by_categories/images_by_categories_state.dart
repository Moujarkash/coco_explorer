part of 'images_by_categories_bloc.dart';

@immutable
abstract class ImagesByCategoriesState {}

class ImagesByCategoriesInitial extends ImagesByCategoriesState {}

class ImagesByCategoriesLoadInProgress extends ImagesByCategoriesState {}

class ImagesByCategoriesLoadFailure extends ImagesByCategoriesState {
  final Failure failure;

  ImagesByCategoriesLoadFailure(this.failure);
}

class ImagesByCategoriesLoadSuccess extends ImagesByCategoriesState {
  final List<int> imagesIds;

  ImagesByCategoriesLoadSuccess(this.imagesIds);
}
