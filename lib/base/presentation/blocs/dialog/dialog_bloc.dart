import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dialog_event.dart';
part 'dialog_state.dart';

abstract class DialogBloc extends Bloc<DialogEvent, DialogState> {
  DialogBloc() : super(DialogState._internal(show: false)) {
    on<DismissDialog>((event, emit) => DialogState._internal(show: false));
    on<ShowDialog>((event, emit) => DialogState._internal(show: true));
  }
}
