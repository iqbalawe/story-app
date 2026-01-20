import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_app/l10n/app_localizations.dart';
import 'package:story_app/src/core/utils/my_show_snackbar.dart';
import 'package:story_app/src/core/widgets/app_loading.dart';
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
  LatLng? _selectedLocation;
  String? _selectedAddress;

  Future<void> _onPickLocation() async {
    final result = await context.push<Map<String, dynamic>>('/pick-location');

    if (result != null) {
      setState(() {
        final latLng = result['latLng'] as LatLng;
        _selectedLocation = latLng;
        _selectedAddress = result['address'] as String;
      });
    }
  }

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
      UploadStory(
        file: _imageFile!,
        description: _descriptionController.text,
        lat: _selectedLocation?.latitude,
        lon: _selectedLocation?.longitude,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarColor = theme.appBarTheme.foregroundColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.addStoryTitle,
          style: theme.textTheme.titleLarge?.copyWith(color: appBarColor),
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<AddStoryBloc, AddStoryState>(
            builder: (context, state) {
              if (state is AddStoryLoading) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: AppLoading(color: appBarColor),
                );
              }

              return IconButton(
                onPressed: state is AddStoryLoading ? null : _uploadStory,
                icon: const Icon(Icons.check_outlined),
              );
            },
          ),
        ],
      ),
      body: BlocListener<AddStoryBloc, AddStoryState>(
        listener: (context, state) {
          if (state is AddStorySuccess) {
            myShowSnackbar(
              context: context,
              text: state.message,
              backgroundColor: Colors.green,
            );
            context.read<StoryBloc>().add(FetchStories());
            context.pop();
          } else if (state is AddStoryFailure) {
            myShowSnackbar(context: context, text: state.message);
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
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.addStoryDescription,
                  hintStyle: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.outline.withValues(alpha: 0.5),
                  ),
                  filled: false,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const SizedBox(height: 24),
              if (_selectedLocation != null) ...[
                Text(
                  'Lokasi: $_selectedAddress',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
              ],
              OutlinedButton.icon(
                onPressed: _onPickLocation,
                icon: Icon(
                  _selectedLocation == null ? Icons.map : Icons.edit_location,
                ),
                label: Text(
                  _selectedLocation == null ? 'Pilih Lokasi' : 'Ubah Lokasi',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
