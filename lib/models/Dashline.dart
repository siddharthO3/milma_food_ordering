import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0, // Adjust the height of the line as needed
      child: CustomPaint(
        painter: DashedLinePainter(),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromARGB(170, 21, 39, 77)// Set the color of the line
      ..strokeWidth = 1.0; // Set the width of the line

    double dashWidth = 5.0; // Set the width of each dash
    double dashSpace = 5.0; // Set the space between dashes

    double startX = 0.0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}