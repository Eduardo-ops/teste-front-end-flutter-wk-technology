import 'package:flutter/material.dart';
import 'package:gerenciador_pessoas/models/person_list.dart';
import 'package:gerenciador_pessoas/utils/app_routes.dart';
import 'package:gerenciador_pessoas/views/person_alter.dart';
import 'package:gerenciador_pessoas/views/person_form.dart';
import 'package:gerenciador_pessoas/views/screen_persons.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ct) => PersonList(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gestão de Pessoas',
        routes: {
          AppRoutes.HOME: (_) => ScreenPersons(),
          AppRoutes.PERSON_FORM: (_) => PersonForm(),
          AppRoutes.PERSON_ALTER: (_) => PersonAltger(),
        },
      ),
    );
  }
}
