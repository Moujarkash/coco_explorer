import 'package:equatable/equatable.dart';

class CocoCaption extends Equatable {
  final String caption;
  final int imageId;

  const CocoCaption(this.caption, this.imageId);

  @override
  List<Object?> get props => [caption, imageId];
}