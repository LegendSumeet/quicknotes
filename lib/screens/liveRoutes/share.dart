import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShareNotes extends ConsumerStatefulWidget {
  const ShareNotes({super.key});

  @override
  ConsumerState createState() => _ShareNotesState();
}

class _ShareNotesState extends ConsumerState<ShareNotes> {
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
