// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      name: json['name'] as String?,
      sharedNotes: (json['sharedNotes'] as List<dynamic>?)
          ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: (json['notes'] as List<dynamic>?)
          ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingNotes: (json['pendingNotes'] as List<dynamic>?)
          ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      notebooks: (json['notebooks'] as List<dynamic>?)
          ?.map((e) => Notebook.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingUser: (json['pendingUser'] as List<dynamic>?)
          ?.map((e) => Notebook.fromJson(e as Map<String, dynamic>))
          .toList(),
      sharedNotebooks: (json['sharedNotebooks'] as List<dynamic>?)
          ?.map((e) => Notebook.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'sharedNotes': instance.sharedNotes?.map((e) => e.toJson()).toList(),
      'notes': instance.notes?.map((e) => e.toJson()).toList(),
      'pendingNotes': instance.pendingNotes?.map((e) => e.toJson()).toList(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'notebooks': instance.notebooks?.map((e) => e.toJson()).toList(),
      'pendingUser': instance.pendingUser?.map((e) => e.toJson()).toList(),
      'sharedNotebooks':
          instance.sharedNotebooks?.map((e) => e.toJson()).toList(),
    };
