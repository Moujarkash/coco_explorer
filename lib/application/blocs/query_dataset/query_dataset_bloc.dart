import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:coco_explorer/domain/coco_dataset/entities/coco_result.dart';
import 'package:coco_explorer/domain/coco_dataset/usecases/get_query_dataset_usecase.dart';
import 'package:coco_explorer/domain/core/error/failure.dart';
import 'package:coco_explorer/domain/core/models/resource.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

part 'query_dataset_event.dart';

part 'query_dataset_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@injectable
class QueryDatasetBloc extends Bloc<QueryDatasetEvent, QueryDatasetState> {
  final GetQueryDatasetUseCase getQueryDatasetUseCase;

  QueryDatasetBloc(this.getQueryDatasetUseCase)
      : super(const QueryDatasetState()) {
    on<QueryDatasetRequested>(
      (event, emit) async {
        if (state.hasReachedMax) return;

        if (state.status == QueryDatasetStatus.initial) {
          final imagesIds = event.imagesIds.take(5).toList();
          final resource = await getQueryDatasetUseCase.call(imagesIds);
          if (resource is ResourceData) {
            final resourceData = resource as ResourceData;
            return emit(state.copyWith(
                status: QueryDatasetStatus.success,
                results: resourceData.data,
                imagesIds: imagesIds,
                hasReachedMax: event.imagesIds.length <= 5));
          } else {
            final resourceFailure = resource as ResourceFailure;
            return emit(state.copyWith(
                status: QueryDatasetStatus.failure,
                imagesIds: imagesIds,
                failure: resourceFailure.failure,
                hasReachedMax: event.imagesIds.length <= 5));
          }
        } else if (state.status == QueryDatasetStatus.failure) {
          final imagesIds = state.imagesIds;

          final resource = await getQueryDatasetUseCase.call(imagesIds);
          if (resource is ResourceData) {
            final resourceData = resource as ResourceData;
            return emit(state.copyWith(
                status: QueryDatasetStatus.success,
                results: List.of(state.results)..addAll(resourceData.data),
                imagesIds: imagesIds));
          } else {
            final resourceFailure = resource as ResourceFailure;
            return emit(state.copyWith(
              status: QueryDatasetStatus.failure,
              imagesIds: imagesIds,
              failure: resourceFailure.failure,
            ));
          }
        } else if (state.status == QueryDatasetStatus.success) {
          final previousIds = state.imagesIds;
          final remainingImagesIds = event.imagesIds;
          remainingImagesIds
              .removeWhere((element) => previousIds.contains(element));

          final imagesIds = remainingImagesIds.take(5).toList();
          final resource = await getQueryDatasetUseCase.call(imagesIds);
          if (resource is ResourceData) {
            final resourceData = resource as ResourceData;
            return emit(state.copyWith(
                status: QueryDatasetStatus.success,
                results: List.of(state.results)..addAll(resourceData.data),
                imagesIds: imagesIds,
                hasReachedMax: remainingImagesIds.length <= 5));
          } else {
            final resourceFailure = resource as ResourceFailure;
            return emit(state.copyWith(
                status: QueryDatasetStatus.failure,
                imagesIds: imagesIds,
                failure: resourceFailure.failure,
                hasReachedMax: remainingImagesIds.length <= 5));
          }
        }
      },
      transformer: throttleDroppable(throttleDuration),
    );
  }
}
