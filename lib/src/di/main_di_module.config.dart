// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:kdigital_test/src/data/datasources/remote/characters_remote_datasource.dart'
    as _i517;
import 'package:kdigital_test/src/data/repository/characters_repository_impl.dart'
    as _i1021;
import 'package:kdigital_test/src/di/main_di_module.dart' as _i240;
import 'package:kdigital_test/src/domain/repository/characters_repository.dart'
    as _i856;
import 'package:kdigital_test/src/domain/usecases/get_characters_usecase.dart'
    as _i872;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerClientModule = _$RegisterClientModule();
    gh.singleton<_i519.Client>(() => registerClientModule.client);
    gh.factory<_i517.CharactersRemoteDatasource>(
        () => _i517.CharactersRemoteDatasourceImpl(gh<_i519.Client>()));
    gh.factory<_i856.CharactersRepository>(() =>
        _i1021.CharactersRepositoryImpl(
            api: gh<_i517.CharactersRemoteDatasource>()));
    gh.factory<_i872.GetCharacters>(() =>
        _i872.GetCharacters(repository: gh<_i856.CharactersRepository>()));
    return this;
  }
}

class _$RegisterClientModule extends _i240.RegisterClientModule {}
