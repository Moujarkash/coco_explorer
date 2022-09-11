part of 'selected_categories_bloc.dart';

@immutable
abstract class SelectedCategoriesEvent {
  const SelectedCategoriesEvent();
}

class SelectedCategoriesChanged extends SelectedCategoriesEvent {
  final Category category;

  const SelectedCategoriesChanged(this.category);
}
