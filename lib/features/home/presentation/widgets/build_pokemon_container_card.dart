import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokedex_3/core/utils/first_string_uppercase.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/home/presentation/bloc/home_bloc.dart';
import 'package:pokedex_3/features/home/presentation/bloc/home_event.dart';

class BuildPokemonContainerCard extends StatelessWidget {
  final PokemonEntity pokemon;
  final HomeBloc bloc;
  final bool isSearch;
  const BuildPokemonContainerCard(
      {required this.pokemon,
      required this.bloc,
      required this.isSearch,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bloc.dispatchEvent(HomeEventNavigateDetails(context, pokemon));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 6.0),
        decoration: BoxDecoration(
            color: pokemon.types.first.element.getColor(),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pokemon.isFavorited == true
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      isSearch == false
                          ? Text(
                              pokemon.name.toUpperCaseFirstString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          : Text(pokemon.name.toUpperCaseFirstString(),
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                      const Icon(
                        Icons.star,
                        size: 12,
                        color: Colors.black,
                      ),
                    ],
                  )
                : isSearch == false
                    ? Text(
                        pokemon.name.toUpperCaseFirstString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    : Text(pokemon.name.toUpperCaseFirstString(),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
            isSearch == false
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: pokemon.types
                        .map((e) => Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: e.element.getColor(),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child:
                                Text(e.element.name.toUpperCaseFirstString())))
                        .toList(),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: pokemon.types
                        .map((e) => Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 10.0,
                            ),
                            decoration: BoxDecoration(
                                color: e.element.getColor(),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: Text(
                              e.element.name.toUpperCaseFirstString(),
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            )))
                        .toList(),
                  ),
            isSearch == false
                ? Image.network(
                    pokemon.sprite,
                    width: 130,
                  )
                : Image.network(
                    pokemon.sprite,
                    width: 260,
                  ),
          ],
        ),
      ),
    );
  }
}
