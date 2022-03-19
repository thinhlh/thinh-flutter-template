part of 'dialog_bloc.dart';

abstract class DialogEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ShowDialog extends DialogEvent {}

class DismissDialog extends DialogEvent {}
