import 'package:pokedex_3/core/global/entities/pokeball_entity.dart';

class PokeballMapper extends PokeballEntity {
  PokeballMapper(super.ball, super.quantity, super.rate);

  toMap() {
    return {
      'pokeballs': {
        'ball': ball,
        'rate': rate,
        'quantity': quantity,
      }
    };
  }
}
