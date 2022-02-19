import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfc/base/presentation/events/e_loading.dart';
import 'package:tfc/base/presentation/states/s_loading.dart';

abstract class BlocLoading<E extends EventLoading, S extends StateLoading>
    extends Bloc<EventLoading, StateLoading> {
  BlocLoading({StateLoading? initialState})
      : super(initialState ?? StateLoading()) {
    on<ShowLoading>((event, emit) => emit(state..isLoading = true));
    on<DismissLoading>(((event, emit) => emit(state..isLoading = false)));
  }
}
