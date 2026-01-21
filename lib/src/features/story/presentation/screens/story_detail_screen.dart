import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/l10n/app_localizations.dart';
import 'package:story_app/src/core/core.dart';
import 'package:story_app/src/features/story/presentation/presentation.dart';

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
    context.read<StoryDetailBloc>().add(
      StoryDetailEvent.fetchStoryDetail(widget.storyId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarColor = theme.appBarTheme.foregroundColor;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.postDetailTitle,
          style: theme.textTheme.titleLarge?.copyWith(color: appBarColor),
        ),
      ),
      body: BlocBuilder<StoryDetailBloc, StoryDetailState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _buildDetailBody(context, state),
          );
        },
      ),
    );
  }

  Widget _buildDetailBody(BuildContext context, StoryDetailState state) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const LoadingStoryDetail(),
      loaded: (story) {
        return SingleChildScrollView(
          key: const ValueKey('story_detail_content'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemImageContainer(story: story),
              PostDetailOverview(story: story),
              if (story.lat != null && story.lon != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: StoryDetailMap(lat: story.lat!, lon: story.lon!),
                ),
            ],
          ),
        );
      },
      failure: (message) {
        return CustomErrorWidget(
          errorMessage: ErrorMapper.getErrorMessage(message, context),
          onRetry: () => context.read<StoryDetailBloc>().add(
            StoryDetailEvent.fetchStoryDetail(widget.storyId),
          ),
        );
      },
    );
  }
}
