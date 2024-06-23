import 'package:QuickNotes/models/Note/note_class.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../Notebook/notebook_class.dart';

part 'user_class.freezed.dart';

part 'user_class.g.dart';

@freezed
abstract class User with _$User {
  @JsonSerializable(explicitToJson: true)
  const factory User({
    required int id,
    required String email,
    String? name,
    List<Note>? sharedNotes,
    List<Note>? notes,
    List<Note>? pendingNotes,
    DateTime? updatedAt,
    DateTime? createdAt,
    List<Notebook>? notebooks,
    List<Notebook>? pendingUser,
    List<Notebook>? sharedNotebooks,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
