import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

import 'detallepokemon.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var pokeApi = "www.freetogame.com/api/games";
  List pokedesk = [];
  @override
  Widget build(BuildContext context) {
    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 50,
              left: 20,
              child: Text(
                "parcial 3 api games  ",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Positioned(
              top: 100,
              bottom: 0,
              width: ancho,
              child: Column(children: [
                pokedesk.length != null
                    ? Expanded(
                        child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.4),
                        itemCount: pokedesk.length,
                        itemBuilder: (context, index) {
                          var tipo = pokedesk[index]['genre'][0];

                          return InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 8),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: pokedesk[index]['genre'][0] ==
                                              "Shooter"
                                          ? Colors.blueAccent
                                          : Colors.blueAccent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Stack(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(),
                                      child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            pokedesk[index]['title'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.00,
                                                color: Colors.white),
                                          )),
                                    ),
                                    Positioned(
                                        top: 45,
                                        left: 20,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8.0,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(tipo.toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10)),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.black26),
                                        )),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 13.00),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CachedNetworkImage(
                                          imageUrl: pokedesk[index]
                                              ['thumbnail'],
                                          //height: 80,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  ])),
                            ),
                            onTap: () {
                              //TODO: llamar pantalla
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DetallePokemon(
                                          pokemonDetalle: pokedesk[index],
                                          color: Colors.white,
                                          idpokemon: index)));
                            },
                          );
                        },
                      ))
                    : Center(
                        child: CircularProgressIndicator(),
                      )
              ]),
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      datosPokemon();
    }
  }

  void datosPokemon() {
    https: //www.freetogame.com/api/games
    var url = Uri.https('www.freetogame.com', '/api/games');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        pokedesk = jsonDecode(value.body);

        print(pokedesk[2]['title']);
        // print(pokedesk);
        setState(() {});
      }

      //  print(decodejsonData);

      //   print(pokedesk);
    });
    //200 correcto
    //404 incorrecto
    //500
    //505,504,505
  }
}
