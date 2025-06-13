import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tokoonline/widgets/task_widget.dart';
import '../data/firestor.dart';

class Stream_note extends StatelessWidget {
  final bool done;
  final String category;
  final String sortBy;
  const Stream_note(this.done, {super.key, this.category = 'All', this.sortBy = 'time'});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore_Datasource().stream(done, category: category),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final noteslist = Firestore_Datasource().getNotes(snapshot);
          
          // Sort the notes based on sortBy parameter
          noteslist.sort((a, b) {
            switch (sortBy) {
              case 'title':
                return a.title.compareTo(b.title);
              case 'category':
                return a.category.compareTo(b.category);
              case 'deadline':
                if (a.deadline == null && b.deadline == null) return 0;
                if (a.deadline == null) return 1;
                if (b.deadline == null) return -1;
                return a.deadline!.compareTo(b.deadline!);
              case 'time':
              default:
                return a.time.compareTo(b.time);
            }
          });

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final note = noteslist[index];
              return Task_Widget(
                note: note,
                onDelete: () async {
                  await Firestore_Datasource().delet_note(note.id);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Task deleted'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              );
            },
            itemCount: noteslist.length,
          );
        });
  }
}
