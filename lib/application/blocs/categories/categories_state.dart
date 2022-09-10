part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesLoadInProgress extends CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesLoadFailure extends CategoriesState {
  final Failure failure;

  const CategoriesLoadFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

class CategoriesLoadSuccess extends CategoriesState {
  final List<Category> categories;

  const CategoriesLoadSuccess(this.categories);

  @override
  List<Object> get props => [categories];
}
