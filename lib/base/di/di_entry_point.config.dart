// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../../features/market_data/data/repos/market_data_repo_impl.dart'
    as _i814;
import '../../features/market_data/data/sources/market_data_remote_datasource.dart'
    as _i1022;
import '../../features/market_data/data/sources/market_data_websocket_datasource.dart'
    as _i770;
import '../../features/market_data/domain/repos/market_data_repo.dart' as _i506;
import '../../features/market_data/domain/use_cases/get_market_data_use_case.dart'
    as _i270;
import '../../features/market_data/presentation/blocs/market_data_cubit.dart'
    as _i33;
import '../networking/http_client.dart' as _i757;
import 'app_module.dart' as _i460;
import 'network_module.dart' as _i567;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initDependencyInjection(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final appModule = _$AppModule();
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i974.Logger>(() => appModule.logger());
  gh.lazySingleton<_i361.Dio>(() => networkModule.dio());
  gh.lazySingleton<_i757.HttpClient>(
    () => networkModule.httpClient(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i1022.MarketDataRemoteDataSource>(
    () => _i1022.MarketDataRemoteDataSourceImpl(gh<_i757.HttpClient>()),
  );
  gh.lazySingleton<_i770.MarketDataWebSocketDataSource>(
    () => _i770.MarketDataWebSocketDataSourceImpl(gh<_i974.Logger>()),
  );
  gh.lazySingleton<_i506.MarketDataRepository>(
    () => _i814.MarketDataRepositoryImpl(
      gh<_i1022.MarketDataRemoteDataSource>(),
      gh<_i770.MarketDataWebSocketDataSource>(),
      gh<_i974.Logger>(),
    ),
  );
  gh.lazySingleton<_i270.GetMarketDataUseCase>(
    () => _i270.GetMarketDataUseCase(gh<_i506.MarketDataRepository>()),
  );
  gh.lazySingleton<_i33.MarketDataCubit>(
    () => _i33.MarketDataCubit(
      gh<_i270.GetMarketDataUseCase>(),
      gh<_i506.MarketDataRepository>(),
    ),
  );
  return getIt;
}

class _$AppModule extends _i460.AppModule {}

class _$NetworkModule extends _i567.NetworkModule {}
