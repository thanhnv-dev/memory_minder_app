// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthModelImpl _$$AuthModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthModelImpl(
      results: UserEntity.fromJson(json['results'] as Map<String, dynamic>),
      token: json['token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$$AuthModelImplToJson(_$AuthModelImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
      'token': instance.token,
      'refresh_token': instance.refreshToken,
      'msg': instance.msg,
    };
