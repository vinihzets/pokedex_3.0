import 'package:pokedex_3/features/inventory/data/datasources/inventory_datasources.dart';
import 'package:pokedex_3/features/inventory/domain/entities/inventory_entity.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_3/features/inventory/domain/repositories/inventory_repository.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  InventoryDataSources dataSources;

  InventoryRepositoryImpl(this.dataSources);
  @override
  Future<Either<Failure, InventoryEntity>> getInventory() async {
    try {
      final getRequest = await dataSources.getInventory();

      return Right(getRequest);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
