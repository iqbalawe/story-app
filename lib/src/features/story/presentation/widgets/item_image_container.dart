import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:story_app/src/core/core.dart';
import 'package:story_app/src/features/story/domain/domain.dart';

class ItemImageContainer extends StatelessWidget {
  const ItemImageContainer({required this.story, this.height = 200, super.key});

  final Story story;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: story.photoUrl,
      cacheManager: customCacheManager,
      height: height,
      width: double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          ShimmerSkeleton(height: height, width: double.infinity, radius: 0),
      errorWidget: (context, url, error) => SizedBox(
        height: height,
        child: Container(
          color: Colors.grey[200],
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.broken_image, color: Colors.grey, size: 40),
              SizedBox(height: 8),
              Text(
                'Gagal memuat gambar',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
      memCacheHeight: (height ?? 200).toInt() * 2,
    );
  }
}
