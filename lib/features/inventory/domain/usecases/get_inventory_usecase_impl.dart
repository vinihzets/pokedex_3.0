import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/features/inventory/domain/entities/inventory_entity.dart';
import 'package:pokedex_3/features/inventory/domain/repositories/inventory_repository.dart';

class GetInventoryUseCaseImpl
    implements UseCase<NoParams, List<InventoryEntity>> {
  InventoryRepository repository;

  GetInventoryUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<InventoryEntity>>> call(NoParams params) {
    return repository.getInventory();
  }
}
