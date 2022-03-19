import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tfc/app/home/presentation/bloc/home_bloc.dart';

part 'loading_event.dart';
part 'loading_state.dart';

abstract class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc(HomeInitial homeInitial)
      : super(LoadingState._internal(show: false)) {
    on<ShowLoading>((event, emit) {});
    on<DismissLoading>((event, emit) => {});
  }
}
