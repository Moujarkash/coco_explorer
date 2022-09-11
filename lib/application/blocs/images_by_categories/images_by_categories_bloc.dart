import 'package:coco_explorer/domain/coco_dataset/usecases/get_images_ids_by_categories_usecase.dart';
import 'package:coco_explorer/domain/core/error/failure.dart';
import 'package:coco_explorer/domain/core/models/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'images_by_categories_event.dart';
part 'images_by_categories_state.dart';

@injectable
class ImagesByCategoriesBloc extends Bloc<ImagesByCategoriesEvent, ImagesByCategoriesState> {
  final GetImagesIdsByCategoriesUseCase getImagesIdsByCategoriesUseCase;

  ImagesByCategoriesBloc(this.getImagesIdsByCategoriesUseCase) : super(ImagesByCategoriesInitial()) {
    on<ImagesByCategoriesRequested>((event, emit) async {
      emit(ImagesByCategoriesLoadInProgress());

      final resource = await getImagesIdsByCategoriesUseCase.call(event.categoriesIds);
      if (resource is ResourceData) {
        final resourceData = resource as ResourceData;
        emit(ImagesByCategoriesLoadSuccess(resourceData.data));
      } else {
        final resourceFailure = resource as ResourceFailure;
        emit(ImagesByCategoriesLoadFailure(resourceFailure.failure));
      }
    });
  }
}
