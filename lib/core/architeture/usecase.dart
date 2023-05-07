import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';

abstract class UseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input params);
}

class NoParams {}

class IndexApiParams {
  int currentIndex;
  int limit;

  IndexApiParams(this.currentIndex, this.limit);
}

class TypeParams {
  String url;

  TypeParams(this.url);
}

class PokemonCaughtParams {
  PokemonEntity pokemon;

  PokemonCaughtParams(this.pokemon);
}

class IdPokemonParams {
  int id;

  IdPokemonParams(this.id);
}
