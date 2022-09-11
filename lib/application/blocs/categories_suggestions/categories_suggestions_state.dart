part of 'categories_suggestions_bloc.dart';

abstract class CategoriesSuggestionsState {
  const CategoriesSuggestionsState();
}

class CategoriesSuggestionsInitial extends CategoriesSuggestionsState {
}

class CategoriesSuggestionsLoadInProgress extends CategoriesSuggestionsState {
}

class CategoriesSuggestionsLoadFailure extends CategoriesSuggestionsState {
  final Failure failure;

  const CategoriesSuggestionsLoadFailure(this.failure);
}

class CategoriesSuggestionsLoadSuccess extends CategoriesSuggestionsState {
  final List<Category> categories;

  const CategoriesSuggestionsLoadSuccess(this.categories);
}