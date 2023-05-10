import 'package:pokedex_3/core/services/auth/auth_service.dart';
import 'package:pokedex_3/core/services/database/database_service.dart';
import 'package:pokedex_3/features/inventory/data/datasources/inventory_datasources.dart';
import 'package:pokedex_3/features/inventory/data/mappers/inventory_mapper.dart';
import 'package:pokedex_3/features/inventory/domain/entities/inventory_entity.dart';

class InventoryDataSourcesRemoteImpl implements InventoryDataSources {
  DatabaseService databaseService;
  AuthService authService;

  InventoryDataSourcesRemoteImpl(this.databaseService, this.authService);

  @override
  Future<List<InventoryEntity>> getInventory() async {
    final db = databaseService.database.collection('inventory');

    final docsGet = await db.get();

    final inventory = docsGet.docs
        .map((e) => InventoryMapper.fromMap(e.data()))
        .where((element) => element.userId == authService.auth.currentUser!.uid)
        .toList();

    return inventory;
  }
}
