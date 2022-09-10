import 'package:coco_explorer/domain/category/entities/category.dart';
import 'package:coco_explorer/domain/category/usecases/get_categories_usecase.dart';
import 'package:coco_explorer/domain/core/error/failure.dart';
import 'package:coco_explorer/domain/core/models/resource.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'categories_event.dart';

part 'categories_state.dart';

@injectable
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoriesBloc(this.getCategoriesUseCase) : super(CategoriesInitial()) {
    on<CategoriesRequested>((event, emit) {
      emit(CategoriesLoadInProgress());

      final resource = getCategoriesUseCase.call();
      if (resource is ResourceData) {
        final resourceData = resource as ResourceData;
        emit(CategoriesLoadSuccess(resourceData.data));
      } else {
        final resourceFailure = resource as ResourceFailure;
        emit(CategoriesLoadFailure(resourceFailure.failure));
      }
    });
  }
}
