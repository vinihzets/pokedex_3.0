import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/services/auth/auth_service.dart';
import 'package:pokedex_3/core/services/database/database_service.dart';
import 'package:pokedex_3/core/utils/consts.dart';
import 'package:pokedex_3/features/login/data/datasources/login_datasources.dart';
import 'package:pokedex_3/features/login/data/datasources/remote/login_datasources_remote_imp.dart';
import 'package:pokedex_3/features/login/data/repositories/login_repository_imp.dart';
import 'package:pokedex_3/features/login/domain/repositories/login_repository.dart';
import 'package:pokedex_3/features/login/domain/usecases/sign_in_usecase_impl.dart';
import 'package:pokedex_3/features/login/presentation/bloc/login_bloc.dart';
import 'package:pokedex_3/features/register/data/datasources/register_datasources.dart';
import 'package:pokedex_3/features/register/data/datasources/remote/register_datasources_remote_imp.dart';
import 'package:pokedex_3/features/register/data/repositories/register_repository_imp.dart';
import 'package:pokedex_3/features/register/domain/repositories/register_repository.dart';
import 'package:pokedex_3/features/register/domain/usecases/sign_up_usecase_imp.dart';
import 'package:pokedex_3/features/register/presentation/bloc/register_bloc.dart';
import 'package:pokedex_3/features/splash/presentation/bloc/splash_bloc.dart';

class Injector {
  static inject() {
    final GetIt getIt = GetIt.instance;

    //core

    getIt.registerLazySingleton(() => ConstsRoutes());
    getIt.registerLazySingleton(() => DatabaseService());
    getIt.registerLazySingleton(() => AuthService());

    //datasources

    getIt.registerLazySingleton<LoginDataSources>(
        () => LoginDataSourcesRemoteImpl(getIt()));

    getIt.registerLazySingleton<RegisterDataSources>(
        () => RegisterDataSourcesRemoteImpl(getIt(), getIt()));

    //repositories

    getIt.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImpl(getIt()));

    getIt.registerLazySingleton<RegisterRepository>(
        () => RegisterRepositoryImpl(getIt()));

    //usecases

    getIt.registerLazySingleton(() => SignInUseCaseImpl(getIt()));
    getIt.registerLazySingleton(() => SignUpUseCaseImpl(getIt()));

    // --> bloc

    getIt.registerFactory(() => RegisterBloc(getIt()));
    getIt.registerFactory(() => LoginBloc(getIt(), getIt()));
    getIt.registerFactory(() => SplashBloc(getIt()));
  }
}
