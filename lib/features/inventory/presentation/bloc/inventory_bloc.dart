import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/features/inventory/domain/usecases/get_inventory_usecase_impl.dart';
import 'package:pokedex_3/features/inventory/presentation/bloc/inventory_event.dart';

class InventoryBloc extends Bloc {
  GetInventoryUseCaseImpl getInventoryUseCaseImpl;

  InventoryBloc(this.getInventoryUseCaseImpl);

  @override
  mapListenEvent(Event event) {
    if (event is InventoryEventFetch) {
      _handleFetchInventory();
    } else if (event is InventoryEventOpenDrawer) {
      _handleOpenDrawer(event.context);
    }
  }

  _handleFetchInventory() async {
    dispatchState(BlocLoadingState());

    final fetchRequest = await getInventoryUseCaseImpl.call(NoParams());

    fetchRequest.fold((l) {
      dispatchState(BlocErrorState(error: l.message));
    }, (r) {
      if (r.isEmpty) {
        dispatchState(BlocEmptyState());
      } else if (r.isNotEmpty) {
        dispatchState(BlocStableState(data: r));
      }
    });
  }

  _handleOpenDrawer(BuildContext context) {
    return Scaffold.of(context).openDrawer();
  }
}
