import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'main_di_module.config.dart';

final getIt = GetIt.instance;

@module
abstract class RegisterClientModule {
  @singleton
  Client get client => Client();
}

@InjectableInit()
void configureDependencies() => getIt.init();
