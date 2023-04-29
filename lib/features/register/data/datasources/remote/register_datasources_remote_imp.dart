import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokedex_3/core/services/auth/auth_service.dart';
import 'package:pokedex_3/core/services/database/database_service.dart';
import 'package:pokedex_3/features/register/data/datasources/mappers/register_mapper.dart';
import 'package:pokedex_3/features/register/data/datasources/register_datasources.dart';
import 'package:pokedex_3/features/register/domain/usecases/sign_up_usecase_imp.dart';

class RegisterDataSourcesRemoteImpl implements RegisterDataSources {
  DatabaseService databaseService;
  AuthService authService;

  RegisterDataSourcesRemoteImpl(this.databaseService, this.authService);

  @override
  Future<UserCredential> signUp(RegisterParams params) async {
    final mapper = RegisterMapper(params.username, params.email);

    final auth = await authService.auth.createUserWithEmailAndPassword(
        email: params.email, password: params.password);
    final db = databaseService.database.collection('users').add(mapper.toMap());

    return auth;
  }
}
