
import 'dart:io';

import 'package:flutter/material.dart';

class ItemImageCard extends StatelessWidget {
  const ItemImageCard(
      {super.key, this.imageFile, required this.onTap, required this.onRemove});
  final File? imageFile;
  final VoidCallback onTap;
  final VoidCallback onRemove;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.2,
            height: MediaQuery.sizeOf(context).height * 0.22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
              image: imageFile != null
                  ? DecorationImage(
                      image: FileImage(imageFile!),
                      fit: BoxFit.contain,
                    )
                  : null,
            ),
            child: imageFile == null
                ? GestureDetector(
                    onTap: onTap,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 50,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'main image',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  )
                : null,
          ),
        ),
        imageFile != null
            ? Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 30,
                  ),
                  onPressed: onRemove,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
