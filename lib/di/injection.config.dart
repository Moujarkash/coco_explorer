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

import '../application/blocs/categories/categories_bloc.dart' as _i14;
import '../application/blocs/categories_suggestions/categories_suggestions_bloc.dart'
    as _i15;
import '../application/blocs/images_by_categories/images_by_categories_bloc.dart'
    as _i21;
import '../application/blocs/query_dataset/query_dataset_bloc.dart' as _i22;
import '../application/blocs/selected_categories/selected_categories_bloc.dart'
    as _i8;
import '../domain/category/repository/category_repository.dart' as _i9;
import '../domain/category/usecases/get_categories_suggestions_usecase.dart'
    as _i12;
import '../domain/category/usecases/get_categories_usecase.dart' as _i13;
import '../domain/coco_dataset/repository/coco_dataset_repository.dart' as _i17;
import '../domain/coco_dataset/usecases/get_images_ids_by_categories_usecase.dart'
    as _i19;
import '../domain/coco_dataset/usecases/get_query_dataset_usecase.dart' as _i20;
import '../infrastructure/category/datasources/category_local_datasource.dart'
    as _i3;
import '../infrastructure/category/repository/category_repository_impl.dart'
    as _i10;
import '../infrastructure/coco_dataset/datasources/coco_dataset_remote_datasource.dart'
    as _i16;
import '../infrastructure/coco_dataset/repository/coco_dataset_repository_impl.dart'
    as _i18;
import '../infrastructure/coco_dataset/service/coco_dataset_service.dart'
    as _i11;
import '../infrastructure/core/config/configuration.dart' as _i4;
import '../infrastructure/core/utils/network_info.dart' as _i7;
import 'injectable_module.dart' as _i23; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i7.NetworkInfo>(
      () => _i7.NetworkInfoImpl(get<_i6.InternetConnectionChecker>()));
  gh.factory<_i8.SelectedCategoriesBloc>(() => _i8.SelectedCategoriesBloc());
  gh.lazySingleton<_i9.CategoryRepository>(() => _i10.CategoryRepositoryImpl(
      get<_i3.CategoryLocalDatasource>(), get<_i4.Configuration>()));
  gh.lazySingleton<_i11.CocoDatasetService>(
      () => _i11.CocoDatasetService(get<_i5.Dio>(), get<_i4.Configuration>()));
  gh.factory<_i12.GetCategoriesSuggestionsUseCase>(() =>
      _i12.GetCategoriesSuggestionsUseCase(get<_i9.CategoryRepository>()));
  gh.factory<_i13.GetCategoriesUseCase>(
      () => _i13.GetCategoriesUseCase(get<_i9.CategoryRepository>()));
  gh.factory<_i14.CategoriesBloc>(
      () => _i14.CategoriesBloc(get<_i13.GetCategoriesUseCase>()));
  gh.factory<_i15.CategoriesSuggestionsBloc>(() =>
      _i15.CategoriesSuggestionsBloc(
          get<_i12.GetCategoriesSuggestionsUseCase>()));
  gh.lazySingleton<_i16.CocoDatasetRemoteDatasource>(() =>
      _i16.CocoDatasetRemoteDatasourceImp(get<_i11.CocoDatasetService>()));
  gh.lazySingleton<_i17.CocoDatasetRepository>(() =>
      _i18.CocoDatasetRepositoryImpl(
          get<_i16.CocoDatasetRemoteDatasource>(), get<_i7.NetworkInfo>()));
  gh.factory<_i19.GetImagesIdsByCategoriesUseCase>(() =>
      _i19.GetImagesIdsByCategoriesUseCase(get<_i17.CocoDatasetRepository>()));
  gh.factory<_i20.GetQueryDatasetUseCase>(() => _i20.GetQueryDatasetUseCase(
      get<_i17.CocoDatasetRepository>(), get<_i9.CategoryRepository>()));
  gh.factory<_i21.ImagesByCategoriesBloc>(() =>
      _i21.ImagesByCategoriesBloc(get<_i19.GetImagesIdsByCategoriesUseCase>()));
  gh.factory<_i22.QueryDatasetBloc>(
      () => _i22.QueryDatasetBloc(get<_i20.GetQueryDatasetUseCase>()));
  return get;
}

class _$InjectableModule extends _i23.InjectableModule {}
