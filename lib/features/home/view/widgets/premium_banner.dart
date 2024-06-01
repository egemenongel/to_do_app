import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/constants/constants.dart';
import 'package:to_do_app/core/extensions/context_extensions.dart';

class PremiumBanner extends StatelessWidget {
  const PremiumBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 116,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.secondary,
            border: Border.all(
              width: 2,
              color: const Color(0xff9EB031),
            ),
          ),
          child: const Row(
            children: [
              _Image(),
              SizedBox(width: 30),
              _Text(),
              Spacer(),
            ],
          ),
        ),
        const _Price(),
      ],
    );
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(R.premium);
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Go Pro (No Ads)',
            style: context.textTheme.bodyMedium,
          ),
          Text(
            'No fuss, no ads, for only \$1 a month',
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _Price extends StatelessWidget {
  const _Price();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          height: 71,
          width: 71,
          color: const Color(0xff071D55),
          child: Center(
            child: Text(
              '\$1',
              style: context.textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
