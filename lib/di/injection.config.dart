// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i6;

import '../application/blocs/categories/categories_bloc.dart' as _i13;
import '../application/blocs/categories_suggestions/categories_suggestions_bloc.dart'
    as _i14;
import '../application/blocs/selected_categories/selected_categories_bloc.dart'
    as _i7;
import '../domain/category/repository/category_repository.dart' as _i8;
import '../domain/category/usecases/get_categories_suggestions_usecase.dart'
    as _i11;
import '../domain/category/usecases/get_categories_usecase.dart' as _i12;
import '../domain/coco_dataset/repository/coco_dataset_repository.dart' as _i16;
import '../domain/coco_dataset/usecases/get_images_ids_by_categories_usecase.dart'
    as _i18;
import '../domain/coco_dataset/usecases/get_query_dataset_usecase.dart' as _i19;
import '../infrastructure/category/datasources/category_local_datasource.dart'
    as _i3;
import '../infrastructure/category/repository/category_repository_impl.dart'
    as _i9;
import '../infrastructure/coco_dataset/datasources/coco_dataset_remote_datasource.dart'
    as _i15;
import '../infrastructure/coco_dataset/repository/coco_dataset_repository_impl.dart'
    as _i17;
import '../infrastructure/coco_dataset/service/coco_dataset_service.dart'
    as _i10;
import '../infrastructure/core/config/configuration.dart' as _i4;
import 'injectable_module.dart' as _i20; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  await gh.lazySingletonAsync<_i3.CategoryLocalDatasource>(
      () => _i3.CategoryLocalDatasourceImpl.create(),
      preResolve: true);
  gh.lazySingleton<_i4.Configuration>(() => _i4.AppConfiguration());
  gh.lazySingleton<_i5.Dio>(() => injectableModule.dioInstance);
  gh.lazySingleton<_i6.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  gh.factory<_i7.SelectedCategoriesBloc>(() => _i7.SelectedCategoriesBloc());
  gh.lazySingleton<_i8.CategoryRepository>(() => _i9.CategoryRepositoryImpl(
      get<_i3.CategoryLocalDatasource>(), get<_i4.Configuration>()));
  gh.lazySingleton<_i10.CocoDatasetService>(
      () => _i10.CocoDatasetService(get<_i5.Dio>(), get<_i4.Configuration>()));
  gh.factory<_i11.GetCategoriesSuggestionsUseCase>(() =>
      _i11.GetCategoriesSuggestionsUseCase(get<_i8.CategoryRepository>()));
  gh.factory<_i12.GetCategoriesUseCase>(
      () => _i12.GetCategoriesUseCase(get<_i8.CategoryRepository>()));
  gh.factory<_i13.CategoriesBloc>(
      () => _i13.CategoriesBloc(get<_i12.GetCategoriesUseCase>()));
  gh.factory<_i14.CategoriesSuggestionsBloc>(() =>
      _i14.CategoriesSuggestionsBloc(
          get<_i11.GetCategoriesSuggestionsUseCase>()));
  gh.lazySingleton<_i15.CocoDatasetRemoteDatasource>(() =>
      _i15.CocoDatasetRemoteDatasourceImp(get<_i10.CocoDatasetService>()));
  gh.lazySingleton<_i16.CocoDatasetRepository>(() =>
      _i17.CocoDatasetRepositoryImpl(get<_i15.CocoDatasetRemoteDatasource>()));
  gh.factory<_i18.GetImagesIdsByCategoriesUseCase>(() =>
      _i18.GetImagesIdsByCategoriesUseCase(get<_i16.CocoDatasetRepository>()));
  gh.factory<_i19.GetQueryDatasetUseCase>(
      () => _i19.GetQueryDatasetUseCase(get<_i16.CocoDatasetRepository>()));
  return get;
}

class _$InjectableModule extends _i20.InjectableModule {}
