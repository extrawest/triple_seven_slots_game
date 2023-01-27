import 'package:flutter/material.dart';
import 'package:triple_seven_slots_game/theme.dart';
import 'package:triple_seven_slots_game/utils/url_launcher.dart';
import 'package:triple_seven_slots_game/widgets/common/common_mouse_region.dart';

class GradientBackgroundScaffold extends StatelessWidget {
  final Widget child;
  final AppBar? appBar;
  final bool useSafeArea;

  const GradientBackgroundScaffold({
    required this.child,
    this.appBar,
    this.useSafeArea = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  brown1,
                  brown2,
                ],
              ),
            ),
            child: useSafeArea
                ? SafeArea(
                    child: child,
                  )
                : child,
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: CommonMouseRegion(
              child: GestureDetector(
                onTap: () => launchWithUrl('https://extrawest.com'),
                child: Text(
                  'Made by Extrawest',
                  style: TextStyles.bodyReg20.copyWith(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
