import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gerenciador_pessoas/models/person.dart';
import 'package:gerenciador_pessoas/utils/constants.dart';
import 'package:http/http.dart' as http;

class PersonList with ChangeNotifier {
  List<Person> _items = [];
  List<Person> get items => [..._items];

  int get itemsCount {
    return _items.length;
  }

  // CREATE
  Future<void> createPerson(Person person) async {
    final response = await http.post(
      Uri.parse('${Constants.PERSON_BASE_URL}.json'),
      body: json.encode({
        'nome': person.nome,
        'dataNascimento': person.dataNascimento,
        'sexo': person.sexo,
        'endereco': person.endereco,
        'foto': person.foto
      }),
    );

    _items.add(Person(
      id: json.decode(response.body)['id'],
      nome: person.nome,
      dataNascimento: person.dataNascimento,
      sexo: person.sexo,
      endereco: person.endereco,
      foto: person.foto,
    ));
    notifyListeners();
  }

  // UPDATE
  Future<void> updatePerson(Person person) async {
    final i = _items.indexWhere((pac) => pac.id == person.id);
    if (i >= 0) {
      final response = await http.patch(
          Uri.parse('${Constants.PERSON_BASE_URL}/${person.id}.json'),
          body: json.encode({
            'nome': person.nome,
            'dataNascimento': person.dataNascimento,
            'sexo': person.sexo,
            'endereco': person.endereco,
            'foto': person.foto
          }));
      _items[i] = person;
      notifyListeners();
    }
  }

  // READ
  Future<void> loadAllpersons() async {
    _items.clear();

    final response = await http.get(
      Uri.parse('${Constants.PERSON_BASE_URL}.json'),
    );
    if (response.body == 'null') return;

    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((personId, personData) {
      _items.add(
        Person(
            id: personId,
            nome: personData['nome'],
            dataNascimento: personData['dataNascimento'],
            sexo: personData['sexo'],
            endereco: personData['endereco'],
            foto: personData['foto']),
      );
    });
    notifyListeners();
  }

  // READ BY ID
  Person getById(int i) {
    return _items[i];
  }

  // DELETE
  Future<void> deletePerson(Person person) async {
    final i = _items.indexWhere((pac) => pac.id == person.id);
    if (i >= 0) {
      final pac = _items[i];
      _items.remove(pac);
      notifyListeners();
      final response = await http
          .delete(Uri.parse('${Constants.PERSON_BASE_URL}/${person.id}.json'));
    }
  }
}
