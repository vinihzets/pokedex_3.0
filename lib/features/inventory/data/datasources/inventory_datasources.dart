import 'package:pokedex_3/features/inventory/domain/entities/inventory_entity.dart';

abstract class InventoryDataSources {
  Future<List<InventoryEntity>> getInventory();
}
