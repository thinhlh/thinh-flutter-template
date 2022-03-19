part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  final String title = tr(LocaleKeys.general);
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final String title;
  HomeLoaded(this.title);

  @override
  List<Object> get props => [title];
}
