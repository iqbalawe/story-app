import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/src/core/bloc/localization_bloc.dart';
import 'package:story_app/src/core/utils/error_mapper.dart';
import 'package:story_app/src/core/widgets/custom_error_widget.dart';
import 'package:story_app/src/features/story/presentation/blocs/story/story_bloc.dart';
import 'package:story_app/src/features/story/presentation/widgets/empty_stories_widget.dart';
import 'package:story_app/src/features/story/presentation/widgets/loading_story_list.dart';
import 'package:story_app/src/features/story/presentation/widgets/logout_dialog_widget.dart';
import 'package:story_app/src/features/story/presentation/widgets/my_popup_menu_button.dart';
import 'package:story_app/src/features/story/presentation/widgets/story_list_body.dart';

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
            icon: const Icon(Icons.logout_outlined),
            onPressed: () => showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const LogoutDialogWidget(),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => context.read<StoryBloc>().add(FetchStories()),
        child: BlocBuilder<StoryBloc, StoryState>(
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _buildBody(context, state),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add-story'),
        child: const Icon(Icons.add_a_photo_outlined),
      ),
    );
  }

  Widget _buildBody(BuildContext context, StoryState state) {
    if (state is StoryLoading) {
      return const LoadingStoryList();
    } else if (state is StoryLoaded) {
      final stories = state.stories;
      if (stories.isEmpty) {
        return const EmptyStoriesWidget();
      }
      return StoryListBody(stories: stories);
    } else if (state is StoryError) {
      return CustomErrorWidget(
        errorMessage: ErrorMapper.getErrorMessage(state.message, context),
        onRetry: () => context.read<StoryBloc>().add(FetchStories()),
      );
    }
    return const SizedBox.shrink();
  }
}
