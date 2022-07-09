import 'dart:math';

import 'package:flutter/material.dart';

class LoadingWidget {
  static OverlayEntry? _overlay;

  static void showLoading(BuildContext context) {
    _overlay ??= OverlayEntry(
      builder: (context) => const ColoredBox(
        color: Color.fromARGB(146, 29, 29, 29),
        child: LoadingProgress(),
      ),
    );
    Overlay.of(context)?.insert(_overlay!);
  }

  static void hideLoading() {
    _overlay?.remove();
    _overlay = null;
  }
}

class LoadingProgress extends StatefulWidget {
  const LoadingProgress({Key? key}) : super(key: key);

  @override
  State<LoadingProgress> createState() => _LoadingProgressState();
}

class _LoadingProgressState extends State<LoadingProgress> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        _controller.isCompleted ? _controller.reverse() : _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, snapshot) {
          return Center(
              child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
            painter: LoadingPaint(_animation.value),
          ));
        });
  }
}

class LoadingPaint extends CustomPainter {
  final double animation;
  const LoadingPaint(this.animation);
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCenter(center: Offset(size.width * .5, size.height * .5), width: 50, height: 50);
    const startAngleExtern = 0.0;
    const sweepAngleExtern = pi * 2;
    const useCenterExtern = false;
    final paintExtern = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    double startAngle = 0.0;
    double sweepAngle = pi / 2;
    const useCenter = false;
    final paint = Paint()
      ..color = const Color(0xFF0533F2)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;
    canvas.drawArc(rect, startAngleExtern, sweepAngleExtern, useCenterExtern, paintExtern);
    canvas.drawArc(rect, startAngle + animation, sweepAngle + animation, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
