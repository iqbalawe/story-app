import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:story_app/src/core/utils/custom_cache_manager.dart';
import 'package:story_app/src/features/story/domain/entities/story.dart';

class ItemImageContainer extends StatelessWidget {
  const ItemImageContainer({required this.story, this.height, super.key});

  final Story story;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: story.photoUrl,
      cacheManager: customCacheManager,
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) => const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => const SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.broken_image, color: Colors.grey),
              Text("Gagal memuat gambar", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
      memCacheHeight: 200 * 2,
    );
  }
}
