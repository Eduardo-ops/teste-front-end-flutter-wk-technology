import 'package:flutter/material.dart';

class Person {
  final String id;
  final String nome;
  final String dataNascimento;
  final String sexo;
  final String endereco;
  final String foto;

  const Person({
    this.id,
    @required this.nome,
    @required this.dataNascimento,
    @required this.sexo,
    @required this.endereco,
    @required this.foto,
  });
}
