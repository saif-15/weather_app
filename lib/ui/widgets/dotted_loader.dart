import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class DottedLoader extends StatefulWidget {
  final Size size;
  final List<Color> colors;
  const DottedLoader({this.size, this.colors, Key key}) : super(key: key);

  @override
  _DoottedLoaderState createState() => _DoottedLoaderState();
}

class _DoottedLoaderState extends State<DottedLoader>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _rotation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1200),
        reverseDuration: Duration(seconds: 2));

    _rotation = Tween<double>(begin: 0, end: 360).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _animationController
      ..forward()
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _rotation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.01)
              ..rotateZ(math.radians(_rotation.value)),
            alignment: Alignment.center,
            child: CustomPaint(
              size: widget.size,
              painter: DottedPainter(
                colors: widget.colors,
                factor: _rotation.value,
              ),
            ),
          );
        });
  }
}

class DottedPainter extends CustomPainter {
  final double factor;
  final List<Color> colors;

  DottedPainter({this.colors, this.factor});
  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width;
    var height = size.height;
    var mainCenter = Offset(width / 2, height / 2);

    var first_center = Offset(mainCenter.dx - 10, mainCenter.dy - 10);
    var second_center = Offset(mainCenter.dx + 10, mainCenter.dy - 10);
    var third_center = Offset(mainCenter.dx - 10, mainCenter.dy + 10);
    var fourth_center = Offset(mainCenter.dx + 10, mainCenter.dy + 10);

    var first_paint = Paint()
      ..color = colors[0]
      ..style = PaintingStyle.fill;

    var second_paint = Paint()
      ..color = colors[1]
      ..style = PaintingStyle.fill;

    var third_paint = Paint()
      ..color = colors[2]
      ..style = PaintingStyle.fill;

    var forth_paint = Paint()
      ..color = colors[3]
      ..style = PaintingStyle.fill;

    canvas.drawCircle(first_center, 5, first_paint);
    canvas.drawCircle(second_center, 5, second_paint);
    canvas.drawCircle(third_center, 5, third_paint);
    canvas.drawCircle(fourth_center, 5, forth_paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
