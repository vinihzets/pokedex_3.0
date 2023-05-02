import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/services/auth/auth_service.dart';
import 'package:pokedex_3/core/services/database/database_service.dart';
import 'package:pokedex_3/core/utils/consts.dart';
import 'package:pokedex_3/features/home/data/datasources/home_datasources.dart';
import 'package:pokedex_3/features/home/data/datasources/remote/home_datasources_remote_impl.dart';
import 'package:pokedex_3/features/home/data/repositories/home_repository_impl.dart';
import 'package:pokedex_3/features/home/domain/repositories/home_repository.dart';
import 'package:pokedex_3/features/home/domain/usecases/fetch_pokemon_type_url_usecase_imp.dart';
import 'package:pokedex_3/features/home/domain/usecases/fetch_pokemon_url_usecase_imp.dart';
import 'package:pokedex_3/features/home/domain/usecases/sign_out_usecase_impl.dart';
import 'package:pokedex_3/features/home/presentation/bloc/home_bloc.dart';
import 'package:pokedex_3/features/login/data/datasources/login_datasources.dart';
import 'package:pokedex_3/features/login/data/datasources/remote/login_datasources_remote_imp.dart';
import 'package:pokedex_3/features/login/data/repositories/login_repository_imp.dart';
import 'package:pokedex_3/features/login/domain/repositories/login_repository.dart';
import 'package:pokedex_3/features/login/domain/usecases/sign_in_usecase_impl.dart';
import 'package:pokedex_3/features/login/presentation/bloc/login_bloc.dart';
import 'package:pokedex_3/features/pokemon_details/data/datasources/pokemon_details_datasources.dart';
import 'package:pokedex_3/features/pokemon_details/data/datasources/remote/pokemon_details_remote_datasources_impl.dart';
import 'package:pokedex_3/features/pokemon_details/data/repositories/pokemon_details_repository_impl.dart';
import 'package:pokedex_3/features/pokemon_details/domain/repositories/pokemon_details_repository.dart';
import 'package:pokedex_3/features/pokemon_details/domain/usecases/add_favorites_usecase_impl.dart';
import 'package:pokedex_3/features/pokemon_details/presentation/bloc/pokemon_details_bloc.dart';
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
    getIt.registerLazySingleton<PokemonDetailsDataSources>(
        () => PokemonDetailsRemoteDataSourcesRemoteImpl(getIt(), getIt()));

    getIt.registerLazySingleton<HomeDataSources>(
        () => HomeDataSourcesRemoteImpl(getIt()));

    getIt.registerLazySingleton<LoginDataSources>(
        () => LoginDataSourcesRemoteImpl(getIt()));

    getIt.registerLazySingleton<RegisterDataSources>(
        () => RegisterDataSourcesRemoteImpl(getIt(), getIt()));

    //repositories

    getIt.registerLazySingleton<PokemonDetailsRepository>(
        () => PokemonDetailsRepositoryImpl(getIt()));

    getIt.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(getIt()));

    getIt.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImpl(getIt()));

    getIt.registerLazySingleton<RegisterRepository>(
        () => RegisterRepositoryImpl(getIt()));

    //usecases

    getIt.registerLazySingleton(() => AddFavoritesUseCaseImpl(getIt()));
    getIt.registerLazySingleton(() => SignOutUseCaseImpl(getIt()));
    getIt.registerLazySingleton(() => FetchPokemonUrlTypeUseCaseImpl(getIt()));
    getIt.registerLazySingleton(() => FetchPokemonUrlUseCaseImpl(getIt()));
    getIt.registerLazySingleton(() => SignInUseCaseImpl(getIt()));
    getIt.registerLazySingleton(() => SignUpUseCaseImpl(getIt()));

    // --> bloc

    getIt.registerFactory(() => PokemonDetailsBloc(getIt()));
    getIt.registerFactory(() => HomeBloc(getIt(), getIt(), getIt(), getIt()));
    getIt.registerFactory(() => RegisterBloc(getIt()));
    getIt.registerFactory(() => LoginBloc(getIt(), getIt()));
    getIt.registerFactory(() => SplashBloc(getIt(), getIt()));
  }
}
