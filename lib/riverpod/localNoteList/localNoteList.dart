import 'package:QuickNotes/Services/LocalStorage/CRUDNotes.dart';
import 'package:QuickNotes/Services/classses/notes_class_db.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'localNoteList.g.dart';

@Riverpod(keepAlive: true)
class LocalNoteSet extends _$LocalNoteSet {
  @override
  FutureOr<Set<LocalNote>> build() async {
    DBHelper dbHelper = DBHelper();
    List<LocalNote> notes = await dbHelper.getNotes();
    notes.removeWhere((note) => note.title == null || note.title == '');
    return notes.toSet();
  }

  Future<void> add(LocalNote note) async {
    DBHelper dbHelper = DBHelper();
    await dbHelper.insertNote(note);
    List<LocalNote> updatedNotes = await dbHelper.getNotes();
    state = AsyncValue.data(updatedNotes.toSet());
  }

  Future<void> delete(LocalNote note) async {
    DBHelper dbHelper = DBHelper();
    await dbHelper.deleteNote(note.id);
    List<LocalNote> updatedNotes = await dbHelper.getNotes();
    state = AsyncValue.data(updatedNotes.toSet());
  }

  Future<void> _updateState() async {
    DBHelper dbHelper = DBHelper();
    List<LocalNote> updatedNotes = await dbHelper.getNotes();
    state = AsyncValue.data(updatedNotes.toSet());
  }
}

@Riverpod(keepAlive: true)
class LocalNoteContent extends _$LocalNoteContent {
  @override
  FutureOr<String> build(int id) async {
    final notes = ref.watch(localNoteSetProvider);
    Set<LocalNote> notesSet = notes.asData!.value;
    return notesSet.firstWhere((note) => note.id == id).content;
  }

  void updateContent(int id, String content) {
    final notes = ref.watch(localNoteSetProvider);
    state = AsyncValue.data(
        notes.asData!.value.firstWhere((note) => note.id == id).content);
  }
}
