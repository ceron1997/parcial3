import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetallePokemon extends StatefulWidget {
  final pokemonDetalle;
  final Color color;
  final int idpokemon;

  const DetallePokemon(
      {super.key,
      required this.pokemonDetalle,
      required this.color,
      required this.idpokemon});
  @override
  State<DetallePokemon> createState() => _DetallePokemonState();
}

class _DetallePokemonState extends State<DetallePokemon> {
  @override
  Widget build(BuildContext context) {
    var anchodeta = MediaQuery.of(context).size.width;
    var altodeta = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: widget.color,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15.00,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      icon:
                          Icon(Icons.arrow_back, color: Colors.black, size: 20),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: Center(child: Text("DETALLE")),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 30.00),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    widget.pokemonDetalle['title'],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10.00, bottom: 10.00),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: CachedNetworkImage(
                      imageUrl: widget.pokemonDetalle['thumbnail'],
                      fit: BoxFit.fitHeight),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Nombre :",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    )),
                                Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      widget.pokemonDetalle['title'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "platform :",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    )),
                                Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      widget.pokemonDetalle['platform'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "publisher :",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      )),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        widget.pokemonDetalle['publisher'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ]),
                          ),
                        ),
                      ]),
                ),
              ),
            ], //hijos
          ),
        ));
  }
}
