import 'package:coco_explorer/domain/category/entities/category.dart';
import 'package:coco_explorer/domain/category/usecases/get_categories_suggestions_usecase.dart';
import 'package:coco_explorer/domain/core/error/failure.dart';
import 'package:coco_explorer/domain/core/models/resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'categories_suggestions_event.dart';

part 'categories_suggestions_state.dart';

@injectable
class CategoriesSuggestionsBloc
    extends Bloc<CategoriesSuggestionsEvent, CategoriesSuggestionsState> {
  final GetCategoriesSuggestionsUseCase getCategoriesSuggestionsUseCase;

  CategoriesSuggestionsBloc(this.getCategoriesSuggestionsUseCase)
      : super(CategoriesSuggestionsInitial()) {
    on<CategoriesSuggestionsRequested>((event, emit) {
      emit(CategoriesSuggestionsLoadInProgress());

      final resource = getCategoriesSuggestionsUseCase.call(event.searchTerm);
      if (resource is ResourceData) {
        final resourceData = resource as ResourceData;
        emit(CategoriesSuggestionsLoadSuccess(resourceData.data));
      } else {
        final resourceFailure = resource as ResourceFailure;
        emit(CategoriesSuggestionsLoadFailure(resourceFailure.failure));
      }
    });

    on<CategoriesSuggestionsCleared>((event, emit) {
      emit(CategoriesSuggestionsLoadSuccess(List.empty()));
    });
  }
}
