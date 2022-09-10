part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();
}

class CategoriesRequested extends CategoriesEvent {
  @override
  List<Object?> get props => [];
}
