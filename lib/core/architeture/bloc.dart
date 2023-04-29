import 'dart:async';

import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/core/utils/hud_mixins.dart';

abstract class Bloc with HudMixins {
  late StreamController<BlocState> _state;
  Stream<BlocState> get state => _state.stream;

  late StreamController<Event> _event;
  Sink<Event> get event => _event.sink;

  Bloc() {
    _state = StreamController.broadcast();

    _event = StreamController.broadcast();

    _event.stream.listen(mapListenEvent);
  }

  dispatchEvent(Event event) {
    _event.add(event);
  }

  dispatchState(BlocState state) {
    _state.add(state);
  }

  mapListenEvent(Event event);
}
