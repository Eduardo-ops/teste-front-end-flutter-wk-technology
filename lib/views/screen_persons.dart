import 'package:flutter/material.dart';
import 'package:gerenciador_pessoas/models/person_list.dart';
import 'package:gerenciador_pessoas/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ScreenPersons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PersonList persons = Provider.of(context);

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
      body: Container(
        child: Text('Teste'),
      ),
    );
  }
}
