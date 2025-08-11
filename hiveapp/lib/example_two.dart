import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/notes_model.dart';

class NotesExample extends StatefulWidget {
  const NotesExample({super.key});

  @override
  State<NotesExample> createState() => _NotesExampleState();
}

class _NotesExampleState extends State<NotesExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes Example')),
      body: FutureBuilder<Box<NotesModel>>(
        future: Hive.openBox<NotesModel>('notes_example'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final box = snapshot.data!;
          if (box.isEmpty) {
            return const Center(child: Text('No notes added yet.'));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final note = box.getAt(index);
              if (note == null) return const SizedBox();
              return ListTile(
                title: Text(note.title??''),
                subtitle: Text(note.description??''),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    note.delete();
                    setState(() {}); // refresh
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FutureBuilder<Box<NotesModel>>(
        future: Hive.openBox<NotesModel>('notes_example'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox();
          final box = snapshot.data!;
          return FloatingActionButton(
            onPressed: () async {
              final noteNumber = box.length + 1;
              final newNote = NotesModel(
                title: "Title $noteNumber",
                description: "This is the description for note $noteNumber.",
              );
              await box.add(newNote);
              setState(() {}); // refresh
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}

