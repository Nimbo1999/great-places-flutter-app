import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storageImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          alignment: Alignment.center,
          child: _storageImage != null
              ? Image.file(
                  _storageImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text('No Image Taken', textAlign: TextAlign.center,),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt),
            label: Text('Take Picture', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
        ))
      ],
    );
  }
}
