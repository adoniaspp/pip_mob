import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class ModalBusca extends StatefulWidget {
  @override
  _ModalBuscaState createState() => _ModalBuscaState();
}

class _ModalBuscaState extends State<ModalBusca> {
  String dropDownValueFinalidade;
  String dropDownValueTipo;
  String dropDownValueCidades;
  bool checkGaragem = false;

  List _myActivities;
  String _myActivitiesResult;
  String _myActivity;
  String _myActivityResult;

  @override
  void initState() {
    super.initState();
    _myActivities = [];
    _myActivitiesResult = '';
    _myActivity = '';
    _myActivityResult = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Procurar Anúncio"),
        centerTitle: true,
      ),
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: ListView(
            children: <Widget>[
              DropDownFormField(
                titleText: 'Finalidade',
                hintText: 'Aluguel ou Venda',
                value: _myActivity,
                onChanged: (value) {
                  setState(() {
                    _myActivity = value;
                  });
                },
                dataSource: [
                  {
                    "display": "Aluguel",
                    "value": "aluguel",
                  },
                  {
                    "display": "Venda",
                    "value": "venda",
                  },
                ],
                textField: 'display',
                valueField: 'value',
              ),
              SizedBox(
                height: 30,
              ),
              DropDownFormField(
                titleText: 'Tipo de Imóvel',
                hintText: 'Selecione um tipo de imóvel',
                value: _myActivity,
                onChanged: (value) {
                  setState(() {
                    _myActivity = value;
                  });
                },
                dataSource: [
                  {
                    "display": "Casa",
                    "value": "casa",
                  },
                  {
                    "display": "Apartamento",
                    "value": "apartamento",
                  },
                  {
                    "display": "Apartamento",
                    "value": "apartamento",
                  },
                  {
                    "display": "Apartamento na Planta",
                    "value": "apartamentoplanta",
                  },
                  {
                    "display": "Prédio Comercial",
                    "value": "prediocomercial",
                  },
                  {
                    "display": "Sala Comercial",
                    "value": "salacomercial",
                  },
                  {
                    "display": "Terreno",
                    "value": "terreno",
                  },
                ],
                textField: 'display',
                valueField: 'value',
              ),
              SizedBox(
                height: 40,
              ),
              DropDownFormField(
                titleText: 'Cidade',
                hintText: 'Selecione uma cidade',
                value: _myActivity,
                onChanged: (value) {
                  setState(() {
                    _myActivity = value;
                  });
                },
                dataSource: [
                  {
                    "display": "Belém",
                    "value": "belem",
                  },
                  {
                    "display": "Ananindeua",
                    "value": "ananindeua",
                  },
                  {
                    "display": "Castanhal",
                    "value": "castanhal",
                  },
                  {
                    "display": "Marituba",
                    "value": "marituba",
                  },
                  {
                    "display": "Benevides",
                    "value": "benevides",
                  },
                ],
                textField: 'display',
                valueField: 'value',
              ),
              SizedBox(
                height: 40,
              ),
              
              MultiSelectFormField(
                autovalidate: false,
                titleText: 'Bairros',
                validator: (value) {
                  if (value == null || value.length == 0) {
                    return 'Please select one or more options';
                  }
                },
                dataSource: [
                  {
                    "display": "Running",
                    "value": "Running",
                  },
                  {
                    "display": "Climbing",
                    "value": "Climbing",
                  },
                  {
                    "display": "Walking",
                    "value": "Walking",
                  },
                  {
                    "display": "Swimming",
                    "value": "Swimming",
                  },
                  {
                    "display": "Soccer Practice",
                    "value": "Soccer Practice",
                  },
                  {
                    "display": "Baseball Practice",
                    "value": "Baseball Practice",
                  },
                  {
                    "display": "Football Practice",
                    "value": "Football Practice",
                  },
                ],
                textField: 'display',
                valueField: 'value',
                okButtonLabel: 'OK',
                cancelButtonLabel: 'CANCEL',
                // required: true,
                hintText: 'Selecione um ou mais bairros',
                value: _myActivities,
                onSaved: (value) {
                  if (value == null) return;
                  setState(() {
                    _myActivities = value;
                  });
                },
              ),
              SizedBox(
                height: 40,
              ),
              CheckboxListTile(
                title: const Text("Garagem"),
                value: checkGaragem,
                secondary: const Icon(Icons.directions_car),
                onChanged: (bool value) {
                  setState(() {
                    checkGaragem = checkGaragem ? false : true;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton.icon(
                label: Text("Buscar Anúncio"),
                onPressed: () {},
                icon: Icon(Icons.search),
                color: Colors.blue[100],
              ),
            ],
          )),
    );
  }
}
