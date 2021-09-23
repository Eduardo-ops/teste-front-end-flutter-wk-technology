import 'package:flutter/material.dart';
import 'package:gerenciador_pessoas/components/person_details.dart';
import 'package:gerenciador_pessoas/models/person_list.dart';
import 'package:gerenciador_pessoas/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ScreenPersons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gestão de Pessoas'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PERSON_FORM);
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future:
              Provider.of<PersonList>(context, listen: false).loadAllpersons(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.error != null) {
              return Center(
                child: Text('Ocorreu um erro!'),
              );
            } else {
              return Consumer<PersonList>(
                builder: (ctx, orders, child) => ListView.builder(
                    itemCount: orders.itemsCount,
                    itemBuilder: (ctx, i) =>
                        PersonDetails(person: orders.items[i])),
              );
            }
          },
        ));
  }
}
