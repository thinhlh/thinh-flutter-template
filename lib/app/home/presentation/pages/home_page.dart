import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tfc/app/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:tfc/base/presentation/events/e_loading.dart';
import 'package:tfc/base/presentation/pages/p_loading.dart';
import 'package:tfc/generated/locale_keys.g.dart';

class HomePage extends PageLoading<HomeBloc> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => bloc.add(ShowLoading()),
        child: Text(
          tr(LocaleKeys.general),
          style: GoogleFonts.robotoCondensed(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
