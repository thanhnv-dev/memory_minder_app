// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memory_minder_app/features/authentication/domain/entities/user_entity.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed

/// Auth user entity
class AuthModel with _$AuthModel {
  /// Factory Constructor
  const factory AuthModel({
    required UserEntity results,
    required String? token,
    @JsonKey(name: "refresh_token") required String? refreshToken,
    required String msg,
  }) = _AuthModel;

  /// factory method to create entity from JSON
  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}
