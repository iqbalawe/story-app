class StoryResponseModel {
  StoryResponseModel({
    required this.error,
    required this.message,
    required this.listStory,
  });

  final bool error;
  final String message;
  final List<StoryModel> listStory;

  factory StoryResponseModel.fromJson(Map<String, dynamic> json) =>
      StoryResponseModel(
        error: json['error'],
        message: json['message'],
        listStory: (json['listStory'] as List)
            .map((e) => StoryModel.fromJson(e))
            .toList(),
      );
}

class StoryModel {
  StoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.createdAt,
    this.lat,
    this.lon,
  });

  final String id;
  final String name;
  final String description;
  final String photoUrl;
  final DateTime createdAt;
  final double? lat;
  final double? lon;

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    photoUrl: json['photoUrl'],
    createdAt: DateTime.parse(json['createdAt']),
    lat: json['lat'] != null ? (json['lat'] as num).toDouble() : null,
    lon: json['lon'] != null ? (json['lon'] as num).toDouble() : null,
  );
}
