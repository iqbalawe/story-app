class LoginResponseModel {
  LoginResponseModel({
    required this.error,
    required this.message,
    this.loginResult,
  });

  final bool error;
  final String message;
  final LoginResultModel? loginResult;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        error: json['error'],
        message: json['message'],
        loginResult: json['loginResult'] != null
            ? LoginResultModel.fromJson(json['loginResult'])
            : null,
      );
}

class LoginResultModel {
  LoginResultModel({
    required this.userId,
    required this.name,
    required this.token,
  });

  final String userId;
  final String name;
  final String token;

  factory LoginResultModel.fromJson(Map<String, dynamic> json) =>
      LoginResultModel(
        userId: json['userId'],
        name: json['name'],
        token: json['token'],
      );
}
