import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:great_places/widgets/location_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const String routeName = '/add-place';

  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace(BuildContext context) {
    if (_textEditingController.text.isEmpty || _pickedImage == null) return;
    Provider.of<GreatPlaces>(context, listen: false).addPlace(_textEditingController.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new Place')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: SingleChildScrollView(child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              TextField(
                decoration: const InputDecoration(label: Text('Title')),
                controller: _textEditingController,),
              const SizedBox(height: 10,),
              ImageInput(onSelectImage: _selectImage,),
              const SizedBox(height: 16,),
              const LocationInput()
            ],),
          ))),
          ElevatedButton.icon(
            onPressed: () => _savePlace(context),
            icon: const Icon(Icons.add, color: Colors.black87),
            label: const Text('Add Place', style: TextStyle(color: Colors.black87),),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary)
            ),
          )
        ]
      ),
    );
  }
}