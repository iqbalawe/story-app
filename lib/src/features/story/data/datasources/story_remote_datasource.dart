import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:story_app/src/core/network/dio_client.dart';
import 'package:story_app/src/core/utils/exception_handler.dart';
import 'package:story_app/src/features/story/data/models/add_story_response_model.dart';
import 'package:story_app/src/features/story/data/models/story_detail_response_model.dart';
import 'package:story_app/src/features/story/data/models/story_model.dart';

abstract class StoryRemoteDatasource {
  Future<List<StoryModel>> getAllStories({
    int page = 1,
    int size = 10,
    int location = 0,
  });
  Future<StoryModel> getStoryDetail(String id);
  Future<String> addStory(
    File imageFile,
    String description,
    double? lat,
    double? lon,
  );
}

class StoryRemoteDatasourceImpl extends StoryRemoteDatasource {
  StoryRemoteDatasourceImpl({required this.dioClient, required this.storage});

  final DioClient dioClient;
  final FlutterSecureStorage storage;

  @override
  Future<List<StoryModel>> getAllStories({
    int page = 1,
    int size = 10,
    int location = 0,
  }) async {
    try {
      String? token = await storage.read(key: 'auth_token');

      if (token == null) {
        throw Exception('Token tidak ditemukan, silahkan login kembali.');
      }

      final response = await dioClient.dio.get(
        '/stories',
        queryParameters: {'page': page, 'size': size, 'location': location},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final storyResponse = StoryResponseModel.fromJson(response.data);

      if (!storyResponse.error) {
        return storyResponse.listStory;
      } else {
        throw Exception(storyResponse.message);
      }
    } catch (e) {
      throw handleException(e);
    }
  }

  @override
  Future<StoryModel> getStoryDetail(String id) async {
    try {
      String? token = await storage.read(key: 'auth_token');
      if (token == null) throw Exception('Token missing');

      final response = await dioClient.dio.get(
        '/stories/$id',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final detailResponse = StoryDetailResponseModel.fromJson(response.data);

      if (!detailResponse.error) {
        return detailResponse.story;
      } else {
        throw Exception(detailResponse.message);
      }
    } catch (e) {
      throw handleException(e);
    }
  }

  @override
  Future<String> addStory(
    File imageFile,
    String description,
    double? lat,
    double? lon,
  ) async {
    try {
      String? token = await storage.read(key: 'auth_token');
      if (token == null) throw Exception('Token missing');

      String fileName = imageFile.path.split('/').last;

      final Map<String, dynamic> formMap = {
        'description': description,
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
      };

      if (lat != null) formMap['lat'] = lat.toString();
      if (lon != null) formMap['lon'] = lon.toString();

      final formData = FormData.fromMap(formMap);

      final response = await dioClient.dio.post(
        '/stories',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      final responseModel = AddStoryResponseModel.fromJson(response.data);

      if (!responseModel.error) {
        return responseModel.message;
      } else {
        throw Exception(responseModel.message);
      }
    } catch (e) {
      throw handleException(e);
    }
  }
}
