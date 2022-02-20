import 'package:equatable/equatable.dart';

mixin Params {}

class NoParams extends Equatable with Params {
  @override
  List<Object?> get props => [];
}
