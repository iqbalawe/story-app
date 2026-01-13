import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_app/src/features/story/presentation/blocs/add_story/add_story_bloc.dart';
import 'package:story_app/src/features/story/presentation/blocs/story/story_bloc.dart'; // Import List Bloc untuk refresh

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
      imageQuality: 50, // Kompresi sederhana agar < 1MB
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

    // Trigger Event Upload
    context.read<AddStoryBloc>().add(
      UploadStory(
        file: _imageFile!,
        description: _descriptionController.text,
        // lat: -6.2, lon: 106.8 // Hardcode atau ambil dari Geolocator nanti
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Cerita')),
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
              Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _imageFile != null
                    ? Image.file(_imageFile!, fit: BoxFit.cover)
                    : const Center(
                        child: Icon(Icons.image, size: 50, color: Colors.grey),
                      ),
              ),
              // const SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ElevatedButton.icon(
              //       onPressed: () => _pickImage(ImageSource.camera),
              //       icon: const Icon(Icons.camera_alt),
              //       label: const Text('Kamera'),
              //     ),
              //     const SizedBox(width: 10),
              //     ElevatedButton.icon(
              //       onPressed: () => _pickImage(ImageSource.gallery),
              //       icon: const Icon(Icons.photo),
              //       label: const Text('Galeri'),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 20),
              // TextField(
              //   controller: _descriptionController,
              //   maxLines: 4,
              //   decoration: const InputDecoration(
              //     labelText: 'Deskripsi',
              //     hintText: 'Ceritakan pengalamanmu...',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // const SizedBox(height: 24),
              // BlocBuilder<AddStoryBloc, AddStoryState>(
              //   builder: (context, state) {
              //     if (state is AddStoryLoading) {
              //       return const Center(child: CircularProgressIndicator());
              //     }
              //     return ElevatedButton(
              //       onPressed: _uploadStory,
              //       style: ElevatedButton.styleFrom(
              //         minimumSize: const Size.fromHeight(50),
              //       ),
              //       child: const Text('Upload Story'),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
