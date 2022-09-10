// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i10;

import '../application/blocs/categories/categories_bloc.dart' as _i11;
import '../application/blocs/categories_suggestions/categories_suggestions_bloc.dart'
    as _i12;
import '../domain/category/repository/category_repository.dart' as _i4;
import '../domain/category/usecases/get_categories_suggestions_usecase.dart'
    as _i8;
import '../domain/category/usecases/get_categories_usecase.dart' as _i9;
import '../infrastructure/category/datasources/category_local_datasource.dart'
    as _i3;
import '../infrastructure/category/repository/category_repository_impl.dart'
    as _i5;
import '../infrastructure/core/config/configuration.dart' as _i6;
import 'injectable_module.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.CategoryLocalDatasource>(
      () => _i3.CategoryLocalDatasourceImpl());
  gh.lazySingleton<_i4.CategoryRepository>(
      () => _i5.CategoryRepositoryImpl(get<_i3.CategoryLocalDatasource>()));
  gh.lazySingleton<_i6.Configuration>(() => _i6.AppConfiguration());
  gh.lazySingleton<_i7.Dio>(() => injectableModule.dioInstance);
  gh.factory<_i8.GetCategoriesSuggestionsUseCase>(
      () => _i8.GetCategoriesSuggestionsUseCase(get<_i4.CategoryRepository>()));
  gh.factory<_i9.GetCategoriesUseCase>(
      () => _i9.GetCategoriesUseCase(get<_i4.CategoryRepository>()));
  gh.lazySingleton<_i10.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  gh.factory<_i11.CategoriesBloc>(
      () => _i11.CategoriesBloc(get<_i9.GetCategoriesUseCase>()));
  gh.factory<_i12.CategoriesSuggestionsBloc>(() =>
      _i12.CategoriesSuggestionsBloc(
          get<_i8.GetCategoriesSuggestionsUseCase>()));
  return get;
}

class _$InjectableModule extends _i13.InjectableModule {}
