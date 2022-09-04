import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tfc/app/login_success/view/providers/login_success_provider.dart';
import 'package:tfc/base/presentation/pages/p_stateless.dart';
import 'package:tfc/config/app_routes.dart';
import 'package:tfc/config/app_sizes.dart';
import 'package:tfc/utils/extensions/context_extension.dart';

class LoginSuccessPage extends PageStateless<LoginSuccessProvider> {
  const LoginSuccessPage({super.key});

  @override
  Widget buildPage(
    BuildContext context,
    LoginSuccessProvider provider,
  ) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Logged In',
              style: context.textTheme.titleLarge,
            ),
            AppSizes.mediumHeightDimens.verticalSpace,
            ElevatedButton(
              onPressed: () => apiCallSafety(() => provider.logout(),
                  unauthorized: () async {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.home,
                  (route) => false,
                );
                return true;
              }),
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
