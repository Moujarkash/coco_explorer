part of 'categories_suggestions_bloc.dart';

abstract class CategoriesSuggestionsEvent extends Equatable {
  const CategoriesSuggestionsEvent();
}

class CategoriesSuggestionsRequested extends CategoriesSuggestionsEvent {
  final String searchTerm;

  const CategoriesSuggestionsRequested(this.searchTerm);

  @override
  List<Object?> get props => [searchTerm];
}
