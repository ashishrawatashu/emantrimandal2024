// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i5;

import '../network/api_service.dart' as _i3;
import 'app_module.dart' as _i6;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.ApiService>(() => appModule.apiService);
  gh.factory<_i4.BaseOptions>(() => appModule.baseOptions);
  gh.factory<_i4.Dio>(() => appModule.dioProvider);
  gh.factory<_i5.PrettyDioLogger>(() => appModule.prettyDioLogger);
  return getIt;
}

class _$AppModule extends _i6.AppModule {}
