part of 'dialog_bloc.dart';

class DialogState extends Equatable {
  bool show = false;
  DialogState._internal({required this.show});

  @override
  List<Object> get props => [show];
}
