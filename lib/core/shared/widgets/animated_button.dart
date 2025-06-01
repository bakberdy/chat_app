import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key, required this.child, required this.onTap});
  final Widget child;
  final VoidCallback onTap;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool isTapping = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: widget.onTap,
      onHighlightChanged: (value) => setState(() {
        isTapping = value;
      }),
      child: RepaintBoundary(
        child: AnimatedScale(
          scale: !isTapping ? 1 : 0.80,
          duration: Duration(milliseconds: 200),
          child: widget.child,
        ),
      ),
    );
  }
}
