import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/src/core/utils/error_mapper.dart';
import 'package:story_app/src/core/widgets/custom_error_widget.dart';
import 'package:story_app/src/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:story_app/src/features/story/presentation/blocs/story/story_bloc.dart';
import 'package:story_app/src/features/story/presentation/widgets/item_card.dart';

class StoryListScreen extends StatefulWidget {
  const StoryListScreen({super.key});

  @override
  State<StoryListScreen> createState() => _StoryListScreenState();
}

class _StoryListScreenState extends State<StoryListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StoryBloc>().add(FetchStories());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Story App',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () {
              context.read<AuthBloc>().add(AuthLogoutRequested());
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => context.read<StoryBloc>().add(FetchStories()),
        child: BlocBuilder<StoryBloc, StoryState>(
          builder: (context, state) {
            if (state is StoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is StoryLoaded) {
              if (state.stories.isEmpty) {
                return const Center(child: Text('Belum ada cerita.'));
              }

              return ListView.builder(
                itemCount: state.stories.length,
                itemBuilder: (context, index) {
                  final story = state.stories[index];
                  return GestureDetector(
                    onTap: () => context.go('/home/stories/${story.id}'),
                    child: ItemCard(story: story),
                  );
                },
              );
            } else if (state is StoryError) {
              return CustomErrorWidget(
                errorMessage: ErrorMapper.getErrorMessage(state.message),
                onRetry: () => context.read<StoryBloc>().add(FetchStories()),
              );
            }
            return const Placeholder();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => context.push('/add-story'),
        child: Icon(Icons.add_a_photo_outlined),
      ),
    );
  }
}
