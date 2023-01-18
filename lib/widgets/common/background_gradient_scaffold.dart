import 'package:flutter/material.dart';
import 'package:triple_seven_slots_game/theme.dart';

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
      body: Container(
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
    );
  }
}
