part of 'query_dataset_bloc.dart';

// @immutable
// abstract class QueryDatasetState {}
//
// class QueryDatasetInitial extends QueryDatasetState {}
//
// class QueryDatasetLoadInProgress extends QueryDatasetState {
// }
//
// class QueryDatasetLoadFailure extends QueryDatasetState {
//   final Failure failure;
//   final List<int> imagesIds;
//   final bool hasReachedEnd;
//
//   QueryDatasetLoadFailure(this.failure, this.imagesIds, this.hasReachedEnd);
// }
//
// class QueryDatasetLoadSuccess extends QueryDatasetState {
//   final List<CocoResult> results;
//   final List<int> imagesIds;
//   final bool hasReachedEnd;
//
//   QueryDatasetLoadSuccess(this.results, this.imagesIds, this.hasReachedEnd);
// }

enum QueryDatasetStatus { initial, success, failure }

class QueryDatasetState extends Equatable {
  final QueryDatasetStatus status;
  final List<CocoResult> results;
  final List<int> imagesIds;
  final Failure? failure;
  final bool hasReachedMax;

  const QueryDatasetState({
    this.status = QueryDatasetStatus.initial,
    this.results = const <CocoResult>[],
    this.imagesIds = const <int>[],
    this.failure,
    this.hasReachedMax = false,
  });



  QueryDatasetState copyWith({
    QueryDatasetStatus? status,
    List<CocoResult>? results,
    List<int>? imagesIds,
    Failure? failure,
    bool? hasReachedMax,
  }) {
    return QueryDatasetState(
      status: status ?? this.status,
      results: results ?? this.results,
      imagesIds: imagesIds ?? this.imagesIds,
      failure: failure ?? this.failure,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, results, imagesIds, hasReachedMax];
}
