import 'package:coco_explorer/domain/coco_dataset/entities/coco_caption.dart';
import 'package:coco_explorer/domain/coco_dataset/entities/coco_image.dart';
import 'package:coco_explorer/domain/coco_dataset/entities/coco_instance.dart';

class CocoResult {
  final CocoImage cocoImage;
  final List<CocoInstance> instances;
  final List<CocoCaption> captions;

  CocoResult(this.cocoImage, this.instances, this.captions);
}