import 'package:coco_explorer/domain/category/entities/category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'selected_categories_event.dart';
part 'selected_categories_state.dart';

@injectable
class SelectedCategoriesBloc extends Bloc<SelectedCategoriesEvent, SelectedCategoriesState> {
  SelectedCategoriesBloc() : super(SelectedCategoriesState(List.empty(growable: true))) {
    on<SelectedCategoriesAdded>((event, emit) {
        final categories = state.selectedCategories;
        if (categories.contains(event.category)) return;

        categories.add(event.category);

        emit(SelectedCategoriesState(categories));
    });

    on<SelectedCategoriesRemoved>((event, emit) {
      final categories = state.selectedCategories;
      categories.remove(event.category);

      emit(SelectedCategoriesState(categories));
    });
  }
}
