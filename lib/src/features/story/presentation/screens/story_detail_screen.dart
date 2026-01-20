import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/l10n/app_localizations.dart';
import 'package:story_app/src/core/utils/error_mapper.dart';
import 'package:story_app/src/core/widgets/custom_error_widget.dart';
import 'package:story_app/src/features/story/presentation/blocs/detail/story_detail_bloc.dart';
import 'package:story_app/src/features/story/presentation/widgets/item_image_container.dart';
import 'package:story_app/src/features/story/presentation/widgets/loading_story_detail.dart';
import 'package:story_app/src/features/story/presentation/widgets/post_detail_overview.dart';

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
    if (state is StoryDetailLoading) {
      return const LoadingStoryDetail();
    } else if (state is StoryDetailLoaded) {
      final story = state.story;
      return SingleChildScrollView(
        key: const ValueKey('story_detail_content'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemImageContainer(story: story),
            PostDetailOverview(story: story),
          ],
        ),
      );
    } else if (state is StoryDetailFailure) {
      return CustomErrorWidget(
        errorMessage: ErrorMapper.getErrorMessage(state.message, context),
        onRetry: () => context.read<StoryDetailBloc>().add(
          FetchStoryDetail(widget.storyId),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
