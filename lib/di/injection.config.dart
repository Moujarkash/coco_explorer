// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i9;

import '../application/blocs/categories/categories_bloc.dart' as _i15;
import '../application/blocs/categories_suggestions/categories_suggestions_bloc.dart'
    as _i16;
import '../application/blocs/selected_categories/selected_categories_bloc.dart'
    as _i10;
import '../domain/category/repository/category_repository.dart' as _i11;
import '../domain/category/usecases/get_categories_suggestions_usecase.dart'
    as _i13;
import '../domain/category/usecases/get_categories_usecase.dart' as _i14;
import '../domain/coco_dataset/repository/coco_dataset_repository.dart' as _i7;
import '../domain/coco_dataset/usecases/get_images_ids_by_categories_usecase.dart'
    as _i6;
import '../domain/coco_dataset/usecases/get_query_dataset_usecase.dart' as _i8;
import '../infrastructure/category/datasources/category_local_datasource.dart'
    as _i3;
import '../infrastructure/category/repository/category_repository_impl.dart'
    as _i12;
import '../infrastructure/core/config/configuration.dart' as _i4;
import 'injectable_module.dart' as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.CategoryLocalDatasource>(
      () => _i3.CategoryLocalDatasourceImpl());
  gh.lazySingleton<_i4.Configuration>(() => _i4.AppConfiguration());
  gh.lazySingleton<_i5.Dio>(() => injectableModule.dioInstance);
  gh.factory<_i6.GetImagesIdsByCategoriesUseCase>(() =>
      _i6.GetImagesIdsByCategoriesUseCase(get<_i7.CocoDatasetRepository>()));
  gh.factory<_i8.GetQueryDatasetUseCase>(
      () => _i8.GetQueryDatasetUseCase(get<_i7.CocoDatasetRepository>()));
  gh.lazySingleton<_i9.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  gh.factory<_i10.SelectedCategoriesBloc>(() => _i10.SelectedCategoriesBloc());
  gh.lazySingleton<_i11.CategoryRepository>(() => _i12.CategoryRepositoryImpl(
      get<_i3.CategoryLocalDatasource>(), get<_i4.Configuration>()));
  gh.factory<_i13.GetCategoriesSuggestionsUseCase>(() =>
      _i13.GetCategoriesSuggestionsUseCase(get<_i11.CategoryRepository>()));
  gh.factory<_i14.GetCategoriesUseCase>(
      () => _i14.GetCategoriesUseCase(get<_i11.CategoryRepository>()));
  gh.factory<_i15.CategoriesBloc>(
      () => _i15.CategoriesBloc(get<_i14.GetCategoriesUseCase>()));
  gh.factory<_i16.CategoriesSuggestionsBloc>(() =>
      _i16.CategoriesSuggestionsBloc(
          get<_i13.GetCategoriesSuggestionsUseCase>()));
  return get;
}

class _$InjectableModule extends _i17.InjectableModule {}
