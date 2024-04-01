import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tfc/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:tfc/app/common/presentation/widgets/dialog/w_error_dialog.dart';
import 'package:tfc/app/home/views/home_provider.dart';
import 'package:tfc/base/presentation/pages/p_stateless.dart';
import 'package:tfc/config/app_languages.dart';
import 'package:tfc/config/app_routers.dart';
import 'package:tfc/config/app_sizes.dart';
import 'package:tfc/generated/locale_keys.g.dart';
import 'package:tfc/utils/extensions/context_extension.dart';

class HomePage extends PageStateless<HomeProvider> {
  const HomePage({super.key});

  @override
  Widget buildPage(
    BuildContext context,
    HomeProvider provider,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.largeWidthDimens,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Selector<HomeProvider, String>(
                  selector: (_, provider) => provider.title,
                  builder: (_, value, child) => Text(
                    value,
                    style: context.textTheme.titleLarge,
                  ),
                ),
              ),
              AppSizes.largeHeightDimens.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => apiCallSafety(
                        provider.checkConnection,
                        onStart: () async => showLoading(context, true),
                        onCompleted: () async => showLoading(context, false),
                        onSuccess: (data) async => context.navigator.push(
                          AppRoutes.instance.loginSuccess,
                        ),
                        onError: (error) async {
                          context.navigator.push(
                            AppRoutes.instance.loginSuccess,
                          );
                        },
                      ),
                      child: Text(
                        LocaleKeys.home_call_api_success.tr(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  AppSizes.mediumWidthDimens.horizontalSpace,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => apiCallSafety(
                        provider.checkConnectionFailed,
                        onStart: () async => showLoading(context, true),
                        onCompleted: () async => showLoading(context, false),
                        onError: (err) async => showDialog(
                          context: context,
                          builder: (_) => WErrorDialog(
                            dialogType: DialogType.error,
                            content: err,
                            onActionProceed: () {},
                          ),
                        ),
                      ),
                      child: Text(
                        LocaleKeys.home_call_api_error.tr(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              AppSizes.largeHeightDimens.verticalSpace,
              ElevatedButton(
                onPressed: () => context.setLocale(
                  context.locale.languageCode ==
                          AppLanguages.supportedLocales.first.languageCode
                      ? AppLanguages.supportedLocales.last
                      : AppLanguages.supportedLocales.first,
                ),
                child: Text(LocaleKeys.home_change_locale.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
