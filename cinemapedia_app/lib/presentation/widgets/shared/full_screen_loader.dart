import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  get stream => null;

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      "Espere por favor...",
      "Cargando...",
      "Estamos trabajando en ello...",
      "Un momento por favor...",
      "Cargando información...",
      "Cargando datos...",
      "Cargando contenido...",
      "Cargando películas...",
      "Cargando series...",
      "Cargando episodios"
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Espere por favor..."),
          const SizedBox(height: 30),
          const CircularProgressIndicator(),
          const SizedBox(height: 30),
          StreamBuilder(
              stream: getLoadingMessages(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  return FadeIn(child: const Text("Cargando..."));
                }
                return FadeIn(
                    key: Key(snapshot.data), child: Text(snapshot.data));
              })
        ],
      ),
    );
  }
}
