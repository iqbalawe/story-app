import 'package:flutter/material.dart';

class StoryListBody extends StatelessWidget {
  const StoryListBody({
    required this.scrollController,
    required this.itemCount,
    required this.itemBuilder,
    super.key,
  });

  final ScrollController scrollController;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      key: const ValueKey('story_list'),
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
