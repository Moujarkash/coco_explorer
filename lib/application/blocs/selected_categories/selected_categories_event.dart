part of 'selected_categories_bloc.dart';

abstract class SelectedCategoriesEvent extends Equatable {
  const SelectedCategoriesEvent();
}

class SelectedCategoriesAdded extends SelectedCategoriesEvent {
  final Category category;

  const SelectedCategoriesAdded(this.category);

  @override
  List<Object?> get props => [category];
}

class SelectedCategoriesRemoved extends SelectedCategoriesEvent {
  final Category category;

  const SelectedCategoriesRemoved(this.category);

  @override
  List<Object?> get props => [category];
}
