import 'package:flutter/material.dart';
import 'package:story_app/src/core/core.dart';

class LoadingStoryList extends StatelessWidget {
  const LoadingStoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ShimmerSkeleton(height: 40, width: 40, radius: 20),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerSkeleton(height: 16, width: 100),
                      SizedBox(height: 4),
                      ShimmerSkeleton(height: 12, width: 60),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              ShimmerSkeleton(height: 200, width: double.infinity, radius: 4),
              SizedBox(height: 12),
              ShimmerSkeleton(height: 14, width: double.infinity),
              SizedBox(height: 4),
              ShimmerSkeleton(height: 14, width: 200),
            ],
          ),
        );
      },
    );
  }
}
