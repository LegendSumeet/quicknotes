import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quicknotes/screens/Widgets/DateTimeline.dart';

class HomeScreenPage extends ConsumerStatefulWidget {
  const HomeScreenPage({super.key});

  @override
  ConsumerState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends ConsumerState<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quick Notes"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            DateTimeLine(),
          ],
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
