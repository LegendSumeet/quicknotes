import 'package:QuickNotes/models/Notebook/notebook_class.dart';
import 'package:QuickNotes/models/Users/user_class.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_class.freezed.dart';
part 'note_class.g.dart';

@freezed
abstract class Note with _$Note {
  @JsonSerializable(explicitToJson: true)
  const factory Note({
    required int id,
    List<String>? tags,
    String? category,
    required String title,
    required String content,
    String? description,
    User? user,
    List<User>? sharedWith,
    List<User>? pendingUser,
    DateTime? updatedAt,
    DateTime? createdAt,
    Notebook? notebook,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}
