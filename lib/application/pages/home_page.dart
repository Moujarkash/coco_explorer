import 'package:cached_network_image/cached_network_image.dart';
import 'package:coco_explorer/application/blocs/categories/categories_bloc.dart';
import 'package:coco_explorer/application/blocs/categories_suggestions/categories_suggestions_bloc.dart';
import 'package:coco_explorer/application/blocs/selected_categories/selected_categories_bloc.dart';
import 'package:coco_explorer/application/widgets/categories_suggestions_widget.dart';
import 'package:coco_explorer/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text("COCO Explorer"),
      ),
      bottomNavigationBar: Material(
        elevation: 4,
        child: Container(
          width: double.infinity,
          height: 80,
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Explore'),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: TextField(
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
                            },
                            icon: const Icon(Icons.close))
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
              ),
              BlocBuilder(
                bloc: categoriesBloc,
                builder: (context, state) {
                  if (state is CategoriesLoadSuccess) {
                    final allCategories = state.categories;
                    return Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        itemCount: allCategories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BlocBuilder<SelectedCategoriesBloc,
                              SelectedCategoriesState>(
                            bloc: selectedCategoriesBloc,
                            builder: (context, selectedCategoriesState) {
                              final category = allCategories[index];
                              final isSelected = selectedCategoriesState
                                  .selectedCategories
                                  .contains(category);
                              return GestureDetector(
                                onTap: () {
                                  selectedCategoriesBloc
                                      .add(SelectedCategoriesChanged(category));
                                },
                                child: GridTile(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: isSelected
                                              ? Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 3)
                                              : null),
                                      child: CachedNetworkImage(
                                        imageUrl: category.imageUrl,
                                        width: 40,
                                        height: 40,
                                      )),
                                ),
                              );
                            },
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 40,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16),
                      ),
                    );
                  }

                  return const SizedBox();
                },
              )
            ],
          ),
          BlocBuilder(
            bloc: categoriesSuggestionsBloc,
            builder: (context, state) {
              if (state is CategoriesSuggestionsLoadSuccess &&
                  state.categories.isNotEmpty &&
                  isSearchHasFocus) {
                final categories = state.categories;
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 70, 16, 0),
                  child: CategoriesSuggestionsWidget(
                    categories: categories,
                    onCategoryClicked: (category) {
                      selectedCategoriesBloc
                          .add(SelectedCategoriesChanged(category));
                      categoriesSuggestionsBloc
                          .add(CategoriesSuggestionsCleared());
                      searchTextEditingController.text = "";
                    },
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
