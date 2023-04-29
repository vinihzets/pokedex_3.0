import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/failure/failure.dart';

abstract class UseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input params);
}
