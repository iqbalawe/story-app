import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/src/features/story/domain/domain.dart';
import 'package:story_app/src/features/story/presentation/presentation.dart';

class StoryListBody extends StatelessWidget {
  const StoryListBody({required this.stories, super.key});

  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const ValueKey('story_list'),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: stories.length,
      itemBuilder: (context, index) {
        final story = stories[index];
        return InkWell(
          onTap: () => context.go('/home/stories/${story.id}'),
          child: ItemCard(story: story),
        );
      },
    );
  }
}
