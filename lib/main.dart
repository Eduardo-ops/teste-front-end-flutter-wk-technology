import 'package:flutter/material.dart';
import 'package:gerenciador_pessoas/utils/app_routes.dart';
import 'package:gerenciador_pessoas/views/person_form.dart';
import 'package:gerenciador_pessoas/views/person_list.dart';

void main() {
  runApp(MaterialApp(
    title: "Gestão de Pessoas",
    debugShowCheckedModeBanner: false,
    routes: {
      AppRoutes.HOME: (_) => PersonList(),
      AppRoutes.PERSON_FORM: (_) => PersonForm()
    },
  ));
}
