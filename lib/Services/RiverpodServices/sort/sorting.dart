import 'dart:developer' as devtools;

import 'package:QuickNotes/Services/classses/notes_class_db.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sorting.g.dart';

@Riverpod(keepAlive: true)
class NoteChipSelector extends _$NoteChipSelector {
  @override
  List<bool> build() {
    return [];
  }

  void update(List<bool> chips) {
    state = chips;
  }
}
