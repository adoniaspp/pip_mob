import 'package:flutter/material.dart';

class ModalBusca extends StatefulWidget {
  @override
  _ModalBuscaState createState() => _ModalBuscaState();
}

class _ModalBuscaState extends State<ModalBusca> {
  String dropDownValueFinalidade;
  String dropDownValueTipo;
  String dropDownValueCidades;
  bool checkGaragem = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(              
              isExpanded: true,
              isDense: true,
              hint: Text("Finalidade"),
              iconSize: 40,
              style: TextStyle(fontSize: 20, color: Colors.black),
              value: dropDownValueFinalidade,
              onChanged: (String novoValor){
                setState(() {
                  dropDownValueFinalidade = novoValor;
                });
              },
              items: <String>['Aluguel', 'Venda'].map<DropdownMenuItem<String>>((String value){
                   return DropdownMenuItem<String>(
                     value: value,
                     child: Text(value),
                   );
                 } 
              ).toList(),
            ), 
            SizedBox(height: 30,),
            DropdownButton<String>(              
              isExpanded: true,
              isDense: true,
              hint: Text("Tipo"),
              iconSize: 40,
              style: TextStyle(fontSize: 20, color: Colors.black),
              value: dropDownValueTipo,
              onChanged: (String novoValor){
                setState(() {
                  dropDownValueTipo = novoValor;
                });
              },
              items: <String>['Casa', 'Apartamento', 'Apartamento na Planta', 'Prédio Comercial', 'Sala Comercial', 'Terreno'].map<DropdownMenuItem<String>>((String value){
                   return DropdownMenuItem<String>(
                     value: value,
                     child: Text(value),
                   );
                 } 
              ).toList(),
            ),
            SizedBox(height: 40,),
            DropdownButton<String>(              
              isExpanded: true,
              isDense: true,
              hint: Text("Cidades"),
              iconSize: 40,
              style: TextStyle(fontSize: 20, color: Colors.black),
              value: dropDownValueCidades,
              onChanged: (String novoValor){
                setState(() {
                  dropDownValueCidades = novoValor;
                });
              },
              items: <String>['Belém', 'Ananindeua', 'Castanhal', 'Marituba', 'Benevides'].map<DropdownMenuItem<String>>((String value){
                   return DropdownMenuItem<String>(
                     value: value,
                     child: Text(value),
                   );
                 } 
              ).toList(),
            ),
            SizedBox(height: 40,),
            CheckboxListTile(
              title: const Text("Garagem"),
              value: checkGaragem,
              secondary: const Icon(Icons.directions_car),
              onChanged: (bool value){
                setState(() {
                  checkGaragem = checkGaragem ? false : true;
                });
              },
            )
          ],
        )
      ),
    );
  }
}
