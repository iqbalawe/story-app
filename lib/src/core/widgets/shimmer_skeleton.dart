import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSkeleton extends StatelessWidget {
  const ShimmerSkeleton({
    this.height,
    this.width,
    this.radius = 8.0,
    super.key,
  });

  final double? height;
  final double? width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final lightBase = Colors.grey[300]!;
    final lightHighlight = Colors.grey[100]!;
    final darkBase = Colors.grey[800]!;
    final darkHighlight = Colors.grey[700]!;

    return Shimmer.fromColors(
      baseColor: isDark ? darkBase : lightBase,
      highlightColor: isDark ? darkHighlight : lightHighlight,
      period: const Duration(milliseconds: 1500),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
