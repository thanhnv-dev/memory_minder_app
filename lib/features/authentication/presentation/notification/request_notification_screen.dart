import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:memory_minder_app/common/widgets/app_scaffold.dart';
import 'package:memory_minder_app/constant/app_assets.dart';
import 'package:memory_minder_app/constant/app_text_styles.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_back_button.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_filled_button.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_tonal_button.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/utils/utils.dart';

@RoutePage()
class RequestNotificationScreen extends ConsumerStatefulWidget {
  const RequestNotificationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RequestNotificationScreenState();
}

class _RequestNotificationScreenState extends ConsumerState<RequestNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      activeUnFocusKeyboard: true,
      fullScreen: true,
      paddingTop: true,
      paddingBottom: true,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _notificationIcon(),
                  const SizedBox(height: 15),
                  _title(context),
                  const SizedBox(height: 15),
                  _subTitle(context),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _enableNotificationButton(),
                const SizedBox(height: 10),
                _skipButton(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  AppTonalButton _skipButton(BuildContext context) {
    return AppTonalButton(
      titleKey: LocaleKeys.notificationRequestButtonSkipTitle,
      backgroundColor: Colors.transparent,
      titleColor: Utils.getThemeColorScheme(context).primary,
      onPressed: () {},
    );
  }

  AppFilledButton _enableNotificationButton() {
    return AppFilledButton(
      titleKey: LocaleKeys.notificationRequestButtonEnableTitle,
      onPressed: () {},
    );
  }

  Widget _subTitle(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        I18nFunc.getLocaleMessage(LocaleKeys.notificationRequestSubTitle),
        style: Utils.getTextTheme(context).bodyMedium?.copyWith(
              color: Utils.getThemeColorScheme(context).onSurface,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      I18nFunc.getLocaleMessage(LocaleKeys.notificationRequestTitle),
      style: AppTextStyles.custom.bold20.copyWith(
        color: Utils.getThemeColorScheme(context).onSurface,
      ),
    );
  }

  SvgPicture _notificationIcon() => SvgPicture.asset(AppSvgImages.notificationRequestLight);
}
