import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:teste_tecnico_2/enemies/demon.dart';
import 'package:teste_tecnico_2/interface/player_interface.dart';
import 'package:teste_tecnico_2/objects/sword.dart';
import 'package:teste_tecnico_2/player/mhero.dart';
import 'package:teste_tecnico_2/objects/mush.dart';

import 'main.dart';

class Starter extends StatefulWidget {
  const Starter({Key? key}) : super(key: key);

  @override
  State<Starter> createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      map: TiledWorldMap(
        'maps/map.json',
        forceTileSize: const Size(tileSize, tileSize),
        objectsBuilder: {
          'p': (properties) => Mush(
              Vector2(properties.position.x - 12, properties.position.y - 12)),
          'boost': ((properties) =>
              Sword(Vector2(properties.position.x, properties.position.y)))
        },
      ),
      player: Mhero(),
      overlayBuilderMap: {
        PlayerInterface.overlayKey: (context, game) =>
            PlayerInterface(game: game)
      },
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
      ],
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        ),
      ),
      components: [
        DemonEnemy(position: Vector2(10 * tileSize, 10 * tileSize)),
      ],
      showCollisionArea: true,
      cameraConfig: CameraConfig(
        zoom: 2,
        smoothCameraEnabled: true,
      ),
    );
  }
}
