import 'dart:developer';

import 'package:pokedex_3/core/architeture/bloc.dart';
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
    }
  }

  _handleFetchInventory() async {
    final fetchRequest = await getInventoryUseCaseImpl.call(NoParams());

    fetchRequest.fold((l) {}, (r) {
      inspect(r);
    });
  }
}
