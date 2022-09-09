import 'package:coco_explorer/domain/core/error/failure.dart';

class Resource<T> {
  Resource._();

  factory Resource.data(T data) = ResourceData;
  factory Resource.failure(Failure failure) = ResourceFailure;
}

class ResourceData<T> extends Resource<T> {
  final T data;

  ResourceData(this.data): super._();
}

class ResourceFailure<T> extends Resource<T> {
  final Failure failure;

  ResourceFailure(this.failure): super._();
}