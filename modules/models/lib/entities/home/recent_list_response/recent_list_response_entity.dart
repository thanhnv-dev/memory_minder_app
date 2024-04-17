import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/entities/home/recent_list/recent_list_entity.dart';

part 'recent_list_response_entity.freezed.dart';
part 'recent_list_response_entity.g.dart';

@freezed
class RecentListResponseEntity with _$RecentListResponseEntity {
  const factory RecentListResponseEntity({
    required List<RecentListEntity> results,
    required String msg,
  }) = _RecentListResponseEntity;

  factory RecentListResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$RecentListResponseEntityFromJson(json);
}
