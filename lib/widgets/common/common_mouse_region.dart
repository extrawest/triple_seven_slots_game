import 'package:flutter/material.dart';

class CommonMouseRegion extends StatefulWidget {
  final Widget child;
  const CommonMouseRegion({required this.child, Key? key}) : super(key: key);

  @override
  State<CommonMouseRegion> createState() => _CommonMouseRegionState();
}

class _CommonMouseRegionState extends State<CommonMouseRegion> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: _isHovered ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onHover: (event) => setState(() => _isHovered = true),
      onExit: (event) => setState(() => _isHovered = false),
      child: widget.child,
    );
  }
}
