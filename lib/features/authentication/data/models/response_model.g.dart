// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseModelImpl _$$ResponseModelImplFromJson(Map<String, dynamic> json) =>
    _$ResponseModelImpl(
      data: json['data'],
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$ResponseModelImplToJson(_$ResponseModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
