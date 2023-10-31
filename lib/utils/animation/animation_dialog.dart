import 'package:flutter/material.dart';

enum Direction { left, right, top, bottom }

class AnimationDialog extends StatefulWidget {
  const AnimationDialog({
    Key? key,
    required this.child,
    this.direction = Direction.left,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);
  final Widget child;
  final Direction? direction;
  final Duration? duration;

  @override
  State<AnimationDialog> createState() => _AnimationDialogState();
}

class _AnimationDialogState extends State<AnimationDialog>
    with TickerProviderStateMixin {
  late Offset begin;
  late Offset end;

  late final AnimationController _controller;
  late final AnimationController _controllerFade;

  late final Animation<Offset> _offsetAnimation;
  late final Animation<double> _fadeAnimation;

  buildFromDirection() {
    switch (widget.direction!) {
      case Direction.left:
        begin = const Offset(-1, 0);
        end = const Offset(0, 0);
        break;
      case Direction.right:
        begin = const Offset(1, 0);
        end = const Offset(0, 0);
        break;
      case Direction.top:
        begin = const Offset(0, -1);
        end = const Offset(0, 0);
        break;
      case Direction.bottom:
        begin = const Offset(0, 1);
        end = const Offset(0, 0);
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    buildFromDirection();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    _controllerFade = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    _offsetAnimation = Tween(begin: begin, end: end).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    Future<void>.delayed(widget.duration!, () {
      _controller.forward();
      _controllerFade.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerFade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: FadeTransition(opacity: _fadeAnimation, child: widget.child),
    );
  }
}
