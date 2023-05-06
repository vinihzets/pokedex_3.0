import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';

class InventoryEmptyState extends StatelessWidget {
  final BlocState state;
  const InventoryEmptyState({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.card_travel_sharp,
            size: 66,
          ),
          Text(
            'Seu inventario esta vazio',
            style: TextStyle(fontSize: 34),
          )
        ],
      )),
    );
  }
}
