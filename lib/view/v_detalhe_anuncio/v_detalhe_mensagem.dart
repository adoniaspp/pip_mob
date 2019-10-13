import 'package:flutter/material.dart';

class DetalheMensagem extends StatefulWidget {
  @override
  _DetalheMensagemState createState() => _DetalheMensagemState();
}

class _DetalheMensagemState extends State<DetalheMensagem> {
  String dropValue = "Op1";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mensagem"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(left: 17, top: 10, right: 17),
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Informe seu nome"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "E-mail para contato"),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Informe um e-mail';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Mensagem"),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Informe a mensagem';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton.icon(
                      label: Text("Enviar"),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                        }
                      },
                      icon: Icon(Icons.email),
                      color: Colors.green[200],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
