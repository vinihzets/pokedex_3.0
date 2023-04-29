abstract class BlocState<T> {
  T? data;

  BlocState({required this.data});
}

class BlocStableState extends BlocState {
  BlocStableState({super.data});
}

class BlocEmptyState extends BlocState {
  BlocEmptyState({super.data});
}

class BlocLoadingState extends BlocState {
  BlocLoadingState({super.data});
}

class BlocErrorState extends BlocState {
  final String error;

  BlocErrorState({super.data, required this.error});
}
