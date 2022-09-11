part of 'query_dataset_bloc.dart';

@immutable
abstract class QueryDatasetEvent {}

class QueryDatasetRequested extends QueryDatasetEvent {
  final List<int> imagesIds;

  QueryDatasetRequested(this.imagesIds);
}
