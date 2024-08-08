// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteImpl _$$NoteImplFromJson(Map<String, dynamic> json) => _$NoteImpl(
      id: (json['id'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: json['category'] as String?,
      title: json['title'] as String,
      content: json['content'] as String,
      description: json['description'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      sharedWith: (json['sharedWith'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingUser: (json['pendingUser'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      notebook: json['notebook'] == null
          ? null
          : Notebook.fromJson(json['notebook'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NoteImplToJson(_$NoteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tags': instance.tags,
      'category': instance.category,
      'title': instance.title,
      'content': instance.content,
      'description': instance.description,
      'user': instance.user?.toJson(),
      'sharedWith': instance.sharedWith?.map((e) => e.toJson()).toList(),
      'pendingUser': instance.pendingUser?.map((e) => e.toJson()).toList(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'notebook': instance.notebook?.toJson(),
    };
