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
          padding: EdgeInsets.only(bottom: 16.0),
          child: Card(
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerSkeleton(height: 200, width: double.infinity, radius: 0),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerSkeleton(height: 20, width: 150),
                      SizedBox(height: 8),
                      ShimmerSkeleton(height: 14, width: double.infinity),
                      SizedBox(height: 4),
                      ShimmerSkeleton(height: 14, width: 200),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
