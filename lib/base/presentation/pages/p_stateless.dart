import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfc/base/presentation/pages/page_actions.dart';

abstract class PageStateless<T extends Bloc> extends StatelessWidget
    implements PageActions {
  PageStateless({Key? key}) : super(key: key);

  late final NavigatorState navigator;
  late final T bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<T>(context, listen: false);
    navigator = Navigator.of(context);
    initialization(context);

    return Scaffold(
      body: SafeArea(
        child: buildPage(context),
      ),
    );
  }
}
