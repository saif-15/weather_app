import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class ProgressLoader extends StatefulWidget {
  final double width;
  final double height;
  final List<Color> colors;

  const ProgressLoader(
      {@required this.colors, this.width = 60.0, this.height = 60.0, Key key})
      : assert(colors.length == 5);

  @override
  _ProgressLoaderState createState() => _ProgressLoaderState();
}

class _ProgressLoaderState extends State<ProgressLoader>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> rotation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    rotation = Tween<double>(begin: 0.0, end: 360).animate(
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
      animation: rotation,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(math.radians(rotation.value)),
          child: CustomPaint(
            size: Size(widget.width, widget.height),
            painter: ProgressPainter(widget.colors, rotation.value),
          ),
        );
      },
    );
  }
}

class ProgressPainter extends CustomPainter {
  List<Color> colors;
  double value;
  ProgressPainter(this.colors, this.value);
  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width;
    var height = size.height;
    var center = Offset(width / 2, height / 2);

    var first_arc = Paint()
      ..shader = LinearGradient(colors: colors).createShader(
          Rect.fromCenter(center: center, width: width, height: height))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width / 5;

    var second_arc = Paint()
      ..shader = LinearGradient(colors: colors).createShader(
          Rect.fromCenter(center: center, width: width, height: height))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width / 6;

    var third_arc = Paint()
      ..shader = LinearGradient(colors: colors).createShader(
          Rect.fromCenter(center: center, width: width, height: height))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width / 8;

    canvas.drawArc(Rect.fromCircle(center: center, radius: width / 2),
        math.radians(-90), math.radians(100), false, first_arc);

    canvas.drawArc(Rect.fromCircle(center: center, radius: width / 2 - 10),
        math.radians(50), math.radians(120), false, second_arc);

    canvas.drawArc(Rect.fromCircle(center: center, radius: width / 5),
        math.radians(220), math.radians(120), false, third_arc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
