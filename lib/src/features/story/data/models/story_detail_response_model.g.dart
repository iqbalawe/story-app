// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoryDetailResponseModel _$StoryDetailResponseModelFromJson(
  Map<String, dynamic> json,
) => _StoryDetailResponseModel(
  error: json['error'] as bool,
  message: json['message'] as String,
  story: StoryModel.fromJson(json['story'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StoryDetailResponseModelToJson(
  _StoryDetailResponseModel instance,
) => <String, dynamic>{
  'error': instance.error,
  'message': instance.message,
  'story': instance.story,
};
