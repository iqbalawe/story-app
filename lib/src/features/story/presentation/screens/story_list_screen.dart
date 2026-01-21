import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/src/core/core.dart';
import 'package:story_app/src/features/story/presentation/presentation.dart';

class StoryListScreen extends StatefulWidget {
  const StoryListScreen({super.key});

  @override
  State<StoryListScreen> createState() => _StoryListScreenState();
}

class _StoryListScreenState extends State<StoryListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<StoryBloc>().add(const StoryEvent.fetchStories());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<StoryBloc>().add(const StoryEvent.fetchStories());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
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
              LocalizationEvent.changeLanguage(value),
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
        onRefresh: () async =>
            context.read<StoryBloc>().add(const StoryEvent.fetchStories()),
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
    if (state.status == StoryStatus.initial ||
        (state.status == StoryStatus.initial && state.stories.isEmpty)) {
      return const LoadingStoryList();
    } else if (state.status == StoryStatus.failure && state.stories.isEmpty) {
      return CustomErrorWidget(
        errorMessage: ErrorMapper.getErrorMessage(state.errorMessage, context),
        onRetry: () =>
            context.read<StoryBloc>().add(const StoryEvent.fetchStories()),
      );
    } else if (state.status == StoryStatus.success && state.stories.isEmpty) {
      return const EmptyStoriesWidget();
    } else {
      return ListView.builder(
        controller: _scrollController,
        key: const ValueKey('story_list'),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: state.hasReachedMax
            ? state.stories.length
            : state.stories.length + 1,
        itemBuilder: (context, index) {
          if (index >= state.stories.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            );
          }

          final story = state.stories[index];

          return InkWell(
            onTap: () => context.go('/home/stories/${story.id}'),
            child: ItemCard(story: story),
          );
        },
      );
    }
  }
}
