part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {
}

class CategoriesLoadInProgress extends CategoriesState {
}

class CategoriesLoadFailure extends CategoriesState {
  final Failure failure;

  const CategoriesLoadFailure(this.failure);
}

class CategoriesLoadSuccess extends CategoriesState {
  final List<Category> categories;

  const CategoriesLoadSuccess(this.categories);
}
