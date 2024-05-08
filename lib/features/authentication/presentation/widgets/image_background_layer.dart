import 'package:flutter/material.dart';
import 'package:memory_minder_app/constant/app_assets.dart';

class ImageBackgroundLayer extends StatefulWidget {
  const ImageBackgroundLayer({super.key, required this.pageViewController, required this.nextImageBackground});

  final PageController pageViewController;
  final void Function(int index) nextImageBackground;

  @override
  State<ImageBackgroundLayer> createState() => _ImageBackgroundLayerState();
}

class _ImageBackgroundLayerState extends State<ImageBackgroundLayer> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: widget.nextImageBackground,
      controller: widget.pageViewController,
      physics: const ClampingScrollPhysics(), // Disable scroll
      children: [
        _backgroundLayout(AppOtherImages.onboarding1),
        _backgroundLayout(AppOtherImages.onboarding2),
        _backgroundLayout(AppOtherImages.onboarding3),
        _backgroundLayout(AppOtherImages.intro),
      ],
    );
  }

  Column _backgroundLayout(String imageName) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Image.asset(
            imageName,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        const Expanded(
          flex: 3,
          child: SizedBox(),
        ),
      ],
    );
  }
}
