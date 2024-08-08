import 'package:QuickNotes/Services/LocalStorage/CRUDNotes.dart';
import 'package:QuickNotes/Services/RiverpodServices/notes/notes_repo.dart';
import 'package:QuickNotes/Services/classses/notes_class_db.dart';
import 'package:QuickNotes/enums/apiEnums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notes.g.dart';

@Riverpod(keepAlive: true)
class LocalApiNoteSet extends _$LocalApiNoteSet {
  @override
  void build({
    required LocalNoteAction actions,
    LocalNote? note,
  }) async {
    DBHelper dbHelper = DBHelper();
    List<LocalNote> notes = await dbHelper.getNotes();
    notes.removeWhere((note) => note.title == null || note.title == '');

    switch (actions) {
      case LocalNoteAction.add:
        ref.read(notesStateProvider.notifier).addAllNotes(notes);

      case LocalNoteAction.delete:
        if (note != null) {
          ref.read(notesStateProvider.notifier).removeNoteById(note.id);
        }
      case LocalNoteAction.update:
        if (note != null) {
          ref.read(notesStateProvider.notifier).updateNoteById(note);
        }
      default:
    }
  }
}
