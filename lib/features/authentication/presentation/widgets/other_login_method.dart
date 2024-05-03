import 'package:flutter/widgets.dart';
import 'package:memory_minder_app/constant/app_assets.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_tonal_button.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';

class OtherLoginMethod extends StatefulWidget {
  const OtherLoginMethod({super.key});

  @override
  OtherLoginMethodState createState() => OtherLoginMethodState();
}

class OtherLoginMethodState extends State<OtherLoginMethod> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTonalButton(
          titleKey: LocaleKeys.commonPhoneButtonTitle,
          onPressed: () {},
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(right: 5),
                child: AppTonalButton(
                  svgAsset: AppSvgIcons.google,
                  onPressed: () {},
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 5),
                child: AppTonalButton(
                  svgAsset: AppSvgIcons.apple,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
