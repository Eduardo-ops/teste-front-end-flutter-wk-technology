import 'package:flutter/material.dart';
import 'package:gerenciador_pessoas/models/person.dart';
import 'package:gerenciador_pessoas/models/person_list.dart';
import 'package:provider/provider.dart';

class PersonAltger extends StatefulWidget {
  @override
  _PersonAltgerState createState() => _PersonAltgerState();
}

class _PersonAltgerState extends State<PersonAltger> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _formGroup(Person person) {
    if (person != null) {
      _formData['id'] = person.id;
      _formData['nome'] = person.nome;
      _formData['dataNascimento'] = person.dataNascimento;
      _formData['sexo'] = person.sexo;
      _formData['endereco'] = person.endereco;
      _formData['foto'] = person.foto;
    }
  }

  @override
  void didChangeDEpendencies() {
    final Person person = ModalRoute.of(context).settings.arguments;
    _formGroup(person);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alteração de Dados'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final validator = _form.currentState.validate();
              if (validator) {
                _form.currentState.save();
                Provider.of<PersonList>(context, listen: false)
                    .updatePerson(Person(
                  id: _formData['id'],
                  nome: _formData['nome'],
                  dataNascimento: _formData['dataNascimento'],
                  sexo: _formData['sexo'],
                  endereco: _formData['endereco'],
                  foto: _formData['foto'],
                ));
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) => _formData['nome'] = value,
              ),
              TextFormField(
                initialValue: _formData['dataNascimento'],
                decoration: InputDecoration(labelText: 'Data de Nascimento'),
                onSaved: (value) => _formData['dataNascimento'] = value,
              ),
              TextFormField(
                initialValue: _formData['sexo'],
                decoration: InputDecoration(labelText: 'Sexo'),
                onSaved: (value) => _formData['sexo'] = value,
              ),
              TextFormField(
                initialValue: _formData['endereco'],
                decoration: InputDecoration(labelText: 'Endereço'),
                onSaved: (value) => _formData['endereco'] = value,
              ),
              TextFormField(
                initialValue: _formData['foto'],
                decoration: InputDecoration(labelText: 'Tire uma foto'),
                onSaved: (value) => _formData['foto'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
