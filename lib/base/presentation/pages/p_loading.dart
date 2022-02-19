import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfc/base/presentation/bloc/b_loading.dart';
import 'package:tfc/base/presentation/pages/p_bloc.dart';
import 'package:tfc/base/presentation/states/s_loading.dart';

abstract class PageLoading<T extends BlocLoading> extends PageBloc<T> {
  PageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parent = super.build(context);

    return Stack(
      children: [
        parent,
        buildPage(context),
        BlocBuilder<T, StateLoading>(
          builder: (context, state) {
            return Visibility(
              visible: state.isLoading,
              child: const CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ],
    );
  }
}
