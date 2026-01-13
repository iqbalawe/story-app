import 'package:flutter/material.dart';
import 'package:story_app/src/core/utils/date_formatter.dart';
import 'package:story_app/src/features/story/domain/entities/story.dart';
import 'package:story_app/src/features/story/presentation/widgets/item_image_container.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({required this.story, super.key});

  final Story story;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            child: ItemImageContainer(story: story, height: 200),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  story.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  story.description,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Text(
                  DateFormatter.formatTimeAgo(story.createdAt.toString()),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
