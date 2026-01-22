import 'package:flutter/material.dart';
import 'package:story_app/src/core/core.dart';

class LoadingStoryDetail extends StatelessWidget {
  const LoadingStoryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerSkeleton(height: 300, width: double.infinity, radius: 0),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ShimmerSkeleton(height: 48, width: 48, radius: 24),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerSkeleton(height: 18, width: 140),
                        SizedBox(height: 6),
                        ShimmerSkeleton(height: 14, width: 100),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24),
                ShimmerSkeleton(height: 16, width: double.infinity),
                SizedBox(height: 8),
                ShimmerSkeleton(height: 16, width: double.infinity),
                SizedBox(height: 8),
                ShimmerSkeleton(height: 16, width: double.infinity),
                SizedBox(height: 8),
                ShimmerSkeleton(height: 16, width: 200),
                SizedBox(height: 32),
                ShimmerSkeleton(
                  height: 200,
                  width: double.infinity,
                  radius: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
