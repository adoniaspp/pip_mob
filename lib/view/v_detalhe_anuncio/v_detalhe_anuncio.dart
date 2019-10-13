import 'package:flutter/material.dart';
import 'v_detalhe_bar.dart';
/*import 'package:pip_mob/view/v_detalhe_basico.dart';
import 'package:pip_mob/view/v_detalhe_dados.dart';
import 'package:pip_mob/view/v_detalhe_endereco.dart';
import 'package:pip_mob/view/v_detalhe_contato.dart';*/


class DetalheAnuncio extends StatefulWidget {
  @override
  _DetalheAnuncioState createState() => _DetalheAnuncioState();
}

class _DetalheAnuncioState extends State<DetalheAnuncio> {
  int _index = 0;
  TabController _tabController;

  void _selectScreen(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final Anuncio anuncio = ModalRoute.of(context).settings.arguments;
    final int indiceLista = ModalRoute.of(context).settings.arguments;
    /*List<Widget> _widgets = <Widget>[
      DetalheBasico(anuncio: anuncio,),
      DetalheDados(anuncio: anuncio,),
      DetalheEndereco(anuncio: anuncio),
      DetalheContato(anuncio: anuncio,),
    ];*/
    return Scaffold(
      appBar: AppBar(
        //title: Text(anuncio.finalidade + " de " + anuncio.tipo),
        title: Text("Detalhe do Anúncio"),
        //centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_camera,
              size: 30,
            ),
            title: Text("Fotos"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info_outline,
              size: 30,
            ),
            title: Text("Dados"),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on,
                size: 30,
              ),
              title: Text("Endereço")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.contacts,
                size: 30,
              ),
              title: Text("Contatos")),
        ],
        currentIndex: _index,
        selectedItemColor: Colors.amber,
        onTap: _selectScreen,
      ),
      body: DetalheBar(
        index: _index,
        indiceLista: indiceLista,
      ),
      /*body: TabBarView(
        children: _widgets,
        controller: _tabController,
      ),*/
    );
  }
}
