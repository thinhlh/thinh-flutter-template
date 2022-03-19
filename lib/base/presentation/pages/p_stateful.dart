import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfc/base/presentation/pages/page_actions.dart';

abstract class PageStateful<T extends Bloc, P extends StatefulWidget>
    extends State<P> implements PageActions {
  late final NavigatorState navigator;
  late final T bloc;

  @mustCallSuper
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of(context, listen: false);

    initialization(context);
  }

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: buildPage(context),
      ),
    );
  }

  @mustCallSuper
  @override
  void dispose() {
    super.dispose();
  }
}
