import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfc/app/home/presentation/bloc/home_bloc.dart';
import 'package:tfc/base/presentation/pages/p_stateless.dart';
import 'package:tfc/config/colors.dart';
import 'package:tfc/services/dialogs/app_loading.dart';

class HomePage extends PageStateless<HomeBloc> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return GestureDetector(
      onTap: () => bloc.checkConnection(),
      child: Center(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: ((context, state) {
            if (state is HomeLoading) {
              AppLoading.showLoading(context);
            } else {
              AppLoading.dismissLoading(context);
            }
          }),
          listenWhen: (previousState, state) =>
              state is HomeLoaded || state is HomeLoading,
          buildWhen: (previous, state) => state is! HomeLoading,
          builder: (_, state) {
            if (state is HomeInitial) {
              return Text(
                state.title,
                style: const TextStyle(fontSize: 24),
              );
            } else if (state is HomeLoading) {
              return const SizedBox.shrink();
            } else {
              return Text(
                (state as HomeLoaded).title,
                style: const TextStyle(fontSize: 24),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
