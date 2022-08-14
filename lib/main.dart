import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:teste_tecnico_2/player/mhero.dart';

const double tileSize = 32;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      joystick: Joystick(
        directional: JoystickDirectional(),
      ),
      map: TiledWorldMap(
        'maps/map.json',
        forceTileSize: const Size(tileSize, tileSize),
      ),
      player: Mhero(Vector2(0.5 * tileSize, 0.5 * tileSize)),
    );
  }
}
