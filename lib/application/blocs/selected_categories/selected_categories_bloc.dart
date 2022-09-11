import 'package:coco_explorer/domain/category/entities/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'selected_categories_event.dart';
part 'selected_categories_state.dart';

@injectable
class SelectedCategoriesBloc extends Bloc<SelectedCategoriesEvent, SelectedCategoriesState> {
  SelectedCategoriesBloc() : super(SelectedCategoriesState(List.empty(growable: true))) {
    on<SelectedCategoriesChanged>((event, emit) {
        final categories = state.selectedCategories;

        if (categories.contains(event.category)) {
          categories.remove(event.category);
        } else {
          categories.add(event.category);
        }

        emit(SelectedCategoriesState(categories));
    });
  }
}
