part of 'categories_bloc.dart';

@immutable
abstract class CategoriesEvent {
  const CategoriesEvent();
}

class CategoriesRequested extends CategoriesEvent {}
