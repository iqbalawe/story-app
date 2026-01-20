import 'package:flutter/material.dart';
import 'package:story_app/src/core/widgets/shimmer_skeleton.dart';

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerSkeleton(height: 24, width: 120),
                    ShimmerSkeleton(height: 16, width: 80),
                  ],
                ),
                SizedBox(height: 24),
                ShimmerSkeleton(height: 16, width: double.infinity),
                SizedBox(height: 8),
                ShimmerSkeleton(height: 16, width: double.infinity),
                SizedBox(height: 8),
                ShimmerSkeleton(height: 16, width: 250),
                SizedBox(height: 8),
                ShimmerSkeleton(height: 16, width: 300),
                SizedBox(height: 32),
                Row(
                  children: [
                    ShimmerSkeleton(height: 24, width: 24, radius: 12),
                    SizedBox(width: 8),
                    ShimmerSkeleton(height: 16, width: 150),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
