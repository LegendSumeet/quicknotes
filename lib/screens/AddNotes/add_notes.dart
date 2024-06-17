import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddNotes extends ConsumerStatefulWidget {
  const AddNotes({super.key});

  @override
  ConsumerState createState() => _AddNotesState();
}

class _AddNotesState extends ConsumerState<AddNotes> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add,
            size: 100,
          ),
          const SizedBox(height: 20),
          Text(
            'Add your notes',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}