import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final void Function(File) onSelectImage;

  const ImageInput({Key? key, required this.onSelectImage}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storageImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePicture() async {
    final XFile? xFile = await _picker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (xFile != null) {
      final File imageFile = File(xFile.path);
      setState(() {
        _storageImage = imageFile;
      });
      final Directory appDir = await syspaths.getApplicationDocumentsDirectory();
      final String fileName = path.basename(xFile.path);
      await xFile.saveTo('${appDir.path}/$fileName');
      widget.onSelectImage(imageFile);
    }
  }

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
            onPressed: _takePicture,
            icon: const Icon(Icons.camera_alt),
            label: Text('Take Picture', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
        ))
      ],
    );
  }
}
