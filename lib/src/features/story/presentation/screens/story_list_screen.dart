import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/src/core/bloc/localization_bloc.dart';
import 'package:story_app/src/core/utils/error_mapper.dart';
import 'package:story_app/src/core/widgets/app_loading.dart';
import 'package:story_app/src/core/widgets/custom_error_widget.dart';
import 'package:story_app/src/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:story_app/src/features/story/presentation/blocs/story/story_bloc.dart';
import 'package:story_app/src/features/story/presentation/widgets/empty_stories_widget.dart';
import 'package:story_app/src/features/story/presentation/widgets/item_card.dart';
import 'package:story_app/src/features/story/presentation/widgets/my_popup_menu_button.dart';

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
    final theme = Theme.of(context);
    final appBarColor = theme.appBarTheme.foregroundColor;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Story App',
          style: theme.textTheme.titleLarge?.copyWith(color: appBarColor),
        ),
        actions: [
          MyPopupMenuButton(
            onSelected: (value) => context.read<LocalizationBloc>().add(
              ChangeLanguage(languageCode: value),
            ),
          ),
          IconButton(
            onPressed: () =>
                context.read<AuthBloc>().add(AuthLogoutRequested()),
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => context.read<StoryBloc>().add(FetchStories()),
        child: BlocBuilder<StoryBloc, StoryState>(
          builder: (context, state) {
            if (state is StoryLoading) {
              return Center(child: AppLoading());
            } else if (state is StoryLoaded) {
              final stories = state.stories;

              if (stories.isEmpty) {
                return EmptyStoriesWidget();
              }

              return ListView.builder(
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  final story = stories[index];
                  return GestureDetector(
                    onTap: () => context.go('/home/stories/${story.id}'),
                    child: ItemCard(story: story),
                  );
                },
              );
            } else if (state is StoryError) {
              final message = state.message;

              return CustomErrorWidget(
                errorMessage: ErrorMapper.getErrorMessage(message),
                onRetry: () => context.read<StoryBloc>().add(FetchStories()),
              );
            }
            return const Placeholder();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add-story'),
        child: Icon(Icons.add_a_photo_outlined),
      ),
    );
  }
}
