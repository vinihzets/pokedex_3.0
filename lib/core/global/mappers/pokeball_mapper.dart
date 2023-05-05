import 'package:pokedex_3/core/global/entities/pokeball_entity.dart';

class PokeballMapper extends PokeballEntity {
  PokeballMapper(super.ball, super.quantity, super.rate);

  factory PokeballMapper.fromMap(dynamic map) {
    return PokeballMapper(
      map['ball'] ?? '',
      map['quantity'] ?? 0,
      map['rate'] ?? 0.0,
    );
  }

  toMap() {
    return {
      'pokeballs': [
        {
          'ball': ball,
          'rate': rate,
          'quantity': quantity,
        }
      ]
    };
  }
}
