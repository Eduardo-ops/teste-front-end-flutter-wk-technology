import 'package:flutter/material.dart';
import 'package:gerenciador_pessoas/models/person.dart';
import 'package:gerenciador_pessoas/models/person_list.dart';
import 'package:gerenciador_pessoas/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PersonDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Person person = Provider.of(context);

    return ListTile(
      title: Text(person.nome),
      subtitle: Text(person.dataNascimento),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PERSON_FORM);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ct) => AlertDialog(
                          title: Text('Excluir Pessoa'),
                          content: Text('Tem certeza ?'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Não'),
                              onPressed: () => {
                                Navigator.of(context).pop(false),
                                FlatButton(
                                  child: Text('Sim'),
                                  onPressed: () => {
                                    Navigator.of(context).pop(true),
                                  },
                                )
                              },
                            )
                          ],
                        )).then((confirmed) {
                  if (confirmed)
                    Provider.of<PersonList>(context, listen: false)
                        .deletePerson(person);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
