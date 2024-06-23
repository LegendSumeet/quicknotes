import 'package:QuickNotes/utils/Widgets/DateTimeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreenPage extends ConsumerStatefulWidget {
  const HomeScreenPage({super.key});

  @override
  ConsumerState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends ConsumerState<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    List<String> tags = ["All", "Work", "Personal", "Family", "Friends"];
    List<bool> isSelected = [true, false, false, false, false];
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Add functionality to add notes
            },
          ),
        ],
        title: const Text("Quick Notes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchField(),
            const DateTimeLine(),
            TageFilterChips(tags: tags, isSelected: isSelected),
            AnimationLimiter(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                    delay: const Duration(milliseconds: 375),
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    columnCount: 2,
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FadeInAnimation(
                          child: Card(
                              borderOnForeground: true,
                              elevation: 4.0,
                              color: Theme.of(context).cardColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: NotesViewCard(
                                title: "Title",
                                description: "Description",
                                imageUrl: null,
                                onTap: () {
                                  context.go('/home/viewEditNotes');
                                },
                              )),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotesViewCard extends ConsumerStatefulWidget {
  final String title;
  final String description;
  final String? imageUrl;
  final VoidCallback onTap;

  const NotesViewCard({
    super.key,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.onTap,
  });

  @override
  NotesViewCardState createState() => NotesViewCardState();
}

class NotesViewCardState extends ConsumerState<NotesViewCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.imageUrl != null)
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                child: Image.network(
                  widget.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.description,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: TextFormField(
        onTapOutside: (value) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
          hintText: "Search for notes",
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear, color: Colors.grey.shade600),
            onPressed: () {
              // Add functionality to clear the search field
            },
          ),
        ),
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
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // You can customize the transition here
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(1.0, 0.0), // Start position of the child widget
        end: Offset.zero, // End position of the child widget
      ).animate(animation),
      child: child,
    );
  }
}