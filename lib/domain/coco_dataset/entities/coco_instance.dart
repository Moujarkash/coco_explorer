import 'package:equatable/equatable.dart';

class CocoInstance extends Equatable {
  final int imageId;
  final List<num> segmentation;
  final int categoryId;

  const CocoInstance(this.imageId, this.segmentation, this.categoryId);

  @override
  List<Object?> get props => [imageId, segmentation, categoryId];
}