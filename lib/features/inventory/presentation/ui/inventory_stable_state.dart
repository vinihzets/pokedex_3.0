import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/features/inventory/domain/entities/inventory_entity.dart';

class InventoryStableState extends StatelessWidget {
  final BlocState state;
  const InventoryStableState({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    final List<InventoryEntity> listInventory = state.data;

    return Scaffold(
        body: Column(
      children: [
        Card(
          child: ExpansionTile(
            title: const Text('Items'),
            children: listInventory
                .map((e) => Column(
                      children: e.pokeballs.isNotEmpty
                          ? e.pokeballs
                              .map((e) => ListTile(
                                    leading: const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://www.pokemoncenter.com/images/DAMRoot/Full-Size/10000/P8737_710-95848_02.jpg'),
                                    ),
                                    title: Text(e.ball),
                                    trailing: Text(e.quantity.toString()),
                                  ))
                              .toList()
                          : [const Text('Nenhuma pokeball adquirida ainda')],
                    ))
                .toList(),
          ),
        ),
        Card(
          child: ExpansionTile(title: const Text('Pokemons'), children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: listInventory.first.pokemons.length,
                itemBuilder: (context, index) {
                  final pokemon = listInventory.first.pokemons[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(pokemon.sprite),
                    ),
                    title: Text(pokemon.name),
                  );
                })
          ]),
        )
      ],
    ));
  }
}
