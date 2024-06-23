import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddNotes extends StatefulHookConsumerWidget {
  const AddNotes({super.key});

  @override
  ConsumerState createState() => _AddNotesState();
}

class _AddNotesState extends ConsumerState<AddNotes>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
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

  @override
  bool get wantKeepAlive => true;
}
