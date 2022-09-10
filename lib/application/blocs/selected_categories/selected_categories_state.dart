part of 'selected_categories_bloc.dart';

class SelectedCategoriesState extends Equatable {
  final List<Category> selectedCategories;

  const SelectedCategoriesState(this.selectedCategories);

  @override
  List<Object?> get props => [selectedCategories];
}
