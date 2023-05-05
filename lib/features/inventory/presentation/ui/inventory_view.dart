import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/components/bloc_screen_builder.dart';
import 'package:pokedex_3/core/components/drawer/ui/custom_drawer.dart';
import 'package:pokedex_3/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:pokedex_3/features/inventory/presentation/bloc/inventory_event.dart';
import 'package:pokedex_3/features/inventory/presentation/ui/inventory_empty_state.dart';
import 'package:pokedex_3/features/inventory/presentation/ui/inventory_error_state.dart';
import 'package:pokedex_3/features/inventory/presentation/ui/inventory_loading_state.dart';
import 'package:pokedex_3/features/inventory/presentation/ui/inventory_stable_state.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({super.key});

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  late InventoryBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();
    bloc.dispatchEvent(InventoryEventFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario'),
        centerTitle: true,
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () =>
                    bloc.dispatchEvent(InventoryEventOpenDrawer(context)),
                icon: const Icon(Icons.list))),
      ),
      drawer: const CustomDrawer(),
      body: BlocScreenBuilder(
          stream: bloc.state,
          onStable: (onStable) => InventoryStableState(state: onStable),
          onError: (onError) => InventoryErrorState(state: onError),
          onLoading: (onLoading) => InventoryLoadingState(state: onLoading),
          onEmpty: (onEmpty) => InventoryEmptyState(state: onEmpty)),
    );
  }
}
