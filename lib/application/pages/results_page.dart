import 'package:auto_route/auto_route.dart';
import 'package:coco_explorer/application/blocs/images_by_categories/images_by_categories_bloc.dart';
import 'package:coco_explorer/application/blocs/query_dataset/query_dataset_bloc.dart';
import 'package:coco_explorer/application/routes/router.gr.dart';
import 'package:coco_explorer/application/widgets/error_view.dart';
import 'package:coco_explorer/application/widgets/result_list_item.dart';
import 'package:coco_explorer/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsPage extends StatefulWidget {
  final List<int> selectedCategoriesIds;

  const ResultsPage({Key? key, required this.selectedCategoriesIds})
      : super(key: key);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final ImagesByCategoriesBloc imagesByCategoriesBloc =
      getIt<ImagesByCategoriesBloc>();
  final QueryDatasetBloc queryDatasetBloc = getIt<QueryDatasetBloc>();

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    imagesByCategoriesBloc
        .add(ImagesByCategoriesRequested(widget.selectedCategoriesIds));

    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text("COCO Explorer"),
      ),
      body: BlocConsumer(
        bloc: imagesByCategoriesBloc,
        listener: (context, state) {
          if (state is ImagesByCategoriesLoadSuccess) {
            queryDatasetBloc.add(QueryDatasetRequested(state.imagesIds));
          }
        },
        builder: (context, state) {
          if (state is ImagesByCategoriesLoadFailure) {
            return Center(
              child: ErrorView(
                  onRetry: () {
                    imagesByCategoriesBloc.add(ImagesByCategoriesRequested(
                        widget.selectedCategoriesIds));
                  },
                  failure: state.failure),
            );
          } else if (state is ImagesByCategoriesLoadSuccess) {
            return BlocBuilder<QueryDatasetBloc, QueryDatasetState>(
              bloc: queryDatasetBloc,
              builder: (context, queryState) {
                switch (queryState.status) {
                  case QueryDatasetStatus.initial:
                    return const Center(child: CircularProgressIndicator());
                  case QueryDatasetStatus.success:
                    if (queryState.results.isEmpty) {
                      return const Center(
                        child: Text('No Results'),
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) {

                        if (index >= queryState.results.length) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          final result = queryState.results[index];
                          return ResultListItem(result: result, onDetailsClicked: () {
                            AutoRouter.of(context).push(ResultDetailsPageRoute(result: result));
                          },);
                        }
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 8,
                      ),
                      itemCount: queryState.hasReachedMax
                          ? queryState.results.length
                          : queryState.results.length + 1,
                      controller: _scrollController,
                    );
                  case QueryDatasetStatus.failure:
                    return Center(
                      child: ErrorView(
                          onRetry: () {
                            queryDatasetBloc.add(QueryDatasetRequested(
                                (imagesByCategoriesBloc.state
                                        as ImagesByCategoriesLoadSuccess)
                                    .imagesIds));
                          },
                          failure: queryState.failure!),
                    );
                }
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom)
      queryDatasetBloc.add(QueryDatasetRequested(
          (imagesByCategoriesBloc.state as ImagesByCategoriesLoadSuccess)
              .imagesIds));
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
