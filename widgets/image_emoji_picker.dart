import 'package:flutter/material.dart';

class ImageEmojiPicker extends StatelessWidget {
  final int index;
  final bool selected;
  final void Function()? onTap;
  final double width;
  final double height;

  static const List<String> imageFiles = [
    '0.png', '1.png', '2.png', '3.png', '4.png'
  ];
  static const List<String> emojis = [
    '📝', '💼', '👤', '🛍️', '❤️'
  ];

  const ImageEmojiPicker({
    Key? key,
    required this.index,
    this.selected = false,
    this.onTap,
    this.width = 60,
    this.height = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final img = (index >= 0 && index < imageFiles.length) ? imageFiles[index] : imageFiles[0];
    final emoji = (index >= 0 && index < emojis.length) ? emojis[index] : emojis[0];
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
            color: selected ? Colors.blue : Colors.grey.shade300,
          ),
          boxShadow: [
            BoxShadow(
              color: selected ? Colors.blue.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 2),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'images/$img',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 32, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 