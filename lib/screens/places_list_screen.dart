import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  static const String routeName = '/';

  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AddPlaceScreen.routeName),
              icon: const Icon(Icons.add))
        ],
      ),
      body: Consumer<GreatPlaces>(
        builder: (context, greatPlaces, child) => greatPlaces.item.isEmpty
            ? child!
            : ListView.builder(
                itemCount: greatPlaces.item.length,
                itemBuilder: (ctx, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            FileImage(greatPlaces.item[index].image),
                      ),
                      title: Text(greatPlaces.item[index].title),
                      onTap: () {},
                    )),
        child:
            const Center(child: Text('Got no places yet, start adding some!')),
      ),
    );
  }
}
