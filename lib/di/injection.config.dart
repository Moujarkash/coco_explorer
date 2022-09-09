// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i7;

import '../domain/category/repository/category_repository.dart' as _i5;
import '../domain/category/usecases/get_categories_suggestions_usecase.dart'
    as _i4;
import '../domain/category/usecases/get_categories_usecase.dart' as _i6;
import 'injectable_module.dart' as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Dio>(() => injectableModule.dioInstance);
  gh.lazySingleton<_i4.GetCategoriesSuggestionsUseCase>(
      () => _i4.GetCategoriesSuggestionsUseCase(get<_i5.CategoryRepository>()));
  gh.lazySingleton<_i6.GetCategoriesUseCase>(
      () => _i6.GetCategoriesUseCase(get<_i5.CategoryRepository>()));
  gh.lazySingleton<_i7.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  return get;
}

class _$InjectableModule extends _i8.InjectableModule {}
