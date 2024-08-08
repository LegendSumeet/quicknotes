import 'dart:developer' as devtools;

import 'package:QuickNotes/Services/classses/notes_class_db.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notes_repo.g.dart';

@Riverpod(keepAlive: true)
class NotesState extends _$NotesState {
  @override
  List<LocalNote> build() {
    return [];
  }

  void addNote(LocalNote note) {
    state = [...state, note];
  }

  void removeNoteById(int id) {
    state = state..removeWhere((note) => note.id == id);
  }

  void updateNoteById(LocalNote note) {
    devtools.log('Updating note');
    state = state.map((n) => n.id == note.id ? note : n).toList();
  }

  void clearNotes() {
    state = [];
  }

  void addAllNotes(List<LocalNote> notes) {
    state = [...state, ...notes];
  }

  void removeNoteByIndex(int index) {
    state = state..removeWhere((note) => state.indexOf(note) == index);
  }

  void updateNoteByIndex(int index, LocalNote note) {
    state = state.map((n) => state.indexOf(n) == index ? note : n).toList();
  }

  void removeNotesByCategory(String category) {
    state = state..removeWhere((note) => note.category == category);
  }

  void removeNotesByTitle(String title) {
    state = state..removeWhere((note) => note.title == title);
  }
}
