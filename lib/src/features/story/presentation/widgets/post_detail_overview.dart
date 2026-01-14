import 'package:flutter/material.dart';
import 'package:story_app/l10n/app_localizations.dart';
import 'package:story_app/src/core/utils/date_formatter.dart';
import 'package:story_app/src/features/story/domain/entities/story.dart';

class PostDetailOverview extends StatelessWidget {
  const PostDetailOverview({required this.story, super.key});

  final Story story;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(story.name, style: theme.textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            '${AppLocalizations.of(context)!.createdAt}: ${DateFormatter.formatDate('${story.createdAt}', Localizations.localeOf(context).languageCode)}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            story.description,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
