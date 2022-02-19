import 'package:equatable/equatable.dart';
import 'package:tfc/base/presentation/bloc/b_loading.dart';
import 'package:tfc/base/presentation/events/e_loading.dart';
import 'package:tfc/base/presentation/states/s_loading.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends BlocLoading<EventLoading, StateLoading> {}
