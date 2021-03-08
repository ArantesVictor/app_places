import 'package:flutter/material.dart';
import '../providers/great_places.dart';
import 'package:provider/provider.dart';
import '../utils/app_routes.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus lugares'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRouts.PLACE_FORM);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(
          context,
          listen: false,
        ).loadPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : Consumer<GreatPlaces>(
                    child: Text('Nenhum local castrado'),
                    builder: (ctx, greatPlaces, child) =>
                        greatPlaces.itemsCount == 0
                            ? child
                            : ListView.builder(
                                itemCount: greatPlaces.itemsCount,
                                itemBuilder: (ctx, i) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: FileImage(
                                      greatPlaces.itemByIndex(i).image,
                                    ),
                                  ),
                                  title: Text(greatPlaces.itemByIndex(i).title),
                                  onTap: () {},
                                ),
                              ),
                  ),
      ),
    );
  }
}
