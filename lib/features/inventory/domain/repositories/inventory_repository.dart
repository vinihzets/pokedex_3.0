import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/features/inventory/domain/entities/inventory_entity.dart';

abstract class InventoryRepository {
  Future<Either<Failure, List<InventoryEntity>>> getInventory();
}
