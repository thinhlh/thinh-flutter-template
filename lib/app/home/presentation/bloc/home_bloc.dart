import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:tfc/app/home/domain/usecases/check_connection_usecase.dart';
import 'package:tfc/base/domain/usecase/params.dart';
import 'package:tfc/base/presentation/blocs/loading/loading_bloc.dart';
import 'package:tfc/generated/locale_keys.g.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CheckConnectionUseCase _checkConnectionUseCase;

  void checkConnection() {
    add(HomeCheckConnection());
  }

  HomeBloc(this._checkConnectionUseCase) : super(HomeInitial()) {
    on<HomeCheckConnection>(_handleCheckConnection);
  }

  void _handleCheckConnection(HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    final result = await _checkConnectionUseCase.call(NoParams());
    final String title = result.fold((l) => l.message, (r) => r.message);

    emit(HomeLoaded(title));
  }
}
