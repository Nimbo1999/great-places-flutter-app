import 'package:flutter/material.dart';
import 'package:great_places/widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const String routeName = '/add-place';

  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final TextEditingController _textEditingController = TextEditingController();

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
              const ImageInput()
            ],),
          ))),
          ElevatedButton.icon(
            onPressed: () {},
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