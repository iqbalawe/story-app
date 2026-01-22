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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(child: Text(getInitials(story.name))),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(story.name, style: theme.textTheme.titleLarge),
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
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            child: ItemImageContainer(story: story, height: 200),
          ),
          const SizedBox(height: 12),
          Text(
            story.description,
            style: theme.textTheme.bodyLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  String getInitials(String name) {
    List<String> words = story.name.split(' ');
    String initials = '';

    for (var word in words) {
      initials += word[0].toUpperCase();
    }

    return initials;
  }
}
