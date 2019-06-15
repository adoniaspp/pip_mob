import 'package:flutter/material.dart';
import 'package:pip_mob/model/Anuncio.dart';
import 'v_detalhe_bar.dart';

class DetalheAnuncio extends StatefulWidget {
  @override
  _DetalheAnuncioState createState() => _DetalheAnuncioState();
}

class _DetalheAnuncioState extends State<DetalheAnuncio> {
  int _index = 0;
  void _selectScreen(int index) {
  setState(() {
    _index = index;
  });
  }
  @override
  Widget build(BuildContext context) {
    final Anuncio anuncio = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share),onPressed: (){},)
        ],
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera,),
            title: Text("Fotos"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline,),
            title: Text("Dados"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on,),
            title: Text("Endereço")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts,),
            title: Text("Contatos")
          ),
        ],
        currentIndex: _index,
        selectedItemColor: Colors.amber,
        onTap: _selectScreen,
      ),
      body: DetalheBar(anuncio: anuncio,index: _index,),
    );
  }
}
