import 'package:cached_network_image/cached_network_image.dart';
import 'package:coco_explorer/application/blocs/selected_categories/selected_categories_bloc.dart';
import 'package:coco_explorer/application/mixin/sized_image.dart';
import 'package:coco_explorer/application/painters/segmentation_painter.dart';
import 'package:coco_explorer/application/widgets/category_grid_item.dart';
import 'package:coco_explorer/di/injection.dart';
import 'package:coco_explorer/domain/coco_dataset/entities/coco_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultDetailsPage extends StatefulWidget {
  final CocoResult result;

  const ResultDetailsPage({Key? key, required this.result}) : super(key: key);

  @override
  State<ResultDetailsPage> createState() => _ResultDetailsPageState();
}

class _ResultDetailsPageState extends State<ResultDetailsPage>
    with ImageSizeMixin {
  final SelectedCategoriesBloc selectedCategoriesBloc =
      getIt<SelectedCategoriesBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text("COCO Explorer"),
      ),
      body: BlocBuilder<SelectedCategoriesBloc, SelectedCategoriesState>(
        bloc: selectedCategoriesBloc,
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                FutureBuilder(
                  future: getImageSize(widget.result.cocoImage.imageUrl),
                  builder: (context, snapshot) {
                    if (snapshot.data == null || !snapshot.hasData) {
                      return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ));
                    } else {
                      return CustomPaint(
                        size: const Size(double.infinity, 300),
                        foregroundPainter: SegmentationPainter(
                            widget.result.instances
                                .where((element) => state.selectedCategories
                                    .map((e) => e.id)
                                    .contains(element.categoryId))
                                .toList(),
                            (MediaQuery.of(context).size.width - 32) / (snapshot.data?.size.width ?? 1),
                            300 / (snapshot.data?.size.height ?? 1)),
                        child: CachedNetworkImage(
                          imageUrl: widget.result.cocoImage.imageUrl,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: 300,
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: widget.result.categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    final category = widget.result.categories[index];
                    final isSelected =
                        state.selectedCategories.contains(category);
                    return CategoryGridItem(
                      category: category,
                      isSelected: isSelected,
                      onClick: () {
                        selectedCategoriesBloc
                            .add(SelectedCategoriesChanged(category));
                      },
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 40,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
