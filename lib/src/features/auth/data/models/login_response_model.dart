import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/src/features/auth/data/data.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    required bool error,
    required String message,
    LoginResultModel? loginResult,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
