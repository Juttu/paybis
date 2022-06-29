import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:payBISUI/widgets/widgets.dart';

import '../../data/utils.dart';
import '../payearly.dart';

double radius = 135;
double strokeWidth = 30;
int j = 0;
double amount_var;

GlobalKey<_CircularSliderState> circularsliderstate =
    GlobalKey<_CircularSliderState>();

class CircularSlider extends StatefulWidget {
  final ValueChanged<double> onAngleChanged;

  const CircularSlider({
    Key key,
    this.onAngleChanged,
  }) : super(key: key);

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  void setstate_fun_circular(amount) {
    j = 1;
    amount_var = double.parse(amount);
    setState(() {});
  }

  Offset _currentDragOffset = Offset.zero;

  double currentAngle = math.pi * 2;

  double startAngle = toRadian(90);

  double totalAngle = toRadian(360);

  Offset fixedPos;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    if (j == 1) {
      if (amount_var > repay_amount) {
        currentAngle = (math.pi * 2);
      } else {
        currentAngle = (amount_var / repay_amount) * (math.pi * 2);
      }
    }
    j = 0;
    Size screenSize = MediaQuery.of(context).size;
    Size canvasSize = Size(screenSize.width, screenSize.width - 35);
    Offset center = canvasSize.center(Offset.zero);
    Offset knobPos = toPolar(center - Offset(strokeWidth, strokeWidth),
        currentAngle + startAngle, radius);
    if (i == 0) {
      fixedPos = knobPos;
    }

    return Stack(
      children: [
        CustomPaint(
          size: canvasSize,
          child: Container(),
          painter: SliderPainter(
            startAngle: startAngle,
            currentAngle: currentAngle,
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 283, right: 9),
          child: _FixedKnob(),
        ),
        Positioned(
          left: knobPos.dx,
          top: knobPos.dy,
          child: GestureDetector(
            onPanStart: (details) {
              RenderBox getBox = context.findRenderObject() as RenderBox;
              _currentDragOffset = getBox.globalToLocal(details.globalPosition);
            },
            onPanUpdate: (details) {
              i = 1;
              var previousOffset = _currentDragOffset;
              _currentDragOffset += details.delta;
              var angle = currentAngle +
                  toAngle(_currentDragOffset, center) -
                  toAngle(previousOffset, center);
              currentAngle = normalizeAngle(angle);
              widget.onAngleChanged(currentAngle);
              setState(() {});
            },
            child: const _Knob(),
          ),
        ),
      ],
    );
  }
}

class SliderPainter extends CustomPainter {
  final double startAngle;
  final double currentAngle;

  SliderPainter({this.startAngle, this.currentAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);

    Rect rect = Rect.fromCircle(center: center, radius: radius);
    var rainbowPaint = Paint()
      ..shader = SweepGradient(colors: colors).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      startAngle,
      math.pi * 2,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth,
    );

    canvas.drawArc(rect, startAngle, currentAngle, false, rainbowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _Knob extends StatelessWidget {
  const _Knob({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: const Color(0xff080808),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3.0)),
    );
  }
}

class _FixedKnob extends StatelessWidget {
  const _FixedKnob({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: const Color(0xff080808),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3.0)),
    );
  }
}
