import 'dart:math';

import 'package:QuickNotes/Services/RiverpodServices/notes/notes_repo.dart';
import 'package:QuickNotes/Services/classses/notes_class_db.dart';
import 'package:QuickNotes/riverpod/localNoteList/localNoteList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateNoteDialog extends StatefulHookConsumerWidget {
  const CreateNoteDialog({Key? key}) : super(key: key);

  @override
  _CreateNoteDialogState createState() => _CreateNoteDialogState();
}

class _CreateNoteDialogState extends ConsumerState<CreateNoteDialog>
    with AutomaticKeepAliveClientMixin {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _tagsController;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _tagsController = TextEditingController();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  bool _isShared = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final selectedCategory = useState<String?>(null);

    final List<String> categories = ['Work', 'Personal', 'Shopping', 'Others'];

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Dialog(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Text(
                'Create a Note',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildTextField(
                autofocus: true,
                controller: _titleController,
                labelText: 'Title',
                hintText: 'Enter the title of your note',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                focusNode: _focusNode,
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
                hint: const Text("Select Category"),
                value: selectedCategory.value,
                onChanged: (String? value) {
                  selectedCategory.value = value;
                  _tagsController.text = value!;
                },
                items:
                    categories.map<DropdownMenuItem<String>>((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child:
                        Text(category, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                icon: Icon(Icons.arrow_drop_down,
                    color: Theme.of(context).colorScheme.secondary),
                style: Theme.of(context).textTheme.titleMedium,
                isDense: true,
                isExpanded:
                    true, // Ensures the dropdown button takes the full width of the parent
              ),
              _buildFilterChip(),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      LocalNote note = LocalNote(
                        id: generateRandomId(),
                        title: _titleController.text,
                        category: _tagsController.text,
                        content: "",
                        createdAt: DateTime.now().toString(),
                        updatedAt: DateTime.now().toString(),
                      );
                      await ref.read(localNoteSetProvider.notifier).add(note);
                      ref.read(notesStateProvider.notifier).addNote(note);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Create Note'),
                  ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    int? maxLines,
    String? Function(String?)? validator,
    bool? autofocus,
  }) {
    return TextFormField(
      autofocus: autofocus ?? false,
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

        hintText: hintText,
      ),
      controller: controller,
      maxLines: maxLines,
      validator: validator,
    );
  }

  Widget _buildFilterChip() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 8.0,
        children: [
          FilterChip(
            label: const Text('Shared'),
            selected: _isShared,
            onSelected: (bool selected) {
              setState(() {
                _isShared = selected;
              });
            },
          ),
          FilterChip(
            label: const Text('Not Shared'),
            selected: !_isShared,
            onSelected: (bool selected) {
              setState(() {
                _isShared = !selected;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

int generateRandomId() {
  final _random = Random();
  return _random
      .nextInt(1000000); // generates a random integer between 0 and 999999
}
