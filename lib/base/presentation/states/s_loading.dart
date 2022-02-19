import 'package:equatable/equatable.dart';

class StateLoading extends Equatable {
  bool isLoading = false;

  @override
  List<Object?> get props => [isLoading];
}
