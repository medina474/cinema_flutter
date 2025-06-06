import 'package:flutter/material.dart';

class StarRatingOverlay extends StatelessWidget {
  final double rating; // Note sur 5
  final double size;
  final Color filledColor;
  final Color unfilledColor;

  const StarRatingOverlay({
    super.key,
    required this.rating,
    this.size = 24,
    this.filledColor = Colors.amber,
    this.unfilledColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        //final starIndex = index + 1;
        final fillPercent = (rating - index).clamp(0.0, 1.0);

        return Stack(
          children: [
            Icon(Icons.star, color: unfilledColor, size: size),
            ClipRect(
              clipper: _StarClipper(fillPercent),
              child: Icon(Icons.star, color: filledColor, size: size),
            ),
          ],
        );
      }),
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double fillPercent; // 0.0 à 1.0

  _StarClipper(this.fillPercent);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * fillPercent, size.height);
  }

  @override
  bool shouldReclip(covariant _StarClipper oldClipper) {
    return oldClipper.fillPercent != fillPercent;
  }
}
