import 'package:bonfire/bonfire.dart';
import '../main.dart';
import 'package:teste_tecnico_2/player/mhero_sprite.dart';

class Mhero extends SimplePlayer with ObjectCollision {
  Mhero(Vector2 position)
      : super(
          position: position,
          size: Vector2(tileSize, tileSize),
          animation: SimpleDirectionAnimation(
            idleLeft: MheroSprite.heroIdleLeft,
            idleRight: MheroSprite.heroIdleRight,
            runLeft: MheroSprite.heroRunLeft,
            runRight: MheroSprite.heroRunRight,
          ),
          speed: 90,
        );
}
