import 'package:equatable/equatable.dart';

class CocoImage extends Equatable {
  final int id;
  final String imageUrl;

  const CocoImage(this.id, this.imageUrl);

  @override
  List<Object?> get props => [id, imageUrl];
}