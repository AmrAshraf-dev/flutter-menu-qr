import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.arcToPoint(Offset(size.width, size.height),
        radius: Radius.elliptical(40, 10));
    path.lineTo(size.width, 0);
    return path;
  }
  // Path getClip(Size size) {
  //   Path path = Path();
  //   path.lineTo(0, size.height - 100);
  //   path.quadraticBezierTo(
  //       size.width / 2, size.height, size.width, size.height - 100);
  //   path.lineTo(size.width, 0);
  //   path.close();

  //   return path;
  // }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

final Path quadPath = new Path()
  ..moveTo(123.0, 12.2)
  ..relativeLineTo(1.1, -0.2)
  ..relativeCubicTo(45.2, -0.6, 162.1, 71.3, 83.2, 83.1)
  // etc all the way around
  ..close();

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: 350.0,
      height: 240.0,
      child: new CustomPaint(
        painter: new LogoPainter(),
      ),
    );
  }
}

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.blue
      ..strokeWidth = 0.0;

    canvas.drawPath(quadPath, paint);

    paint.color = Colors.blue[600];
    canvas.drawCircle(new Offset(123.4, 56.7), 12.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
// class CustomClipPath extends CustomClipper<Path> {
//   var radius = 10.0;
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, 100);
//     path.lineTo(50, 50);
//     path.lineTo(30, 0);
//     path.lineTo(30, 0);
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
