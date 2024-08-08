// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notebook_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotebookImpl _$$NotebookImplFromJson(Map<String, dynamic> json) =>
    _$NotebookImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      category: json['category'] as String?,
      description: json['description'] as String?,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      pendingUser: (json['pendingUser'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      sharedWith: (json['sharedWith'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: (json['notes'] as List<dynamic>?)
          ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$NotebookImplToJson(_$NotebookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'tags': instance.tags,
      'category': instance.category,
      'description': instance.description,
      'user': instance.user,
      'pendingUser': instance.pendingUser,
      'sharedWith': instance.sharedWith,
      'notes': instance.notes,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };
