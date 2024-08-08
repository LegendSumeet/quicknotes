import 'dart:convert';
import 'dart:math';

import 'package:QuickNotes/Services/RiverpodServices/notes/notes_repo.dart';
import 'package:QuickNotes/Services/classses/notes_class_db.dart';
import 'package:QuickNotes/api/localapi/notes.dart';
import 'package:QuickNotes/enums/apiEnums.dart';
import 'package:QuickNotes/screens/EditNotes/edit_notes.dart';
import 'package:QuickNotes/utils/Widgets/DateTimeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/Widgets/create_note_dialog.dart';

class HomeScreenPage extends StatefulHookConsumerWidget {
  const HomeScreenPage({super.key});

  @override
  ConsumerState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends ConsumerState<HomeScreenPage> {
  ScrollController scrollController = ScrollController();

  Future<void> _showDeleteConfirmationDialog(LocalNote note) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AnimatedDialog(
          child: AlertDialog(
            title: Text(
              'Delete Note',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            content: Text('Are you sure you want to delete "${note.title}"?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Delete'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isScrolling = useState(false);

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        isScrolling.value = false;
      } else {
        isScrolling.value = true;
      }
    });

    ref.read(localApiNoteSetProvider(actions: LocalNoteAction.add));
    List<LocalNote> notes = ref.watch(notesStateProvider);
    notes.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: isScrolling.value
            ? FloatingActionButton(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                foregroundColor: Theme.of(context).colorScheme.primary,
                focusColor: Theme.of(context).colorScheme.primary,
                focusElevation: 4,
                hoverElevation: 4,
                key: ValueKey<bool>(isScrolling.value),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const CreateNoteDialog();
                    },
                  );
                },
                child: const Icon(Icons.note_add),
              )
            : FloatingActionButton.extended(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                foregroundColor: Theme.of(context).colorScheme.primary,
                focusColor: Theme.of(context).colorScheme.primary,
                focusElevation: 4,
                hoverElevation: 4,
                icon: const Icon(Icons.note_add),
                key: ValueKey<bool>(isScrolling.value),
                label: const Text("Create Note"),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const CreateNoteDialog();
                    },
                  );
                },
              ),
      ),
      appBar: AppBar(
        notificationPredicate: (notification) {
          return true;
        },
        shadowColor: Theme.of(context).shadowColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
        ),
        forceMaterialTransparency: true,
        actionsIconTheme: Theme.of(context).iconTheme,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: TageFilterChips(
            tags: ["All", "Work", "Personal", "Shopping", "Others"],
            isSelected: [true, false, false, false, false],
          ),
        ),
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const Dialog.fullscreen(
                      child: SearchPage(),
                    );
                  });
            },
          ),
        ],
        title: const Text("Quick Notes"),
      ),
      body: AnimationLimiter(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
          ),
          primary: true,
          reverse: false,
          padding: const EdgeInsets.all(8.0),
          addAutomaticKeepAlives: true,
          physics: const BouncingScrollPhysics(),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            LocalNote note = notes.elementAt(index);
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                horizontalOffset: 50.0,
                curve: Curves.easeInOut,
                child: FadeInAnimation(
                  child: ScaleAnimation(
                    curve: Curves.easeInOut,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: "notes_${note.id}",
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: ListTile(
                            onLongPress: () {
                              _showDeleteConfirmationDialog(note);
                            },
                            onTap: () {
                              showAnimatedDialog(
                                context,
                                "notes_${note.id}",
                                note.id,
                                note.title,
                              );
                            },
                            title: Text(note.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.white)),
                            subtitle: Text(
                              convertToDocument(note.content),
                              maxLines:
                                  convertToDocument(note.content).length <= 3
                                      ? convertToDocument(note.content).length
                                      : 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TageFilterChips extends StatelessWidget {
  const TageFilterChips({
    super.key,
    required this.tags,
    required this.isSelected,
  });

  final List<String> tags;
  final List<bool> isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tags.length, // Number of FilterChips you want
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: FilterChip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                selectedColor: Theme.of(context).scaffoldBackgroundColor,
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.5),
                label: Text(
                  tags[index],
                ),
                selected: isSelected[index],
                onSelected: (value) {},
              ),
            );
          },
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: TextFormField(
              onTapOutside: (value) {
                FocusScope.of(context).unfocus();
              },
              autocorrect: true,
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                // fillColor: Theme.of(context).colorScheme.secondaryContainer,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),

                hintText: "Search...",

                prefixIcon: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _createDrawerItem({
  required IconData icon,
  required String text,
  required GestureTapCallback onTap,
  required BuildContext context,
  bool isActive = false,
}) {
  return ListTile(
    leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
    title: Text(
      text,
      style: TextStyle(
        color: isActive ? Theme.of(context).colorScheme.primary : Colors.black,
        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
      ),
    ),
    onTap: onTap,
    selected: isActive,
    selectedTileColor: Colors.grey.withOpacity(0.1),
  );
}

class ViewEditNotes extends ConsumerStatefulWidget {
  const ViewEditNotes({super.key});

  @override
  ConsumerState createState() => _ViewEditNotesState();
}

class _ViewEditNotesState extends ConsumerState<ViewEditNotes> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "notes",
      child: Column(
        children: [
          const SearchField(),
          const DateTimeLine(),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                contentPadding: const EdgeInsets.all(16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                ),
                hintText: "Title",
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              maxLines: 10,
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                contentPadding: const EdgeInsets.all(16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                ),
                hintText: "Description",
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPageRoute<T> extends MaterialPageRoute<T> {
  CustomPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const curve = Curves.easeInOut;

    var tween = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Slide from right
      end: Offset.zero,
    ).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: FadeTransition(
        opacity: animation.drive(CurveTween(curve: curve)),
        child: ScaleTransition(
          scale: Tween<double>(
            begin: 0.9, // Slightly zoom out at the start
            end: 1.0, // Zoom in to the normal size
          ).animate(CurvedAnimation(
            parent: animation,
            curve: curve,
          )),
          child: child,
        ),
      ),
    );
  }
}

class NoteGenerator {
  static Random random = Random();

  static Color generateReadableColor({required Color backgroundColor}) {
    Color randomColor;
    bool isLightBackground = _calculateBrightness(backgroundColor) > 128;

    do {
      randomColor = _generateRandomColor();
    } while (!_hasSufficientContrast(randomColor, isLightBackground));

    return randomColor;
  }

  static Color _generateRandomColor() {
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  static bool _hasSufficientContrast(Color color, bool isLightBackground) {
    Color darkColor = Colors.black;
    Color lightColor = Colors.white;

    double contrastWithDark = _calculateContrastRatio(color, darkColor);
    double contrastWithLight = _calculateContrastRatio(color, lightColor);

    // Determine the minimum contrast ratio required based on background color
    double minContrast = isLightBackground ? 4.5 : 3.0;

    return contrastWithDark >= minContrast && contrastWithLight >= minContrast;
  }

  static double _calculateContrastRatio(Color foreground, Color background) {
    // Calculate contrast ratio using the relative luminance method
    double luminance1 = _calculateLuminance(foreground);
    double luminance2 = _calculateLuminance(background);

    if (luminance1 > luminance2) {
      return (luminance1 + 0.05) / (luminance2 + 0.05);
    } else {
      return (luminance2 + 0.05) / (luminance1 + 0.05);
    }
  }

  static double _calculateLuminance(Color color) {
    double r = color.red / 255.0;
    double g = color.green / 255.0;
    double b = color.blue / 255.0;

    return 0.2126 * r + 0.7152 * g + 0.0722 * b;
  }

  static int _calculateBrightness(Color color) {
    // Calculate brightness based on the perceived luminance formula
    return ((color.red * 299) + (color.green * 587) + (color.blue * 114)) ~/
        1000;
  }
}

void showAnimatedDialog(
    BuildContext context, String tag, int NoteId, String title) {
  showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Hero(
        tag: tag,
        child: Dialog.fullscreen(
          child: EditNotes(title: title, NoteId: NoteId),
        ),
      );
    },
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 375),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );
      return ScaleTransition(
        scale: curvedAnimation,
        child: FadeTransition(
          opacity: curvedAnimation,
          child: child,
        ),
      );
    },
  );
}

class AnimatedDialog extends StatelessWidget {
  final Widget child;

  const AnimatedDialog({required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: AnimatedScale(
          scale: 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: child,
        ),
      ),
    );
  }
}

String convertToDocument(String Content) {
  if (Content.isEmpty || Content == null || Content == "") {
    return "Tap to add content";
  }
  QuillController controller = QuillController.basic();
  final jsonImport = jsonDecode(Content) as List<dynamic>;
  final document = Document.fromJson(jsonImport);
  final int docLength = document.length;

  controller = QuillController(
    document: document,
    selection: TextSelection.collapsed(offset: docLength - 1),
  );
  return controller.document.toPlainText();
}

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SearchField(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Note $index"),
                  subtitle: Text("Description $index"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

IconData getCategoryIcon(String category) {
  switch (category) {
    case 'Work':
      return Icons.work;
    case 'Personal':
      return Icons.person;
    case 'Shopping':
      return Icons.shopping_cart;
    case 'Others':
      return Icons.more_horiz;
    default:
      return Icons.help; // Default icon if the category is not recognized
  }
}
