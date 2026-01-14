import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_app/src/features/story/presentation/blocs/add_story/add_story_bloc.dart';
import 'package:story_app/src/features/story/presentation/blocs/story/story_bloc.dart';
import 'package:story_app/src/features/story/presentation/widgets/image_upload_container.dart';

class AddStoryScreen extends StatefulWidget {
  const AddStoryScreen({super.key});

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  final _descriptionController = TextEditingController();
  File? _imageFile;
  final _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 50,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _uploadStory() {
    if (_imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mohon pilih gambar terlebih dahulu')),
      );
      return;
    }
    if (_descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Mohon isi deskripsi')));
      return;
    }

    context.read<AddStoryBloc>().add(
      UploadStory(file: _imageFile!, description: _descriptionController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buat Cerita',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<AddStoryBloc, AddStoryState>(
            builder: (context, state) {
              if (state is AddStoryLoading) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                );
              }

              return IconButton(
                onPressed: state is AddStoryLoading ? null : _uploadStory,
                icon: Icon(Icons.check_outlined),
                tooltip: 'Upload Story',
              );
            },
          ),
        ],
      ),
      body: BlocListener<AddStoryBloc, AddStoryState>(
        listener: (context, state) {
          if (state is AddStorySuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
            context.read<StoryBloc>().add(FetchStories());
            context.pop();
          } else if (state is AddStoryFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageUploadContainer(
                imageFile: _imageFile,
                onTapCamera: () => _pickImage(ImageSource.camera),
                onTapGallery: () => _pickImage(ImageSource.gallery),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _descriptionController,
                maxLines: null,
                minLines: 4,
                keyboardType: TextInputType.multiline,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  hintText: 'Bagikan ceritamu...',
                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.outline.withValues(alpha: 0.5),
                  ),
                  filled: false,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
