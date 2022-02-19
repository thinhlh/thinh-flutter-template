import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PageBloc<T extends Bloc> extends StatelessWidget {
  late final T bloc;

  // ignore: prefer_const_constructors_in_immutables
  PageBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bloc = context.read<T>();

    return Scaffold(
      body: buildPage(context),
    );
  }

  Widget buildPage(BuildContext context);
}
