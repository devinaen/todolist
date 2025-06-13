import 'package:flutter/material.dart';
import 'package:tokoonline/const/colors.dart';
import 'package:tokoonline/data/firestor.dart';
import 'package:tokoonline/screen/edit_screen.dart';
import 'package:tokoonline/model/notes_model.dart';
import 'package:tokoonline/widgets/image_emoji_picker.dart';

class Task_Widget extends StatelessWidget {
  final Note note;
  final Function() onDelete;

  const Task_Widget({
    super.key,
    required this.note,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: note.isDon ? Colors.grey[100] : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: note.isDon ? Colors.grey[300]! : Colors.grey[200]!,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Task Image
          Opacity(
            opacity: note.isDon ? 0.5 : 1.0,
            child: ImageEmojiPicker(
              index: note.image,
              selected: false,
              width: 60,
              height: 60,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: note.isDon ? Colors.grey[600] : Colors.black87,
                    decoration: note.isDon ? TextDecoration.lineThrough : null,
                    decorationColor: primaryBlue,
                    decorationThickness: 2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  note.subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: note.isDon ? Colors.grey[500] : Colors.grey[600],
                    decoration: note.isDon ? TextDecoration.lineThrough : null,
                    decorationColor: primaryBlue,
                    decorationThickness: 2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (note.deadline != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: note.isDon ? Colors.grey[400] : primaryBlue,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Deadline: ${note.deadline!.day}/${note.deadline!.month}/${note.deadline!.year}',
                        style: TextStyle(
                          fontSize: 12,
                          color: note.isDon ? Colors.grey[400] : primaryBlue,
                          fontWeight: FontWeight.w500,
                          decoration: note.isDon ? TextDecoration.lineThrough : null,
                          decorationColor: primaryBlue,
                          decorationThickness: 2,
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Checkbox
                    Transform.scale(
                      scale: 0.8,
                      child: Checkbox(
                        activeColor: primaryBlue,
                        value: note.isDon,
                        onChanged: (value) {
                          Firestore_Datasource().isdone(note.id, !note.isDon);
                        },
                      ),
                    ),
                    // Edit Button
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Edit_Screen(note),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                        color: note.isDon ? Colors.grey[400] : primaryBlue,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Delete Button
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: onDelete,
                      icon: Icon(
                        Icons.delete,
                        color: note.isDon ? Colors.grey[400] : Colors.red,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
