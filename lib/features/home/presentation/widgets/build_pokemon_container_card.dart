import 'package:flutter/material.dart';
import 'package:pokedex_3/features/home/domain/entities/pokemon_entity.dart';

class BuildPokemonContainerCard extends StatelessWidget {
  final PokemonEntity pokemon;
  const BuildPokemonContainerCard({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
      decoration: BoxDecoration(
          color: pokemon.types.first.element.getColor(),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            pokemon.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: pokemon.types
                .map((e) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: e.element.getColor(),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Text(e.element.name)))
                .toList(),
          ),
          Image.network(
            pokemon.sprite,
            width: 130,
          )
        ],
      ),
    );
  }
}
