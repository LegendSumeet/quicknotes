import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditNotes extends ConsumerStatefulWidget {
  const EditNotes({super.key});

  @override
  ConsumerState createState() => _EditNotesState();
}

class _EditNotesState extends ConsumerState<EditNotes> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.share,
            size: 100,
          ),
          const SizedBox(height: 20),
          Text(
            'Share your notes with friends',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
