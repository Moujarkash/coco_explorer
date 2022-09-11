import 'package:coco_explorer/application/blocs/categories/categories_bloc.dart';
import 'package:coco_explorer/application/blocs/categories_suggestions/categories_suggestions_bloc.dart';
import 'package:coco_explorer/application/blocs/selected_categories/selected_categories_bloc.dart';
import 'package:coco_explorer/application/widgets/categories_suggestions_widget.dart';
import 'package:coco_explorer/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CategoriesBloc categoriesBloc = getIt<CategoriesBloc>();
  final CategoriesSuggestionsBloc categoriesSuggestionsBloc =
      getIt<CategoriesSuggestionsBloc>();
  final SelectedCategoriesBloc selectedCategoriesBloc =
      getIt<SelectedCategoriesBloc>();

  final TextEditingController searchTextEditingController =
      TextEditingController();
  bool searchHasText = false;

  final FocusNode searchFocusNode = FocusNode();
  bool isSearchHasFocus = false;

  @override
  void initState() {
    super.initState();
    categoriesBloc.add(CategoriesRequested());
    searchHasText = searchTextEditingController.text.isNotEmpty;
    isSearchHasFocus = searchFocusNode.hasFocus;

    searchTextEditingController.addListener(() {
      setState(() {
        searchHasText = searchTextEditingController.text.isNotEmpty;
      });
    });

    searchFocusNode.addListener(() {
      setState(() {
        isSearchHasFocus = searchFocusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("COCO Explorer"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.search),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: searchTextEditingController,
                  focusNode: searchFocusNode,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    label: const Text("Search for category"),
                    border: const OutlineInputBorder(),
                    suffixIcon: searchTextEditingController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              searchTextEditingController.text = "";
                              categoriesSuggestionsBloc
                                  .add(CategoriesSuggestionsCleared());
                            }, icon: const Icon(Icons.close))
                        : null,
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      categoriesSuggestionsBloc
                          .add(CategoriesSuggestionsCleared());
                      return;
                    }

                    categoriesSuggestionsBloc
                        .add(CategoriesSuggestionsRequested(value));
                  },
                ),
                BlocBuilder(
                  bloc: categoriesSuggestionsBloc,
                  builder: (context, state) {
                    if (state is CategoriesSuggestionsLoadSuccess &&
                        state.categories.isNotEmpty &&
                        isSearchHasFocus) {
                      final categories = state.categories;
                      return CategoriesSuggestionsWidget(
                        categories: categories,
                        onCategoryClicked: (category) {
                          selectedCategoriesBloc
                              .add(SelectedCategoriesAdded(category));
                          categoriesSuggestionsBloc
                              .add(CategoriesSuggestionsCleared());
                          searchTextEditingController.text = "";
                        },
                      );
                    }

                    return const SizedBox();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
