import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:story_app/src/core/network/dio_client.dart';
import 'package:story_app/src/features/story/data/models/story_detail_response_model.dart';
import 'package:story_app/src/features/story/data/models/story_model.dart';

abstract class StoryRemoteDatasource {
  Future<List<StoryModel>> getAllStories();
  Future<StoryModel> getStoryDetail(String id);
}

class StoryRemoteDatasourceImpl extends StoryRemoteDatasource {
  StoryRemoteDatasourceImpl({required this.dioClient, required this.storage});

  final DioClient dioClient;
  final FlutterSecureStorage storage;

  @override
  Future<List<StoryModel>> getAllStories() async {
    try {
      String? token = await storage.read(key: 'auth_token');

      if (token == null) {
        throw Exception('Token tidak ditemukan, silahkan login kembali.');
      }

      final response = await dioClient.dio.get(
        '/stories',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final storyResponse = StoryResponseModel.fromJson(response.data);

      if (!storyResponse.error) {
        return storyResponse.listStory;
      } else {
        throw Exception(storyResponse.message);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
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
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
