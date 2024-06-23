import 'package:QuickNotes/models/Note/note_class.dart';
import 'package:QuickNotes/models/Users/user_class.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notebook_class.freezed.dart';
part 'notebook_class.g.dart';

@freezed
abstract class Notebook with _$Notebook {
  const factory Notebook({
    required int id,
    required String title,
    required List<String> tags,
    String? category,
    String? description,
    required User user,
    List<User>? pendingUser,
    List<User>? sharedWith,
    List<Note>? notes,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) = _Notebook;

  factory Notebook.fromJson(Map<String, dynamic> json) =>
      _$NotebookFromJson(json);
}
