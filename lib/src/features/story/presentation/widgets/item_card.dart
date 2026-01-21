import 'package:flutter/material.dart';
import 'package:story_app/src/core/core.dart';
import 'package:story_app/src/features/story/domain/domain.dart';
import 'package:story_app/src/features/story/presentation/presentation.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({required this.story, super.key});

  final Story story;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.surface,
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
                Text(story.name, style: theme.textTheme.headlineMedium),
                Text(
                  story.description,
                  style: theme.textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Text(
                  DateFormatter.formatTimeAgo(
                    '${story.createdAt}',
                    Localizations.localeOf(context).languageCode,
                  ),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.secondary,
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
