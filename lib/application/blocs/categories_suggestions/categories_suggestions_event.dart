part of 'categories_suggestions_bloc.dart';

abstract class CategoriesSuggestionsEvent {
  const CategoriesSuggestionsEvent();
}

class CategoriesSuggestionsRequested extends CategoriesSuggestionsEvent {
  final String searchTerm;

  const CategoriesSuggestionsRequested(this.searchTerm);
}


class CategoriesSuggestionsCleared extends CategoriesSuggestionsEvent {
}