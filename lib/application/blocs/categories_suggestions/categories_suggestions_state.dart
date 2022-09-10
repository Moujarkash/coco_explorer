part of 'categories_suggestions_bloc.dart';

abstract class CategoriesSuggestionsState extends Equatable {
  const CategoriesSuggestionsState();
}

class CategoriesSuggestionsInitial extends CategoriesSuggestionsState {
  @override
  List<Object> get props => [];
}

class CategoriesSuggestionsLoadInProgress extends CategoriesSuggestionsState {
  @override
  List<Object> get props => [];
}

class CategoriesSuggestionsLoadFailure extends CategoriesSuggestionsState {
  final Failure failure;

  const CategoriesSuggestionsLoadFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

class CategoriesSuggestionsLoadSuccess extends CategoriesSuggestionsState {
  final List<Category> categories;

  const CategoriesSuggestionsLoadSuccess(this.categories);

  @override
  List<Object> get props => [categories];
}