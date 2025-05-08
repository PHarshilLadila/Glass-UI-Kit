// ignore_for_file: deprecated_member_use

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

/// A customizable GlassContainer widget that provides a frosted glass effect.
class GlassContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final double blur;
  final double borderRadius;
  final Color backgroundColor;
  final Border? border;
  final Alignment alignment;
  final EdgeInsetsGeometry? padding;
  final CustomClipper<Path>? clipper;

  const GlassContainer({
    super.key,
    this.height,
    this.width,
    this.child,
    this.blur = 15.0,
    this.borderRadius = 20.0,
    this.backgroundColor = Colors.white24,
    this.border,
    this.alignment = Alignment.center,
    this.padding,
    this.clipper,
  });

  @override
  Widget build(BuildContext context) {
    final Widget frosted = Container(
      height: height,
      width: width,
      alignment: alignment,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: border ?? Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: child,
          ),
        ),
      ),
    );

    if (clipper != null) {
      return ClipPath(
        clipper: clipper,
        child: SizedBox(height: height, width: width, child: frosted),
      );
    }

    return frosted;
  }
}

/// A collection of custom clippers for creating unique shapes.

/// Creates an arc-shaped clip.
class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height - 40)
      ..quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        size.height - 40,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Creates a wave-shaped clip at the bottom.
class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
        size.width / 4,
        size.height - 30,
        size.width / 2,
        size.height,
      )
      ..quadraticBezierTo(
        3 * size.width / 4,
        size.height + 30,
        size.width,
        size.height,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Creates a circular cutout at the top of the shape.
class CircleCutClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2 - 40, 0)
      ..arcToPoint(
        Offset(size.width / 2 + 40, 0),
        radius: const Radius.circular(40),
        clockwise: false,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Creates a curved bottom edge.
class CurveBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height - 50)
      ..quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        size.height - 50,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Creates a diagonal cut shape.
class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height - 50)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Creates a rounded diagonal cut shape.
class RoundedDiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, size.height * 0.2)
      ..quadraticBezierTo(0, 0, size.width * 0.2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Creates a triangle-shaped clip.
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Creates a wave-shaped clip.
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height - 40)
      ..quadraticBezierTo(
        size.width / 4,
        size.height,
        size.width / 2,
        size.height - 40,
      )
      ..quadraticBezierTo(
        3 * size.width / 4,
        size.height - 80,
        size.width,
        size.height - 40,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Creates a star-shaped clip.
class StarClipper extends CustomClipper<Path> {
  final int numberOfPoints;

  StarClipper({this.numberOfPoints = 5});

  @override
  Path getClip(Size size) {
    final path = Path();
    final double outerRadius = size.width / 2;
    final double innerRadius = outerRadius / 2.5;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double angle = pi / numberOfPoints;

    for (int i = 0; i < numberOfPoints * 2; i++) {
      final isEven = i % 2 == 0;
      final radius = isEven ? outerRadius : innerRadius;
      final x = centerX + radius * cos(i * angle - pi / 2);
      final y = centerY + radius * sin(i * angle - pi / 2);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Creates a hexagon-shaped clip.
class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    return Path()
      ..moveTo(w * 0.5, 0)
      ..lineTo(w, h * 0.25)
      ..lineTo(w, h * 0.75)
      ..lineTo(w * 0.5, h)
      ..lineTo(0, h * 0.75)
      ..lineTo(0, h * 0.25)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Create a Heart-shaped Clip.
class HeartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double w = size.width;
    final double h = size.height;
    final path = Path();

    path.moveTo(w / 2, h * 0.4);

    // Left side of heart
    path.cubicTo(w * 0.1, h * 0.05, 0, h * 0.5, w / 2, h);

    path.cubicTo(w, h * 0.5, w * 0.9, h * 0.05, w / 2, h * 0.4);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Creates a Diamond-shaped clip.
class DiamondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.moveTo(w / 2, 0);
    path.lineTo(w, h / 2);
    path.lineTo(w / 2, h);
    path.lineTo(0, h / 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Creates a Concave-shaped clip.
class ConcaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double w = size.width;
    double h = size.height;
    path.moveTo(0, 0);
    path.quadraticBezierTo(w / 2, h * 0.2, w, 0);
    path.lineTo(w, h);
    path.quadraticBezierTo(w / 2, h * 0.8, 0, h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Creates a Pentagon-shaped clip.
class PentagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();
    path.moveTo(w * 0.5, 0);
    path.lineTo(w, h * 0.38);
    path.lineTo(w * 0.8, h);
    path.lineTo(w * 0.2, h);
    path.lineTo(0, h * 0.38);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Creates a Shield-shaped clip.
class ShieldClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();
    path.moveTo(w / 2, 0);
    path.lineTo(w, h * 0.25);
    path.lineTo(w, h * 0.6);
    path.quadraticBezierTo(w / 2, h, 0, h * 0.6);
    path.lineTo(0, h * 0.25);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Creates a Blob-shaped clip.
class BlobClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.2, 0, size.width * 0.5, 0);
    path.quadraticBezierTo(size.width, 0, size.width, size.height * 0.4);
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height,
      size.width * 0.5,
      size.height,
    );
    path.quadraticBezierTo(size.width * 0.2, size.height, 0, size.height * 0.6);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Creates a Blob-shaped-2 clip.
class BlobClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.1,
      size.width * 0.5,
      size.height * 0.15,
    );
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.2,
      size.width * 0.8,
      size.height * 0.6,
    );
    path.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.9,
      size.width * 0.4,
      size.height * 0.85,
    );
    path.quadraticBezierTo(0, size.height * 0.75, 0, size.height * 0.3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
