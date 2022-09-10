// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;

import '../domain/category/repository/category_repository.dart' as _i6;
import '../domain/category/usecases/get_categories_suggestions_usecase.dart'
    as _i5;
import '../domain/category/usecases/get_categories_usecase.dart' as _i7;
import '../infrastructure/core/config/configuration.dart' as _i3;
import 'injectable_module.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Configuration>(() => _i3.AppConfiguration());
  gh.lazySingleton<_i4.Dio>(() => injectableModule.dioInstance);
  gh.factory<_i5.GetCategoriesSuggestionsUseCase>(
      () => _i5.GetCategoriesSuggestionsUseCase(get<_i6.CategoryRepository>()));
  gh.factory<_i7.GetCategoriesUseCase>(
      () => _i7.GetCategoriesUseCase(get<_i6.CategoryRepository>()));
  gh.lazySingleton<_i8.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  return get;
}

class _$InjectableModule extends _i9.InjectableModule {}
