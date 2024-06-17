import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditNotes extends ConsumerStatefulWidget {
  const EditNotes({super.key});

  @override
  ConsumerState createState() => _EditNotesState();
}

class _EditNotesState extends ConsumerState<EditNotes> {
  @override
  Widget build(BuildContext context) {
    QuillController _controller = QuillController.basic();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Notes'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: QuillEditor.basic(
                  configurations: QuillEditorConfigurations(
                    magnifierConfiguration: const TextMagnifierConfiguration(
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
                        backgroundColor: WidgetStateProperty.all(Colors.blue),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                      ),
                    ),
                    customStyles: DefaultStyles(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    textSelectionThemeData: TextSelectionThemeData(
                      cursorColor: Colors.blue,
                      selectionColor: Colors.blue.withOpacity(0.3),
                      selectionHandleColor: Colors.blue,
                    ),
                    autoFocus: true,
                    padding: EdgeInsets.all(16),
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
                      backgroundColor: WidgetStateProperty.all(Colors.blue),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
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
        ),
      ),
    );
  }
}
