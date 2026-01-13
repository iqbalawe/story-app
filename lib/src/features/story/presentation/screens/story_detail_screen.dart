import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/src/core/utils/date_formatter.dart';
import 'package:story_app/src/features/story/presentation/blocs/detail/story_detail_bloc.dart';
import 'package:story_app/src/features/story/presentation/widgets/item_image_container.dart';

class StoryDetailScreen extends StatefulWidget {
  const StoryDetailScreen({required this.storyId, super.key});

  final String storyId;

  @override
  State<StoryDetailScreen> createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StoryDetailBloc>().add(FetchStoryDetail(widget.storyId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Post Detail',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: BlocBuilder<StoryDetailBloc, StoryDetailState>(
        builder: (context, state) {
          if (state is StoryDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StoryDetailLoaded) {
            final story = state.story;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemImageContainer(story: story),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          story.name,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Dibuat pada: ${DateFormatter.formatDate(story.createdAt.toString())}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          story.description,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is StoryDetailFailure) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
