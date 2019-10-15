import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pip_mob/bloc/busca_anuncio_bloc.dart';
import 'package:pip_mob/model/busca_anuncio.dart';
import 'package:pip_mob/model/Anuncio.dart';
import 'package:pip_mob/util/functions.dart';

class VisaoBusca extends StatefulWidget {
  @override
  _VisaoBuscaState createState() => _VisaoBuscaState();
}

class _VisaoBuscaState extends State<VisaoBusca> {
  AnuncioBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.getBloc<AnuncioBloc>();
    bloc.buscaAnuncio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/modalBusca');
        },
        label: Text("Procurar"),
        icon: Icon(Icons.search),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("PIP-Imóveis"),
        centerTitle: true,
        actions: <Widget>[
          /*IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/modalBusca');
            },
          ),*/
        ],
      ),
      drawer: Drawer(),
      body: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          alignment: Alignment.center,
          child: StreamBuilder(
              stream: bloc.outBuscaAnuncio,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  BuscaAnuncio anuncios = snapshot.data;
                  return ListView.builder(
                      //padding: const EdgeInsets.all(3.0),
                      itemCount: anuncios.anuncio.length,
                      itemBuilder: (context, int index) {
                        Anuncio anuncio = anuncios.anuncio[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/detalheAnuncio');
                            bloc.detalharAnuncio(anuncio.tipo, anuncio.idanuncio);
                          },
                          child: Card(
                              margin: EdgeInsets.only(bottom: 20),
                              elevation: 8,
                              color: Colors.white70,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      child: ListTile(
                                    leading: Icon(
                                      Icons.home,
                                      size: 50,
                                      color: Colors.brown,
                                    ),
                                    title: Text(
                                      anuncio.finalidade.toUpperCase() +
                                          " DE " +
                                          anuncio.tipo.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Times new Roman'),
                                    ),
                                    subtitle: Text(
                                      anuncio.bairro.toUpperCase(),
                                      style: TextStyle(
                                          fontFamily: 'Times new Roman'),
                                    ),
                                  )),
                                  Stack(
                                    alignment: Alignment.topCenter,
                                    children: <Widget>[
                                      FadeInImage.assetNetwork(
                                          image:
                                              "https://opcionis.cl/blog/wp-content/uploads/2015/10/casa.jpg",
                                          placeholder: 'assets/casa.png'),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.black26,
                                        ),
                                        child: Text(
                                          Functions.moneyFormat(
                                              anuncio.valormin),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.zoom_out_map,
                                                  size: 35,
                                                ),
                                                Text((anuncio.area != null)
                                                    ? anuncio.area + ' m2'
                                                    : '-')
                                              ],
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            anuncio.quarto!=null ? Column(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.hotel,
                                                  size: 35,
                                                ),
                                                Text((anuncio.quarto != null)
                                                    ? anuncio.quarto
                                                    : '-')
                                              ],
                                            ): Column(),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.hot_tub,
                                                  size: 35,
                                                ),
                                                Text((anuncio.banheiro != null)
                                                    ? anuncio.banheiro
                                                    : '-')
                                              ],
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Icon(Icons.directions_car,
                                                    size: 35),
                                                Text((anuncio.garagem != null)
                                                    ? anuncio.garagem
                                                    : '-')
                                              ],
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        );
                      });
                  //Text('${anuncios.anuncio[0].logradouro}',
                  //  style: TextStyle(fontSize: 25));
                } else {
                  return CircularProgressIndicator();
                }
              })),
    );
  }
}
