import 'dart:convert';
import 'dart:developer' as devtool;

import 'package:QuickNotes/Services/LocalStorage/CRUDNotes.dart';
import 'package:QuickNotes/Services/RiverpodServices/notes/notes_repo.dart';
import 'package:QuickNotes/Services/classses/notes_class_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditNotes extends ConsumerStatefulWidget {
  final String title;
  final int NoteId;

  const EditNotes({super.key, required this.NoteId, required this.title});

  @override
  ConsumerState createState() => _EditNotesState();
}

class _EditNotesState extends ConsumerState<EditNotes>
    with AutomaticKeepAliveClientMixin {
  late QuillController _controller;
  late Future<LocalNote?> _noteFuture;

  @override
  void initState() {
    super.initState();
    DBHelper dbHelper = DBHelper();
    _noteFuture = dbHelper.getNoteById(widget.NoteId);
    _controller = QuillController.basic();

    _noteFuture.then((note) {
      if (note != null) {
        try {
          final jsonImport = jsonDecode(note.content) as List<dynamic>;
          final document = Document.fromJson(jsonImport);
          final int docLength = document.length;

          setState(() {
            _controller = QuillController(
              document: document,
              selection: TextSelection.collapsed(offset: docLength - 1),
            );
          });
        } catch (e) {
          devtool.log('Error parsing document: $e');
        }
      }
    }).catchError((error) {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateNote() async {
    devtool.log('Updating note');
    // Check if the widget is mounted before performing any operations
    if (mounted) {
      final jsonSave = jsonEncode(_controller.document.toDelta().toJson());
      DBHelper dbHelper = DBHelper();

      try {
        final noteUpdated = await _noteFuture;
        if (noteUpdated != null) {
          LocalNote updatedNote = LocalNote(
            id: widget.NoteId,
            category: noteUpdated.category,
            title: noteUpdated.title,
            content: jsonSave,
            createdAt: noteUpdated.createdAt,
            updatedAt: DateTime.now().toString(),
          );

          try {
            await dbHelper.updateNote(updatedNote);
            // Check if the widget is still mounted before updating the state
            if (mounted) {
              // Update provider or state management system
              final notesProvider = ref.read(notesStateProvider.notifier);
              notesProvider.updateNoteById(updatedNote);
              ref.read(notesStateProvider.notifier).updateNoteById(updatedNote);
              // Handle successful database update
              devtool.log('Note updated successfully: ${updatedNote.id}');
            }
          } catch (error) {
            // Handle database update errors
            if (mounted) {
              devtool.log('Error updating note in database: $error');
            }
            devtool.log('Error fetching note: $error');
          }
        }
      } catch (error) {
        // Handle errors fetching the note
        if (mounted) {
          devtool.log('Error fetching note: $error');
        }
        devtool.log('Error fetching note: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      _updateNote();
    });
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text(widget.title),
      ),
      body: Hero(
        tag: "notes_${widget.NoteId}",
        child: FutureBuilder(
          future: _noteFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: QuillEditor.basic(
                        configurations: QuillEditorConfigurations(
                          magnifierConfiguration:
                              const TextMagnifierConfiguration(
                            shouldDisplayHandlesInMagnifier: true,
                          ),
                          showCursor: true,
                          scribbleAreaInsets: const EdgeInsets.all(16),
                          scrollable: true,
                          scrollBottomInset: 16,
                          scrollPhysics: const BouncingScrollPhysics(),
                          enableInteractiveSelection: true,
                          enableScribble: true,
                          enableSelectionToolbar: true,
                          requestKeyboardFocusOnCheckListChanged: true,
                          paintCursorAboveText: true,
                          detectWordBoundary: true,
                          dialogTheme: QuillDialogTheme(
                            buttonStyle: ButtonStyle(
                              backgroundColor:
                              WidgetStateProperty.all(Colors.blue),
                              foregroundColor:
                              WidgetStateProperty.all(Colors.white),
                            ),
                          ),
                          customStyles: DefaultStyles(
                            color: Theme
                                .of(context)
                                .colorScheme
                                .primary,
                          ),
                          textSelectionThemeData: TextSelectionThemeData(
                            cursorColor: Colors.blue,
                            selectionColor: Colors.blue.withOpacity(0.3),
                            selectionHandleColor: Colors.blue,
                          ),

                          padding: const EdgeInsets.all(16),
                          placeholder: 'Add your notes here...',
                          expands: true,
                          controller: _controller,
                          sharedConfigurations: const QuillSharedConfigurations(
                            locale: Locale('de'),
                          ),
                        ),
                      ),
                    ),
                    QuillToolbar.simple(
                      configurations: QuillSimpleToolbarConfigurations(
                        headerStyleType: HeaderStyleType.buttons,
                        linkStyleType: LinkStyleType.alternative,
                        showDividers: true,
                        multiRowsDisplay: false,
                        toolbarIconAlignment: WrapAlignment.center,
                        showBoldButton: true,
                        showItalicButton: true,
                        showUnderLineButton: true,
                        showStrikeThrough: true,
                        showColorButton: true,
                        showBackgroundColorButton: true,
                        showClearFormat: true,
                        showHeaderStyle: true,
                        showListNumbers: true,
                        showListBullets: true,
                        showListCheck: true,
                        showCodeBlock: true,
                        showQuote: true,
                        showIndent: true,
                        showLink: true,
                        dialogTheme: QuillDialogTheme(
                          buttonStyle: ButtonStyle(
                            backgroundColor:
                            WidgetStateProperty.all(Colors.blue),
                            foregroundColor:
                            WidgetStateProperty.all(Colors.white),
                          ),
                        ),
                        controller: _controller,
                        sharedConfigurations: const QuillSharedConfigurations(
                          locale: Locale('de'),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
