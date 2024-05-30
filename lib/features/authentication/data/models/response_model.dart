// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';
part 'response_model.g.dart';

@freezed
class ResponseModel with _$ResponseModel {
  const factory ResponseModel({
    dynamic data,
    required int statusCode,
    required String message,
  }) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);
}
