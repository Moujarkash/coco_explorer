import 'package:cached_network_image/cached_network_image.dart';
import 'package:coco_explorer/domain/coco_dataset/entities/coco_result.dart';
import 'package:flutter/material.dart';

class ResultListItem extends StatelessWidget {
  final CocoResult result;
  final Function onDetailsClicked;

  const ResultListItem({Key? key, required this.result, required this.onDetailsClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: result.cocoImage.imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FloatingActionButton(onPressed: () => onDetailsClicked(), child: const Icon(Icons.arrow_forward),)

                // IconButton(onPressed: () => onDetailsClicked(), icon: const Icon(Icons.arrow_forward)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
