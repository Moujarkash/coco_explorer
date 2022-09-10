import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String title;
  final String imageUrl;

  const Category(this.id, this.title, this.imageUrl);

  @override
  List<Object?> get props => [id, title, imageUrl];
}