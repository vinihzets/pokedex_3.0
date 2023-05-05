import 'package:pokedex_3/core/services/auth/auth_service.dart';
import 'package:pokedex_3/core/services/database/database_service.dart';
import 'package:pokedex_3/features/inventory/data/datasources/inventory_datasources.dart';
import 'package:pokedex_3/features/inventory/domain/entities/inventory_entity.dart';

class InventoryDataSourcesRemoteImpl implements InventoryDataSources {
  DatabaseService databaseService;
  AuthService authService;

  InventoryDataSourcesRemoteImpl(this.databaseService, this.authService);

  @override
  Future<InventoryEntity> getInventory() {
    // TODO: implement getInventory
    throw UnimplementedError();
  }
}
