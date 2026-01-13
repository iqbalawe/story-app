import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/src/features/story/presentation/blocs/detail/story_detail_bloc.dart';

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
      appBar: AppBar(title: const Text("Story Detail")),
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
                  CachedNetworkImage(
                    imageUrl: story.photoUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (_, _) => const SizedBox(
                      height: 300,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (_, _, _) => const Icon(Icons.error),
                  ),

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
                          "Dibuat pada: ${story.createdAt.toString().split('.')[0]}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          story.description,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 20),
                        if (story.lat != null && story.lon != null) ...[
                          const Divider(),
                          const Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.red),
                              SizedBox(width: 8),
                              Text(
                                "Lokasi",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text("Lat: ${story.lat}, Lon: ${story.lon}"),
                        ],
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
